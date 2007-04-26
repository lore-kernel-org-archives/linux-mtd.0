Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hh1eC-0007a3-6b
	for linux-mtd@lists.infradead.org; Thu, 26 Apr 2007 06:56:25 -0400
Subject: RE: [PATCH] OneNAND 2x program support
From: Artem Bityutskiy <dedekind@infradead.org>
To: kmpark@infradead.org
In-Reply-To: <001001c787d6$0139ba20$e1ac580a@swcenter.sec.samsung.co.kr>
References: <000701c787a8$f968a9f0$e1ac580a@swcenter.sec.samsung.co.kr>
	<1177571998.18889.14.camel@sauron>
	<001001c787d6$0139ba20$e1ac580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain; charset=utf-8
Date: Thu, 26 Apr 2007 13:56:12 +0300
Message-Id: <1177584972.18889.19.camel@sauron>
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

On Thu, 2007-04-26 at 16:39 +0900, Kyungmin Park wrote:
> OK, I will add the chip number.

Also, in the menuconfig description I suggest to note the following
facts:

1. Page size becomes 4KiB
2. Eraseblock size becomes 256KiB
3. I/O throughput becomes 2x faster, i.e., 4KiB NAND page in 2x mode is
flashed as fast as 2KiB NAND page in non-2x mode.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
