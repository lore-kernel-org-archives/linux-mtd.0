Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A7Vaz-000740-9v
	for <linux-mtd@lists.infradead.org>; Thu, 09 Oct 2003 08:52:26 +0100
From: David Woodhouse <dwmw2@redhat.com>
To: Kevin Liao <kevinliao@iei.com.tw>
In-Reply-To: <012c01c38e38$85298770$ab0a10ac@rdkevinliaonb>
References: <1065683429.30987.223.camel@imladris.demon.co.uk>
	 <012c01c38e38$85298770$ab0a10ac@rdkevinliaonb>
Message-Id: <1065685868.30987.262.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Thu, 09 Oct 2003 08:51:08 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: etux@embeddedtux.org
cc: jffs-dev@axis.com
Subject: Re: [ANNOUNCE] JFFS2 support for NAND flash..
Reply-To: dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-10-09 at 15:39 +0800, Kevin Liao wrote:
> Congratulations and thanks a lot for all your effort! Does mtd-snapshot-20031008.tar.bz2 contains all thses?

Thanks. No it doesn't, at least not entirely -- although all the NAND
wbuf handling has been there for a while, some of the tuning changes to
the GC were actually committed in the small hours of this morning. The
next snapshot will have it.

Your question was worth answering on all three lists; further followups
to only one please.

-- 
dwmw2
