Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Zt97-0006lq-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 14:04:09 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <013d01c2388f$94c655a0$1b0448c0@gv.com.tw> 
References: <013d01c2388f$94c655a0$1b0448c0@gv.com.tw>  <010c01c2388d$05af1660$1b0448c0@gv.com.tw> <007901c23869$35d3f500$1b0448c0@gv.com.tw> <31207.1028103302@redhat.com> <6562.1028118221@redhat.com> 
To: "??" <kevin@gv.com.tw>
Cc: linux-mtd@lists.infradead.org
Subject: Re: do i have to "eraseall" first? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 31 Jul 2002 14:04:06 +0100
Message-ID: <10399.1028120646@redhat.com>
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

kevin@gv.com.tw said:
>  now it report many "magic bitmask not found" do i have to do
> something like "eraseall /dev/mtdblock1" before "cp test.img /dev/
> mtdblock1"? 

Yes. eraseall /dev/mtd1. I don't remember how you are supposed to write the 
images so the ECC is correct. Thomas?

--
dwmw2
