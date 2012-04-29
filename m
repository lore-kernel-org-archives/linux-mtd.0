Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SOSQm-0007Rs-SR
 for linux-mtd@lists.infradead.org; Sun, 29 Apr 2012 11:36:45 +0000
Received: by lboj14 with SMTP id j14so1670209lbo.36
 for <linux-mtd@lists.infradead.org>; Sun, 29 Apr 2012 04:36:42 -0700 (PDT)
Date: Sun, 29 Apr 2012 14:36:31 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 01/10] mtd: nand: add 'oob_required' argument to NAND
 {read,write}_page interfaces
Message-ID: <20120429143631.532ce0a6@pixies.home.jungo.com>
In-Reply-To: <1335576594-25267-2-git-send-email-computersforpeace@gmail.com>
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
 <1335576594-25267-2-git-send-email-computersforpeace@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Mike Dunn <mikedunn@newsguy.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Lei Wen <leiwen@marvell.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Kevin Cernekee <cernekee@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Prabhakar Kushwaha <prabhakar@freescale.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Scott Wood <scottwood@freescale.com>,
 Jamie Iles <jamie@jamieiles.com>, Thomas Gleixner <tglx@linutronix.de>,
 Li Yang <leoli@freescale.com>, David Woodhouse <dwmw2@infradead.org>,
 Axel Lin <axel.lin@gmail.com>, Bastian Hecht <hechtb@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 27 Apr 2012 18:29:45 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
> New NAND controllers can perform read/write via HW engines which don't expose
> OOB data in their DMA mode. To reflect this, we should rework the nand_chip /
> nand_ecc_ctrl interfaces that assume that drivers will always read/write OOB
> data in the nand_chip.oob_poi buffer. A better interface includes a boolean
> argument that explicitly tells the callee when OOB data is requested by the
> calling layer (for reading/writing to/from nand_chip.oob_poi).
> 
> This patch adds the 'oob_required' parameter to each relevant {read,write}_page
> interface; all 'oob_required' parameters are left unused for now. The next
> patch will set the parameter properly in the nand_base.c callers, and follow-up
> patches will make use of 'oob_required' in some of the callee functions.
> 
> Note that currently, there is no harm in ignoring the 'oob_required' parameter
> and *always* utilizing nand_chip.oob_poi, but there can be
> performance/complexity/design benefits from avoiding filling oob_poi in the
> common case. I will try to implement this for some drivers which can be ported
> easily.
> 
> Note: I couldn't compile-test all of these easily, as some had ARCH
> dependencies.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Reviewed-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>

Regards,
Shmulik
