Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Immg-0003lq-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 09:50:19 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0206141627370.8899-100000@cliffordux.hkpc.org> 
References: <Pine.LNX.4.33.0206141627370.8899-100000@cliffordux.hkpc.org> 
To: Clifford Loo <kfloo@hkpc.org>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Problem putting JFFS on MTD 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 14 Jun 2002 09:50:14 +0100
Message-ID: <19580.1024044614@redhat.com>
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

kfloo@hkpc.org said:
>  I can now mount an erased mtdblock device directly to "/mnt/jffs".
> But creating files or directories results in I/O errors: 

Hmmm. No message from the flash driver when this happens? They're not from 
JFFS, they're from the flash driver itself. 

--
dwmw2
