Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H29pu-0005Zw-Vr
	for linux-mtd@lists.infradead.org; Wed, 03 Jan 2007 12:23:37 -0500
Subject: Re: UBI error on 64bit Machine
From: Artem Bityutskiy <dedekind@infradead.org>
To: Shiner Chen <shiner.chen@gmail.com>,
	K G Srivastava <kg.srivastava@gmail.com>
In-Reply-To: <f9fe74a60612150559x4bcb9eedlfe9675b6be70682@mail.gmail.com>
References: <f9fe74a60612150559x4bcb9eedlfe9675b6be70682@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jan 2007 19:18:13 +0200
Message-Id: <1167844693.20245.18.camel@sauron>
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

On Fri, 2006-12-15 at 21:59 +0800, Shiner Chen wrote:
> Dear all,
>=20
> Recently, I get the source code on the ubi-2.6.git tree. I compiled
> the kernel on x86-32 arch and erverything is ok,but on x86-64,I met
> some problems as follows
> Environment
> operation system:Red hat Enterprise Server 4.3(kernel 2.6.19 including
> the UBI,gcc 3.5)
> hardware:x86-64

On Fri, 2006-12-15 at 18:58 +0530, K G Srivastava wrote:=20
> Hi,
>   I am trying to setup UBI over mtdram/nandsim on a AMD 64-bit (1.66
> MHz) Turion Dual core machine. The MTD device is of size 128 MB and
> the UBI volume is of size 111 MB. I have tried it on Intel P-4 CPU
> 2.66GHz and it works fine. But as soon as i do a modprobe for ubi
> module, the kernel gives an oops. Can you please tell me if UBI works
> fine on 64-bit architecture or if there are any known issues and if
> there are any fixes available. The trace of the same is as follows -

May you please try the newest UBI? There is a chance that it will work
better on 64-bit machines now.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
