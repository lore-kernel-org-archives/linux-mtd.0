Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157Cd8-0004Nk-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2001 09:56:02 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010605105729.A26674@crystal.2d3d.co.za> 
References: <20010605105729.A26674@crystal.2d3d.co.za>  <20010605104201.A26328@crystal.2d3d.co.za> <25630.991730918@redhat.com> 
To: Abraham vd Merwe <abraham@2d3d.co.za>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: acceptable chip driver limitations 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 05 Jun 2001 10:00:10 +0100
Message-ID: <25766.991731610@redhat.com>
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

abraham@2d3d.co.za said:
>  No, I'm talking about mtd->read() and mtd->write. Surely they can
> return errors? If not, what about physical write/read errors? 

Sorry, I misunderstood. No, that is not acceptable. You must accept 
unaligned and odd-sized writes. You can just special-case the first and 
last read/write cycles, padding writes with 0xFF. See how the existing 
driver for Intel chips does it.


--
dwmw2
