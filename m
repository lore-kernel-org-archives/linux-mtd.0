Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fU3m-0003ye-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2002 22:57:30 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <003c01c1be50$93d84590$e297000f@SNAGGLE> 
References: <003c01c1be50$93d84590$e297000f@SNAGGLE> 
To: "Christopher Hoover" <ch@murgatroid.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: patch for lock/unlock with varsize (against infradead cvs) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 25 Feb 2002 23:08:47 +0000
Message-ID: <7546.1014678527@redhat.com>
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

ch@murgatroid.com said:
>  (I'm not sure this applies cleanly anymore but it did as of
> Valentine's Day.) 

It doesn't - I cleaned up the #ifdef CFI_WORD_64 stuff. Can I have another? 
Sorry to be a pain.

--
dwmw2
