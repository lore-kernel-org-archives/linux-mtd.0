Received: from mail1.cray.com ([136.162.0.111])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B5RUo-00009f-0x
	for linux-mtd@lists.infradead.org; Mon, 22 Mar 2004 15:37:46 +0000
Received: from relaya.us.cray.com (relaya.us.cray.com [192.168.252.144])
	i2MFbeFj013421	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Mar 2004 09:37:40 -0600 (CST)
Received: from orchid.us.cray.com (orchid.us.cray.com [172.30.27.91])
	i2MFbdhN008521	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Mar 2004 09:37:39 -0600 (CST)
Received: from cray.com (troll [192.168.250.5])i2MFbbld4246939
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Mar 2004 09:37:37 -0600 (CST)
Message-ID: <405F0840.3030503@cray.com>
Date: Mon, 22 Mar 2004 09:37:36 -0600
From: David Updegraff <dave@cray.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <6.0.1.1.0.20040317175202.01f80e70@dns.struinfo.it>
	<200403181411.25596.tglx@linutronix.de>
	<6.0.1.1.0.20040318154520.01ec5658@192.168.2.1>
	<1079621971.16952.154.camel@hades.cambridge.redhat.com>
In-Reply-To: <1079621971.16952.154.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Large block NAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am looking at the existing 'drivers' in drivers/mtd/nand; am a bit 
baffled; need help understanding approach.

The files (spia, autcpu12..) are apparently drivers for particular NAND 
chips, but it appears to me that they all call nand_scan in nand.c, 
which in turn just looks for ids enumerated in nand_ids.h.  Does this 
not make it necessary to hand-tune which driver you want to compile with 
nand.c instead of having the drivers themselves control with nand chip 
they know how to drive -- based on what ID one finds?  Or is the 
thinking that the quirks of each little embedded gadget to too wierd 
anyway; so must hand-tune?

-dbu.
