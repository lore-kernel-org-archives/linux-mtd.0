Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 153Hb1-0000Aq-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 May 2001 14:25:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B0E5857.636CBC17@niisi.msk.ru> 
References: <3B0E5857.636CBC17@niisi.msk.ru> 
To: andreev <andreev@niisi.msk.ru>
Cc: "linux-mtd@lists.infrared.org" <linux-mtd@lists.infradead.org>
Subject: Re: Why timer interrupt is disabled? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 25 May 2001 14:12:51 +0100
Message-ID: <11329.990796371@redhat.com>
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

andreev@niisi.msk.ru said:
>  In do_ftl_request i found commented out sti() function. Why it were
> commented out? I had a look to the current sourse in your CVS, and i
> found that sti() is still commented out. Where we have to enable
> interrupts? If driver works under the closed interrupts, why does it
> use the time_after and jiffies? Can anybody tell me abouut it?

You probably need to unlock the io_request_lock. But you probably shouldn't 
be using FTL anyway - why not just put JFFS or JFFS2 on the flash directly?

--
dwmw2
