Subject: Re: [PATCH 1/1] [MTD/NAND]: Add Blackfin BF52x on-chip NAND Flash
	controller driver support in bf5xx_nand driver
From: David Woodhouse <dwmw2@infradead.org>
To: Bryan Wu <bryan.wu@analog.com>
In-Reply-To: <1195812893-26312-1-git-send-email-bryan.wu@analog.com>
References: <1195812893-26312-1-git-send-email-bryan.wu@analog.com>
Content-Type: text/plain
Date: Fri, 23 Nov 2007 10:19:38 +0000
Message-Id: <1195813178.25590.35.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: uclinux-dist-devel@blackfin.uclinux.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 2007-11-23 at 18:14 +0800, Bryan Wu wrote:
> 
> +#ifdef CONFIG_BF54x
>         /* Setup DMAC1 channel mux for NFC which shared with SDH */
>         val = bfin_read_DMAC1_PERIMUX();
>         val &= 0xFFFE;
>         bfin_write_DMAC1_PERIMUX(val);
>         SSYNC();
> -
> +#endif

You can't build a multiplatform kernel which runs on BF52x and BF54x?
And want to make it harder to do so in future?

-- 
dwmw2
