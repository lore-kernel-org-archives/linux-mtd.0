Received: from fish.redhat.com ([213.86.99.237]
	helo=executor.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19sjlu-0001bS-IQ
	for <linux-mtd@lists.infradead.org>; Fri, 29 Aug 2003 14:58:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Luca Contini <luca.contini@mediaenabling.com>
In-Reply-To: <023501c36e31$81a4a610$a970a8c0@topo>
References: <023501c36e31$81a4a610$a970a8c0@topo>
Message-Id: <1062165490.17744.341.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 29 Aug 2003 14:58:12 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: latest MTD snapshot
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-08-29 at 15:28 +0200, Luca Contini wrote:

> [arm@Botolo2 mtd]$insmod mtdblock.o
> mtdblock.o: unresolved symbol unlikely

Should be in linux/compiler.h, which should be included from
linux/kernel.h. Ancient kernel?

> mtdblock.o: unresolved symbol register_mtd_blktrans
> mtdblock.o: unresolved symbol add_mtd_blktrans_dev
> mtdblock.o: unresolved symbol deregister_mtd_blktrans
> mtdblock.o: unresolved symbol del_mtd_blktrans_dev

insmod mtd_blkdevs.o

-- 
dwmw2
