Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AFLAm-0003tL-2J
	for <linux-mtd@lists.infradead.org>; Thu, 30 Oct 2003 22:21:45 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Robin Gilks <robin.gilks@tait.co.nz>
In-Reply-To: <3FA18616.6090201@tait.co.nz>
References: <3FA18616.6090201@tait.co.nz>
Message-Id: <1067552405.21312.41.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Thu, 30 Oct 2003 22:20:05 +0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: mtd list <linux-mtd@lists.infradead.org>
Subject: Re: Has anyone managed to compile jffs2reader lately?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-10-31 at 10:43 +1300, Robin Gilks wrote:
> I note that its commented out in the makefile and despite various hacks 
> and trials I'm unable to compile it since it seems to suffer rather a 
> lot of typedef problems (inherited from zlib I think).

Omit '-I../include' from its CFLAGS; let it include _old_ JFFS2 kernel
headers from your 2.4 kernel.

-- 
dwmw2
