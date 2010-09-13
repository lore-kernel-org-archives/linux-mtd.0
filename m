Received: from relay1.mail.timico.net ([62.121.20.91] helo=relay.timico.net)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Ov1vi-00022b-8O
	for linux-mtd@lists.infradead.org; Mon, 13 Sep 2010 05:50:15 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: Mike Frysinger <vapier@gentoo.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Content-Class: urn:content-classes:message
Date: Mon, 13 Sep 2010 06:50:04 +0100
Subject: RE: [PATCH 2/2] nanddump: add --nobad to read bad blocks
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE0903E3E3DC@Cloud.RL.local>
In-Reply-To: <1284263427-31342-2-git-send-email-vapier@gentoo.org>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mike Frysinger wrote:
> Sometimes dumping bad blocks is useful, like when the data isn't
> actually
> bad but the OOB layout isn't what the kernel is expecting or is
> otherwise
> screwed up.  The --nobad option allows just that.

> +"-N         --nobad              Read without bad block skipping\n"

This doesn't seem like a good name for the option to me. A useful option bu=
t an unintuitive name, "nobad" sounds like it is going to omit bad blocks, =
where actually it is going to include them.

"noskipbad" or "includebad" would seem to be better.

I see this got pushed already though..

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
