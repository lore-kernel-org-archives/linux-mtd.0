Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17biQ0-0003cv-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Aug 2002 15:01:08 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3D4E3DBC.4F73955D@enst.fr> 
References: <3D4E3DBC.4F73955D@enst.fr> 
To: Sylvain Meunier <meunier@enst.fr>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Mix flash sector size and JFFS2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 05 Aug 2002 15:01:04 +0100
Message-ID: <24149.1028556064@redhat.com>
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


meunier@enst.fr said:
>  Does a single filesystem JFFS2 need that all sectors of flash
> partition are same size or could we use different sector size (as for
> some flash that mix small and big sector). ?

JFFS2 only operates with a single sector size. However, when you have 
smaller erase blocks you will generally find that they add up to a single 
block's worth of the normal erase size. For example, 8*8KiB + 15*64KiB. 

JFFS2 will work OK on that, and just treat the 8*8KiB blocks as a single 
64KiB block.


--
dwmw2
