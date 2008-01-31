Received: from py-out-1112.google.com ([64.233.166.182])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JKfJC-0002z0-H9
	for linux-mtd@lists.infradead.org; Thu, 31 Jan 2008 19:42:56 +0000
Received: by py-out-1112.google.com with SMTP id p76so1257029pyb.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 31 Jan 2008 11:42:48 -0800 (PST)
Message-ID: <f383264b0801311142h3cbcbc91pb4e0d3a60fc78f4f@mail.gmail.com>
Date: Thu, 31 Jan 2008 11:42:47 -0800
From: "Matt Reimer" <mattjreimer@gmail.com>
To: llandre <r&d2@dave-tech.it>
Subject: Re: JFFS2: file contents in case of data CRC error
In-Reply-To: <47A1FD3F.2020102@dave-tech.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <47A1FD3F.2020102@dave-tech.it>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Jan 31, 2008 8:54 AM, llandre <r&d2@dave-tech.it> wrote:
> I have a JFFS2 partition on 32MByte NAND device.
> When reading a specific file - see below for details - JFFS2 reports a
> Data CRC error but function nand_correct_data never returns -1, so I
> assume ECC algorithm is able to correct errors.
> However the file is not equal to the original one that has been written
> to NAND. In fact, in the middle of the file, I see a 4-kByte "hole"
> where all bytes are 0.
> Anybody can help me about understanding if this is the expected
> behaviour of JFFS2?
> Thanks in advance.

I saw exactly this problem on an s3c2440 board back in October. It
turned out that the ECC correction code in the s3c2410 driver was
incorrect in a couple of ways, resulting in corrupt data being passed
up to JFFS2. I'm not sure, but I think what happened from there is
that JFFS2 failed to decompress a block and instead of returning an
error it left the page zeroed. You can use jffs2dump to correlate the
offset reported in the CRC error with the problematic inode. Check the
thread "bit flip" in October 2007.

What platform is this on?

Matt
