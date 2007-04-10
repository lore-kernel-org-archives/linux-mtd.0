Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HbK5M-0005I1-01
	for linux-mtd@lists.infradead.org; Tue, 10 Apr 2007 13:24:54 -0400
Subject: Re: Centralized summary as a way to speed up "ls" time
From: Artem Bityutskiy <dedekind@infradead.org>
To: akorolev <alexey.korolev@intel.com>
In-Reply-To: <461BC120.2080507@intel.com>
References: <461BC120.2080507@intel.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 10 Apr 2007 20:24:28 +0300
Message-Id: <1176225868.19966.66.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-04-10 at 20:53 +0400, akorolev wrote:
> Hello Ferenc,
>=20
> While using JFFS2 on NAND devices with large size and many files I faced=20
> the problem of very slow "ls" performance.
> On folder which contains ~40 files and ~80MB ls could take ~25sec!

One way could be to introduce an aggregated dentry node which would
store several, say 32 direntries together, instead of having
per-direntry node.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
