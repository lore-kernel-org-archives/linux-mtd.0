Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15f1K6-0004yQ-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Sep 2001 16:44:10 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <01090609533800.00800@grosmorne.wirelessnetworksinc.com> 
References: <01090609533800.00800@grosmorne.wirelessnetworksinc.com>  <Pine.LNX.4.33.0109061600490.9437-100000@hex.linuxgrrls.org> 
To: Herman Oosthuysen <herman@wirelessnetworksinc.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: DiskOnChip write performance 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 06 Sep 2001 16:49:58 +0100
Message-ID: <13924.999791398@redhat.com>
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

herman@wirelessnetworksinc.com said:
>  You may be able to speed the system up a little by optimizing the
> code, but the improvement will be insignificant compared to the erase
> cycle time.

Don't count on that if you're using my drivers. There are some fairly 
inefficient algorithms in there which I threw in to see if I could get it 
to work, and haven't yet had time to rewrite.

--
dwmw2
