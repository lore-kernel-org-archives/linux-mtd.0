Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Ila2-0003dg-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 08:33:10 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0206141053220.8899-100000@cliffordux.hkpc.org> 
References: <Pine.LNX.4.33.0206141053220.8899-100000@cliffordux.hkpc.org> 
To: Clifford Loo <kfloo@hkpc.org>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Problem putting JFFS on MTD 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 14 Jun 2002 08:33:05 +0100
Message-ID: <17643.1024039985@redhat.com>
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
> mount: /dev/mtdblock0 has wrong device number or fs type jffs not
> supported and cp: cannot create regular file `/dev/mtd0': No such
> device 

I'd strongly recommend using JFFS2, not JFFS. Do you definitely have the 
/dev/mtd* device nodes and CONFIG_MTD_BLOCK and CONFIG_MTD_CHAR?

--
dwmw2
