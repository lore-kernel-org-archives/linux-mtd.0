Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eb1LR-0001uk-Aa
	for linux-mtd@lists.infradead.org; Sat, 12 Nov 2005 14:47:39 -0500
Message-ID: <437646F5.6080803@mvista.com>
Date: Sat, 12 Nov 2005 11:48:05 -0800
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Russell King <rmk@arm.linux.org.uk>
References: <20051112182155.GE28987@flint.arm.linux.org.uk>
In-Reply-To: <20051112182155.GE28987@flint.arm.linux.org.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: fyi: jornada720 build failure in jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Russell King wrote:
> jffs2 seems to have a problem.  Anyone care to fix it /in/
> /mainline/ please?
> 
>   CC      fs/jffs2/scan.o
> fs/jffs2/scan.c: In function 'jffs2_fill_scan_buf':
> fs/jffs2/scan.c:288: warning: dereferencing 'void *' pointer

Fixed in linux-mtd CVS.  Avoid with CONFIG_JFFS2_FS_DEBUG=0 in the meantime.

Thomas, please consider for sending upstream, or give me the word and 
I'll mail it to Andrew, thanks,

-- 
Todd
