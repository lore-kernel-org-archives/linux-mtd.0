Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16iywY-0005Gp-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Mar 2002 14:32:30 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C876F87.2010903@gmx.de> 
References: <3C876F87.2010903@gmx.de>  <002701c1c5dc$c9ba47b0$1900000a@v.vmanage.com> 
To: Juergen Brunk <juergen.brunk@gmx.de>
Cc: Gad Hayisraeli <gad@syete.co.il>,
    Linux-mtd List <linux-mtd@lists.infradead.org>,
    Linux-Arm List <linux-arm@lists.arm.linux.org.uk>,
    JFFS dev list <jffs-dev@axis.com>
Subject: Re: dump for jffs2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 07 Mar 2002 14:43:33 +0000
Message-ID: <3273.1015512213@redhat.com>
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

juergen.brunk@gmx.de said:
>  May this help you?

Possibly in conjunction with the new jffs2 code in 2.4.18 that doesn't
always report i_size of zero for symlinks? :)

--
dwmw2
