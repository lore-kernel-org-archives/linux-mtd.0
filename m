Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16gVL5-0000ha-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Feb 2002 18:31:35 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <EA23924D8B48774F889C7733226B28E80E7DBA@exalane.intransa.com> 
References: <EA23924D8B48774F889C7733226B28E80E7DBA@exalane.intransa.com> 
To: "Paul Lai" <paul.lai@intransa.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 and flash sectors 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 28 Feb 2002 18:42:49 +0000
Message-ID: <4190.1014921769@redhat.com>
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

paul.lai@intransa.com said:
> How cognizant of flash sectors is jffs2? 

Very.

> Will an inode and it's data cross flash sector boundaries?  

No single node (log entry) will cross sector boundary. An inode may have 
nodes in any sectors though.

> Or will jffs2 align them to fit within and start them on flash sector
> boundaries?

http://sources.redhat.com/jffs2/jffs2.pdf

--
dwmw2
