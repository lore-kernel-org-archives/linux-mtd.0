Received: from smtp116.sbc.mail.sp1.yahoo.com ([69.147.64.89])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LomTo-0006Fg-QU
	for linux-mtd@lists.infradead.org; Tue, 31 Mar 2009 22:30:57 +0000
From: David Brownell <david-b@pacbell.net>
To: "Mike McTernan" <mmcternan@airvana.com>
Subject: Re: [PATCH] [MTD] devices/mtd_dataflash: Add SW sector protection
	support
Date: Tue, 31 Mar 2009 15:30:44 -0700
References: <AcmXQvsMZtFKpGUCSJK7bv2cngp9Eg==>
	<200903231335.32064.david-b@pacbell.net>
	<4B3F8896E1733D4787DDB0EA1C7FF91F7EFFCE@ukmail.uk.wirelessworld.airvananet.com>
In-Reply-To: <4B3F8896E1733D4787DDB0EA1C7FF91F7EFFCE@ukmail.uk.wirelessworld.airvananet.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200903311530.45069.david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org, Ulf Samuelsson <ulf.samuelsson@atmel.com>,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 31 March 2009, Mike McTernan wrote:
> > The terminology is confusing ... there are now two kinds 
> > of "sector" in the driver.  Call one of them "lock sector"
> > or somesuch,
> 
> It's as per the datasheet figure 4-1; the device has pages, blocks and
> sectors.  Blocks aren't very interesting so are not in the driver, but
> pages and sectors are.  But I see only one use of sectors in this
> driver, what am I missing?

See current usage of the word "sector" in the driver.
Maybe that just needs to be corrected ("page"?).


> > so it makes sense to check the count of such sectors
> 
> Could you clarify what you mean here?

You use "zero sectors" to indicate whether it supports that
new mechanism.
