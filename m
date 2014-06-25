Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wzlo3-00037s-NT
 for linux-mtd@lists.infradead.org; Wed, 25 Jun 2014 11:56:04 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: David Jander <david.jander@protonic.nl>
Subject: RE: [FRC] [PATCH] MTD: nand_base.c: Enable support for Samsung
 E-die SLC NAND
Date: Wed, 25 Jun 2014 11:55:26 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAF7689@DBDE04.ent.ti.com>
References: <1403259137-22171-1-git-send-email-david@protonic.nl>
 <CAE94FHELXgoZ9Jm1E3_YT6D1SB=VAGWthZSjbsR+qqkUWn97PA@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAF6A08@DBDE04.ent.ti.com>
 <CAE94FHGNHDVygoviGgEtE2ZDyumjwa73tZiDnEBdSnnWCE03YQ@mail.gmail.com>
 <CAE94FHFvCoZyawRC=LL+PdBR3ig10crKJN6c_M_q=yGdOXnR9A@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAF7560@DBDE04.ent.ti.com>
 <20140625133129.060cd535@archvile>
In-Reply-To: <20140625133129.060cd535@archvile>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ted Juan <ted.juan@gmail.com>,
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

Hi David,

>From: David Jander [mailto:david.jander@protonic.nl]
>>"Gupta, Pekon" <pekon@ti.com> wrote:
>> >From: Ted Juan [mailto:ted.juan@gmail.com]
>> >Dear Pekon,
>> >
>> >I backup the raw data to data2[] before doing elm_decode_bch_error_page=
();
>> >Dump  code is as below. The raw data is the same with the correction
>> >data that all more than 8 bit-flips.
>> >
>> (a) In that case you should contact the Flash vendor here.
>> Fresh NAND device from factory should not violate the spec.
>> I don't suspect a driver issue here, because the raw data read itself
>> has random bit-flips.
>
>Sorry to interrupt, but this does sound serious. Are you absolutely sure y=
our
>hardware is OK? Is the power-supply clean and well enough decoupled? Timin=
gs
>within specs? If electrical specifications are not met, this could explain=
 the bit-flips.
>
I don't have the hardware (board), I'm just  helping Ted as I'm actively
involved with OMAP NAND drivers from TI side. Ted is the original developer
working on this board.
However, I don't suspect this to be board supply or noise issue because:
(1) A timing mis-match would cause read-failure for whole word,
  not just few bits in the word.
(2) Also, power-supply noise would not cause bit-flips in erased-page,
 Because erase operation inside flash is usually driver by charged-pumps
 so a dynamic supply noise may not cause random bit-flips. Though it can
can erase-failures, which will be detected on reading STATUS register.

> It is possible that Samsung is at fault here (they screwed up the specs f=
or this
>version anyway), but double checking the hardware looks like a good idea
>here...
>
Agree. But hardware issue will be difficult to identify and debug.

Ted,
Plz relax timing by 10-20% and check if that makes a difference.


with regards, pekon
