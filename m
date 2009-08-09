Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ma0qm-00007A-F9
	for linux-mtd@lists.infradead.org; Sun, 09 Aug 2009 05:21:48 +0000
Subject: Re: [RFC/PATCH] flash_eraseall: extra care if NOR flash is not
	BIT_WRITEABLE
From: Artem Bityutskiy <dedekind@infradead.org>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
In-Reply-To: <20090806145842.GA14994@Chamillionaire.breakpoint.cc>
References: <1237848138-18157-1-git-send-email-sebastian@breakpoint.cc>
	<1237848138-18157-4-git-send-email-sebastian@breakpoint.cc>
	<1239366655.3390.14.camel@localhost.localdomain>
	<20090806145842.GA14994@Chamillionaire.breakpoint.cc>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 09 Aug 2009 08:20:07 +0300
Message-Id: <1249795207.9157.38.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-08-06 at 16:58 +0200, Sebastian Andrzej Siewior wrote:
> >then we may just take them.
> I don't use JFFS2 anymore so I would leave as it. If someone needs/wants
> to fix it, he can take the patches probably as it since the jffs2
> doesn't change much these days. Unless you really want me get it fixed
> some way but I doubt it :)

Right, let's not touch this then.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
