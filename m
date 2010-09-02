Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OrAId-0003fP-Ut
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 13:57:56 +0000
In-Reply-To: <1283425149.3085.6.camel@brekeke>
References: <1283357021-16187-1-git-send-email-w.sang@pengutronix.de>	
	<1283366151.2209.21.camel@brekeke>
	<OF213EDC22.80E0A084-ONC1257792.0025CB36-C1257792.00268F36@transmode.se>
	<1283425149.3085.6.camel@brekeke>
Subject: Re: [RFC] jffs2: use cond_resched() instead of yield()
To: dedekind1@gmail.com
Message-ID: <OF13870AE6.AC42397E-ONC1257792.004C0931-C1257792.004C4099@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 2 Sep 2010 15:52:52 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, linux-kernel@vger.kernel.org,
	Wolfram Sang <w.sang@pengutronix.de>,
	linux-mtd@lists.infradead.org, Ingo Molnar <mingo@elte.hu>,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> wrote on 2010/09/02 12:59:09:
>
> On Thu, 2010-09-02 at 09:01 +0200, Joakim Tjernlund wrote:
> > At the time cond_resched() was a problem but now I don't know. The erasing
> > has moved to the GC thread and been somewhat reworked. I don't know if
> > it still needs yield(). Perhaps David can tell?
>
> I think 'yield()' is rather a hack than a real solution.

Yes, the real fix is to move erasing to GC and that has been done now.
There is a good chance yield() can be removed without regression
but I am not sure nor do I have the time to test that.

 Jocke
