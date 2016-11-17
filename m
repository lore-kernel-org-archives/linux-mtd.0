Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7GA0-000187-0D
 for linux-mtd@lists.infradead.org; Thu, 17 Nov 2016 06:27:00 +0000
Received: by mail-wm0-x231.google.com with SMTP id g23so288878781wme.1
 for <linux-mtd@lists.infradead.org>; Wed, 16 Nov 2016 22:26:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1476628518-20450-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1476628518-20450-1-git-send-email-boris.brezillon@free-electrons.com>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Thu, 17 Nov 2016 14:26:37 +0800
Message-ID: <CAAyFORJYaNysioJDfjPyYKx0Eh4yvgrM3GHz8e=4J1Pcdc5-Eg@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] mtd: nand: Abstract away the NAND interface type
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-kernel@vger.kernel.org,
 "peterpandong@micron.com" <peterpandong@micron.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Sun, Oct 16, 2016 at 10:35 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Hi,
>
> This series is aiming at providing a generic NAND layer to share code
> between different NAND based devices.
>
> We currently have 3 different interfaces to interact with NANDs:
> - Raw NANDs
> - OneNANDs
> - SPI NANDs
>
> Apart from the way these NAND devices are accessed they have a lot
> in common, like the way the memory is organized, or their constraints.
> This is usually a good sign that some work should be done to factorize
> the code.
>
> This work has been started by Peter who wanted to re-use the BBT
> code for its SPI-NAND driver. But I think we can push it further
> other stuff (the software ECC implementation, or the way offsets are
> converted to block/page number).
>
> Peter, can you please review/test this version, and if possible, post
> the code you've done to support SPI NANDs.
>

I already finished review and test work. The BBT works well after I applied
my modification which I already sent to your by email. I tried to build a new
BBT on a new NAND and then mark one block to bad. Both works well.
My test platform is Xilinx Zed board.

I will try to rebase my SPI NAND patch on your patch and send it out.
It will take me some time because I'm quite busy with other company affairs.


Thanks,
Peter Pan
