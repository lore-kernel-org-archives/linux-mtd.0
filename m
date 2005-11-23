Received: from baythorne.infradead.org ([2001:8b0:10b:1::1])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EexHR-0007PM-OW
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2005 11:15:34 -0500
From: David Woodhouse <dwmw2@infradead.org>
To: hs@denx.de
In-Reply-To: <AHEILKONAKAEJPHNMOPNMEMKCDAA.hs@denx.de>
References: <AHEILKONAKAEJPHNMOPNMEMKCDAA.hs@denx.de>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Nov 2005 16:15:29 +0000
Message-Id: <1132762529.15117.281.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
Subject: RE: [PATCH]	MTD:	Add support for the PM82x Boards.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-11-23 at 17:08 +0100, Heiko Schocher wrote:
> I ported this code from the 2.4er Kernel, so I didn´t know
> the background, why this code uses the jedec-probe. What
> exactly bothers you?

The JEDEC tables are large enough already -- if the chips do support the
CFI probe, then I'd prefer not to add them to the table.

-- 
dwmw2
