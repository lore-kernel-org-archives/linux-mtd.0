Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17c7nS-0006vC-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 18:07:03 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3D4FFA9B.2C693A02@esteem.com> 
References: <3D4FFA9B.2C693A02@esteem.com>  <3D4EDA18.C77AEDA@esteem.com> 
To: Conn Clark <clark@esteem.com>
Cc: MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: Need help getting JFFS2 working with kernel 2.4.19 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 06 Aug 2002 18:06:56 +0100
Message-ID: <25573.1028653616@redhat.com>
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

clark@esteem.com said:
> 
> 	I figured it out. The jffs2 zlib was conflicting with the zlib used
> bye ppp compresion. I just had to remove zlib.o from the COMPR_OBJS
> definition in the Makefile.

There's a better fix in 2.4.20-pre2 and at 
ftp.kernel.org:/pub/linux/kernel/people/dwmw2/shared-zlib/

Get the latest patch (2.4.19-pre10) and it should apply to most 2.4 kernels.

--
dwmw2
