Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J4CgF-0004I4-Fg
	for linux-mtd@lists.infradead.org; Mon, 17 Dec 2007 09:54:42 +0000
Subject: ubi-utils cleanup
From: Artem Bityutskiy <dedekind@infradead.org>
To: Frank Haverkamp <haver@vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Dec 2007 11:46:40 +0200
Message-Id: <1197884800.25999.73.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Alexander Schmidt <alexs@linux.vnet.ibm.com>,
	MTD Mailinglist <linux-mtd@lists.infradead.org>,
	Andreas Arnez <arnez@linux.vnet.ibm.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Frank, Alex, Andreas,

since UBIFS gets tried more, people start using ubi-utils more, and I
got several feed-backs about how untidy mtd-utils,git is, and ubi-utils
are untidy as well.

May you please help me cleaning them up a little? We should re-structure
the repo a bit to start of. I've added few ideas into the ubi-utils/TODO
file.

First of, we should separate out UBI tests from ubi-utils and move them
to tests/ubi-tests. Then we should separate-out the tools which are
NAND-related - indeed, what do they do in ubi-utils? They should go to
nand-tools, and stuff like nanddump and nandwrite should go to
nand-tools as well.

Since most of the stuff in ubi-utils were make by your team, I kindly
ask you to help with re-structuring them.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
