Received: from az33egw02.freescale.net ([192.88.158.103])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1My8Lw-0007Do-28
	for linux-mtd@lists.infradead.org; Wed, 14 Oct 2009 18:13:40 +0000
Received: from de01smr02.am.mot.com (de01smr02.freescale.net [10.208.0.151])
	by az33egw02.freescale.net (8.14.3/az33egw02) with ESMTP id
	n9EIDUbV025295 for <linux-mtd@lists.infradead.org>;
	Wed, 14 Oct 2009 11:13:31 -0700 (MST)
Received: from az33exm25.fsl.freescale.net (az33exm25.am.freescale.net
	[10.64.32.16])
	by de01smr02.am.mot.com (8.13.1/8.13.0) with ESMTP id n9EIGXKX024177
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Oct 2009 13:16:33 -0500 (CDT)
Message-ID: <4AD614E4.6030005@freescale.com>
Date: Wed, 14 Oct 2009 13:13:56 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Felix Radensky <felix@embedded-sol.com>
Subject: Re: UBIFS problem on MPC8536DS
References: <4AD5ADC9.30503@embedded-sol.com>	<4AD5C5B4.3060303@nokia.com>	<4AD5D053.9000901@embedded-sol.com>	<4AD5FFE7.7080703@nokia.com>
	<4AD60EF4.4080306@embedded-sol.com>
In-Reply-To: <4AD60EF4.4080306@embedded-sol.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Felix Radensky wrote:
> Yes, NAND and NOR are on the same local bus controller.
> 
> Maybe powerpc folks can provide some insight here.
> Is it possible that simultaneous access to NOR and NAND
> on MPC8536 can result in NAND timeouts ?

I've heard other reports of such problems with eLBC, but was unable to 
reproduce it myself last time I tried.  Could you reduce this down to a 
minimal set of specific reproduction instructions (e.g. eliminate UBI if 
possible, or else explain how to set up UBI)?

-Scott
