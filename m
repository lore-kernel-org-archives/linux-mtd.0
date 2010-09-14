Received: from relay1.mail.timico.net ([62.121.20.91] helo=relay.timico.net)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OvKi3-000298-9E
	for linux-mtd@lists.infradead.org; Tue, 14 Sep 2010 01:53:24 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: Mike Frysinger <vapier.adi@gmail.com>
Content-Class: urn:content-classes:message
Date: Tue, 14 Sep 2010 02:53:18 +0100
Subject: RE: linux equivalent of u-boot's "nand scrub" (erasing blocks even
	whenOOB says "bad")
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE0903E3E5A5@Cloud.RL.local>
In-Reply-To: <AANLkTim=Fi_-kwaHSpF1OXMVv79xugnigMK7=bzQmE=s@mail.gmail.com>
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

Mike Frysinger wrote:
> i dont have any devices that have dedicated software BBTs.  i'm
> concerned with just the forced erasing of blocks since the rest works
> for me already (forced reading and writing).  the ability to change
> the definition of the OOB is apparently "deprecated" now, so i cant
> fix things on the fly there.

Not quite sure what you mean by the last part. I have used raw writes with =
OOB, software-generated ECC and altered layout of flash pages, to good effe=
ct.

I'm don't know what's deprecated, although the kind of hackery I am doing I=
 wouldn't expect to be encouraged by the API. I do, however, appreciate whe=
n such things are possible. Especially on embedded, I don't want a kernel A=
PI thinking it knows best about, f.ex., allowing me to erase and rewrite th=
e BBT. Stopping me doing it by accident is fine. Making it impossible is a =
pain.

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
