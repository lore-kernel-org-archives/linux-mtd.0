Received: from mail.fst.it ([213.255.39.254] helo=fst.it)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 19wdd5-0006Ip-20
	for <linux-mtd@lists.infradead.org>; Tue, 09 Sep 2003 09:13:39 +0100
From: Luca Contini <luca.contini@mediaenabling.com>
To: "MTD-Linux" <linux-mtd@lists.infradead.org>
Date: Tue, 9 Sep 2003 10:12:22 +0200
MIME-Version: 1.0
Message-Id: <200309091012.22241.luca.contini@mediaenabling.com>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: missing function 'unlikely'
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
I've downloaded the snapshot 2003-08-28 and I'm trying to use it with ker=
nel=20
2.4.18.
The mtdblock module is compiled with no problems but when i try to insert=
 it I=20
get this error:
'unresolved symbol unlikely'
I've done a grep on the entire kernel tree but with no result.
Just to try I've downloaded the 2.4.21 kernel and applied the patch=20
(patchin.sh) to it, but since I cannot use the module (the kernel on the=20
board is still 2.4.18) I couldn't verify whether it works. Anyway I've lo=
oked=20
for the function 'unlikely' in the kernel 2.4.21 patched with patchin.sh =
but=20
with no result.
Any suggestion?

regards

--=20
Luca
