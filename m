From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@oktetlabs.ru
In-Reply-To: <4194D188.9050200@oktetlabs.ru>
References: <4194D188.9050200@oktetlabs.ru>
Content-Type: text/plain
Message-Id: <1100272904.21273.193.camel@baythorne.infradead.org>
Mime-Version: 1.0
Date: Fri, 12 Nov 2004 15:21:44 +0000
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Garbage collect pristine nodes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-11-12 at 18:06 +0300, Artem Bityuckiy wrote:
> We allocate sizeof(struct jffs2_raw_inode) + JFFS2_MIN_DATA_LEN which is 
>    only 68 + 128 bytes. But the maximum size of direntry is more than 
> 245 bytes. So, if few bytes were allocated (alloclen < rawlen) and this 
> is just direntry with long name, we Garbage Collect it using long path 
> (which is unneeded).

How often does this _actually_ happen? Remember, alloclen tells us how
much space is _available_ -- it could be larger than the amount we asked
for. So we'll only take the long route if the name in the dirent is
large _and_ it wouldn't actually fit in the end of the eraseblock.

-- 
dwmw2
