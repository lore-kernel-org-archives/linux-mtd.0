Subject: Re: [PATCH v7 1/5]: mtdoops: avoid erasing already empty areas
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
In-Reply-To: <20091015094721.6c85cc48@marrow.netinsight.se>
References: <20091015094057.7298e0d7@marrow.netinsight.se>
	<20091015094721.6c85cc48@marrow.netinsight.se>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 23 Oct 2009 06:57:04 +0300
Message-Id: <1256270224.29885.173.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-10-15 at 09:47 +0200, Simon Kagstrom wrote:
> After having scanned the entire mtdoops area, mtdoops will erase it if
> there are no mtdoops headers in it. However, empty and already erased
> areas (i.e., without mtdoops headers) will therefore also be erased at
> each startup.
> 
> This patch counts the number of unclean pages (neither empty nor with
> the mtdoops header) and only erases if no headers are found and the area
> is still unclean.
> 
> Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>

Actually, it is safer to erase the partition. This is exactly why JFFS2
has erase markers. On NOR flash, if you interrupt an erase operation
(e.g., by re-booting), you may end up with unstable bits, which are read
as '1' sometimes, but sometimes they may be read as '1'. Or you may end
up with 0xFF's at the beginning, and garbage at the end.

When you erase the partition before starting using it, you make sure you
start with eraseblocks in normal state.

In practice, we observed stuff like that only on NOR, so if this is a
performance issue for you, you can make the erasure to be mandatory only
on NOR, but this won't be very nice.

BTW, we could also add some limit to the partition size of MTD oops. If
users use mtdoops with 256MiB partition, e.g., by mistake, it does not
make sense and we may just refuse it, instead of erasing.

-----
Side note, not a request to implement, but if you add a comment to the
code about this, it may be nice
-----

BTW, this suggests that before erasing eraseblocks in MTD oops, you need
to "invalidate" them by writing, say zeroes, to the second byte of the
eraseblock, if this is NOR. This is what we added to UBI recently,
because otherwise unclean reboots made it fail horribly on NOR, If you
are interested, you may take a look at the 'nor_erase_prepare()'
function in drivers/mtd/ubi/io.c

But again, this is NOR-specific.



-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
