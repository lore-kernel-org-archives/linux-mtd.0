From: David Woodhouse <dwmw2@infradead.org>
To: Kevin Liao <kevinliao@iei.com.tw>
In-Reply-To: <018301c3ad14$07225eb0$f80a10ac@rdkevinliaonb>
References: <013301c3acf4$8d3033d0$f80a10ac@rdkevinliaonb>
	 <1069065133.4490.53.camel@hades.cambridge.redhat.com>
	 <018301c3ad14$07225eb0$f80a10ac@rdkevinliaonb>
Content-Type: text/plain
Message-Id: <1069078336.4490.78.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 17 Nov 2003 14:12:17 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Garbage collection problem for nand flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-11-17 at 22:06 +0800, Kevin Liao wrote:
> But I did not saw such messages when I used the mtd snapshot 20030720 (I
> just updated from snapshot 20030720 to 20031112). 

Yes. The code in question was added in August.

> I also compared the gc.c with these two snapshots. But I did not found obvious difference in the
> functions that issue the complaint, that is jffs2_find_gc_block and
> jffs2_garbage_collect_pass. Therefore I still doubt that there may be
> something I did wrong. 

The change was made elsewhere, in places which now call those functions
but did not do so before.

-- 
dwmw2
