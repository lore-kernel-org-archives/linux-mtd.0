Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15U3hZ-0007Km-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Aug 2001 11:03:05 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010802205155.1538.qmail@nwcst337.netaddress.usa.net> 
References: <20010802205155.1538.qmail@nwcst337.netaddress.usa.net> 
To: Eric <ebrower@usa.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] duplicate assignment in map_ram.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 07 Aug 2001 11:08:48 +0100
Message-ID: <4224.997178928@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


ebrower@usa.net said:
> There's a duplicate assignment to mtd->erasesize in  <mtd>/drivers/mtd/
> chips/map_ram.c which is removed with the following patch. 

Applied, along with the following:
 	mtd->erasesize = PAGE_SIZE;
+ 	while(mtd->size & (mtd->erasesize - 1))
+		mtd->erasesize >>= 1;

Thanks.

--
dwmw2
