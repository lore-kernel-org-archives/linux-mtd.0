Received: from mail03.agrinet.ch ([81.221.250.52])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AOuVB-0006xa-Ne
	for <linux-mtd@lists.infradead.org>; Wed, 26 Nov 2003 07:54:21 +0000
Received: from pegasus (80.254.183.189) by mail03.agrinet.ch (7.0.024)
	id 3FBB9BD6000EAB5B for linux-mtd@lists.infradead.org;
	Wed, 26 Nov 2003 08:52:17 +0100
From: Felix Frey <ffrey@freesurf.ch>
To: linux-mtd@lists.infradead.org
Date: Tue, 25 Nov 2003 08:09:17 +0100
References: <E1AOFNr-0001Yk-QS@pentafluge.infradead.org>
In-Reply-To: <E1AOFNr-0001Yk-QS@pentafluge.infradead.org>
MIME-Version: 1.0
Message-Id: <200311241354.38322.ffrey@freesurf.ch>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Re: booting from DOC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> The grub loader boots from the DOC but stops at the grub prompt, how do=
 I
> get grub to boot my kernel image ?
> in karims book it talks about building a root filesystem and
> /boot/grub/menu.lst but I can't see how this can run without the module=
s
> loaded needed by the kernel (e.g. docecc.o, doc2000.o etc) confused ;/ =
=2E..

Grub stage2 contains the code which can access a filesystem (and the DoC,=
 of=20
course)
For a step-by-step howto, read these instructions:=20
 http://www.lakeshoremicro.com/diskonchip-grub-howto.html
For more infos on grub, IBM has written a nice tutorial:         =20
http://www-106.ibm.com/developerworks/edu/l-dw-linuxgrub-i.html?S_TACT=3D=
103AMW03&S_CMP=3DEDU

Felix
