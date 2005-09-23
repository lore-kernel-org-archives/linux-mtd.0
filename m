Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EIkRi-0001ns-66
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2005 06:06:51 -0400
Message-ID: <4333D37A.1020900@yandex.ru>
Date: Fri, 23 Sep 2005 14:05:46 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Peter Menzebach <pm-mtd@mw-itcon.de>
References: <4333D014.8000809@mw-itcon.de>
In-Reply-To: <4333D014.8000809@mw-itcon.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Minimum/optimal sector_size for jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Peter Menzebach wrote:
> Hi,
> since my grep through the source code was not successful:
> Is there a minimum possible jffs2_sb_info.sector_size and somewhere a 
> definition?
There is probably no minimum value, but not because it doesn't matter, 
just because nobody cared adding a check.

> Is there somewhat like an optimal sector_size?
Not sure about optimal, probably yes. Consider the following aspects:

1. There is an array (c->blocks[]) with one element per eraseblock. The 
smaller is yur eraseblock - the larger is the array.

2. The eraseblock size cannot be less then PAGE_SIZE + sizeof(struct 
jffs2_raw_inode). PAGE_SIZE is mostly 4096 bytes.

3. The space at the end of eraseblock is not used if there are less then 
JFFS2_MIN_DATA_LEN bytes, or if the node beinf written does not fit that 
space. So, the smaller is the eraseblock, the more space is wasted.

> I have here a device (dataflash), which has a very small
> erase/write page size (1056 bytes).
Err, AFAIR, I explained why you cannot use 1056 bytes eraseblocks... It 
is simply too small.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
