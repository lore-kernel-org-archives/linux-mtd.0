Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16s9Vy-0001xZ-00
	for <linux-mtd@lists.infradead.org>; Mon, 01 Apr 2002 22:38:58 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <015901c1d9a2$973ef720$87657bc8@athlon> 
References: <015901c1d9a2$973ef720$87657bc8@athlon> 
To: "Derek Ross" <dross@iders.ca>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Can cfi_cmdset.c functions be called by anybody? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 01 Apr 2002 22:35:47 +0100
Message-ID: <30890.1017696947@redhat.com>
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

dross@iders.ca said:
> This would be simplified if I were able to directly use the functions
> from cfi_cmdset_0001.c.

> Are the functions available for any application to use, or are they
> only available for device drivers? 

The read/write/erase functionality of the chip driver is presented to 
userspace via the /dev/mtd[0123...] devices. Read and write work as 
expected, and there's an ioctl to perform an erase.

--
dwmw2
