Received: from baythorne.infradead.org ([2001:8b0:10b:1::1])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EeuHE-0004Ig-C6
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2005 08:03:08 -0500
From: David Woodhouse <dwmw2@infradead.org>
To: hs@denx.de
In-Reply-To: <AHEILKONAKAEJPHNMOPNCEMHCDAA.hs@denx.de>
References: <AHEILKONAKAEJPHNMOPNCEMHCDAA.hs@denx.de>
Content-Type: text/plain
Date: Wed, 23 Nov 2005 13:03:06 +0000
Message-Id: <1132750986.15117.252.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, tglx@linutronix.de, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]	MTD:	Add support for the PM82x Boards.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-11-23 at 13:37 +0100, Heiko Schocher wrote:
> now without drivers/mtd/devices/docprobe.c

Thanks. Are those Intel chips really not CFI-compliant? 
Please could you also correct each instance of 'MB' to 'MiB'?

-- 
dwmw2
