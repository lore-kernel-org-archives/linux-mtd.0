Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15U3Nf-0007G3-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Aug 2001 10:42:31 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B67E336.B7925626@hispafuentes.com> 
References: <3B67E336.B7925626@hispafuentes.com> 
To: Juan Ramon Jimenez Garcia <juan@hispafuentes.com>
Cc: linux-mtd@lists.infradead.org, olea@hispafuentes.com
Subject: Re: Problems compiling kernel 2.2.17 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 07 Aug 2001 10:48:21 +0100
Message-ID: <523.997177701@redhat.com>
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


juan@hispafuentes.com said:
>  but now we got another link error with an undefined reference to
> 'init_nftl' 

init_nftl was declared 'static' because that works in 2.4 and I don't often 
test with 2.2 kernels before 2.2.18 (where it also works because the 2.4 
initcall stuff has been merged). I've now fixed it in v1.77 of nftlcore.c.

> How can we solved this? Do you think we must to configure
> something special to get the kernel image?

Using 2.2.18 would help - it does the initcall stuff in the new way.
Otherwise, it ought to work, it's mostly just details like the above which I
won't have noticed.


--
dwmw2
