Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16lPin-000255-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Mar 2002 07:32:21 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020314041628.BFCAB3ECC@sitemail.everyone.net> 
References: <20020314041628.BFCAB3ECC@sitemail.everyone.net> 
To: zeusj@firstlinux.net
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: why the kernel doesnt work 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 14 Mar 2002 07:43:47 +0000
Message-ID: <24565.1016091827@redhat.com>
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
> thank you for your reply , David , I've got the appropriate entry in /
> proc/mtd and I make the device file with "mknod /dev/mtdblock0 b 31
> 0", but when I try to mount jffs on it, it appears wrong  message"no
> such device", what'wrong with it?

In the 2.4 kernel, you also need CONFIG_MTD_BLOCK defined so the fake 
blockdevice driver is included. (This is about to be fixed in 2.5, but that 
won't be backported to 2.4).


--
dwmw2
