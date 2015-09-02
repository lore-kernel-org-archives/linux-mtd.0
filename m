Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXF1R-0001By-2S
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2015 20:52:45 +0000
Received: by pacfv12 with SMTP id fv12so22911775pac.2
 for <linux-mtd@lists.infradead.org>; Wed, 02 Sep 2015 13:52:24 -0700 (PDT)
Date: Wed, 2 Sep 2015 13:52:22 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 linux-mtd@lists.infradead.org,
 Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH] nand: pxa3xx: Remove unused platform-data flash
 specification
Message-ID: <20150902205222.GV81844@google.com>
References: <1440182848-8254-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <87vbc72naw.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87vbc72naw.fsf@belgarion.home>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 22, 2015 at 08:25:11PM +0200, Robert Jarzmik wrote:
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:
> 
> > The driver supports board files specificating the flash
> > device, by passing a pxa3xx_nand_flash struct (with
> > flash parameters) in the platform data struct.
> >
> > Currently this support is not being used by any board file.
> > Moreover, we'd like to deprecate such usage in favor of
> > using the device table in nand_ids.c.
> >
> > So let's remove the ad-hoc flash specification.
> >
> > Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Applied to l2-mtd.git/next
