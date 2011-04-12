Received: from relay2.mail.timico.net ([62.121.20.90] helo=relay.timico.net)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9Rjv-0003lE-QM
	for linux-mtd@lists.infradead.org; Tue, 12 Apr 2011 00:45:57 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: Ben Gardiner <bengardiner@nanometrics.ca>, Stefano Babic <sbabic@denx.de>
Content-Class: urn:content-classes:message
Date: Tue, 12 Apr 2011 01:45:50 +0100
Subject: RE: [PATCH 6/6] EA20: do not use subpage write for NAND
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE093FB3FF75@Cloud.RL.local>
In-Reply-To: <BANLkTi=e7Zsk6maA_-O4j7mf_VzeRsPT=w@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Scott Wood <scottwood@freescale.com>,
	"u-boot@lists.denx.de" <u-boot@lists.denx.de>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Sandeep Paulraj <s-paulraj@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ben Gardiner wrote:
> "tries to access subpages" is maybe a little too vague; I think Jon
> Povey described the problem quite succinctly:

That's me, I better wake up!

> What's more is that the davinci nand controller could do subpage
> writing if the writing operation were informed of the extents of the
> subpage being written instead of being handed a buffer with 0xFF in
> the non-target page areas. Which, I believe is Artem's primary
> motivation for the introduction of nand_write_subpage() to the
> davinci NAND controller driver [2].

I can't remember if I posted about this at the time, but what I ended up
doing was propagating the subpage start offset and length through to all
the write_page() functions. At the appropriate place the ECC for any
"unwritten" subpages is FF'd out. It's a fairly ugly platform-specific
hack but it works, if anyone wants to see it I can dig out the patch.

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
