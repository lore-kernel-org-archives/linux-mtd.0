Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cjNR-0004a1-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2002 10:14:41 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3D518D06.B809B67@mvista.com> 
References: <3D518D06.B809B67@mvista.com>  <002f01c23dfb$dea583f0$5501a8c0@synso.com.tw> <1028717345.19447.249.camel@thomas.tec.linutronix.de> 
To: Alice Hennessy <ahennessy@mvista.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
    Steve Tsai <startec@ms11.hinet.net>,
    Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: NAND Configuration 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 08 Aug 2002 10:14:02 +0100
Message-ID: <2777.1028798042@redhat.com>
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

ahennessy@mvista.com said:
>  From looking at nand_erase(), it appears that the attempted erase of
> a bad block would result in not performing the erase and exiting with
> -EIO, correct?

> What is the preferred method to erase nand? 

As I understand it, the preferred method to erase factory-marked bad blocks
is not at all.

--
dwmw2
