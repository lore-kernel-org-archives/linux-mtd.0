Received: from mail8.cadvision.com ([207.228.64.93] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15f28P-00057q-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Sep 2001 17:36:09 +0100
Received: from grosmorne.wirelessnetworksinc.com (h-207-228-117-70.gen.cadvision.com [207.228.117.70])
	by mail8.cadvision.com (8.9.3/8.9.3/CWT/DCE) with SMTP id KAA28237
	for <linux-mtd@lists.infradead.org>; Thu, 6 Sep 2001 10:41:42 -0600
From: Herman Oosthuysen <herman@wirelessnetworksinc.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: DiskOnChip write performance
Date: Thu, 6 Sep 2001 10:45:46 -0600
Content-Type: text/plain
References: <01090609533800.00800@grosmorne.wirelessnetworksinc.com> <Pine.LNX.4.33.0109061600490.9437-100000@hex.linuxgrrls.org> <13924.999791398@redhat.com>
In-Reply-To: <13924.999791398@redhat.com>
MIME-Version: 1.0
Message-Id: <01090610482402.00800@grosmorne.wirelessnetworksinc.com>
Content-Transfer-Encoding: 8bit
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

In  my experience, a disk drive is always at least an order of magnitude slower
than the figure in the sales brochure, so the measured 70KB/s is probably
good...

Herman

On Thu, 06 Sep 2001, David Woodhouse wrote:
> herman@wirelessnetworksinc.com said:
> >  You may be able to speed the system up a little by optimizing the
> > code, but the improvement will be insignificant compared to the erase
> > cycle time.
> 
> Don't count on that if you're using my drivers. There are some fairly 
> inefficient algorithms in there which I threw in to see if I could get it 
> to work, and haven't yet had time to rewrite.
> 
> --
> dwmw2
