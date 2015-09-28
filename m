Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgLwp-00031w-IH
 for linux-mtd@lists.infradead.org; Mon, 28 Sep 2015 00:05:40 +0000
Received: by padhy16 with SMTP id hy16so156517881pad.1
 for <linux-mtd@lists.infradead.org>; Sun, 27 Sep 2015 17:05:18 -0700 (PDT)
Date: Sun, 27 Sep 2015 17:05:15 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: nand: pxa3xx-nand: prevent DFI bus lockup on
 removal
Message-ID: <20150928000515.GA34421@google.com>
References: <1440961710-17347-1-git-send-email-robert.jarzmik@free.fr>
 <87a8s9exxg.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a8s9exxg.fsf@belgarion.home>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Sep 26, 2015 at 10:19:07PM +0200, Robert Jarzmik wrote:
> Robert Jarzmik <robert.jarzmik@free.fr> writes:
> 
> > After the conversion of pxa architecture to common clock framework, the
> > NAND clock can be disabled on driver exit.
> >
> > In this case, it happens that if the driver used the NAND and set the
> > DFI arbitration bit, the next access to a static memory controller area,
> > such as an ethernet card, will stall the system bus, and the core will
> > be stalled forever.
> >
> > This is especially true on pxa31x SoCs, where the NDCR was augmented
> > with a new bit to prevent this lockups by giving full ownership of the
> > DFI arbiter to the SMC, in change SCr#6.
> >
> > Fix this by clearing the DFI arbritration bit in driver exit. This
> > effectively prevents a lockup on zylonite when removing pxa3xx-nand
> > module, and using ethernet afterwards.
> >
> > Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Hi Brian,
> 
> Are you happy with this patch, and if so could you queue it please ?

It looks OK to me, but it doesn't apply to the latest l2-mtd.git. Am I
missing something? I didn't try too hard to work out the conflict
myself.

Brian
