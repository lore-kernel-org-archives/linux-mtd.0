Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ITor-0006AX-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Jul 2001 12:30:45 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B4610D7.8040501@niisi.msk.ru> 
References: <3B4610D7.8040501@niisi.msk.ru>  <3B460280.9060805@niisi.msk.ru> <31888.994415407@redhat.com> 
To: Alexandr Andreev <andreev@niisi.msk.ru>
Cc: linux-mtd@lists.infradead.org
Subject: Re: FTL and Endianity 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 06 Jul 2001 12:35:25 +0100
Message-ID: <6473.994419325@redhat.com>
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

andreev@niisi.msk.ru said:
> But when the ftl_fromat utility creates an ftl partition, it doesn't
> swap any field of the header. So, it doesn't matter on which endianity
> the FTL driver and ftl_format works, it must be the same only. Am i
> wrong?

You're right - except that it does matter in theory. The FTL spec is 
defined as little-endian. So while it would _work_ if you do it all 
backwards, it's technically wrong. 

I'd be happier to fix ftl_format and ftl_check to do the byteswapping than 
to remove same from ftl.c.

--
dwmw2
