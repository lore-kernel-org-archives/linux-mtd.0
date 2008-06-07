Subject: Re: [PATCH v2] [NAND] driver extension to support NAND on TQM85xx
	modules
From: David Woodhouse <dwmw2@infradead.org>
To: Wolfgang Grandegger <wg@grandegger.com>
In-Reply-To: <4847A8DA.6010406@grandegger.com>
References: <4847A8DA.6010406@grandegger.com>
Content-Type: text/plain
Date: Sat, 07 Jun 2008 09:01:41 +0100
Message-Id: <1212825701.32207.403.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, Anton Vorontsov <avorontsov@ru.mvista.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-06-05 at 10:50 +0200, Wolfgang Grandegger wrote:
> [NAND] driver extension to support NAND on TQM85xx modules
> 
> This patch extends the FSL UPM NAND driver from Anton Vorontsov to
> support NAND on the TQM85xx modules. Unfortunately, the hardware does
> not support the R/B pins of the NAND chip and therefore the specified
> maximum delay time must used. It therefore re-introduces the chip-delay
> property.
> 
> Note: this patch is based on various patches from  Anton Vorontsov posted
>       to this list:
> 
>       http://ozlabs.org/pipermail/linuxppc-dev/2008-April/055587.html.

Do you also want me to apply that patch (on which this one depends)?
It says 'Signed-off-by: not yet' ...

You should probably comment on the removal of the OF_GPIO dependency. It
looks fine, since the relevant functions all get stubbed out and will do
the right thing, but it's worth a comment in the commit text.

-- 
dwmw2
