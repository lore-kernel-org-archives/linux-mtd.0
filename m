Received: from penguin-ext.wise.edt.ericsson.se ([193.180.251.47]
	helo=penguin.wise.edt.ericsson.se)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1946J8-0005Fm-M9
	for <linux-mtd@lists.infradead.org>; Fri, 11 Apr 2003 22:43:38 +0100
From: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>
To: "Marc D'Anjou" <marcd@amperion.com>
In-Reply-To: <C6D44AA99ECEB540A5498F15F92DA07D8922D0@amperion01>
References: <C6D44AA99ECEB540A5498F15F92DA07D8922D0@amperion01>
Date: 11 Apr 2003 23:43:40 +0200
Message-Id: <1050097421.1169.67.camel@spawn>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
cc: Mtd <linux-mtd@lists.infradead.org>
Subject: RE: Long JFFS2 Mount time?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-04-11 at 23:25, Marc D'Anjou wrote:
> I forgot to say that the one line command used to fill the log contains a=
 while loop:
>=20
> "while true; do cat file1.txt >> file2.log; done"
>=20
> While this was executing, I monitored the file size until it reached 2 me=
g bytes.
>=20
> Where file1.txt has 450 bytes in it.
>=20
> Note: I don't think the 450 bytes is important, it could have been much s=
maller and still given the save results.
>=20
> Marc

And I used this a few times until the file system had 100kb free. no
problem with mount or ls.=20
---
#! /bin/bash

:>$1

TIMES=3D4096
while [ $TIMES -gt 0 ]
do
  dd if=3D/dev/urandom bs=3D512 count=3D1 2>/dev/null >> $1
  TIMES=3D$(($TIMES - 1))
done
---

--=20
Kenneth Johansson=09
Ericsson AB                       Tel: +46 8 719 70 20
Tellusborgsv=E4gen  90              Fax: +46 8 719 29 45
126 25 Stockholm                  ken@switchboard.ericsson.se
