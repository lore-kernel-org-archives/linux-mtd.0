Received: from mu-out-0910.google.com ([209.85.134.185])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hbzls-00023F-Bp
	for linux-mtd@lists.infradead.org; Thu, 12 Apr 2007 09:55:34 -0400
Received: by mu-out-0910.google.com with SMTP id w1so597892mue
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Apr 2007 06:55:29 -0700 (PDT)
Message-ID: <625fc13d0704120655u2f452b12ge9315f47b951aa34@mail.gmail.com>
Date: Thu, 12 Apr 2007 08:55:23 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Seongsu Lee" <senux@senux.com>
Subject: Re: FAT file system on NAND flash memory
In-Reply-To: <20070412134137.GA25860@pooky.senux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20070412134137.GA25860@pooky.senux.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/12/07, Seongsu Lee <senux@senux.com> wrote:
> Hi,
>
> In my knowledge, mtdblock.c must be used to use
> FAT filesystem on bare NAND flash memories
> because NFTL is made only for a specific hardware,
> DiskOnChip.
>
> (Layer 0) VFS
> (Layer 1) FAT (or EXT2, EXT3)
> (Layer 2) mtdblock.c (nftl.c can be used only with DiskOnChip)
> (Layer 3) NAND flash memory driver (vendor specific)
> (Layer 4) Physical NAND flash memory
>
> Please let me know if it is wrong.

That layering is correct, but your results will be bad.  mtdblock
doesn't handle bad blocks.  So if you have one in the middle of your
filesystem, it will break things.  You need some kind of translation
layer if you're going to use NAND.

josh
