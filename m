Received: from relay2.mail.timico.net ([62.121.20.90] helo=relay.timico.net)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P0qaq-0007Fx-Kr
	for linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 06:56:46 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: Iwo Mergler <iwo@call-direct.com.au>, Mike Frysinger <vapier@gentoo.org>
Content-Class: urn:content-classes:message
Date: Wed, 29 Sep 2010 07:56:35 +0100
Subject: RE: [PATCH] nandwrite: add --nobad to write bad blocks
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE093ED6015C@Cloud.RL.local>
In-Reply-To: <4CA2B3E9.3030707@call-direct.com.au>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

linux-mtd-bounces@lists.infradead.org wrote:
> Mike Frysinger wrote:
>> i'm open to logic, but i cant figure out your side.  all i can see is
>> "it's been this way" and "we shouldnt write bad blocks".  but both
>> sound like policies that the end user should have control over rather
>> than the userspace utils always enforcing.  so if you feel i've
>> missed something, please highlight it.
>
> Hi Mike,
>
> while I agree with the philosophy to allow users to shoot
> themselves in the foot if they really like that sort of thing,
> the "don't touch bad blocks" rule makes sense and it's not
> necessarily obvious.

[manufacturer-marked bad blocks]

> Thus the rule about not touching bad blocks. It's the only
> way to make sure that you don't end up with a batch of products
> that will die on the shelf, after you successfully tested them.

I can't speak for Mike, but I have run into a few situations where
blocks were marked bad incorrectly. For example, the ROM bootloader of
a chip I work with requires a different OOB layout to that specified by
the NAND flash manufacturer, so to write the second-stage bootloader
you must write data into what is, as far as the NAND maker is concerned,
the OOB area. Then when u-boot or Linux loads, it finds no BBT, scans
the bootloader, finds non-FF OOB and marks it bad.

These blocks are NOT really bad, and as engineers who know what we are
doing, we need to be able to rewrite these for firmware upgrades and
so on.

There are also situations of upgrading to new firmware that uses a
different OOB layout (yes it's perverted, and yes I have been there),
maybe we know a block is bad but it's full of FF, we are going to
reboot and rebuild the BBT, we want to write a bad block marker in
the new OOB - we need to be able to write the bad block.

imo, the mtd-utils are low-level and specialist enough that allowing
a --yes-i-really-know-what-i-am-doing kind of flag makes sense.
Perhaps that support could even be an #ifdef, disabled by default.

Yes, someone using it has to really know what they are doing, including
being aware of manufacturer-marked bad blocks.

Either way, I for one need to do these kind of low-level hacks, and if
mtd kernel or utils have policy hardwired into them, happily I have
the source and a compiler and can fix that locally.

--
Jon Povey
jon.povey@racelogic.co.uk

Racelogic is a limited company registered in England. Registered number 274=
3719 .
Registered Office Unit 10, Swan Business Centre, Osier Way, Buckingham, Buc=
ks, MK18 1TB .

The information contained in this electronic mail transmission is intended =
by Racelogic Ltd for the use of the named individual or entity to which it =
is directed and may contain information that is confidential or privileged.=
 If you have received this electronic mail transmission in error, please de=
lete it from your system without copying or forwarding it, and notify the s=
ender of the error by reply email so that the sender's address records can =
be corrected. The views expressed by the sender of this communication do no=
t necessarily represent those of Racelogic Ltd. Please note that Racelogic =
reserves the right to monitor e-mail communications passing through its net=
work
