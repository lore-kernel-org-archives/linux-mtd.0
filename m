Date: Fri, 28 Feb 2014 08:06:35 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH v6 0/2] Introduce AEMIF driver for Davinci/Keystone archs
Message-ID: <20140228160635.GA6144@kroah.com>
References: <1393262772-24442-1-git-send-email-ivan.khoronzhuk@ti.com>
 <5310AEA8.1070804@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5310AEA8.1070804@ti.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grygorii.strashko@ti.com,
 linux@arm.linux.org.uk, pawel.moll@arm.com, swarren@wwwdotorg.org,
 ijc+devicetree@hellion.org.uk, nsekhar@ti.com, galak@kernel.crashing.org,
 rob.herring@calxeda.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, robherring2@gmail.com, rob@landley.net,
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

On Fri, Feb 28, 2014 at 10:43:36AM -0500, Santosh Shilimkar wrote:
> Greg,
> 
> On Monday 24 February 2014 12:26 PM, Ivan Khoronzhuk wrote:
> > These patches introduce Async External Memory Interface (EMIF16/AEMIF)
> > controller driver for Davinci/Keystone archs.
> > 
> > For more informations see documentation:
> > Davinci DM646x - http://www.ti.com/lit/ug/sprueq7c/sprueq7c.pdf
> > OMAP-L138 - http://www.ti.com/lit/ug/spruh77a/spruh77a.pdf
> > Kestone - http://www.ti.com/lit/ug/sprugz3a/sprugz3a.pdf
> > 
> [..]
> 
> > 
> > v5..v6:
> > - memory: ti-aemif: introduce AEMIF driver
> > - memory: ti-aemif: add bindings for AEMIF driver
> > 	changed opaque names for cs node properties
> > 
> Can you please pick these two patches ? 

Asking for a response with less than a weeks time is really bold:
  $ ~/bin/mdfrm -c ~/mail/todo/
  521 messages in /home/gregkh/mail/todo/

Give me a chance to catch up please...
