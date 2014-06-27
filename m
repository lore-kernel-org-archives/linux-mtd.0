Received: from mail-qg0-x22c.google.com ([2607:f8b0:400d:c04::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X0SDj-0000rP-7g
 for linux-mtd@lists.infradead.org; Fri, 27 Jun 2014 09:13:24 +0000
Received: by mail-qg0-f44.google.com with SMTP id j107so4138235qga.3
 for <linux-mtd@lists.infradead.org>; Fri, 27 Jun 2014 02:13:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAE94FHHdznCqXMsrkFB6MDdDLaX7__v53myDgQj0yiSO-L6puw@mail.gmail.com>
References: <1403259137-22171-1-git-send-email-david@protonic.nl>
 <CAE94FHELXgoZ9Jm1E3_YT6D1SB=VAGWthZSjbsR+qqkUWn97PA@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAF6A08@DBDE04.ent.ti.com>
 <CAE94FHGNHDVygoviGgEtE2ZDyumjwa73tZiDnEBdSnnWCE03YQ@mail.gmail.com>
 <CAE94FHFvCoZyawRC=LL+PdBR3ig10crKJN6c_M_q=yGdOXnR9A@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAF7560@DBDE04.ent.ti.com>
 <CAE94FHHdznCqXMsrkFB6MDdDLaX7__v53myDgQj0yiSO-L6puw@mail.gmail.com>
Date: Fri, 27 Jun 2014 17:13:01 +0800
Message-ID: <CAE94FHH89FYc93J8DATYW4MMOaNCbgd9sz9XUY8YgHmqX3SaeA@mail.gmail.com>
Subject: Re: [FRC] [PATCH] MTD: nand_base.c: Enable support for Samsung E-die
 SLC NAND
From: Ted Juan <ted.juan@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Jander <david@protonic.nl>,
 "sjhill@realitydiluted.com" <sjhill@realitydiluted.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Pekon,


>
>> (b) Also, it may be the case that there few particular blocks which has gone
>> bad and those are is showing again and again at each boot. However, If it
>> was such a case that only some handful blocks on NAND device have gone
>> bad, then UBI torture test [1] should have detected them and marked them
>> bad. And those should not re-appear in next time.
>> - You can check (b) by scrubbing all bad-blocks from u-boot
>>   #u-boot> nand scrub.chip all
>>   #u-boot> nand bad  (should report 0 bad blocks)
>> - Then, re-boot and let UBI detect bad-blocks on its own using torture-test
>> - And then again reset the system 2nd time and check newly detected bad-blocks
>>   #u-boot> nand bad  (should report [n] bad blocks)
>>

I do the torture test in uboot.

Some block data was not correct as below , and it should be pattern '0x55'.

This block is not mask the bad, and sometimes the same block pass the
torture test.
Several blocks also have the same phenomenon.

So it seems the Nand Flash problem?

regards,
Ted

nand dump 6560000
Page 06560000 dump:
ff ff ff ff ff ff ff ff  ff ff 55 55 ff ff ff ff
01 55 55 55 55 55 ff ff  ff ff 55 55 ff ff ff ff
55 55 55 55 ff ff ff ff  ff ff 55 55 ff ff 55 55
ff ff 55 55 ff ff ff ff  ff ff ff ff 55 55 55 55
ff ff ff ff ff ff ff ff  ff ff 55 55 ff ff ff ff
55 51 55 55 55 55 ff ff  ff ff 55 55 ff ff ff ff
55 55 55 55 ff ff ff ff  ff ff 55 55 ff ff 55 55
ff ff 55 55 ff ff ff ff  ff ff ff ff 55 55 55 55
ff ff ff ff ff ff ff ff  ff ff 55 55 ff ff ff ff
55 55 55 55 55 55 ff ff  ff ff 55 55 ff ff ff ff
55 55 55 55 ff ff ff ff  ff ff 55 55 ff ff 55 55
ff ff 55 55 ff ff ff ff  ff ff ff ff 55 55 55 55
ff ff ff ff ff ff ff ff  ff ff 55 55 ff ff ff ff
55 54 55 55 45 51 ff ff  ff ff 55 55 ff ff ff ff
55 55 55 55 ff ff ff ff  ff ff 55 55 ff ff 55 55
ff ff 55 55 ff ff ff ff  ff ff ff ff 55 55 55 55
ff ff ff ff ff ff ff ff  ff ff 55 55 ff ff ff ff
55 55 55 55 55 55 ff ff  ff ff 55 55 ff ff ff ff
55 55 55 55 ff ff ff ff  ff ff 55 55 ff ff 55 55
ff ff 55 55 ff ff ff ff  ff ff ff ff 55 55 55 55
ff ff ff ff ff ff ff ff  ff ff 55 55 ff ff ff ff
45 55 55 55 55 55 ff ff  ff ff 55 55 ff ff ff ff
55 55 55 55 ff ff ff ff  ff ff 55 55 ff ff 55 55
ff ff 55 55 ff ff ff ff  ff ff ff ff 55 55 55 15
ff ff ff ff ff ff ff ff  ff ff 55 55 ff ff ff ff
55 55 55 55 55 51 ff ff  ff ff 55 55 ff ff ff ff
55 55 55 55 ff ff ff ff  ff ff 55 55 ff ff 55 55
ff ff 55 55 ff ff ff ff  ff ff ff ff 55 55 55 55
ff ff ff ff ff ff ff ff  ff ff 55 55 ff ff ff ff
55 51 55 55 55 55 ff ff  ff ff 55 55 ff ff ff ff
55 55 55 55 ff ff ff ff  ff ff 55 55 ff ff 55 55
ff ff 55 55 ff ff ff ff  ff ff ff 7f 55 55 55 55
55 55 ff ff 55 55 ff ff  ff ff ff ff 55 55 ff ff
ff ff ff ff 55 55 ff ff  ff ff ff ff ff ff ff ff
55 55 ff ff 55 55 55 55  55 55 55 55 55 55 ff ff
55 55 55 55 ff ff ff ff  55 55 ff ff 55 55 55 55
55 55 ff ff 55 55 ff ff  ff ff ff ff 55 55 ff ff
ff ff ff ff 55 55 ff ff  ff ff ff ff ff ff ff ff
55 55 ff ff 55 55 55 55  55 55 55 55 55 55 ff ff
55 55 55 55 ff ff ff ff  55 55 ff ff 55 55 55 55
55 55 ff ff 55 55 ff ff  ff ff ff ff 55 55 ff ff
ff ff ff ff 55 55 ff ff  ff ff ff ff ff ff ff ff
55 55 ff ff 55 55 55 55  55 55 55 55 55 55 ff ff
55 55 55 55 ff ff ff ff  55 55 ff ff 55 55 55 55
55 55 ff ff 55 55 ff ff  ff ff ff ff 55 55 ff ff
ff ff ff ff 55 55 ff ff  ff ff ff ff ff ff ff ff
55 55 ff ff 55 55 55 55  55 55 55 55 55 55 ff ff
55 55 55 55 ff ff ff ff  55 55 ff ff 55 55 55 55
55 55 ff ff 55 55 ff ff  ff ff ff ff 55 55 ff ff
ff ff ff ff 55 55 ff ff  ff ff ff ff ff ff ff ff
55 55 ff ff 55 55 55 55  55 55 55 55 55 55 ff ff
55 55 55 55 ff ff ff ff  55 55 ff ff 55 55 55 55
55 55 7f ff 55 55 ff ff  ff ff ff ff 55 55 ff ff
7f ff ff ff 55 55 ef ff  ff ff ff ff ff ff 7f ff
55 55 ff ff 55 55 55 55  55 55 55 55 55 55 ff ff
55 55 55 55 ff ff ff ff  55 55 ff ff 55 55 55 55
55 55 ff ff 55 55 ff ff  ff ff 7f ff 55 55 ff ff
ff ff ff ff 55 55 ff ff  7f ff ff ff ff ff ff ff
55 55 ff ff 55 55 55 55  55 55 55 55 55 55 ff ff
55 55 55 55 7f ff ff ff  55 55 ff ff 55 55 55 55
55 55 ff ff 55 55 ff ff  ff ff f7 ff 55 55 ff ff
ff ff ff ff 55 55 ff ff  f7 ff ff ff ff fb ff ff
55 55 ff ff 55 55 55 55  55 55 55 55 55 55 ff ff
55 55 55 55 f7 ff ff ff  55 55 ff ff 55 55 55 55
ff ff ff ff ff ff 55 55  ff ff 55 55 55 55 55 55
55 55 55 55 ff ff 55 55  ff ff ff ff 55 55 55 55
55 55 ff ff ff ff ff ff  55 55 55 55 ff ff ff ff
ff ff ff ff ff ff ff ff  55 55 55 55 55 55 ff ff
ff ff ff ff ff ff 55 55  ff ff 55 55 55 55 55 55
55 55 55 55 ff ff 55 55  ff ff ff ff 55 55 55 55
55 55 ff ff ff ff ff ff  55 55 55 55 ff ff ff ff
ff ff ff ff ff ff ff ff  55 55 55 55 55 55 ff ff
ff ff ff ff ff ff 55 55  ff ff 55 55 55 55 55 55
55 55 55 55 ff ff 55 55  ff ff ff ff 55 55 55 55
55 55 ff ff ff ff ff ff  55 55 55 55 ff ff ff ff
ff ff ff ff ff ff ff ff  55 55 55 55 55 55 ff ff
ff ff ff ff ff ff 55 55  ff ff 55 55 55 55 55 55
55 55 55 55 ff ff 55 55  ff ff ff ff 55 55 55 55
55 55 ff ff ff ff ff ff  55 55 55 55 ff ff ff ff
ff ff ff ff ff ff ff ff  55 55 55 55 55 55 ff ff
ff ff ff ff ff ff 55 55  ff ff 55 55 55 55 55 55
55 55 55 55 ff ff 55 55  ff ff ff ff 55 55 55 55
55 55 ff ff ff ff ff ff  55 55 55 55 ff ff ff ff
ff ff ff ff ff ff ff ff  55 55 55 55 55 55 ff ff
ff ff ff ff ff ff 55 55  ff ff 55 55 55 55 55 55
55 55 55 55 ff ff 55 55  ff ff ff ff 55 55 55 55
55 55 ff ff ff ff ff ff  55 55 55 55 ff ff ff ff
ff ff ff ff ff ff ff ff  55 55 55 55 55 55 ff ff
ff ff ff ff ff ff 55 55  ff ff 55 55 55 55 55 55
55 55 55 55 ff ff 55 55  ff ff ff ff 55 55 55 55
55 55 ff ff ff ff ff ff  55 55 55 55 ff ff ff ff
ff ff ff ff ff ff ff ff  55 55 55 55 55 55 ff ff
ff ff ff ff ff ff 55 55  ff ff 55 55 55 55 55 55
55 55 55 55 ff ff 55 55  ff ff ff ff 55 55 55 55
55 55 ff ff ff ff ff ff  55 55 55 55 ff ff ff ff
ff ff ff ff ff ff ff ff  55 55 55 55 55 55 ff ff
55 55 55 55 ff ff 55 55  55 55 55 55 ff ff 55 55
55 55 ff ff ff ff ff ff  55 55 ff ff ff ff 55 55
ff ff ff ff ff ff ff ff  55 55 55 55 55 55 55 55
ff ff ff ff 55 55 ff ff  55 55 ff ff ff ff 55 55
55 55 55 55 ff ff 55 55  55 55 55 55 ff ff 55 55
55 55 ff ff ff ff ff ff  55 55 ff ff ff ff 55 55
ff ff ff ff ff ff ff ff  55 55 55 55 55 55 55 55
ff ff ff ff 55 55 ff ff  55 55 ff ff ff ff 55 55
55 55 55 55 ff ff 55 55  55 55 55 55 ff ff 55 55
55 55 ff ff ff ff ff ff  55 55 ff ff ff ff 55 55
ff ff ff ff ff ff ff ff  55 55 55 55 55 55 55 55
ff ff ff ff 55 55 ff ff  55 55 ff ff ff ff 55 55
55 55 55 55 ff ff 55 55  55 55 55 55 ff ff 75 55
55 55 ff ff ff ff ff ff  55 55 ff ff ff ff 55 55
ff ff ff ff ff ff ff ff  55 55 55 55 55 55 55 55
ff ff ff ff 55 55 ff ff  55 55 ff ff ff ff 55 55
55 55 55 55 ff ff 55 55  15 55 55 55 ff ff 55 55
55 55 ff ff ff ff ff ff  55 55 ff ff ff ff 55 55
ff ff ff ff ff ff ff ff  55 55 55 55 55 55 55 55
ff ff ff ff 55 55 ff ff  55 55 ff ff ff ff 55 55
55 55 55 55 ff ff 55 55  55 55 55 55 ff ff 55 55
55 55 ff ff ff ff ff ff  55 55 ff ff ff ff 55 55
ff ff ff ff ff ff ff ff  55 55 55 55 55 55 55 55
ff ff ff ff 55 55 ff ff  55 55 ff ff ff ff 55 55
55 55 55 55 ff ff 55 55  55 55 55 55 ff ff 55 55
55 55 ff ff ff ff ff ff  55 55 ff ff ff ff 55 55
ff ff ff ff ff ff ff ff  55 55 55 55 55 55 55 55
ff ff ff ff 55 55 ff ff  55 55 ff ff ff ff 55 55
55 55 55 55 ff ff 55 55  55 55 55 55 ff ff 55 55
55 55 ff ff ff ff ff ff  55 55 ff ff ff ff 55 55
ff ff ff ff ff ff ff ff  55 55 55 55 55 55 55 55
ff ff ff ff 55 55 ff ff  55 55 ff ff ff ff 55 55
OOB:
ff ff ff dd 57 ff ff df
ff 7d ef 3e f5 ea ff 00
fe cd eb af d8 ff ff eb
ff 7f bf ff ff aa ff cd
43 af fa ff d7 ff f7 ff
f5 e0 27 00 fd dd eb 5d
dd ff d2 ff ff 7f ff ff
05 00 ff ff ff ff ff ff
