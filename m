Received: from msr38.hinet.net ([168.95.4.138] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16t1s1-0005Mw-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Apr 2002 08:41:21 +0100
Received: from steve2000 (61-217-122-141.HINET-IP.hinet.net [61.217.122.141])
	by msr.hinet.net (8.9.3/8.9.3) with SMTP id PAA08560
	for <linux-mtd@lists.infradead.org>; Thu, 4 Apr 2002 15:41:17 +0800 (CST)
Message-ID: <00b001c1dbac$23abbd00$5501a8c0@synso.com.tw>
From: "Steve Tsai" <startec@ms11.hinet.net>
To: <linux-mtd@lists.infradead.org>
References: <008801c1dba7$55a5b8b0$5501a8c0@synso.com.tw> <1017905022.23995.13.camel@pcjonashg>
Subject: Re: how to use amd_flash.c
Date: Thu, 4 Apr 2002 15:41:31 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi Jonas,

Thanks. I know how to add codes to amd_flash.c, but I can not make kernel
run amd_flash_probe(). I used jffs1 and flash.c on my board from AXIS before
and it works fine. Now I want ot port uClinux 2.4.17 to my board and I plan
to use jffs2 and mtd, but I found it is more complicated.  The flash I use
is not CFI compliance, so I am not sure I can use jedec_probe + CFI-driver.
I modified amd_flash.c already, but the kernal can not probe the flash at
start time. Should I call do_map_probe in somewhere to find out the flash?

Steve


> On Thu, 2002-04-04 at 09:07, Steve Tsai wrote:
> > I'd want to use mtd and jffs2 in our ARM7  board.  The flash is
MX29LV160B/T
> > and it is similar to am29LV160, but it does not support CFI. How many
files
> > do I to modify or add to mtd tree? It seems I can modify amd_flash.c to
fit
> > my flash, but I can not probe the chip at booting time. Does anyone know
how
> > to use amd_flash.c? thanks.
>
> You need to find out the manufacturer ID and device ID for your chip. It
> can usually be found in some datasheet at the manufacurer's site. Then
> add an element to the amd_flash_info table[] in amd_flash_probe().
>
> But the amd_flash driver is obsolete and you should use jedec_probe
> instead. It works about the same way as amd_flash_probe. The only thing
> that amd_flash does better than jedec_probe + CFI-driver is that it
> handles different types of chips in the same map. But with the new MTD
> concat layer you don't need to use amd_flash in that case either.
>
> /Jonas
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
