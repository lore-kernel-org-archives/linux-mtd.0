Received: from relay2.mail.timico.net ([62.121.20.90] helo=relay.timico.net)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P19jv-0002DP-ON
	for linux-mtd@lists.infradead.org; Thu, 30 Sep 2010 03:23:24 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: Iwo Mergler <iwo@call-direct.com.au>
Content-Class: urn:content-classes:message
Date: Thu, 30 Sep 2010 04:23:15 +0100
Subject: RE: [PATCH] nandwrite: add --nobad to write bad blocks
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE093EE3E0B7@Cloud.RL.local>
In-Reply-To: <4CA3CF60.5060705@call-direct.com.au>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Mike Frysinger <vapier@gentoo.org>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Iwo Mergler wrote:
> Jon Povey wrote:
> Although I would always use an in-flash BBT for this kind of
> situation. As you say, there are bootloaders, filesystems and
> hardware ECC that will only work if you re-purpose the bad block
> marker region in the OOB.
>
> In such a case, just do the bad block scan once, at production time,
> and write the BBT. Then change everything else to use that BBT. And
> you leave the BBT alone during reflash.

I agree this is a nice way to do it, if it's practical.

> In the case you describe, I would use the old BBT to create the
> new one directly, without attempting to write to the bad blocks.

That's what I did, but note mtd won't allow you to rewrite the BBTs,
they are hardwired to be off-limits in the kernel. So, you have to
do something like write a new bootloader that can translate it on
reboot. Happily that has been OK for me, but it's not ideal, and one
may be in a position where that is difficult (restricted code size for
bootloader and such)

The inability to rewrite the BBT from linux is a separate issue though.

>> Either way, I for one need to do these kind of low-level hacks, and
>> if mtd kernel or utils have policy hardwired into them, happily I
>> have the source and a compiler and can fix that locally.
>
> I agree. I only wrote what I did to maybe contribute to the
> documentation. There seemed to be the sentiment that the tools
> only skiped bad blocks because of some silly tradition.
>
> I'm all in favour of adding the feature.

Ah, I thought you were against it.
Jolly good.

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
