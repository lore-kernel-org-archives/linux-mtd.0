From: David Woodhouse <dwmw2@infradead.org>
To: mike <mikelee@avantwave.com>
In-Reply-To: <41AD826A.3030809@avantwave.com>
References: <41AD826A.3030809@avantwave.com>
Content-Type: text/plain
Date: Wed, 01 Dec 2004 09:48:18 +0000
Message-Id: <1101894498.4574.104.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 minimum mtd block size
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-12-01 at 16:35 +0800, mike wrote:
> Dear all
>     I want to ask about minimum mtdblock size which jffs2 need . Why i 
> ask is because i try to make a 128kbyte mtdblock for my system status 
> storage, it fails. And i repartition to 1MB, it consumes the flash 
> nearly 600KB without any data.
>     Am i do something wrong? or there is a minimum size for jffs2.
>     If it is, Could i conclude that jffs2 do not suit to store small 
> size of data. And which filesystem expertise can suggest me for this 
> purpose?

It needs at least one or two eraseblocks free for garbage collection;
currently it's a little more conservative than that though. You can
reduce the reserved space in jffs2_calc_trigger_levels() in build.c

-- 
dwmw2
