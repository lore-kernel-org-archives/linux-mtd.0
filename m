Subject: RE: [PATCH V2] [MTD] m25p80.c extended jedec support
From: David Woodhouse <dwmw2@infradead.org>
To: Chen Gong-B11801 <G.Chen@freescale.com>
In-Reply-To: <C3C4D3116BA1F84989E53FCF1F5051870D29BB@zch01exm21.fsl.freescale.net>
References: <1221545652-2280-1-git-send-email-g.chen@freescale.com>
	<1221546997.3106.54.camel@macbook.infradead.org>
	<C3C4D3116BA1F84989E53FCF1F5051870D29BB@zch01exm21.fsl.freescale.net>
Content-Type: text/plain
Date: Mon, 15 Sep 2008 23:51:54 -0700
Message-Id: <1221547914.3106.56.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-09-16 at 14:41 +0800, Chen Gong-B11801 wrote:
> you mean I should create a patch based that tree, not torvalds's tree,
> right ?

Yes, please.

> > 
> > What happens if you call spi_write_then_read(spi, x, x, x, 5) on a
> > device which is only expecting to return 3 bytes. Does the call return
> > failure? Or just pad to 5 bytes with zeroes?
> 
> frankly, I'm not sure to much, but from the datasheet I'v read, if CS#
> doesn't be pulled high, it should can read zero or Hi-Z(maybe some mess data)

I would like to be sure that we're not going to break on older chips.

-- 
dwmw2
