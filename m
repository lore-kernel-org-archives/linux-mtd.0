Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JipHl-0004hM-Ul
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 11:13:14 +0000
Date: Mon, 7 Apr 2008 13:12:50 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [patch 8/15] fs/logfs/inode.c
Message-ID: <20080407111249.GF22431@logfs.org>
References: <20080401181308.512473173@logfs.org>
	<20080401181332.853833008@logfs.org>
	<9c9fda240804032357i36e7eac0q1c639a017b27af42@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c9fda240804032357i36e7eac0q1c639a017b27af42@mail.gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 4 April 2008 15:57:08 +0900, Kyungmin Park wrote:
> 
> Same reason, 'read_inode' is removed.
> 
> After some works, it can compile but there's undefined symbols.
> WARNING: "swapper_space" [fs/logfs/logfs.ko] undefined!
> WARNING: "add_to_page_cache_lru" [fs/logfs/logfs.ko] undefined!
> WARNING: "inode_lock" [fs/logfs/logfs.ko] undefined!
> 
> Which kernel version do you use?

2.6.24, until today.  I've updated my compat patch here:
http://lazybastard.org/~joern/patches/logfs.patch.769

It should work on all kernel from 2.6.21 to current git.

Thanks for pointing it out.

Jörn

-- 
They laughed at Galileo.  They laughed at Copernicus.  They laughed at
Columbus. But remember, they also laughed at Bozo the Clown.
-- unknown
