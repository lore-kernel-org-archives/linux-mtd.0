Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OAGaO-0000JN-Uz
	for linux-mtd@lists.infradead.org; Fri, 07 May 2010 05:58:58 +0000
Subject: Re: [PATCH 0/4] UBI: improve empty flash handling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
In-Reply-To: <20100506095218.GB15335@Chamillionaire.breakpoint.cc>
References: <1272881582-17196-1-git-send-email-Artem.Bityutskiy@nokia.com>
	<20100506095218.GB15335@Chamillionaire.breakpoint.cc>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 07 May 2010 08:57:53 +0300
Message-ID: <1273211873.2178.7.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-05-06 at 11:52 +0200, Sebastian Andrzej Siewior wrote:
> * Artem Bityutskiy | 2010-05-03 13:12:58 [+0300]:
> 
> >Hi Sebastian,
> Hi Artem,
> 
> >Please, review and test the following series.
> 
> The code looks fine. I wiped the flash and the test resulted in:

Pushed the patches to the master branch so far. If everything is
allright, I'll push them to linux-next in few days. This is because I
can amend patches which are in the master branch (i.e., rebase the git
tree), but when they go to linux-next, I try hard to avoid any
re-basing.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
