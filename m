Received: from smtpeu1.atmel.com ([195.65.72.27] helo=bagnes.atmel.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KkeFC-0005mT-ID
	for linux-mtd@lists.infradead.org; Tue, 30 Sep 2008 12:22:22 +0000
Date: Tue, 30 Sep 2008 14:22:07 +0200
From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
To: "Leon Woestenberg" <leon.woestenberg@gmail.com>
Subject: Re: [PATCH] mtd: AT49BV6416 has swapped erase regions
Message-ID: <20080930142207.72d5edaa@hskinnemo-gx745.norway.atmel.com>
In-Reply-To: <c384c5ea0809300502h48915058r78a6586968c1ac1a@mail.gmail.com>
References: <1222775733-6690-1-git-send-email-haavard.skinnemoen@atmel.com>
	<c384c5ea0809300502h48915058r78a6586968c1ac1a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"Leon Woestenberg" <leon.woestenberg@gmail.com> wrote:
> Haavard,
> 
> On Tue, Sep 30, 2008 at 1:55 PM, Haavard Skinnemoen
> <haavard.skinnemoen@atmel.com> wrote:
> > The CFI information read from AT49BV6416 lists the erase regions in the
> > wrong order, causing problems when trying to erase or update the first
> > or last 64K block.
> >
> Are there other Atmel designs with this bug or only the chip with this CFI ID?

That's a good question. I guess there may be others in the same family
with the same bug. I don't really know.

The replacement, AT49BV642D, does not have this bug.

> I ask, because the check in u-boot is too generic; I found u-boot
> wrongly assumes wrong order for another Atmel part, not checking on a
> specific CFI ID.

That's interesting...especially since u-boot only reads the low byte
of the JEDEC ID, so adding a fixup for one particular ID may match tons
of chips with 16-bit IDs.

I'll have to check the latest u-boot and see if it breaks any of my
boards.

Haavard
