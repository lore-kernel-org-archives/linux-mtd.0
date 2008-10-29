Received: from ogre.sisk.pl ([217.79.144.158])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KvKMv-00057u-DZ
	for linux-mtd@lists.infradead.org; Wed, 29 Oct 2008 23:22:29 +0000
From: "Rafael J. Wysocki" <rjw@sisk.pl>
To: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: 2.6.28-rc2: (mtd)block/partitions BUG with kobject reference count
Date: Thu, 30 Oct 2008 00:27:18 +0100
References: <87ej1z4ep8.fsf@macbook.be.48ers.dk>
In-Reply-To: <87ej1z4ep8.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200810300027.19116.rjw@sisk.pl>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, 29 of October 2008, Peter Korsgaard wrote:
> Hi,
> 
> I'm seing what looks like a kobject reference count issue with
> mtdblock_ro + mtd_dataflash + mtd partitions and repeated unbind/bind.
> I'm on 2.6.28-rc2, but I can reproduce the problem on 2.6.27 as well.

Is it reproducible with 2.6.26 too?

Rafael
