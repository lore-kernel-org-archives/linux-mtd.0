Received: from fmr18.intel.com ([134.134.136.17] helo=orsfmr003.jf.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EmS79-000476-8q
	for linux-mtd@lists.infradead.org; Wed, 14 Dec 2005 08:35:56 +0000
From: "zhao, forrest" <forrest.zhao@intel.com>
To: Artem Bityutskiy <dedekind@yandex.ru>
In-Reply-To: <439FBEDF.7000506@yandex.ru>
References: <439C33D2.506@yandex.ru>
	<1134367675.3152.9.camel@localhost.localdomain>
	<439D5159.4030704@yandex.ru>
	<1134455209.7346.12.camel@localhost.localdomain>
	<20051213114752.GA9165@angel.research.nokia.com>
	<1134545396.27194.11.camel@localhost.localdomain>
	<439FBEDF.7000506@yandex.ru>
Content-Type: text/plain
Date: Wed, 14 Dec 2005 16:30:14 +0800
Message-Id: <1134549014.27194.16.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>, tglx@linutronix.de,
	Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 CVS broken after 2005/11/14
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> >
> Actually even without that patch JFFS2 doesn't work. I don't know which 
> regression tests you did, but JFFS2 fails to do simle a thing:
> 
> mount
> copy a file
> unmount
> mount
> 
> and it is reproducable on nandsim.

Yes, I reproduced the bug for CVS snapshot after 2005/11/14
on kernel 2.6.12.2.
For snapshot before 2005/11/14 on kernel 2.6.12.2,
JFFS2 works fine.
I just got 2.6.15-rc5 and will do the same test later.

Thanks,
Forrest
