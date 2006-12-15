Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GvDMr-0001j2-Pv
	for linux-mtd@lists.infradead.org; Fri, 15 Dec 2006 08:44:56 -0500
Subject: Re: [UBI] Issues while running UBI on 64 Bit Turion machine
From: Artem Bityutskiy <dedekind@infradead.org>
To: K G Srivastava <kg.srivastava@gmail.com>
In-Reply-To: <15756b990612150528w4a75a606g9b46f260e082b9d2@mail.gmail.com>
References: <15756b990612150528w4a75a606g9b46f260e082b9d2@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 15 Dec 2006 15:44:25 +0200
Message-Id: <1166190265.18628.60.camel@sauron>
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

On Fri, 2006-12-15 at 18:58 +0530, K G Srivastava wrote:
> Hi,
>   I am trying to setup UBI over mtdram/nandsim on a AMD 64-bit (1.66
> MHz) Turion Dual core machine. The MTD device is of size 128 MB and
> the UBI volume is of size 111 MB. I have tried it on Intel P-4 CPU
> 2.66GHz and it works fine. But as soon as i do a modprobe for ubi
> module, the kernel gives an oops. Can you please tell me if UBI works
> fine on 64-bit architecture or if there are any known issues and if
> there are any fixes available. The trace of the same is as follows -

I have never tried it on 64-bit machines. But theoretically it should
work. There must be some bug there.

To start off, may you please try mount JFFS2 over nandsim on your 64-bit
machine and check if JFFS2/MTD are fine with 64-bit?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
