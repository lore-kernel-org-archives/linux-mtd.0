Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 176f7E-0002xV-00
	for <linux-mtd@lists.infradead.org>; Sat, 11 May 2002 23:13:24 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200205102006.g4AK6kP01710@tinman.seitzassoc.com> 
References: <200205102006.g4AK6kP01710@tinman.seitzassoc.com> 
To: Galen Seitz <galens@seitzassoc.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: patch to correct time units in printk of erase time (cfi_probe.c) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 11 May 2002 23:13:22 +0100
Message-ID: <23020.1021155202@redhat.com>
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

galens@seitzassoc.com said:
> This patch changes the time units in the printk statements which
> display the erase timeouts from microseconds to milliseconds. 

Applied. Thanks.

--
dwmw2
