Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16lnSl-000458-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Mar 2002 08:53:23 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <5.1.0.14.2.20020315094736.01e6de60@pop3.terra.es> 
References: <5.1.0.14.2.20020315094736.01e6de60@pop3.terra.es> 
To: Securez <securez@teleline.es>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problems compiling MTD 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 15 Mar 2002 09:04:45 +0000
Message-ID: <21265.1016183085@redhat.com>
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

securez@teleline.es said:
>  i put some printk functions, and it hags making the ioremap.. 

Hmmm. For uClinux you don't really need the ioremap - I'm surprised that it 
breaks. Just comment it out and make it use the real address. If that 
doesn't work, check with the uClinux people.

--
dwmw2
