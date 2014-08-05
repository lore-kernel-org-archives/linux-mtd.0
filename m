Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEmCC-0003KB-Hg
 for linux-mtd@lists.infradead.org; Tue, 05 Aug 2014 21:23:04 +0000
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: hujianyang <hujianyang@huawei.com>
Subject: Re: [PATCH RFC v2] UBI: New ioctl() to support ubidump
References: <53D7677A.6000905@huawei.com> <53D768B5.6090409@huawei.com>
 <87vbqgb4re.fsf@nbsps.com> <53D85203.7030302@huawei.com>
 <87siliu9lm.fsf@nbsps.com> <53D9B1A0.8080300@huawei.com>
 <1406813088.20616.32.camel@sauron.fi.intel.com>
 <53DB0081.1040905@huawei.com>
 <1406878239.20616.65.camel@sauron.fi.intel.com>
 <87iomcrzo7.fsf@nbsps.com> <53DF03D8.6040504@huawei.com>
Date: Tue, 05 Aug 2014 17:10:26 -0400
Message-ID: <87bnry7id9.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On  3 Aug 2014, hujianyang@huawei.com wrote:

> On 2014/8/1 23:35, Bill Pringlemeir wrote:

>> 1. Allocate a 'pmap' array and a temporary 'sequence' array.
>> 2. Initialize 'pmap' to -1.
>> 3a. For each valid 'eb', get 'lnum' and 'sqnum' from vid header.
>> b. if (pmap[lnum] == -1 || sequence[lnum] < sqnum)
>> pmap[lnum] = eb, sequence[lnum] = sqnum;

> I've researched the function ubi_scan() in libscan.c today and
> found it's not easy to just add small changes to enable LEB->PEB
> mapping table as we want.
>
> There are two methods on enabling this functionality:
> 1) Add a mapping table in struct ubi_scan_info
> 2) Add some new parameters for function ubi_scan()
>
> You know each MTD device may contain more than one UBI volume
> and each volume should has a private mapping table. So it's not
> easy to enable it in struct ubi_scan_info like method 1) because
> we don't know the actual counts of volumes.

Yes, I think you are completely correct.  The array only keeps track of
the erase count not the LEB.  Sorry, I was confused about that.

> Further more, @sqnum is not enough for peb determining, we should
> consider @on_copy flag for wear-leveling and atomic write. If
> @on_copy flag is set, we need to read the whole leb and check CRC
> to determine which peb is right. As this is a debugging tool, I
> think printing all pebs have same lnum(of course in same volume)
> is better. Now, we have to start thinking how to record this
> stuff, that's a big problem.

Validating the header CRC is always part of seeing if the block is
valid.  For a real physical device, the unstable bits maybe an issue.
So, it is probably better to examine 'copy_flag'.  Many of these are
abnormal cases, which need to be handled, but the tool would not
normally run through these paths for every block.  Running the CRC on
the data maybe particularly slow.

> In another way like method 2), we can add a new structure named
> ubi_translate, put lnum and vol_id in it and returns a list or an
> array contains the set of pebs which has a lnum equal to what we
> set in translate struct. Original call like ubiformat set this
> structure pointer to NULL and only ubidump use it. But if it's
> better than writing a new function to do this stuff separately?
> The code in ubi_scan is complicated now. Lnum translation is not
> needed for ubiformat and the calculate of ec is not needed for
> ubidump.

I agree it is complex.  It could be decomposed into functions.

> How about adding a new function to scan the whole MTD device and
> just return a list contain all the pebs(mostly 1 or 2) in same
> vol_id and same lnum?
>
> in libscan.c
>
> struct ubi_translate_info {
> 	int lnum,
> 	int vol_id,
> 	int find,	// counts of peb we find
> 	int *array	// dynamic or static(5? in size) array for
> 			// recording peb num
> };

> int ubi_translate(struct ubi_translate_info *info /* or **info */)
> {
> 	// full scan the MTD device
> 	while (...) {
> 		read(ec);
> 		
> 		// determine if it is a valid peb
> 		...
>
> 		read(vid);
>
> 		if (vid->vol_id == info->vol_id &&
> 		    vid->lnum == info->lnum) {
> 			// add to list @array
> 			...
>
> 			find++;			
> 		}
> 	}
>
> 	return err; // MTD is bad or something else
> }

ubi_translate() is more complex.  You need to read the VID header and
possibly data as well.  The ubi_scan() never reads these.  

However, a lot of the erase header checking will be the same.  So
besides all 'si->...=' lines most of ubi_scan() loop body is needed for
the 'ubi_translate()' to validate the erase header.  Then you need the
extra step to read the 'vid'.  I think you could have a function like,

/* ech invalid unless return < MAX_EC */
static uint32_t read_ehdr(struct mtd_dev_info *mtd, int fd, 
		int eb, struct ubi_ec_hdr *ech)
{
  ... 

That returns the 'enum' or erase count.  The 'enum' could be amended
with a 'fatal', which is the current 'goto out_ec' path (or you need
another parameter).  Then, the current ubi_scan() could be,

	for (eb = 0; eb < mtd->eb_cnt; eb++) {
		uint32_t ec;
		ec = read_ehdr(mtd, fd, eb, &ech);
                switch(ec) {
                   ...
                /* Do stuff to 'si->... here. */
			break;
		case EB_FATAL:
			goto out_ec;

And then ubi_translate() could reuse the read_ehdr() to do the
'determine if a valid peb' part.  Ie, whether you should even read the
'vid'.

> By the way, I have to say this separating of UBI and UBIFS makes
> it really hard to read data from both sides.

You mean both layers at once?  Ie, layers == sides?  Or do you mean to
support reading from an 'mtd' or a 'ubi' device?

Regards,
Bill Pringlemeir.
