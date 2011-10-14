Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REdZI-00015N-Cu
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 08:56:41 +0000
Received: by wwg9 with SMTP id 9so552792wwg.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 01:56:38 -0700 (PDT)
Subject: Re: [PATCH] mtd: rename the redboot module to RedBoot
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Andres Salomon <dilinger@queued.net>
Date: Fri, 14 Oct 2011 11:56:07 +0300
In-Reply-To: <20111003222346.5ac48654@queued.net>
References: <20111003222346.5ac48654@queued.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1318582575.12351.74.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-10-03 at 22:23 -0700, Andres Salomon wrote:
> parse_mtd_partitions takes a list of partition types; if the driver
> isn't loaded, it attempts to load it, and then it grabs the partition
> parser.  For redboot, the module name is "redboot.ko", while the parser
> name is "RedBoot".  Since modprobe is case-sensitive, attempting to
> modprobe "RedBoot" will never work.  I suspect the embedded systems that
> make use of redboot just always manually loaded redboot prior to loading
> their specific nand chip drivers (or statically compiled it in).
> 
> Alternatives include renaming the parser to "redboot", changing
> parse_mtd_partitions to accept pairs of strings, or changing modprobe
> to be case-insensitive.  Renaming the module seems like the easy,
> obvious solution. :)
> 
> Signed-off-by: Andres Salomon <dilinger@queued.net>
> ---
>  drivers/mtd/Makefile  |    2 +-
>  drivers/mtd/RedBoot.c |  315 +++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/redboot.c |  315 -------------------------------------------------
>  3 files changed, 316 insertions(+), 316 deletions(-)
>  create mode 100644 drivers/mtd/RedBoot.c
>  delete mode 100644 drivers/mtd/redboot.c

Could you please use MODULE_ALIAS(RedBoot) instead?

-- 
Best Regards,
Artem Bityutskiy
