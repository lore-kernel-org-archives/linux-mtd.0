Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 172Wdw-0000G7-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Apr 2002 13:22:04 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <012701c1f031$bc52eee0$bdb270d5@homeip.net> 
References: <012701c1f031$bc52eee0$bdb270d5@homeip.net>  <00d201c1f02d$f672d580$bdb270d5@homeip.net> <30704.1020161437@redhat.com> 
To: johan.adolfsson@axis.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] Create mtdram device at runtime. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 30 Apr 2002 13:21:53 +0100
Message-ID: <18096.1020169313@redhat.com>
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

johan.adolfsson@axis.com said:
> Here it comes, not tested though... Beleive I took care of the cleanup
> as well.

What about the case where mtdram_init_device() is called from elsewhere?
Perhaps we should register a cleanup function with as mtdram_init_device()
and call _that_ in the later cleanup?

--
dwmw2
