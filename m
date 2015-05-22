Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvhKk-0006cE-DX
 for linux-mtd@lists.infradead.org; Fri, 22 May 2015 07:25:30 +0000
Received: by pdea3 with SMTP id a3so12911559pde.2
 for <linux-mtd@lists.infradead.org>; Fri, 22 May 2015 00:25:09 -0700 (PDT)
Date: Fri, 22 May 2015 00:25:05 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] MTD: spi-nor: check for short writes in spi_nor_write.
Message-ID: <20150522072505.GE23718@brian-ubuntu>
References: <cover.1430403750.git.hramrach@gmail.com>
 <50c40ef17ab6566f35ef5a4426bf23567f896db7.1430403750.git.hramrach@gmail.com>
 <20150520233835.GX11598@ld-irv-0074>
 <CAOMqctTYqDWL51twOuGi+oXONXQ4B2-2BkdJNSpzZAXshZUN6g@mail.gmail.com>
 <20150521102802.GS21577@sirena.org.uk>
 <20150522071727.GD23718@brian-ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150522071727.GD23718@brian-ubuntu>
Cc: Marek Vasut <marex@denx.de>, Michal Suchanek <hramrach@gmail.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, linux-mtd@lists.infradead.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Alison Chaiken <alison_chaiken@mentor.com>,
 Bean Huo =?utf-8?B?6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(trimming CC a little this time, though it's still a bit large)

On Fri, May 22, 2015 at 12:17:27AM -0700, Brian Norris wrote:
> Admittedly, as he's using an out-of-tree driver, I'm not
> sure I know exactly what failure modes he is hitting yet.

Sorry, I realized I misread here. He's using spi-sunxi. Given that...

... is this code even valid?

static int sun6i_spi_transfer_one(struct spi_master *master,
                                  struct spi_device *spi,
                                  struct spi_transfer *tfr)
{
...
	/* We don't support transfer larger than the FIFO */
	if (tfr->len > SUN6I_FIFO_DEPTH)
		return -EINVAL;

Seems like it should be looping over the transfer in multiple chunks
instead.

Brian
