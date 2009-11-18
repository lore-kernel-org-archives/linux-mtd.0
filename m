Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NAh25-0004RO-6b
	for linux-mtd@lists.infradead.org; Wed, 18 Nov 2009 09:41:05 +0000
Subject: Re: a UBIFS image makes task pdflush blocked > 120 seconds
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
In-Reply-To: <4B03BDBD.3040409@aimvalley.nl>
References: <4B012D0D.4080500@aimvalley.nl>
	<1258446318.27437.60.camel@localhost> <4B02CE86.5000908@aimvalley.nl>
	<1258532918.27437.126.camel@localhost> <4B03BDBD.3040409@aimvalley.nl>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 18 Nov 2009 11:40:24 +0200
Message-Id: <1258537224.27437.193.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, joakim.tjernlund@transmode.se
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-11-18 at 10:26 +0100, Norbert van Bolhuis wrote:
> Artem Bityutskiy wrote:
> 
> > 
> > The best way to say thanks is:
> > 
> > 1. Add a small documentation section about your case to UBIFS howto, so
> > others could benefit. You could send a patch against the MTD web-site:
> > http://git.infradead.org/mtd-www.git
> > 
> 
> Ok, I'll do this.

Cool. I guess a section to this page would work well:
http://www.linux-mtd.infradead.org/faq/ubifs.html

> > 2. Make your solution work in upstream out-of-the box.
> > 
> 
> The solution is to enable erase-suspend for writing for which
> Joakim already sent earlier patches.
> So if it's OK with him I will send the patch for cmdset_0002.

Why his patch is not in upstream yet? I think he mentioned some issues
with modules.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
