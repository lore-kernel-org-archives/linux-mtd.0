Received: from relay2.mail.timico.net ([62.121.20.90] helo=relay.timico.net)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oyav0-0003Ui-QA
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 01:48:15 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: Mike Frysinger <vapier@gentoo.org>, "dedekind1@gmail.com"
	<dedekind1@gmail.com>
Content-Class: urn:content-classes:message
Date: Thu, 23 Sep 2010 02:48:08 +0100
Subject: RE: [PATCH] nandwrite: add --nobad to write bad blocks
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE093ED5FAA1@Cloud.RL.local>
In-Reply-To: <AANLkTin+2ocUT_NMToGHoAhX5=Trn2CdLFmiMBmvSVuC@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

linux-mtd-bounces@lists.infradead.org wrote:
> it is completely artificial.  as you said yourself, it is "not
> necessarily writable".  that means i should be able to tell the
> hardware "do XXX" and let the hardware do it.  instead, i'm stuck with
> userspace utils that say "no, you cant do that".

As Artem is thinking about it, I'll just chip in with a "me too".

By all means the default should protect you from doing potentially
stupid and dangerous things. But these are low level utilities for
people who know what they are doing, having a "safeties off" option
makes a lot of sense.

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
