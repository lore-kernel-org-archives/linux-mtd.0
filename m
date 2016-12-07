Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEXzB-0001Qa-Aj
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2016 08:53:58 +0000
Date: Wed, 7 Dec 2016 10:53:30 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Lee Jones <lee.jones@linaro.org>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Peter Tyser <ptyser@xes-inc.com>, key.seong.lim@intel.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v6 0/3] spi-nor: Add support for Intel SPI serial flash
 controller
Message-ID: <20161207085330.GN1459@lahna.fi.intel.com>
References: <20161128120626.130693-1-mika.westerberg@linux.intel.com>
 <20161205112727.GI1459@lahna.fi.intel.com>
 <2dac1535-de7f-47c3-2747-ba8cac854811@gmail.com>
 <20161205163106.GJ1459@lahna.fi.intel.com>
 <62db8daa-7ebf-1a42-bd70-897c3c636e3c@atmel.com>
 <20161206094525.GA25385@dell.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161206094525.GA25385@dell.home>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 06, 2016 at 09:45:25AM +0000, Lee Jones wrote:
> I'm happy either way.  However if you take them, I will require a
> pull-request to an immutable branch containing only these patches.
> 
> If I take them, it won't be until v4.11, since we are half way though
> -rc8 already and I would like them to soak in -next for at least a
> couple of weeks.

This series already missed v4.8 and v4.9 so I don't think there is a
rush to get it for v4.10 either ;-) I'm fine if it goes for v4.11.
