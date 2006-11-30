Received: from mgw-ext04.nokia.com ([131.228.20.96])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Gplws-0001yA-E9
	for linux-mtd@lists.infradead.org; Thu, 30 Nov 2006 08:27:37 -0500
Subject: Re: NOR read/write beyond end of flash partition
From: Artem Bityutskiy <dedekind@infradead.org>
To: Tigadi Kiran-r10350c <R10350C@freescale.com>
In-Reply-To: <A4F93E6F2F2D4E4D8F6AF6C7562DDBD891559A@zin33exm21.fsl.freescale.net>
References: <A4F93E6F2F2D4E4D8F6AF6C7562DDBD891559A@zin33exm21.fsl.freescale.net>
Content-Type: text/plain; charset=utf-8
Date: Thu, 30 Nov 2006 15:27:18 +0200
Message-Id: <1164893238.576.68.camel@sauron>
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

Hello,

On Thu, 2006-11-30 at 18:45 +0530, Tigadi Kiran-r10350c wrote:
> But mtd_read routine implemented in the same file does not have this
> check. So when I try to read beyond end of NOR MTD partition it is
> returning 0.=20

Sounds like a bug, feel free to send a patch against mtd-2.6.git tree.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
