Received: from [157.55.0.214] (helo=DUB004-OMC1S15.hotmail.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQdvV-0006th-7Y
 for linux-mtd@lists.infradead.org; Sun, 07 Sep 2014 14:58:49 +0000
Message-ID: <DUB128-W61F274D19C6B54433EDD629CC00@phx.gbl>
From: David Binderman <dcb314@hotmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: mtd-utils-1.5.1 bug report
Date: Sun, 7 Sep 2014 14:58:26 +0000
Content-Type: text/plain; charset="iso-8859-1"
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

Hello there=2C=0A=
=0A=
ubi-utils/ubiformat.c:636:28: warning: logical not is only applied to the l=
eft hand side of comparison [-Wlogical-not-parentheses]=0A=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!args.subpage_size !=3D m=
td->min_io_size)=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 normsg("may be su=
b-page size is "=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 "incorrect?")=3B=0A=
=0A=
Something boolean compared to a size. Looks a possible problem to me.=0A=
Removal of the double negative might also help.=0A=
=0A=
Regards=0A=
=0A=
David Binderman=0A=
=0A=
 		 	   		  =
