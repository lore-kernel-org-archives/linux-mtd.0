Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16l4sW-00008D-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2002 09:17:00 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020313092505.3D9472756@sitemail.everyone.net> 
References: <20020313092505.3D9472756@sitemail.everyone.net> 
To: zeusj@firstlinux.net
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: why the kernel doesnt work 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 13 Mar 2002 09:28:25 +0000
Message-ID: <27340.1016011705@redhat.com>
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

zeusj@firstlinux.net said:
> I am trying to add a intel 28f128 strataflash to perseus borad 
> I think what I should do is just to:
> 1.create a file named perseus-flash.c in /drivers/mtd/maps based on physmap
> 2.modify the Config.in and Makefile in the same directory
> 3.set the configuration and remake the kernel image to restart

> is that right? and if it is,what should happen or how can i check 
> whether the flash works well.

That's right. You should see happy messages when it detects the flash, and 
an appropriate entry in /proc/mtd.

--
dwmw2
