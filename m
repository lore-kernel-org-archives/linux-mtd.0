Received: from fastmail.fm ([209.61.183.86] helo=www.fastmail.fm)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1896r2-0000Sx-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Nov 2002 16:47:04 +0000
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
MIME-Version: 1.0
Date: Tue, 5 Nov 2002 17:17:12 UT
From: "Jeffrey Lim" <jfsworld@fastmail.fm>
To: "=?ISO-8859-1?Q?J=F6rn=20Engel?=" <joern@wohnheim.fh-wedel.de>,
	"Junping Zhang" <JZhang@erinc.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: seeking help on JFFS2
Message-Id: <20021105171709.3BC642FD77@server4.fastmail.fm>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, 5 Nov 2002 17:41:26 +0100, "J=F6rn Engel"
<joern@wohnheim.fh-wedel.de> said:
> On Tue, 5 November 2002 08:40:31 -0500, Junping Zhang wrote:
>=20
> >     (b) I tried mkfs.jffs2 on both target and my x86 host (with
> >         big-endian option)
> >=20
> >         mkfs.jffs2 -dipc -e0x40000 -p0x700000 -b -o /opt/ipc.jffs2
>                              ^^^^^^^   ^^^^^^^^
> Does this really work? I remember that mkfs.jffs2 once didn't
> understand hex and you had to pass it the decimal numbers. Can you
> check that?
>=20

I believe there shouldnt be a problem with passing hex to it - the code
uses strtol() to recognize both decimal and hex.

-jf

=20
--
  "It's an extraordinary world!" - jfsworld <at> fastmail.fm
=20
=20
