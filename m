Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16W0XW-0004LV-00
	for <linux-mtd@lists.infradead.org>; Wed, 30 Jan 2002 19:37:02 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <EA23924D8B48774F889C7733226B28E80E7D99@exalane.intransa.com> 
References: <EA23924D8B48774F889C7733226B28E80E7D99@exalane.intransa.com> 
To: "Paul Lai" <paul.lai@intransa.com>
Cc: "Mtd-Linux (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: looking for pushpull.c [newbie question] 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 30 Jan 2002 19:48:03 +0000
Message-ID: <5899.1012420083@redhat.com>
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
>  So, where's pushpull.c?  Where am I not looking?

It doesn't need it any more. Remove it from the Makefile. It might still 
not build though - the source is in flux at the moment. There's an i386 
binary at http://sources.redhat.com/jffs2/

--
dwmw2
