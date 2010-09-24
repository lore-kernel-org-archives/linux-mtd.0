Received: from relay1.mail.timico.net ([62.121.20.91] helo=relay.timico.net)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oz130-0006mU-74
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 05:42:15 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: Mike Frysinger <vapier@gentoo.org>
Content-Class: urn:content-classes:message
Date: Fri, 24 Sep 2010 06:42:09 +0100
Subject: RE: [PATCH 4/4] mtd-utils: unify flash_erase and flash_eraseall
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE093ED5FC9E@Cloud.RL.local>
In-Reply-To: <AANLkTim3U4i0y0jtV1SmJvGUR8vAiyiqv8HetVHXFN6a@mail.gmail.com>
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
> On Fri, Sep 24, 2010 at 00:35, Jon Povey wrote:

>> But anyway; will the flash_eraseall script still get installed by
>> make install? it needs to.
>
> it will not, but i didnt think that to be too much of a problem.
> people usually dont use `make install` for their embedded system ...
> they pluck out the one or two utils they actually need.

"I suppose" is not much of an argument for breaking make install.
It can be made to work.. I could do this but don't have time right now.

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
