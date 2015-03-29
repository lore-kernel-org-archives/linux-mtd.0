Received: from mail-qc0-f176.google.com ([209.85.216.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YcMlf-0007XI-65
 for linux-mtd@lists.infradead.org; Sun, 29 Mar 2015 23:37:24 +0000
Received: by qcay5 with SMTP id y5so57782333qca.1
 for <linux-mtd@lists.infradead.org>; Sun, 29 Mar 2015 16:37:00 -0700 (PDT)
Message-ID: <55188BFD.5070908@vanguardiasur.com.ar>
Date: Sun, 29 Mar 2015 20:34:21 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Gabriel Dobato <dobatog@gmail.com>, linux-arm-kernel@lists.infradead.org,
 "mt >> linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Fwd: Ask for help: ARM: mvebu: add NAND support for dove
References: <551713D8.3060809@gmail.com> <551714F8.2050401@gmail.com>
In-Reply-To: <551714F8.2050401@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: Jean-Francois Moine <moinejf@free.fr>, ezequiel.garcia@free-electrons.com,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 03/28/2015 05:54 PM, Gabriel Dobato wrote:
[..]
> However, if I try to read/write into the mtd partitions, I can not,
> there are errors:
> 
> root@debug:~# nandwrite -p /dev/mtd0 /uImage
> Writing at 0x00000000
> pxa3xx-nand f10c0000.nand: Wait time out!!!
> 
> root@debug:~# flash_erase /dev/mtd0 0 0
> Erasing 128 Kibyte @ 0 --  0 % complete pxa3xx-nand f10c0000.nand: Wait
> time out!!!
> 
> root@debug:~# cat /dev/mtd0
> pxa3xx-nand f10c0000.nand: Wait time out!!!
> 

Maybe a silly question, but does your bootloader initializes the
controller? Are you able to read/write/erase using it?

The current pxa3xx-nand driver relies on that for Armada370/XP, as
timing setup is not properly handled.

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
