Date: Mon, 31 Jan 2005 17:25:05 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050131172133.GJ6694@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.58.0501311722120.17207@phoenix.infradead.org>
References: <Pine.LNX.4.61.0501311010180.3552@localhost.localdomain>
	<1107184897.7567.20.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.61.0501311038140.3730@localhost.localdomain>
	<Pine.LNX.4.58.0501311553590.17207@phoenix.infradead.org>
	<Pine.LNX.4.61.0501311109050.13936@localhost.localdomain>
	<1107188578.21196.346.camel@tglx.tec.linutronix.de>
	<1107188815.19262.203.camel@hades.cambridge.redhat.com>
	<Pine.LNX.4.61.0501311145030.14092@localhost.localdomain>
	<Pine.LNX.4.58.0501311709530.17207@phoenix.infradead.org>
	<20050131172133.GJ6694@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>, tglx@linutronix.de,
	MTD mailing list <linux-mtd@lists.infradead.org>,
	"Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: running out of space dd'ing JFFS2 image to /dev/mtdblock/0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 31 Jan 2005, [iso-8859-1] J=F6rn Engel wrote:

> On Mon, 31 January 2005 17:11:38 +0000, Artem B. Bityuckiy wrote:
> > On Mon, 31 Jan 2005, Robert P. J. Day wrote:
> >=20
> > > i agree completely, but i thought some of the recognized suffixes wer=
e
> > > "KiB", "MiB" and so on.  anyway, i was pretty sure that even a
> > > suggestion this innocuous was going to generate some discussion.
> > Nobody told about not to use KiB/MiB. It wos told about not to us K and=
 M,=20
> > like 10K, 100M. Use 10KiB, 100MiB instead.
>=20
> What information does the "B" in "10KiB" contain?  And why is it "Ki"
> instead of the correct "ki"?
Hehe.

This is just widely used unit. And it is usually written like that. And=20
now most utilities work with such. But if one wants and thinks it is=20
reasonable, why not to use kib :-)
=20
> Robert: please don't just sit there and wait for someone else to do
> your work.  Send a patch.  If it's wrong, people will comment.  Right
> now, this discussion is completely academic.
>=20
> J=F6rn
>=20
> --=20
> Measure. Don't tune for speed until you've measured, and even then
> don't unless one part of the code overwhelms the rest.
> -- Rob Pike
>=20

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
