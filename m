Date: Wed, 11 Jan 2012 12:54:04 +0100
From: Hans-Christian Egtvedt <egtvedt@samfundet.no>
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 1/3] ATMEL: fix nand ecc support
Message-ID: <20120111115404.GA15221@samfundet.no>
References: <1325933370-17475-1-git-send-email-plagnioj@jcrosoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1325933370-17475-1-git-send-email-plagnioj@jcrosoft.com>
Cc: linux-mtd@lists.infradead.org, Nicolas Ferre <nicolas.ferre@atmel.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Around Sat 07 Jan 2012 11:49:28 +0100 or thereabout, Jean-Christophe PLAGNIOL-VILLARD wrote:

Hello,

> so we can now choose for the board the ecc mode (ecc soft, soft bch, no ecc
> and hardware)
> 
> set ecc mode in the boards to soft as currently in the driver
> 
> move platform data to a common header
> include/linux/atmel_nand.h
> 
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
> Cc: Hans-Christian Egtvedt <egtvedt@samfundet.no>
> Cc: linux-mtd@lists.infradead.org

Acked-by: Hans-Christian Egtvedt <egtvedt@samfundet.no>

> ---
> Hi David,
> 
> 	If you don't
> 	I'll apply this via ARM tree

Sounds fine by me.

<snipp AT91 changes>

>  arch/avr32/boards/atngw100/setup.c          |    1 +
>  arch/avr32/boards/atstk1000/atstk1002.c     |    1 +
>  arch/avr32/mach-at32ap/include/mach/board.h |   13 +------------

These AVR32 changes seems sane, thanks for the update.

<snipp diff>

-- 
mvh
Hans-Christian Egtvedt
