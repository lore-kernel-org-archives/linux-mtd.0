Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BmutC-0000jR-8P
	for linux-mtd@lists.infradead.org; Tue, 20 Jul 2004 09:42:39 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
In-Reply-To: <1090250271.14173.6.camel@famine>
References: <1090250271.14173.6.camel@famine>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jul 2004 09:41:32 -0400
Message-Id: <1090330892.4614.1.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: problems with JFFS2 assert failure on mutex
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-07-19 at 17:17 +0200, Øyvind Harboe wrote:
> I was working on a different problem when I came across a mutex that
> was being obtained twice(discovered via eCos asserts).
> 
> On the surface of it, this patch looks correct.

Looks correct; I've committed an equivalent to CVS. Thanks.

> Comments?

Only that this error path should never happen. The call to
jffs2_gc_fetch_inode() for a valid inode should _never_ fail.

-- 
dwmw2
