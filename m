Received: from anubis.se.axis.com ([195.60.68.12])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SSOLD-0000E7-0Q
 for linux-mtd@lists.infradead.org; Thu, 10 May 2012 08:03:15 +0000
Date: Thu, 10 May 2012 09:51:25 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: "Philip, Avinash" <avinashphilip@ti.com>
Subject: RE: mtd oob test is failing consistently at same places in NAND flash
In-Reply-To: <518397C60809E147AF5323E0420B992E3E936732@DBDE01.ent.ti.com>
Message-ID: <Pine.LNX.4.64.1205100944310.27120@lnxricardw.se.axis.com>
References: <518397C60809E147AF5323E0420B992E3E934BF1@DBDE01.ent.ti.com>
 <20120508132354.GA16164@parrot.com>
 <518397C60809E147AF5323E0420B992E3E934DD0@DBDE01.ent.ti.com>
 <20120508184516.GA16380@parrot.com>
 <518397C60809E147AF5323E0420B992E3E9366EF@DBDE01.ent.ti.com>
 <20120509152437.GA12280@parrot.com>
 <518397C60809E147AF5323E0420B992E3E936732@DBDE01.ent.ti.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Ivan Djelic <ivan.djelic@parrot.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 9 May 2012, Philip, Avinash wrote:

> Basically I am testing why bit flips is happening in OOB area. Some obser=
vation related
> to mtd_oob test in the setup we are having is
> 1. Modify mtd_oob test to write patterns (0x0, 0x55, 0xAA, 0xff), then te=
st is getting passed
> for all patterns.
> 2. On inserting a delay of 10 ms after erase_whole_device() in mtd oob te=
st, test is getting passed.
>
> I can't correlate how test is getting passed on modifying pattern as we a=
re covering all bits in
> either of the patterns.
>
> On inserting delay test is getting passed, will point to me some problems=
 in command issue. I am
> debugging on this.

We've had problems with bus buffers between the CPU and flash not being=20
fast enough. The symptoms were similar to what is described above, certain=
=20
patterns would fail, whereas others wouldn't. When a given byte failed, it=
=20
depended on what the previous byte on the bus was if I remember correctly,=
=20
in some pattern that we never bothered do find out. We upgraded the bus=20
drivers and changed the CPU timing towards the flash which cleared up the=
=20
problem.

One symptom was that the probability of errors changed drastically when=20
the temperature was changed. It also varied a lot between individual=20
devices.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
