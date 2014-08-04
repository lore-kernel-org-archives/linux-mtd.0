Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XE9Mq-0005Yu-FW
 for linux-mtd@lists.infradead.org; Mon, 04 Aug 2014 03:55:27 +0000
Message-ID: <53DF03D8.6040504@huawei.com>
Date: Mon, 4 Aug 2014 11:54:00 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Bill Pringlemeir <bpringlemeir@nbsps.com>
Subject: Re: [PATCH RFC v2] UBI: New ioctl() to support ubidump
References: <53D7677A.6000905@huawei.com> <53D768B5.6090409@huawei.com>
 <87vbqgb4re.fsf@nbsps.com> <53D85203.7030302@huawei.com>
 <87siliu9lm.fsf@nbsps.com> <53D9B1A0.8080300@huawei.com>
 <1406813088.20616.32.camel@sauron.fi.intel.com> <53DB0081.1040905@huawei.com>
 <1406878239.20616.65.camel@sauron.fi.intel.com> <87iomcrzo7.fsf@nbsps.com>
In-Reply-To: <87iomcrzo7.fsf@nbsps.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/8/1 23:35, Bill Pringlemeir wrote:
> 
>  1. Allocate a 'pmap' array and a temporary 'sequence' array.
>  2. Initialize 'pmap' to -1.
>  3a. For each valid 'eb', get 'lnum' and 'sqnum' from vid header.
>   b. if (pmap[lnum] == -1 || sequence[lnum] < sqnum)
>       pmap[lnum] = eb, sequence[lnum] = sqnum;
> 

I've researched the function ubi_scan() in libscan.c today and
found it's not easy to just add small changes to enable LEB->PEB
mapping table as we want.

There are two methods on enabling this functionality:
1) Add a mapping table in struct ubi_scan_info
2) Add some new parameters for function ubi_scan()

You know each MTD device may contain more than one UBI volume
and each volume should has a private mapping table. So it's not
easy to enable it in struct ubi_scan_info like method 1) because
we don't know the actual counts of volumes.

Further more, @sqnum is not enough for peb determining, we should
consider @on_copy flag for wear-leveling and atomic write. If
@on_copy flag is set, we need to read the whole leb and check CRC
to determine which peb is right. As this is a debugging tool, I
think printing all pebs have same lnum(of course in same volume)
is better. Now, we have to start thinking how to record this
stuff, that's a big problem.


In another way like method 2), we can add a new structure named
ubi_translate, put lnum and vol_id in it and returns a list or an
array contains the set of pebs which has a lnum equal to what we
set in translate struct. Original call like ubiformat set this
structure pointer to NULL and only ubidump use it. But if it's
better than writing a new function to do this stuff separately?
The code in ubi_scan is complicated now. Lnum translation is not
needed for ubiformat and the calculate of ec is not needed for
ubidump.

How about adding a new function to scan the whole MTD device and
just return a list contain all the pebs(mostly 1 or 2) in same
vol_id and same lnum?

in libscan.c

struct ubi_translate_info {
	int lnum,
	int vol_id,
	int find,	// counts of peb we find
	int *array	// dynamic or static(5? in size) array for
			// recording peb num
};

int ubi_translate(struct ubi_translate_info *info /* or **info */)
{
	// full scan the MTD device
	while (...) {
		read(ec);
		
		// determine if it is a valid peb
		...

		read(vid);

		if (vid->vol_id == info->vol_id &&
		    vid->lnum == info->lnum) {
			// add to list @array
			...

			find++;			
		}
	}

	return err; // MTD is bad or something else
}

Just quick thought.

What's your opinion?

By the way, I have to say this separating of UBI and UBIFS makes
it really hard to read data from both sides.
