Received: from wx-out-0506.google.com ([66.249.82.236])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hh8NK-0000ck-23
	for linux-mtd@lists.infradead.org; Thu, 26 Apr 2007 14:07:28 -0400
Received: by wx-out-0506.google.com with SMTP id t8so681742wxc
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Apr 2007 11:07:18 -0700 (PDT)
Date: Fri, 27 Apr 2007 02:59:02 +0900
From: Seongsu Lee <senux@senux.com>
To: linux-mtd@lists.infradead.org
Subject: Re: FAT file system on NAND flash memory
Message-ID: <20070426175902.GA21492@pooky.senux.com>
References: <20070412134137.GA25860@pooky.senux.com>
	<625fc13d0704120655u2f452b12ge9315f47b951aa34@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <625fc13d0704120655u2f452b12ge9315f47b951aa34@mail.gmail.com>
Cc: Josh Boyer <jwboyer@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 12, 2007 at 08:55:23AM -0500, Josh Boyer wrote:
> On 4/12/07, Seongsu Lee <senux@senux.com> wrote:
> > Hi,
> >
> > In my knowledge, mtdblock.c must be used to use
> > FAT filesystem on bare NAND flash memories
> > because NFTL is made only for a specific hardware,
> > DiskOnChip.
> >
> > (Layer 0) VFS
> > (Layer 1) FAT (or EXT2, EXT3)
> > (Layer 2) mtdblock.c (nftl.c can be used only with DiskOnChip)
> > (Layer 3) NAND flash memory driver (vendor specific)
> > (Layer 4) Physical NAND flash memory
> >
> > Please let me know if it is wrong.
> 
> That layering is correct, but your results will be bad.  mtdblock
> doesn't handle bad blocks.  So if you have one in the middle of your
> filesystem, it will break things.  You need some kind of translation
> layer if you're going to use NAND.

Thank you for the reply. 

Just one more question.

Could you tell me the reason that there is no translation layer code
in MTD for bare flash memories? 
(Because of patent or copyright? or technical reason? I wonder.)

-- 
Seongsu's personal blog - http://www.senux.com/
Beauty may be skin deep, but ugly goes clear to the
bone. -- Redd Foxx
