Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16QuXA-0006rC-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 Jan 2002 18:11:36 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020116163239.99399.qmail@web13206.mail.yahoo.com> 
References: <20020116163239.99399.qmail@web13206.mail.yahoo.com> 
To: Sanjay Kumar <sankumar73@yahoo.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 is crashing the kernel 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 16 Jan 2002 18:22:34 +0000
Message-ID: <8630.1011205354@redhat.com>
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

sankumar73@yahoo.com said:
> 5>inflate returned -4 

That's Z_MEM_ERROR. Looks like a kmalloc failed.

The oops is impossible to interpret unless it's passed through ksymoops.

--
dwmw2
