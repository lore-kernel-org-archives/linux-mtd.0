Received: from moutng.kundenserver.de ([212.227.126.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KVwND-0003YN-Dk
	for linux-mtd@lists.infradead.org; Wed, 20 Aug 2008 22:41:51 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: linuxppc-dev@ozlabs.org
Subject: Re: [RFC] mtd: add OF2PDEV convertor for the NDFC driver
Date: Thu, 21 Aug 2008 00:40:58 +0200
References: <20080820205958.GA13371@www.tglx.de>
In-Reply-To: <20080820205958.GA13371@www.tglx.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200808210040.58809.arnd@arndb.de>
Cc: linux-mtd@lists.infradead.org, Sebastian Siewior <bigeasy@linutronix.de>,
	tglx@linutronix.de, Sean MacLennan <smaclennan@pikatech.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 20 August 2008, Sebastian Siewior wrote:
> I didn't convert the NDFC driver to support OF because there are
> non-OF-aware platforms with the ndfc chip.
> All settings are mandatory except the oob layout.

Are you aware of Sean's patch from
http://patchwork.ozlabs.org/linuxppc/patch?id=20183 ?

What are the other platforms using it?

	Arnd <><
