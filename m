Subject: Re: [PATCH] jffs2: Do not assume erase will fail
From: David Woodhouse <dwmw2@infradead.org>
To: dedekind1@gmail.com
In-Reply-To: <1287993709.2224.6.camel@localhost>
References: <1286468986-24627-1-git-send-email-Joakim.Tjernlund@transmode.se>
	<1287965485.5674.25.camel@macbook.infradead.org>
	<1287993709.2224.6.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 Oct 2010 11:56:48 +0100
Message-ID: <1288004208.26820.57.camel@i7.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
	Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-10-25 at 11:01 +0300, Artem Bityutskiy wrote:
> 
> there are 2 patches which you seem to miss. I've re-based my l2 tree
> against your today's mtd tree, and applied them on top. I've also
> preserved this patch. Please, look at those. 

The 'fix NAND pwrite in raw mode' patch is redundant -- the problem is
fixed by Jon Povey's patch in commit cdcf12b2, which looks almost
identical to the way I suggested it be fixed.

The callback from m25p80 was dropped by its author, and rightly so.

Thanks, again, for keeping track.

-- 
dwmw2
