Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15f1PH-00050Q-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Sep 2001 16:49:31 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0109061649230.9437-100000@hex.linuxgrrls.org> 
References: <Pine.LNX.4.33.0109061649230.9437-100000@hex.linuxgrrls.org> 
To: kira brown <kira@hex.linuxgrrls.org>
Cc: Herman Oosthuysen <herman@wirelessnetworksinc.com>,
    "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: DiskOnChip write performance 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 06 Sep 2001 16:55:32 +0100
Message-ID: <14482.999791732@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

kira@hex.linuxgrrls.org said:
>  There are basically two ways to speed this situation up:

Don't forget "don't use O(n^3) algorithms when trying to find a new block 
to write to".


--
dwmw2
