Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZjSGv-0003Nq-8f
 for linux-mtd@lists.infradead.org; Tue, 06 Oct 2015 13:27:13 +0000
Received: by wiclk2 with SMTP id lk2so159179274wic.1
 for <linux-mtd@lists.infradead.org>; Tue, 06 Oct 2015 06:26:51 -0700 (PDT)
Date: Tue, 6 Oct 2015 14:26:47 +0100
From: Brian Norris <computersforpeace@gmail.com>
To: ispamyou <ispamyou@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Kernel segfault when using nandsim on Debian kernel 4.1
Message-ID: <20151006132647.GA26818@localhost>
References: <CAKA5=i-JCDkYAfwLde=QhCSg7E4y-7cXDLMKhy2A_Pd1oPDnOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKA5=i-JCDkYAfwLde=QhCSg7E4y-7cXDLMKhy2A_Pd1oPDnOA@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 01, 2015 at 08:25:04AM +0800, ispamyou wrote:
> Hi,
> 
> when I try and use nandsim to emulate "SDTNRGAMA 64G 3.3V 8-bit" using
> the following command I get a segmentation fault:
> 
> modprobe nandsim id_bytes=0x45,0xde,0x94,0x93,0x76,0x50 cache_file=./test.img
> 
> [  142.734637] [nandsim] warning: read_byte: unexpected data output
> cycle, state is STATE_READY return 0x0
> [  142.734637] [nandsim] warning: read_byte: unexpected data output
> cycle, state is STATE_READY return 0x0
> [  142.734640] nand: device found, Manufacturer ID: 0x45, Chip ID: 0xde
> [  142.734641] nand: SanDisk SDTNRGAMA 64G 3.3V 8-bit
> [  142.734644] nand: 8192 MiB, MLC, erase size: 4096 KiB, page size:
> 16384, OOB size: 1280
> [  142.734650] nand: No oob scheme defined for oobsize 1280

^^ this is the key

> [  142.734672] ------------[ cut here ]------------
> [  142.734674] kernel BUG at
> /build/linux-PoJsUp/linux-4.1.6/drivers/mtd/nand/nand_base.c:3952!

^^ and this too. You could look up your source code to find the exact
code context that triggers this BUG().

[...]

> I have also witnessed this segmentation fault on Ubuntu 14.04 LTS with
> an older kernel (3.19).
> 
> Is there any more information I can provide to try and help fix this issue?

The problem is that nand_base doesn't provide a default ECC layout for
odd/large OOB sizes on soft (Hamming) ECC (the default for nandsim). If
you want to use odd OOB sizes, I think you'll have better luck with soft
BCH, which generates ECC layouts dynamically. You can get this by using
the 'bch' module parameter to nandsim. See 'modinfo nandsim'.

Brian
