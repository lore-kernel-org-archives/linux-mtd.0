Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTVYo-0002K5-K3
 for linux-mtd@lists.infradead.org; Thu, 05 Mar 2015 13:11:31 +0000
Message-ID: <54F855E4.9030106@suse.de>
Date: Thu, 05 Mar 2015 14:11:00 +0100
From: Hannes Reinecke <hare@suse.de>
MIME-Version: 1.0
To: Valentin Rothberg <valentinrothberg@gmail.com>, akpm@linux-foundation.org
Subject: Re: [PATCH] Remove deprecated IRQF_DISABLED flag entirely
References: <1425560442-13367-1-git-send-email-valentinrothberg@gmail.com>
In-Reply-To: <1425560442-13367-1-git-send-email-valentinrothberg@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Cc: Nishanth Menon <nm@ti.com>, linux-mips@linux-mips.org,
 Quentin Lambert <lambert.quentin@gmail.com>, Jiri Kosina <jkosina@suse.cz>,
 Tony Lindgren <tony@atomide.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Sricharan R <r.sricharan@ti.com>, linux-mtd@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, Huacai Chen <chenhc@lemote.com>,
 Christoph Hellwig <hch@lst.de>, Kukjin Kim <kgene.kim@samsung.com>,
 iss_storagedev@hp.com, Jonathan Corbet <corbet@lwn.net>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Ewan Milne <emilne@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, Afzal Mohammed <afzal@ti.com>,
 Arnd Bergmann <arnd@arndb.de>, Rajendra Nayak <rnayak@ti.com>,
 Eyal Perry <eyalpe@mellanox.com>, Thomas Gleixner <tglx@linutronix.de>,
 Paul Bolle <pebolle@tiscali.nl>, Keerthy <j-keerthy@ti.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Felipe Balbi <balbi@ti.com>,
 Zhou Wang <wangzhou1@hisilicon.com>, linux-usb@vger.kernel.org,
 Santosh Shilimkar <santosh.shilimkar@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hongliang Tao <taohl@lemote.com>, Brian Norris <computersforpeace@gmail.com>,
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

On 03/05/2015 01:59 PM, Valentin Rothberg wrote:
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
> ---
> The bigger hunk in Documentation/scsi/ncr53c8xx.txt is removed entirely
> as IRQF_DISABLED is gone now; the usage in older kernel versions
> (including the old SA_INTERRUPT flag) should be discouraged.  The
> trouble of using IRQF_SHARED is a general problem and not specific to
> any driver.
> 
> I left the reference in Documentation/PCI/MSI-HOWTO.txt untouched since
> it has already been removed in linux-next by commit b0e1ee8e1405
> ("MSI-HOWTO.txt: remove reference on IRQF_DISABLED").
> 
> All remaining references are changelogs that I suggest to keep.

While you're at it: having '0x0' as a value for the irq flags looks
a bit silly, and makes you wonder what the parameter is for.

I would rather like to have

#define IRQF_NONE 0x0

and use it for these cases.
That way the scope of that parameter is clear.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke		               zSeries & Storage
hare@suse.de			               +49 911 74053 688
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 Nürnberg
GF: F. Imendörffer, J. Smithard, J. Guild, D. Upmanyu, G. Norton
HRB 21284 (AG Nürnberg)
