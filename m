Received: from [209.92.187.33] (helo=core.arrancar.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18XoCk-0005Ow-00
	for <linux-mtd@lists.infradead.org>; Sun, 12 Jan 2003 19:55:34 +0000
Received: from core.arrancar.com (localhost [127.0.0.1])
	by core.arrancar.com (8.12.2/8.12.2) with ESMTP id h0CJhiNN026829
	for <linux-mtd@lists.infradead.org>; Sun, 12 Jan 2003 16:43:45 -0300
Subject: Re: JFFS2 on block devices
From: Federico Ferreres <fferreres@arrancar.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <13805.1042363286@passion.cambridge.redhat.com>
References: <1042352498.1998.19.camel@tp>  
	<13805.1042363286@passion.cambridge.redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 12 Jan 2003 17:22:05 -0300
Message-Id: <1042402929.12878.10.camel@tp>
Mime-Version: 1.0
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

On Sun, 2003-01-12 at 06:21, David Woodhouse wrote:
 
> Out of interest, are you using the current code from CVS or the stable 
> branch from the 2.4 kernel? The current code should mount a _lot_ faster.
> How long does it take to mount?

I am using the kernel version and mount time is about 15 minutes on this
celeron 433. After mounting, speed and reliability are great. I'll test
the CVS version today and report back!

Regards,

Federico

> --
> dwmw2
> 
> 
