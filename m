Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178yVC-0007cv-00
	for <linux-mtd@lists.infradead.org>; Sat, 18 May 2002 08:19:42 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <hbvg9m9gs5.fsf@tolkien.mizi.com> 
References: <hbvg9m9gs5.fsf@tolkien.mizi.com>  <20020516144608.86328.qmail@web21509.mail.yahoo.com> 
To: Yong-iL Joh <tolkien@mizi.com>
Cc: Studying MTD <studying_mtd@yahoo.com>, linux-mtd@lists.infradead.org
Subject: Re: FAT for NAND Flash 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 18 May 2002 08:19:36 +0100
Message-ID: <10862.1021706376@redhat.com>
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

tolkien@mizi.com said:
>  but, we can't use current MTD's nand.c because of different usage of
> OOB. we called SMCTL as "B. Translation".

We can fix nand.c so that you can use it.

--
dwmw2
