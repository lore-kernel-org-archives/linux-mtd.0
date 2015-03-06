Received: from pmta1.delivery4.ore.mailhop.org ([54.191.151.194])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTx7j-0004bE-7Q
 for linux-mtd@lists.infradead.org; Fri, 06 Mar 2015 18:37:23 +0000
Received: from smtp6.ore.mailhop.org (172.31.18.134) by
 pmta1.delivery1.ore.mailhop.org id hv7psu20r847 for
 <linux-mtd@lists.infradead.org>;
 Fri, 6 Mar 2015 18:36:40 +0000 (envelope-from <tony@atomide.com>)
Date: Fri, 6 Mar 2015 10:31:38 -0800
From: Tony Lindgren <tony@atomide.com>
To: Valentin Rothberg <valentinrothberg@gmail.com>
Subject: Re: [PATCH v2] Remove deprecated IRQF_DISABLED flag entirely
Message-ID: <20150306183137.GZ13520@atomide.com>
References: <1425560442-13367-1-git-send-email-valentinrothberg@gmail.com>
 <1425565425-12604-1-git-send-email-valentinrothberg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1425565425-12604-1-git-send-email-valentinrothberg@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, linux-mips@linux-mips.org,
 Jiri Kosina <jkosina@suse.cz>, Peter Zijlstra <peterz@infradead.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Sricharan R <r.sricharan@ti.com>,
 linux-mtd@lists.infradead.org, Felipe Balbi <balbi@ti.com>,
 Huacai Chen <chenhc@lemote.com>, Christoph Hellwig <hch@lst.de>,
 iss_storagedev@hp.com, Jonathan Corbet <corbet@lwn.net>,
 Quentin Lambert <lambert.quentin@gmail.com>, Ewan Milne <emilne@redhat.com>,
 Ingo Molnar <mingo@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Afzal Mohammed <afzal@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Rajendra Nayak <rnayak@ti.com>, Eyal Perry <eyalpe@mellanox.com>,
 Hannes Reinecke <hare@suse.de>, Thomas Gleixner <tglx@linutronix.de>,
 Paul Bolle <pebolle@tiscali.nl>, Keerthy <j-keerthy@ti.com>,
 linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 Zhou Wang <wangzhou1@hisilicon.com>,
 Santosh Shilimkar <santosh.shilimkar@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hongliang Tao <taohl@lemote.com>, akpm@linux-foundation.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Valentin Rothberg <valentinrothberg@gmail.com> [150305 06:24]:
> The IRQF_DISABLED is a NOOP and has been scheduled for removal since
> Linux v2.6.36 by commit 6932bf37bed4 ("genirq: Remove IRQF_DISABLED from
> core code").
> 
> According to commit e58aa3d2d0cc ("genirq: Run irq handlers with
> interrupts disabled") running IRQ handlers with interrupts enabled can
> cause stack overflows when the interrupt line of the issuing device is
> still active.
> 
> This patch ends the grace period for IRQF_DISABLED (i.e., SA_INTERRUPT
> in older versions of Linux) and removes the definition and all remaining
> usages of this flag.
> 
> Signed-off-by: Valentin Rothberg <valentinrothberg@gmail.com>

Acked-by: Tony Lindgren <tony@atomide.com>
