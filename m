Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16WjKq-0007ZX-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Feb 2002 19:26:56 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C5ADFC8.BD97CFFF@comdev.cc> 
References: <3C5ADFC8.BD97CFFF@comdev.cc>  <3C5AD150.1A3B9AAE@comdev.cc> <20020201142405.79130.qmail@web20309.mail.yahoo.com> <9323.1012576311@redhat.com> <30239.1012586688@redhat.com> 
To: Adam Wozniak <adam.wozniak@comdev.cc>
Cc: linux-mtd@lists.infradead.org
Subject: Re: debugging strategies for jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 01 Feb 2002 19:38:02 +0000
Message-ID: <31627.1012592282@redhat.com>
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

adam.wozniak@comdev.cc said:
>  scan.c, 495
>                         return -0; 
> Was that intentional?

Er, that looks buggered. Make it mark the node obsolete and continue 
scanning.

--
dwmw2
