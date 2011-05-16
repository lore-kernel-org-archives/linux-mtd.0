Received: from caramon.arm.linux.org.uk ([78.32.30.218])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QM4qn-0001ov-7p
	for linux-mtd@lists.infradead.org; Mon, 16 May 2011 20:57:14 +0000
Date: Mon, 16 May 2011 21:56:44 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Eric Miao <eric.y.miao@gmail.com>
Subject: Re: [PATCH v5 8/8] MTD: physmap: let set_vpp() pass a
	platform_device instead of a map_info
Message-ID: <20110516205644.GG13659@n2100.arm.linux.org.uk>
References: <1305557977-16871-1-git-send-email-marc.zyngier@arm.com>
	<1305557977-16871-9-git-send-email-marc.zyngier@arm.com>
	<BANLkTi=-Lcg5Wk7yuipTTzrSxs0nNmpMaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BANLkTi=-Lcg5Wk7yuipTTzrSxs0nNmpMaw@mail.gmail.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Ben Dooks <ben-linux@fluff.org>, Marc Zyngier <marc.zyngier@arm.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Nicolas Ferre <nicolas.ferre@atmel.com>, linux-mtd@lists.infradead.org,
	Philipp Zabel <philipp.zabel@gmail.com>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Andrew Victor <linux@maxim.org.za>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 16, 2011 at 11:06:10PM +0800, Eric Miao wrote:
> On Mon, May 16, 2011 at 10:59 PM, Marc Zyngier <marc.zyngier@arm.com> wrote:
> > The set_vpp() method provided by physmap passes a map_info back to
> > the platform code, which has little relevance as far as the platform
> > is concerned (this parameter is completely unused).
> >
> > Instead, pass the platform_device, which can be used in the pismo
> > driver to retrieve some important information in a nicer way, instead
> > of the hack that was in place.
> 
> Not really sure if a 'struct device' would be more generic here, though this
> case is simply a 'struct platform_device'.

As it's a platform device driver (at the moment), passing the platform
device seems logical.

If it becomes an DT based device driver, then we need some other way of
describing the set_vpp etc functionality as we can't describe function
pointers in DT (the same problem goes for a lot of platform device
drivers.)
