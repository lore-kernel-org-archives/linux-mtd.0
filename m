Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AsK8K-000879-81
	for linux-mtd@lists.infradead.org; Sun, 15 Feb 2004 11:08:20 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Marc Singer <elf@buici.com>
In-Reply-To: <20040215095325.GA27531@buici.com>
References: <20040215095325.GA27531@buici.com>
Content-Type: text/plain
Message-Id: <1076843296.4484.2.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sun, 15 Feb 2004 11:08:16 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Can 256K erase blocks work with JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2004-02-15 at 01:53 -0800, Marc Singer wrote:
> When creating the jffs2 filesystem, if I set the erase block size to
> 256 then the filesystem created is twice the size of my total flash
> capacity--can't use it.  The default of 64 produces a modest
> filesystem of 5MB.

256 would be a problem. 256KiB would be fine. Precisely what did you
tell mkfs.jffs2, and what version of mkfs.jffs2 is it? Only recent
versions will _assume_ you're lying if you tell it 256 bytes, and
silently assume 256KiB instead.

-- 
dwmw2
