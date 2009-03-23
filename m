Received: from smtp115.sbc.mail.sp1.yahoo.com ([69.147.64.88])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Llqs4-0001eL-PU
	for linux-mtd@lists.infradead.org; Mon, 23 Mar 2009 20:35:51 +0000
From: David Brownell <david-b@pacbell.net>
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH] [MTD] devices/mtd_dataflash: Add SW sector protection
	support
Date: Mon, 23 Mar 2009 13:35:31 -0700
References: <AcmXQvsMZtFKpGUCSJK7bv2cngp9Eg==>
	<4B3F8896E1733D4787DDB0EA1C7FF91F7556E7@ukmail.uk.wirelessworld.airvananet.com>
	<8bd0f97a0902251050i3d6fc22qaad178a1d7e5b51b@mail.gmail.com>
In-Reply-To: <8bd0f97a0902251050i3d6fc22qaad178a1d7e5b51b@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200903231335.32064.david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org, Mike McTernan <mmcternan@airvana.com>,
	Ulf Samuelsson <ulf.samuelsson@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 25 February 2009, Mike Frysinger wrote:
> On Wed, Feb 25, 2009 at 07:17, Mike McTernan wrote:
> > From: Michael McTernan <mmcternan@airvana.com>
> >
> > The Atmel AT45DBxxxD serial DataFlash parts allow software protection of
> > specific device sectors.  This is detailed in section 8, "Sector
> > Protection" of the data sheets available on their site (e.g.
> > http://www.atmel.com/dyn/resources/prod_documents/doc3597.pdf).
> >
> > This patch expands the device probe tables to include sector geometry
> > information, and issues the "enable sector protection command" after a
> > compatible part is found and the build is configured with
> > CONFIG_MTD_DATAFLASH_SWPROT.  The lock() and unlock() functions are then
> > implemented to allow manipulation of the "sector protection register" in
> > the device such that program/erase operations can be selectively allowed
> > or blocked.  Note that this register is subject to a limit of 10,000
> > erase/program cycles according to the datasheet.

I took a really quick look at this.  The terminology is
confusing ... there are now two kinds of "sector" in the
driver.  Call one of them "lock sector" or somesuch, so
it makes sense to check the count of such sectors; and
stylistically, it'd be better not to #ifdef the guts of
the lock/unlock methods.  #define them as NULL when
SWPROT is not configured, and don't even set those
methods for devices that don't support those ops.
