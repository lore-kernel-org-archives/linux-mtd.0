Received: from wproxy.gmail.com ([64.233.184.204])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FAWYk-0005CT-U4
	for linux-mtd@lists.infradead.org; Sat, 18 Feb 2006 13:11:57 -0500
Received: by wproxy.gmail.com with SMTP id i7so821288wra
	for <linux-mtd@lists.infradead.org>;
	Sat, 18 Feb 2006 10:11:52 -0800 (PST)
Message-ID: <f9d2a5e10602181011k6552d396q4da6daef944a6fff@mail.gmail.com>
Date: Sat, 18 Feb 2006 10:11:52 -0800
From: "Russ Dill" <russ.dill@gmail.com>
To: tglx@linutronix.de
In-Reply-To: <1140253826.2480.651.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <43EB96DC.3030900@eptar.com>
	<35fb2e590602100558s2d868fa3o1752fbf3217439e4@mail.gmail.com>
	<d97046180602151153g23064424x9e1ddf83a1d7ae4f@mail.gmail.com>
	<200602161432.17447.manningc2@actrix.gen.nz>
	<1140253826.2480.651.camel@localhost.localdomain>
Cc: Charles Manning <manningc2@actrix.gen.nz>, linux-mtd@lists.infradead.org,
	yaffs@stoneboat.aleph1.co.uk
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Some words about Reed Solomon.
>
> Reed Solomon needs hardware support for performance reasons. Efficient
> usage of Reed Solomon requires a different Data / RS-code layout:

At what level is hardware support required? I'm involved in the design
of a new system with a 466Mhz 80200. Should fpga considerations be
mode for ecc correction? What sort of logic would be best to put in
the fpga?
