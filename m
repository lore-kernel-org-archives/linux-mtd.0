Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8XcI-0004fV-NB
 for linux-mtd@lists.infradead.org; Mon, 14 Dec 2015 18:12:59 +0000
Received: by pff63 with SMTP id 63so15062976pff.2
 for <linux-mtd@lists.infradead.org>; Mon, 14 Dec 2015 10:12:38 -0800 (PST)
Date: Mon, 14 Dec 2015 10:12:35 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH] mtd: bcm47xxnflash: really unregister NAND on device
 removal
Message-ID: <20151214181235.GA10460@google.com>
References: <1449623099-21634-1-git-send-email-computersforpeace@gmail.com>
 <20151214184907.3460eb71@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20151214184907.3460eb71@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 14, 2015 at 06:49:07PM +0100, Boris Brezillon wrote:
> On Tue,  8 Dec 2015 17:04:59 -0800
> Brian Norris <computersforpeace@gmail.com> wrote:
> 
> > The field bcma_nflash::mtd is never set to be non-zero anywhere, but we
> > test for it in the removal path. So the MTD is never unregistered.
> > 
> > Also, we should use nand_release(), not mtd_device_unregister().
> > 
> > Finally, we don't need to use the 'platdata' for stashing/retrieving our
> > *driver* data -- that's what *_{get,set}_drvdata() are for.
> > 
> > So, kill off bcm_nflash::mtd, and stash the struct bcm47xxnflash in
> > drvdata instead. Also move the forward declaration of mtd_info up a bit,
> > since struct bcma_sflash should be using it.
> > 
> > Caught while inspecting other changes being made to this driver. Compile
> > tested only.
> > 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > Cc: "Rafał Miłecki" <zajec5@gmail.com>
> > Cc: linux-wireless@vger.kernel.org
> 
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Applied to l2-mtd.git
