Received: from webmanixhosting.com ([216.40.225.16]
	helo=www.webmanixhosting.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BVv7V-0001Ow-Nz
	for linux-mtd@lists.infradead.org; Thu, 03 Jun 2004 12:31:12 -0400
From: "Dan Post" <djp.mtd@onemyth.net>
To: linuxtom@yam.com
Date: Thu, 3 Jun 2004 08:31:25 -0800
Message-Id: <20040603163125.M13784@onemyth.net>
In-Reply-To: <40BE02C6.5030107@yam.com>
References: <40BE02C6.5030107@yam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: linux-mtd@lists.infradead.org
Subject: Re: erase error when I use the Intel E28F128J3C-150 chip
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 03 Jun 2004 00:39:34 +0800, linuxtom wrote
> ...
> But when I mounted it as a writeable filesystem, the system was crashed.
> I tryed to debug this error, and I found that the problem is erase error
> in do_erase_oneblock().
> The system crashed after erase command.(CFI:0x20,0xD0) in this
> function.(waiting... and then core dump....)
> ...

If you provide a decoded dump error (through ksymoops), your kernel version
and patches you applied, as well as the date you got your MTD from CVS (if you
did), people can help you a lot easier.

Does this error happen every time, or is it intermittant?

Dan
