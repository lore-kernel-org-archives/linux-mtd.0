Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17kQ1I-0000Ga-00
	for <linux-mtd@lists.infradead.org>; Thu, 29 Aug 2002 15:11:36 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3D6E2A8D.4000502@goepel.com> 
References: <3D6E2A8D.4000502@goepel.com> 
To: Michael Palme <m.palme@goepel.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: 2.4.18-rmk7 + CVS jffs2 ld error (zlib) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 29 Aug 2002 15:11:27 +0100
Message-ID: <24260.1030630287@redhat.com>
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


m.palme@goepel.com said:
>  so i grepped around in the list archive and found a possible solution
> to  remove compr_zlib.o from COMPR_OBJS in jffs2/Makefile. Now after
> rebuilding i get:

Don't do that. Apply 

http://ftp.kernel.org/pub/linux/kernel/people/dwmw2/shared-zlib/linux-2.4.19-pre10-shared-zlib.gz 



--
dwmw2
