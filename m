Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16AvWh-00089u-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Dec 2001 16:01:03 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0112030715100.14716-100000@newbast.lynuxworks.com> 
References: <Pine.LNX.4.33.0112030715100.14716-100000@newbast.lynuxworks.com> 
To: Aleksander Sanochkin <asanochkin@Lnxw.COM>
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: cfi_cmdset_001.c problem 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 03 Dec 2001 16:11:37 +0000
Message-ID: <13387.1007395897@redhat.com>
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

asanochkin@Lnxw.COM said:
>  I seem to remember this, too. But it was in the read() routine. It
> used to switch flash to the status mode and then back to ready even if
> it had been ready right away. Our modification affects only write and
> erase routines.

OK, if you're sure it doesn't adversely affect performance, then please go 
ahead and commit it.

--
dwmw2
