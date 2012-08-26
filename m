Message-ID: <503A323A.9090309@antcom.de>
Date: Sun, 26 Aug 2012 16:27:06 +0200
From: Roland Stigge <stigge@antcom.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH RESEND] mtd: lpc32xx_mlc: Make driver independent of AMBA
 DMA engine driver
References: <1345674311-16874-1-git-send-email-stigge@antcom.de>
 <1345898007.1815.7.camel@kyv>
In-Reply-To: <1345898007.1815.7.camel@kyv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: srinivas.bakki@nxp.com, linux@arm.linux.org.uk, arnd@arndb.de,
 artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org,
 kevin.wells@nxp.com, linux-mtd@lists.infradead.org, aletes.xgr@gmail.com,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 25/08/12 14:33, Artem Bityutskiy wrote:
> On Thu, 2012-08-23 at 00:25 +0200, Roland Stigge wrote:
>> This patch makes the MLC NAND driver independent of the single
>> AMBA DMA engine driver by using the platform data provided
>> dma_filter callback.
>> 
>> (This also fixes the build error of the MLC NAND driver in case
>> of module linking because the (not exported) reference to
>> pl08x_filter_id is gone now.)
>> 
>> Signed-off-by: Roland Stigge <stigge@antcom.de>
> 
> I already have both patches in l2-mtd.git. Please, use it as the 
> baseline for sending patches.

Yes, noticed to late that you have already applied it, sorry.

The recently posted cleanup patches for LPC32xx SLC and MLC drivers
apply to l2-mtd.git, anyway.

Thanks,

Roland
