Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15gOVS-0005BD-00
	for <linux-mtd@lists.infradead.org>; Mon, 10 Sep 2001 11:41:34 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <003a01c139e4$28e04e40$c801a8c0@starticon> 
References: <003a01c139e4$28e04e40$c801a8c0@starticon>  <002201c139d7$0c1948a0$c801a8c0@starticon> <30336.1000112243@redhat.com> 
To: "Yunus Shaikh" <yshaikh@start-icon.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Kernel 2.4.0 and Doc2000 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 10 Sep 2001 11:47:38 +0100
Message-ID: <10486.1000118858@redhat.com>
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

yshaikh@start-icon.com said:
> > > Unable to handle kernel NULL pointer dereference at virtual address 00000000
> >  You need to feed the whole of that through ksymoops or it's useless to us. 
> Unable to handle kernel NULL pointer dereference at virtual address 00000000

You need to feed the whole of that through ksymoops or it's useless to us. 

Read Documentation/oops-tracing.txt

--
dwmw2
