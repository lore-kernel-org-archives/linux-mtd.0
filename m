Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GvFgB-0002rD-Uz
	for linux-mtd@lists.infradead.org; Fri, 15 Dec 2006 11:13:02 -0500
Subject: Re: UBI error on 64bit Machine
From: Artem Bityutskiy <dedekind@infradead.org>
To: Shiner Chen <shiner.chen@gmail.com>
In-Reply-To: <f9fe74a60612150616h4b423eabr2678eb78d8bdfb35@mail.gmail.com>
References: <f9fe74a60612150559x4bcb9eedlfe9675b6be70682@mail.gmail.com>
	<1166191629.18628.64.camel@sauron>
	<f9fe74a60612150616h4b423eabr2678eb78d8bdfb35@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 15 Dec 2006 16:26:04 +0200
Message-Id: <1166192764.18628.68.camel@sauron>
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

On Fri, 2006-12-15 at 22:16 +0800, Shiner Chen wrote:
> thank you for your quick reply,
> the ubi was loaded as a kernel module and the load command is
> modprobe ubi mtd=3D0
> (mtd0 device is nandsim module simulate)
>=20
> I also found the problem is very strange. I debug the part code and
> found it create volume table twice. the problem occured only on 64bit
> machine!

Probably there is some bug related to 64bit machine. I have no 64bit
setup to test this, but I will try to dig this later anyway

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
