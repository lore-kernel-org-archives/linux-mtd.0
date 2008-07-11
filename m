Subject: Re: JFFS2: real free capacity of the partition
From: David Woodhouse <dwmw2@infradead.org>
To: Sergei Poselenov <sposelenov@emcraft.com>
In-Reply-To: <48724132.3050004@emcraft.com>
References: <486CFB83.3010301@emcraft.com>  <48724132.3050004@emcraft.com>
Content-Type: text/plain
Date: Fri, 11 Jul 2008 18:32:50 +0100
Message-Id: <1215797570.11567.447.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-07-07 at 20:15 +0400, Sergei Poselenov wrote:
> Seems I found why is that happens.
> In jffs2_statfs() the wasted_size is excluded
> from calculation:
> ...
>     avail = c->dirty_size + c->free_size;
> ...
> 
> Could someone explain for what reason?
> Have I understand it right - on the certain conditions, the
> wasted space can be converted to dirty space?

Wasted space is just the same as dirty space, really. The only
difference is that we don't expect it to be reclaimed by garbage
collection. The small spaces at the end of an eraseblock, for example,
are still likely to be there when we write a new eraseblock full of
data. There'll still be a small amount of wasted space at the end of the
new block.

That's why we treat 'wasted' space differently from dirty space --
otherwise the GC might just keep going for ever and ever, trying to
reclaim 'dirty' space but always not quite managing to reclaim as much
as it needs.

-- 
dwmw2
