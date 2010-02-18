Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Ni66L-0001Pe-Ue
	for linux-mtd@lists.infradead.org; Thu, 18 Feb 2010 13:07:34 +0000
Subject: Re: Re-2: [PATCH 1/2] jffs2: Move erasing from write_super to GC.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kai-Uwe Bloem <kai-uwe.bloem@auerswald.de>
In-Reply-To: <DIIE.00002B5100245E92@mail.auerswald.de>
References: <DIIE.00002B5100245E92@mail.auerswald.de>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 18 Feb 2010 15:06:00 +0200
Message-ID: <1266498360.16891.40.camel@localhost>
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

On Thu, 2010-02-18 at 12:41 +0000, Kai-Uwe Bloem wrote:
> > Right. You can move the signal check to the BGT, and do 1-3 erases at a
> > time by passing cnt = 1-3. I think it is cleaner.
> 
> Seconded. I would restrict the count to 1, since some NOR flashes
> might need up to 4 seconds for one erase operation. OTOH, the count
> parameter would be superfluous in that case, since all the other
> invocations erase only one block as well.

It might be superfluous, but it is not necessary to remove it.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
