Date: Thu, 9 May 2013 20:12:40 +0200
From: Hans-Christian Egtvedt <egtvedt@samfundet.no>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH 1/2] atmel_nand: at91/avr32/: Replace
 cpu_is_at32ap7000() with a nand platform data
Message-ID: <20130509181240.GA4260@samfundet.no>
References: <1368084895-18266-1-git-send-email-josh.wu@atmel.com>
 <1368084895-18266-2-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1368084895-18266-2-git-send-email-josh.wu@atmel.com>
Cc: nicolas.ferre@atmel.com, plagnioj@jcrosoft.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Around Thu 09 May 2013 15:34:54 +0800 or thereabout, Josh Wu wrote:
> The nand driver use cpu_is_at32ap7000() macro for a workaround. For the
> multi-platform support, we will remove this cpu_is_xxx() macro.
> 
> This patch adds a boolean variable need_reset_workaround in structure
> atmel_nand_data. Using this variable we can remove cpu_is_at32ap7000() macro.
> 
> Signed-off-by: Josh Wu <josh.wu@atmel.com>
> Cc: Hans-Christian Egtvedt <egtvedt@samfundet.no>

Acked-by: Hans-Christian Egtvedt <egtvedt@samfundet.no>

> ---
>  arch/avr32/mach-at32ap/at32ap700x.c |    3 +++
>  drivers/mtd/nand/atmel_nand.c       |   13 ++++++-------
>  include/linux/platform_data/atmel.h |    3 +++
>  3 files changed, 12 insertions(+), 7 deletions(-)

Feel free to push this through the mtd tree, if they won't accept it I'm
working on getting my workflow up on the linux-avr32.git tree.

<snipp diff>

-- 
HcE
