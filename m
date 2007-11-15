Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Isdv8-0002se-ML
	for linux-mtd@lists.infradead.org; Thu, 15 Nov 2007 07:34:16 -0500
Date: Thu, 15 Nov 2007 13:33:52 +0100
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] More CFI fixups for Atmel chips
Message-ID: <20071115133352.4bf0bba2@dhcp-255-175.norway.atmel.com>
In-Reply-To: <1193758387-9325-1-git-send-email-hskinnemoen@atmel.com>
References: <1193758387-9325-1-git-send-email-hskinnemoen@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hans-Christian Egtvedt <hcegtvedt@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 30 Oct 2007 16:33:07 +0100
Haavard Skinnemoen <hskinnemoen@atmel.com> wrote:

> This patch (or some variation of it) has been posted a couple of times
> before to the MTD list, and I find myself applying it over and over
> again when testing stuff against the latest mainline tree. I'd
> appreciate if you could either apply it or thoroughly NAK it, as MTD
> on the ATNGW100 board is currently broken.

Ok, can I just get a quick ACK or NAK then? I'd really like to get this
fixed in mainline. It's causing real data corruption problems on real
boards that are otherwise nicely supported in mainline.

Håvard
