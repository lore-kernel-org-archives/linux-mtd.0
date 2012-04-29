Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SOSVa-0007yG-6n
 for linux-mtd@lists.infradead.org; Sun, 29 Apr 2012 11:41:42 +0000
Received: by lagy4 with SMTP id y4so1650090lag.36
 for <linux-mtd@lists.infradead.org>; Sun, 29 Apr 2012 04:41:40 -0700 (PDT)
Date: Sun, 29 Apr 2012 14:41:31 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 02/10] mtd: nand: pass proper 'oob_required' parameter
Message-ID: <20120429144131.6418d893@pixies.home.jungo.com>
In-Reply-To: <1335576594-25267-3-git-send-email-computersforpeace@gmail.com>
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
 <1335576594-25267-3-git-send-email-computersforpeace@gmail.com>
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

On Fri, 27 Apr 2012 18:29:46 -0700 Brian Norris <computersforpeace@gmail.com> wrote:
> We now have an interface for notifying the nand_ecc_ctrl functions when OOB
> data must be returned to the upper layers and when it may be left untouched.
> This patch fills in the 'oob_required' parameter properly from
> nand_do_{read,write}_ops. When utilized properly in the lower layers, this
> parameter can improve performance for NAND HW and SW that can simply avoid
> transferring the OOB data.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Reviewed-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>

Regards,
Shmulik
