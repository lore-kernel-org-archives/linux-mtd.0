Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16T3zA-0007fT-00
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jan 2002 16:41:24 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020122143808.55950.qmail@web20303.mail.yahoo.com> 
References: <20020122143808.55950.qmail@web20303.mail.yahoo.com> 
To: =?iso-8859-1?q?David=20Mackay?= <monitoreurope@yahoo.co.uk>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS XConfig 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 22 Jan 2002 16:52:26 +0000
Message-ID: <16227.1011718346@redhat.com>
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

monitoreurope@yahoo.co.uk said:
>  We have downloaded the source of 2.4.12 and are using XConfig to set
> compile parameters. We intend a system with a 16M compact flash IDE
> device formatted as JFFS2. However when it comes to JFFS2 the option
> is greyed out, JFFS is however available for selection, any thoughts? 

JFFS and JFFS2 will not be available unless you have selected CONFIG_MTD.

As you don't have any flash devices on your system and you want to use 
JFFS2 on a hard drive, you need to select the 'blkmtd' driver and configure 
it to use your CF drive as backing store for the faked MTD device.

--
dwmw2
