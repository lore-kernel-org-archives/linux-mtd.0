Received: from na3sys009aog108.obsmtp.com ([74.125.149.199])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QR1au-00087h-Al
	for linux-mtd@lists.infradead.org; Mon, 30 May 2011 12:29:17 +0000
Received: by mail-vx0-f181.google.com with SMTP id 39so3350985vxb.40
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 May 2011 05:29:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTik+35hH5ADOGJ+qXtVJjtPd_AKz3g@mail.gmail.com>
References: <BANLkTik+35hH5ADOGJ+qXtVJjtPd_AKz3g@mail.gmail.com>
Date: Mon, 30 May 2011 08:29:13 -0400
Message-ID: <BANLkTin9hvdNCMeVRSj806R19obN_91v5w@mail.gmail.com>
Subject: Re: ubifs_decompress: cannot decompress ...
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: "Matthew L. Creech" <mlcreech@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: MTD list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Matthew,

On Fri, May 27, 2011 at 5:12 PM, Matthew L. Creech <mlcreech@gmail.com> wrote:
> We encountered a device which has the following error:
>
> UBIFS error (pid 428): ubifs_decompress: cannot decompress 1010 bytes,
> compressor lzo, error -22
> UBIFS error (pid 428): read_block: bad data node (block 388, inode 556196)
> UBIFS error (pid 428): do_readpage: cannot read page 388 of inode
> 556196, error -22
> UBIFS error (pid 428): ubifs_decompress: cannot decompress 1010 bytes,
> compressor lzo, error -22
> UBIFS error (pid 428): read_block: bad data node (block 388, inode 556196)
> UBIFS error (pid 428): do_readpage: cannot read page 388 of inode
> 556196, error -22

It looks like the lzo.c decompress function lzo_decompress() maps all
non-ok return codes from lzo1x_decompress_safe() to -EINVAL (-22). So
any one of the possible failures of the decompressor could cause the
error you are observing.

I don't see any debug statements in lzo1x_decompress_safe() that can
be enabled, so you might want to add some printing to
lzo1x_decompress_safe() or at least print the non-ok return code of
lzo1x_decompress_safe() in lzo_decompress() to get an idea of how the
decompressor is failing.

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca
