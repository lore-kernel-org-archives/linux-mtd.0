Received: from imladris.demon.co.uk ([193.237.130.41] ident=exim)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18eczW-0004kz-00
	for <linux-mtd@lists.infradead.org>; Fri, 31 Jan 2003 15:22:06 +0000
Date: Fri, 31 Jan 2003 15:53:04 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Stephane List <stephane.list@lilotux.net>
cc: linux-mtd <linux-mtd@lists.infradead.org>
In-Reply-To: <20030131154221.GB21200@lilotux.net>
Message-ID: <Pine.LNX.4.44.0301311551500.7456-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Subject: Re: Compilation of util directory
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

On Fri, 31 Jan 2003, Stephane List wrote:

> With the latest CVS code, I can't compile mkfs.jffs2.c

Yeah -- when updating it recently I checked the eCos, Linux 2.4 and Linux 
2.5 builds but forgot mkfs.jffs2 :) 

The obvious fix was posted on the jffs-dev list last week. I haven't yet 
got round to committing it.

-- 
dwmw2
