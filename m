Received: from ppp121.spiderweb.com.au ([202.76.149.121] helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Zeg5-0004ZD-00
	for <linux-mtd@lists.infradead.org>; Sat, 09 Feb 2002 21:04:58 +0000
Date: Sun, 10 Feb 2002 06:46:02 +1000 (EST)
From: David Woodhouse <dwmw2@infradead.org>
To: Derek Ross <dross@iders.ca>
cc: linux-mtd@lists.infradead.org
Subject: Re: Is realtime logging possible?
In-Reply-To: <002501c1b17b$80b65010$87657bc8@athlon>
Message-ID: <Pine.LNX.4.44.0202100644560.32016-100000@lapdancer.baythorne.internal>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Sat, 9 Feb 2002, Derek Ross wrote:

> Is it possible for a filesystem to coexist with 
> low-level reading, writing and erasing?  Maybe by
> specifying in advance which sectors are forbidden
> to the filesystem.

Yes, you can partition the flash however you like. As I mentioned before, 
you need to check that the chip driver won't make the RT process wait for 
writes to happen in the filesystem partition, because it thinks the whole 
_chip_ is busy not just one sector.

-- 
dwmw2
