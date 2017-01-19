Received: from mail-oi0-f65.google.com ([209.85.218.65])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cUGwq-0001E7-Dh
 for linux-mtd@lists.infradead.org; Thu, 19 Jan 2017 17:56:33 +0000
Received: by mail-oi0-f65.google.com with SMTP id w144so3782253oiw.1
 for <linux-mtd@lists.infradead.org>; Thu, 19 Jan 2017 09:56:10 -0800 (PST)
Date: Thu, 19 Jan 2017 11:56:08 -0600
From: Rob Herring <robh@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Masahiko Iwamoto <iwamoto@allied-telesis.co.jp>,
 Jagan Teki <jagan@openedev.com>, Marek Vasut <marex@denx.de>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3] mtd: spi-nor: add dt support for Everspin MRAMs
Message-ID: <20170119175608.5okfpsfutv7oawoo@rob-hp-laptop>
References: <480df61d-c949-b3b0-61a4-d9db17f09e7d@atmel.com>
 <20170117110338.10756-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170117110338.10756-1-u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 17, 2017 at 12:03:38PM +0100, Uwe Kleine-König wrote:
> The MR25 family doesn't support JEDEC, so they need explicit mentioning
> in the list of supported spi IDs. This makes it possible to add these
> using for example:
> 
> 	compatible = "everspin,mr25h40";
> 
> There was already an entry for mr25h256. Move that one out of the "keep
> for compatibility" section and put in a new group for Everspin MRAMs.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Changes since (implicit) v1:
> 
>  - use Kib instead of kib
> 
> Changes since v2:
> 
>  - update dt docs
>  - handle already existing mr25h256 in m25p_ids[]
> 
> Thanks to Cyrille for catching these.
> 
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 2 ++
>  drivers/mtd/devices/m25p80.c                            | 6 +++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
