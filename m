Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DLk9A-0007IF-Do
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2005 11:51:21 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Nickolay <nickolay@protei.ru>
In-Reply-To: <425D3BDF.9030505@protei.ru>
References: <425D3BDF.9030505@protei.ru>
Content-Type: text/plain
Date: Wed, 13 Apr 2005 19:50:50 +0400
Message-Id: <1113407451.23175.32.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: K9F1G08U0M NAND support
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-04-13 at 19:33 +0400, Nickolay wrote:
> Hallo Guys!
> 
> I has IXDP425 board with K9F1G08U0M NAND flash as secondary flash(first 
> flash - NOR for booting).
> Kernel version: 2.4.20_mvl31
> 
> I get mtd from CVS and just replace originally 
> linux-2.4.20_mvl31/drivers/mtd with mtd/drivers/mtd.
That's wrong. Please, read http://www.linux-
mtd.infradead.org/source.html 

And please, pay your attention at the "Kernel versions" section there.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
