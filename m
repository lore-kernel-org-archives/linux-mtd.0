Received: from fish.redhat.com ([213.86.99.237]
	helo=executor.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A4NcE-0007YF-Hb
	for <linux-mtd@lists.infradead.org>; Tue, 30 Sep 2003 17:44:46 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Thayne Harbaugh <tharbaugh@lnxi.com>
In-Reply-To: <E1A4N9X-0001VN-IB@phoenix.infradead.org>
References: <E1A4N9X-0001VN-IB@phoenix.infradead.org>
Message-Id: <1064940235.21551.158.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 30 Sep 2003 17:43:56 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/drivers/mtd/maps sbc8240.c,NONE,1.1 Config.in,1.56,1.57
	Makefile.common,1.3,1.4
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-09-30 at 17:15 +0100, Thayne Harbaugh wrote:
> Added Files:
> 	sbc8240.c 
> Log Message:
> sbc8240 map driver contributed by Carolyn J Smith

Please add $Id$, convert to C99 initialisers and spell KiB/MiB
correctly.

(But thanks)

-- 
dwmw2
