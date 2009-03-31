Received: from airmail.airvana.com ([12.6.244.135]
	helo=airmail.wirelessworld.airvananet.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lom9B-000178-Mm
	for linux-mtd@lists.infradead.org; Tue, 31 Mar 2009 22:09:37 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH] [MTD] devices/mtd_dataflash: Add SW sector protection
	support
Date: Tue, 31 Mar 2009 22:08:26 -0000
Message-ID: <4B3F8896E1733D4787DDB0EA1C7FF91F7EFFCE@ukmail.uk.wirelessworld.airvananet.com>
In-Reply-To: <200903231335.32064.david-b@pacbell.net>
References: <AcmXQvsMZtFKpGUCSJK7bv2cngp9Eg==>
	<4B3F8896E1733D4787DDB0EA1C7FF91F7556E7@ukmail.uk.wirelessworld.airvananet.com>
	<8bd0f97a0902251050i3d6fc22qaad178a1d7e5b51b@mail.gmail.com>
	<200903231335.32064.david-b@pacbell.net>
From: "Mike McTernan" <mmcternan@airvana.com>
To: "David Brownell" <david-b@pacbell.net>,
	"Mike Frysinger" <vapier.adi@gmail.com>
Cc: linux-mtd@lists.infradead.org, Ulf Samuelsson <ulf.samuelsson@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 23 March 2009 20:36, David Brownell wrote:

> I took a really quick look at this.=20

Many thanks.

> The terminology is confusing ... there are now two kinds=20
> of "sector" in the driver.  Call one of them "lock sector"
> or somesuch,

It's as per the datasheet figure 4-1; the device has pages, blocks and
sectors.  Blocks aren't very interesting so are not in the driver, but
pages and sectors are.  But I see only one use of sectors in this
driver, what am I missing?

> so it makes sense to check the count of such sectors

Could you clarify what you mean here?

> stylistically, it'd be better not to #ifdef the guts of
> the lock/unlock methods.  #define them as NULL when
> SWPROT is not configured, and don't even set those
> methods for devices that don't support those ops.

That's easily changed.

Kind Regards,

Mike
