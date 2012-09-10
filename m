Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TB1HQ-0002vs-1L
 for linux-mtd@lists.infradead.org; Mon, 10 Sep 2012 10:31:48 +0000
Received: by lbbgf7 with SMTP id gf7so1069631lbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 10 Sep 2012 03:31:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN0F+aWY_3GC4Arj+Zj97RJhy-7C7TT0dP2gERw=-WD3vhd6Sg@mail.gmail.com>
References: <CAN0F+aWY_3GC4Arj+Zj97RJhy-7C7TT0dP2gERw=-WD3vhd6Sg@mail.gmail.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 10 Sep 2012 12:31:23 +0200
Message-ID: <CACQ1gAgqBS-v5hSD5Lt7wWVzSC9BEiAfUU83uviBta63yWoAVQ@mail.gmail.com>
Subject: Re: lseek32 and lseek64
To: Cheney Chen <cheneychencl2012@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[forwarding to linux-mtd ML]
2012/9/10 Cheney Chen <cheneychencl2012@gmail.com>:
> Dear Richard,
>
> I'm a developer on android os. I porting the MTD utility into android os and
> I find one bug for 8GB nand flash:
>
> # ./ubiformat /dev/ubi0_0
>
> If ubi0_0 offset is larger than 4GB, this partition can't be formatted.
> Finally I found that the 32bit lseek function cause this issue in
> mtd-utility. Becuase the linux kernel 3.0.8 can support the 64bit lseek.
>

Hi,
AFAIK, ubiformat is used on mtd devices (ubiformat /dev/mtd0) not on
ubi volumes.
are you sure it's the command you used ?
