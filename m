Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16kv3X-0007Xy-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Mar 2002 22:47:43 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200203121747718.SM01632@there> 
References: <200203121747718.SM01632@there> 
To: Mark Meade <mark@lakeshoremicro.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: UnitSizeFactor of != 1 yet? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 12 Mar 2002 22:59:04 +0000
Message-ID: <2920.1015973944@redhat.com>
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

mark@lakeshoremicro.com said:
>  1) On line 131 of nftlmount.c, ReplUnitTable is accessed before it is
>  allocated, causing an oops message.  

That one should be fixed.

> 2) A freshly formatted DoC Millennium (with doc504.exb firmware)
> returns a  UnitSizeFactor of 0x00. 

Er, as in "Sorry, we don't support UnitSizeFactor 0x00" ?
I don't think that's legal according to the docs I have. Vadim?



--
dwmw2
