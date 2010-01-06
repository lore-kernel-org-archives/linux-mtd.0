Received: from [213.115.205.20] (helo=gw1.transmode.se)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NSd3R-0006dm-5f
	for linux-mtd@lists.infradead.org; Wed, 06 Jan 2010 21:04:38 +0000
In-Reply-To: <2daf59621001061210l5a352913u6b94a5e8570b1e7b@mail.gmail.com>
References: <a64f67eb1001041649u500f3a6bx40d443c4a3415f1b@mail.gmail.com>	
	<Pine.LNX.4.64.1001050905071.5028@lnxricardw.se.axis.com>
	<a64f67eb1001050013wd122746iab32bdfc93ba1aee@mail.gmail.com>	
	<Pine.LNX.4.64.1001051016020.5028@lnxricardw.se.axis.com>
	<B125D8217ABC4B43826503DE00A2D44910DFCE341F@SJEXCHCCR01.corp.ad.broadcom.com>
	<OF8A2BBBA0.AB41AC26-ONC12576A2.005C2B63-C12576A2.005D212F@transmode.se>
	<Pine.LNX.4.64.1001062048090.26184@lnxricardw.se.axis.com>
	<2daf59621001061210l5a352913u6b94a5e8570b1e7b@mail.gmail.com>
Subject: Re: JFFS2 - speed up while booting
To: hedwin <hedwin.koning@gmail.com>
Message-ID: <OFBD856627.E61BEE74-ONC12576A3.00735EA8-C12576A3.0073A28C@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Wed, 6 Jan 2010 22:03:02 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	linux newbie <linux.newbie79@gmail.com>,
	Darwin Rambo <drambo@broadcom.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hedwin <hedwin.koning@gmail.com> wrote on 06/01/2010 21:10:31:

> From: hedwin <hedwin.koning@gmail.com>
> To: Ricard Wanderlof <ricard.wanderlof@axis.com>
> Cc: Joakim Tjernlund <joakim.tjernlund@transmode.se>, linux newbie
> <linux.newbie79@gmail.com>, Darwin Rambo <drambo@broadcom.com>, "linux-
> mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
> Date: 06/01/2010 21:10
> Subject: Re: JFFS2 - speed up while booting
>
> One thing we did to speed up JFFS2 booting is delaying the garbage collection
> process from starting.
>
> Hedwin

Yes, maybe GC should be delayed a minute. It is not really needed initially.

 Jocke
