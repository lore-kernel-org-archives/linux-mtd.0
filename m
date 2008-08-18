Date: Mon, 18 Aug 2008 09:11:22 +0200
From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
To: "Eirik Aanonsen" <eaa@wprmedical.com>
Subject: Re: Jffs2 crach in 2.6.25.6.atmel.1
Message-ID: <20080818091122.56b94796@hskinnemo-gx745.norway.atmel.com>
In-Reply-To: <6B5648EA2E2C2D42AF2FF7691522AD92417C8F@wpr01.wprmedical.local>
References: <6B5648EA2E2C2D42AF2FF7691522AD92417C1C@wpr01.wprmedical.local>
	<20080808150524.5263de89@hskinnemo-gx745.norway.atmel.com>
	<1218203287.12232.165.camel@pmac.infradead.org>
	<6B5648EA2E2C2D42AF2FF7691522AD92417C8C@wpr01.wprmedical.local>
	<1218877876.3184.185.camel@pmac.infradead.org>
	<6B5648EA2E2C2D42AF2FF7691522AD92417C8D@wpr01.wprmedical.local>
	<1218979060.3184.291.camel@pmac.infradead.org>
	<6B5648EA2E2C2D42AF2FF7691522AD92417C8E@wpr01.wprmedical.local>
	<1218992056.3184.321.camel@pmac.infradead.org>
	<6B5648EA2E2C2D42AF2FF7691522AD92417C8F@wpr01.wprmedical.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	kernel@avr32linux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"Eirik Aanonsen" <eaa@wprmedical.com> wrote:
> I have :
> CONFIG_SLUB_DEBUG=y
> # CONFIG_SLAB is not set
> CONFIG_SLUB=y
> # CONFIG_SLOB is not set

You need to add "slub_debug" to the command line in order to actually
turn it on. Alternatively, set CONFIG_SLUB_DEBUG_ON=y.

Haavard
