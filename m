Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Wdta-0002Ul-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Aug 2001 14:06:10 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <9A1957CB9FC45A4FA6F35961093ABB8403E63F4C@srvmail-mtl.ubisoft.qc.ca> 
References: <9A1957CB9FC45A4FA6F35961093ABB8403E63F4C@srvmail-mtl.ubisoft.qc.ca> 
To: Patrick Allaire <pallaire@gameloft.com>
Cc: Vipin Malik <Vipin.Malik@daniel.com>, linux-mtd@lists.infradead.org
Subject: Re: Applying MTD to 2.2.x kernel, with more info 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 14 Aug 2001 14:11:58 +0100
Message-ID: <7329.997794718@redhat.com>
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
> init/main.o: In function `do_basic_setup': init/main.o(.text.init+0xdc9
> ): undefined reference to `init_mtd' make: *** [vmlinux] Error 1 

2.2.18 has the sane initcalls backported from 2.4, so you don't need the 
patch to call init_mtd(). Which is actually called init_mtd_devices() 
afaict.

--
dwmw2
