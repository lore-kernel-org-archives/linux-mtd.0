Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15WevV-0002Zx-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Aug 2001 15:12:13 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <9A1957CB9FC45A4FA6F35961093ABB8403E63F4C@srvmail-mtl.ubisoft.qc.ca> 
References: <9A1957CB9FC45A4FA6F35961093ABB8403E63F4C@srvmail-mtl.ubisoft.qc.ca> 
To: Patrick Allaire <pallaire@gameloft.com>
Cc: Vipin Malik <Vipin.Malik@daniel.com>, linux-mtd@lists.infradead.org
Subject: Re: Applying MTD to 2.2.x kernel, with more info 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 14 Aug 2001 15:18:03 +0100
Message-ID: <15926.997798683@redhat.com>
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

pallaire@gameloft.com said:
>  An other question, do you know wich option I have to set to support
> this flash :

> 	Flash STMicroelectronics Part number M58LW064A150N1T, package TSOP-56
> 	manufacturer code = 0x20h
> 	device code = 0x17h 

Is it CFI-compliant? Does it use the Intel or the AMD command set (I think 
ST is the intel set)

--
dwmw2
