Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16cr0x-0007I8-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2002 16:51:43 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0202181800360.20027-100000@dagobert.svc.sysgo.de> 
References: <Pine.LNX.4.21.0202181800360.20027-100000@dagobert.svc.sysgo.de> 
To: Robert Kaiser <rob@sysgo.de>
Cc: "Brian J. Fox" <bfox@ua.com>, linux-mtd@lists.infradead.org,
    joern@wohnheim.fh-wedel.de
Subject: Re: MTD concat layer 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 18 Feb 2002 17:02:56 +0000
Message-ID: <7861.1014051776@redhat.com>
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

rob@sysgo.de said:
>  OK, so we all finally agree that BUG() is the way to go (rather than
> returning -EINVAL. Right ?

As long as you make sure you can't trigger the BUG() from the mtdchar 
ioctl() routine, yes.



--
dwmw2
