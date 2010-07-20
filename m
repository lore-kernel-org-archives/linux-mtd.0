Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ObA4F-0006Ir-39
	for linux-mtd@lists.infradead.org; Tue, 20 Jul 2010 10:28:55 +0000
Subject: Re: [PATCH 1/2] mxc_nand: fix Unbalanced enable for IRQ
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
In-Reply-To: <4C457885.9000404@pengutronix.de>
References: <1276178584-10074-1-git-send-email-eric@eukrea.com>
	<1279345824.3212.24.camel@localhost.localdomain>
	<4C457885.9000404@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 20 Jul 2010 13:22:17 +0300
Message-ID: <1279621337.16462.100.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: s.hauer@pengutronix.de, u.kleine-koenig@pengutronix.de,
	linux-mtd@lists.infradead.org, ivo.clarysse@gmail.com,
	linux-arm-kernel@lists.arm.linux.org.uk
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, 2010-07-20 at 12:20 +0200, Marc Kleine-Budde wrote:
> Current mainline has (still) this problem, too. Is there any change to
> get this patch into 2.6.35 before the release?

You should bug David Woodhouse about this.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
