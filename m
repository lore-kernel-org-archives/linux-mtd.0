Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 172Uav-00005M-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Apr 2002 11:10:49 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <00d201c1f02d$f672d580$bdb270d5@homeip.net> 
References: <00d201c1f02d$f672d580$bdb270d5@homeip.net> 
To: johan.adolfsson@axis.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] Create mtdram device at runtime. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 30 Apr 2002 11:10:37 +0100
Message-ID: <30704.1020161437@redhat.com>
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
>  Does it make enough sense to go into the official version  (after
> some tweaking)? 

Looks OK. Can you split the new init_mtdram() into two entirely separate 
functions; one for the CONFIG_MTDRAM_ABS_POS case, one for the vmalloc() 
case?

--
dwmw2
