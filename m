Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I1eDb-00066B-Ed
	for linux-mtd@lists.infradead.org; Fri, 22 Jun 2007 04:10:41 -0400
Subject: Re: Real-time flash simulator
From: Artem Bityutskiy <dedekind@infradead.org>
To: Martin =?ISO-8859-1?Q?D=E4umler?= <martin.daeumler@s2003.tu-chemnitz.de>
In-Reply-To: <467B77F7.2000007@informatik.tu-chemnitz.de>
References: <467B77F7.2000007@informatik.tu-chemnitz.de>
Content-Type: text/plain; charset=utf-8
Date: Fri, 22 Jun 2007 11:09:33 +0300
Message-Id: <1182499773.4403.76.camel@sauron>
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

Martin,

On Fri, 2007-06-22 at 09:19 +0200, Martin D=C3=A4umler wrote:
> what is the current development status of a real-time capable flash
> simulator? I am searching for a flash simulator similar to nandsim, but
> with real-time garantuees.
> Has anybody developed such a simulator or is developing one?

I am not an expert in real-time, so I would ask you to elaborate on what
particularly makes nandsim not real-time? What are your requirements?
Which nandsim operation/function/part has to be done in fixed time but
it is not? Why do you think other pieces of kernel code are OK but
nandsim is a bottleneck WRT to real-time?

> Furthermore, there are some efforts to develop a (scaleable) real-time
> capable flash file system?

We develop UBIFS (see MTD web site) but we do not set real-time
requirements. You are welcome to collaborate.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
