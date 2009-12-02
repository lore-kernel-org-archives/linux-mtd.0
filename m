Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NFipZ-0002rp-EG
	for linux-mtd@lists.infradead.org; Wed, 02 Dec 2009 06:36:58 +0000
Subject: Re: [RFC / PATCH] mtd/ubi: flush wl before clearing update marker
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
In-Reply-To: <20091201233020.GB18479@Chamillionaire.breakpoint.cc>
References: <20091129184602.GB30617@Chamillionaire.breakpoint.cc>
	<1259585497.7518.108.camel@localhost>
	<20091201233020.GB18479@Chamillionaire.breakpoint.cc>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 02 Dec 2009 08:36:22 +0200
Message-Id: <1259735782.10805.5.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-12-02 at 00:30 +0100, Sebastian Andrzej Siewior wrote:
> * Artem Bityutskiy | 2009-11-30 14:51:37 [+0200]:
> 
> >This bug fix deserves being sent to Linus now, but it is now so late
> >that I'm really not sure I should do this, because if this causes any
> >regression, it will be too late to fix it for 2.6.32. So I think I'll
> >merge it to 2.6.33, is this OK with you?
> Sure. This bug is there since the first release of UBI so it
> shouldn't hurt anyone if the fix comes one release later.
> It would be nice if you would push it -stable and pick it up in your
> ubifs trees once you decided that it should not create any regressions
> :)

I'll do this, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
