Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16kvpu-0007cj-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Mar 2002 23:37:42 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <AEA9DCA73595D411A6D4009027DE9C5E019BFA74@MSI-EX6> 
References: <AEA9DCA73595D411A6D4009027DE9C5E019BFA74@MSI-EX6> 
To: Vadim Khmelnitsky <VadimK@m-sys.com>
Cc: Mark Meade <mark@lakeshoremicro.com>, linux-mtd@lists.infradead.org
Subject: Re: UnitSizeFactor of != 1 yet? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 12 Mar 2002 23:49:06 +0000
Message-ID: <4513.1015976946@redhat.com>
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

VadimK@m-sys.com said:
> Can you tell where did you get this info from ? For Millennium 8M
> Virtual Unit size is always equal to a physical unit size 

Right.... so UnitSizeFactor should be 0xFF, not 0x00. Perhaps I did 
something stupid?

--
dwmw2
