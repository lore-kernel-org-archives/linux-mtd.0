Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BlOpI-0007iC-5c
	for linux-mtd@lists.infradead.org; Fri, 16 Jul 2004 05:16:20 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Dave Airlie <airlied@linux.ie>
In-Reply-To: <Pine.LNX.4.58.0406020642310.16424@skynet>
References: <Pine.LNX.4.58.0406020642310.16424@skynet>
Content-Type: text/plain
Message-Id: <1089969377.8822.177.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Fri, 16 Jul 2004 10:16:17 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [patch] MTD: add st m50fw0* to jedec_probe.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-06-02 at 06:46 +0100, Dave Airlie wrote:
> Please ignore my last patch, my hardware guy pointed me at some more
> chips,
> 
> so this patch adds support to the jedec probe for ST M50FW040, M50FW080
> and M50FW016 all Firmware hubs for i8x0 chipsets,

AFAICT those three are all already in CVS and in Linus' current
BitKeeper tree.

-- 
dwmw2
