Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BxiGd-0008Uw-U3
	for linux-mtd@lists.infradead.org; Thu, 19 Aug 2004 04:27:28 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Todd Poynor <tpoynor@mvista.com>
In-Reply-To: <4123FE19.9000109@mvista.com>
References: <4123FE19.9000109@mvista.com>
Content-Type: text/plain
Message-Id: <1092904045.3777.69.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Thu, 19 Aug 2004 09:27:25 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtdblock cache flush at remount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-08-18 at 18:10 -0700, Todd Poynor wrote:
> Figured I'd check whether anybody feels this is something that could and 
> should be fixed or whether there's already a solution for this.  I've 
> recommended use of only mtd-savvy filesystems like JFFS2 for this sort 
> of usage, but the CE developers I talked to felt filesystems over 
> mtdblock were also important. 

Normal filesystems on mtdblock are always going to be horridly
unreliable. If you lose power at the wrong point during the
read/modify/erase/writeback cycle you've lost a _lot_ of data, not just
the sector the file system thought it was writing. 

I don't care much, but if you see a way to make sync() have the desired
effect I wouldn't be averse to it. Criticism in 'diff -u' form always
preferred :)

-- 
dwmw2
