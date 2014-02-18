Date: Tue, 18 Feb 2014 12:27:02 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH v4 0/2] Introduce AEMIF driver for Davinci/Keystone archs
Message-ID: <20140218202702.GA18642@kroah.com>
References: <1391629574-18955-1-git-send-email-ivan.khoronzhuk@ti.com>
 <53037113.3090105@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53037113.3090105@ti.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grygorii.strashko@ti.com,
 linux@arm.linux.org.uk, pawel.moll@arm.com, swarren@wwwdotorg.org,
 ijc+devicetree@hellion.org.uk, nsekhar@ti.com, galak@kernel.crashing.org,
 rob.herring@calxeda.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, rob@landley.net,
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 18, 2014 at 09:41:23AM -0500, Santosh Shilimkar wrote:
> Greg,
> 
> On Wednesday 05 February 2014 02:46 PM, Ivan Khoronzhuk wrote:
> > These patches introduce Async External Memory Interface (EMIF16/AEMIF)
> > controller driver for Davinci/Keystone archs.
> > 
> > For more informations see documentation:
> > Davinci DM646x - http://www.ti.com/lit/ug/sprueq7c/sprueq7c.pdf
> > OMAP-L138 - http://www.ti.com/lit/ug/spruh77a/spruh77a.pdf
> > Kestone - http://www.ti.com/lit/ug/sprugz3a/sprugz3a.pdf
> > 
> Can you please have a look at the series ? It has been on the list for
> sometime and all the outstanding comments are addressed so far. If
> you are ok with it, I would like to get these queued up for 3.15
> via your tree.

Why my tree?  Am I the drivers/memory/ maintainer?

/me digs in git...

Ah, it looks like I might be...

Ok, let me go review this.

greg k-h
