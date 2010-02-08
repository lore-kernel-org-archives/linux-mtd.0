Received: from fg-out-1718.google.com ([72.14.220.152])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NeXbh-0003xm-Df
	for linux-mtd@lists.infradead.org; Mon, 08 Feb 2010 17:41:13 +0000
Received: by fg-out-1718.google.com with SMTP id 16so228299fgg.0
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Feb 2010 09:41:06 -0800 (PST)
Subject: Re: NAND: fixes
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1265411890-9156-1-git-send-email-maximlevitsky@gmail.com>
References: <1265411890-9156-1-git-send-email-maximlevitsky@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 08 Feb 2010 19:41:02 +0200
Message-ID: <1265650862.4115.1.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "stanley.miao" <stanley.miao@windriver.com>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Vitaly Wool <vitalywool@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-02-06 at 01:18 +0200, Maxim Levitsky wrote: 
> This is part of my patcheset that touches the nand subsystem
> 
> Stanley, patch #2 should now cover attempts to write outside the oob.
> 
> Also I did another (don't know if less or more evil) approach to bad block testing.
> Now check_bad always takes the controller locks and selects the chip. Thus it is
> possible to use read_oob/write_oob.
> This however changes behavier of the nand_erase_nand to deny erases if any block within
> the range is bad. Also it selects/releases the chip once per erase block.
> This is done in patch #5. Patch #6 is ported to that change.
> 
> Patches 1-3 are pure fixes.
> 
> Best regards,
> 	Maxim Levitsky

Any update?

Best regards,
Maxim Levitsky
