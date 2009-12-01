Received: from chamillionaire.breakpoint.cc ([85.10.199.196])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NFcAq-0007X1-Dr
	for linux-mtd@lists.infradead.org; Tue, 01 Dec 2009 23:30:29 +0000
Date: Wed, 2 Dec 2009 00:30:20 +0100
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [RFC / PATCH] mtd/ubi: flush wl before clearing update marker
Message-ID: <20091201233020.GB18479@Chamillionaire.breakpoint.cc>
References: <20091129184602.GB30617@Chamillionaire.breakpoint.cc>
	<1259585497.7518.108.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1259585497.7518.108.camel@localhost>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Artem Bityutskiy | 2009-11-30 14:51:37 [+0200]:

>This bug fix deserves being sent to Linus now, but it is now so late
>that I'm really not sure I should do this, because if this causes any
>regression, it will be too late to fix it for 2.6.32. So I think I'll
>merge it to 2.6.33, is this OK with you?
Sure. This bug is there since the first release of UBI so it
shouldn't hurt anyone if the fix comes one release later.
It would be nice if you would push it -stable and pick it up in your
ubifs trees once you decided that it should not create any regressions
:)

Sebastian
