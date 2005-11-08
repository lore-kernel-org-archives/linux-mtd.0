Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EZbqS-00034R-7N
	for linux-mtd@lists.infradead.org; Tue, 08 Nov 2005 17:21:39 -0500
Date: Tue, 8 Nov 2005 23:21:27 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20051108222127.GA16542@wohnheim.fh-wedel.de>
References: <20051105162650.620266000@b551138y.boeblingen.de.ibm.com>
	<20051105162712.921102000@b551138y.boeblingen.de.ibm.com>
	<20051108105923.GA31446@wohnheim.fh-wedel.de>
	<m3zmofovsc.fsf@maxwell.lnxi.com>
	<20051108183339.GB31446@wohnheim.fh-wedel.de>
	<1131476269.18108.195.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1131476269.18108.195.camel@tglx.tec.linutronix.de>
Cc: "Eric W. Biederman" <ebiederman@lnxi.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 06/25] mtd: move ioctl32 code to mtdchar.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 8 November 2005 19:57:49 +0100, Thomas Gleixner wrote:
> 
> The code _is_ ugly and ioctls are out of fashion, but your "remove it"
> request is just silly as long as you dont provide a reasonable
> alternative access to those bits.

You may have noticed the missing patch and figured that it was not a
formal request for removal.  Still, I'll be happy when it's gone and
am also happy that mtdchar mess is not spread over yet another file
anymore.  Thanks, Arnd.

Jörn

-- 
Mac is for working, 
Linux is for Networking, 
Windows is for Solitaire! 
-- stolen from dc
