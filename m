Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ua2X-0000bj-00
	for <linux-mtd@lists.infradead.org>; Fri, 19 Oct 2001 14:50:22 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BD030F4.300970C9@uniquemodem.com> 
References: <3BD030F4.300970C9@uniquemodem.com>  <3BCD84E1.4DD484A6@uniquemodem.com> <25716.1003325012@redhat.com> 
To: data <data@uniquemodem.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problem on recognise the CFI flash chip on SC520CDP 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 19 Oct 2001 14:59:24 +0100
Message-ID: <18972.1003499964@redhat.com>
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

data@uniquemodem.com said:
>  We got through the kernel compilation process but we encountered
> another problem on recognising the CFI flash chip. I have compared
> with the boot up process of other people. They usually have the CFI
> recongising but we don't have, i.e. CFI: Found 4*8 device....

Check your .config matches theirs exactly. You seem to be probing in 
different locations, and trying to use the jedec module which isn't enabled 
in your kernel.

--
dwmw2
