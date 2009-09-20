Subject: Re: Corruption of JFFS2 node read from DMA
From: David Woodhouse <dwmw2@infradead.org>
To: Gilles Casse <list@gcasse.net>
In-Reply-To: <4A5C8844.1000002@gcasse.net>
References: <4A5C8844.1000002@gcasse.net>
Content-Type: text/plain
Date: Sun, 20 Sep 2009 05:43:48 -0700
Message-Id: <1253450628.6317.98.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-07-14 at 15:29 +0200, Gilles Casse wrote:
> 
> Another preliminary solution is proposed below, thank you for your
> comments.

You only really need SLAB_HWCACHE_ALIGN for the jffs2_raw_inode and
jffs2_raw_dirent, right?

-- 
dwmw2
