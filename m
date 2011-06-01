Subject: Re: [PATCH] ATMEL, AVR32: inline nand partition table access
From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1306676962-22308-1-git-send-email-dbaryshkov@gmail.com>
References: <1306676962-22308-1-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Jun 2011 15:32:09 +0200
Message-ID: <1306935129.1097.3.camel@hcegtvedt.norway.atmel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Nicolas Ferre <nicolas.ferre@atmel.com>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
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

On Sun, 2011-05-29 at 17:49 +0400, Dmitry Eremin-Solenikov wrote:
> Currently atmel_nand driver used by AT91 and AVR32 calls a special callback
> which return nand partition table and number of partitions. However in all
> boards this callback returns just static data. So drop this callback and
> make atmel_nand use partition table provided statically via platform_data.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

Thanks for this update, always nice seeing code being optimized. I
really can't recall why it was made like this in the first place...

For the AVR32 related parts:

Acked-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>

<snipp diff>

Will this go through the linux-mtd tree (since it spans two archs) or
should it go through an arch tree?

-- 
Hans-Christian Egtvedt
