Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 171E4T-0001iy-00
	for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2002 23:20:05 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3CC9A794.4070706@yottayotta.com> 
References: <3CC9A794.4070706@yottayotta.com>  <3CC8C1C9.80709@yottayotta.com> <14375.1019801767@redhat.com> 
To: Murtada Shah <mshah@yottayotta.com>
Cc: linux-mtd@lists.infradead.org,
    linux-arm-kernel@lists.arm.linux.org.uk
Subject: Re: Kernel removing directories 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 26 Apr 2002 23:20:03 +0100
Message-ID: <24028.1019859603@redhat.com>
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

mshah@yottayotta.com said:
> There is nothing displayed before it... Even with debug set to 2 Just
> "Netwinder Floating Point Emulator"..

Can you set DEFAULT_CONSOLE_LOGLEVEL in kernel/printk.c to 9 and try again? 
You'll want to use a serial console with _logging_.

--
dwmw2
