Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Qwc9-00070a-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 Jan 2002 20:24:53 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <19201.1011213161@redhat.com> 
References: <19201.1011213161@redhat.com>  <3C45DC51.599F4E7B@comdev.cc> <20020116163239.99399.qmail@web13206.mail.yahoo.com> <8630.1011205354@redhat.com> 
To: Adam Wozniak <adam.wozniak@comdev.cc>, linux-mtd@lists.infradead.org
Subject: Re: different crash (was Re: JFFS2 is crashing the kernel) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 16 Jan 2002 20:35:52 +0000
Message-ID: <19249.1011213352@redhat.com>
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

dwmw2@infradead.org said:
>  Can you look at the assembly and see precisely what line of code was
> faulting? Recompiling the offending file with identical flags except
> for  adding '-g' can be useful.

Note to self: Read all of mail before replying. It makes you look less 
stupid.

What version of build.c?

--
dwmw2
