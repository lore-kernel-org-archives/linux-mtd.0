Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NDYMC-00019J-PJ
	for linux-mtd@lists.infradead.org; Thu, 26 Nov 2009 07:01:41 +0000
Subject: Re: [PATCH] MTD: add missing put_chip() in cfi_intelext_reset()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Antonio Ospite <ospite@studenti.unina.it>
In-Reply-To: <20091120111435.d28c19bf.ospite@studenti.unina.it>
References: <20091023000533.57893593.ospite@studenti.unina.it>
	<alpine.LFD.2.00.0910231559320.21460@xanadu.home>
	<20091120111435.d28c19bf.ospite@studenti.unina.it>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 26 Nov 2009 09:01:18 +0200
Message-Id: <1259218878.29118.39.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: openezx-devel@lists.openezx.org, linux-mtd@lists.infradead.org,
	Nicolas Pitre <nico@fluxnic.net>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-11-20 at 11:14 +0100, Antonio Ospite wrote:
> On Fri, 23 Oct 2009 16:02:42 -0400 (EDT)
> Nicolas Pitre <nico@fluxnic.net> wrote:
> 
> > 
> > Signed-off-by: Nicolas Pitre <nico@fluxnic.net>
> >
> 
> Hi, has this fix been submitted yet?
> I can't see it in 2.6.32-rc8.

The current situation indicates it is not going to be there.

This patch is in my l2-mtd tree, though.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
