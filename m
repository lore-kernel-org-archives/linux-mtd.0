Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jy128-0005Hx-NI
	for linux-mtd@lists.infradead.org; Mon, 19 May 2008 08:47:53 +0000
Date: Mon, 19 May 2008 18:47:46 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: dedekind@infradead.org, linux-mtd@lists.infradead.org
Subject: ubiupdatevol from pipe/compressed file
Message-ID: <20080519084746.GA19325@cloud.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We discussed this briefly a few months back but I want to investigate a
bit further.

I would like to be able to update a ubi volume from a compressed file.
My system has limited RAM so I can't always keep the whole file
uncompressed in RAM, and I'd prefer not to uncompress it to temporary
space on flash, just to copy it somewhere else.

I'm doing this on a block device with "zcat img.gz | dd of=..." but
ubiupdatevol doesn't accept a pipe.

Reading the source this looks quite difficult to fix - it really must
know how many bytes are to be programmed in advance because it
communicates that to the kernel.

One solution I see is to add decompression support directly into
ubiupdatevol. eg with zlib it can gzseek() to the end of the file to get
the length, then rewind. I modified flashcp once to do this. However I
prefer to use better compression (lzma or bzip2) and we don't want to
add all of these to mtd-utils I think.

Alternatively allow the uncompressed file size to be specified as a
ubiupdatevol parameter. In my application I can store the uncompressed
file size and provide it to ubiupdatevol ok.

Artem, do you have any other ideas?

Thanks
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
