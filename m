Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AiqQB-0004lp-AI
	for linux-mtd@lists.infradead.org; Tue, 20 Jan 2004 07:35:35 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: leoli@motorola.com
In-Reply-To: <1074572447.14559.23.camel@Gundam>
References: 
	 <01139FC052A0D411900B00508B9535FC0F0D25BB@ZCH07EXM04.corp.mot.com>
	 <1074503876.14499.40.camel@imladris.demon.co.uk>
	 <1074509881.14564.3.camel@Gundam>
	 <1074510244.14499.49.camel@imladris.demon.co.uk>
	 <1074572447.14559.23.camel@Gundam>
Content-Type: text/plain
Message-Id: <1074583969.14499.100.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 20 Jan 2004 07:32:49 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2+mtd+big endian problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-01-20 at 12:20 +0800, Li Yang wrote:
> > This sounds like you're using byte-swapping operations in your map
> > driver. You should be using __raw_write*() not write*(). You said you
> > were 'at the very beginning'... are you still doing that now?
> 
> I have verified my maps/ file.  I'm using __raw_write*() now.  Here is
> part of my maps file, I don't know if the memcpy_toio() matters.

It doesn't -- it'll never get used. All you need are read32, write32 and
copy_from. Try this...
                                                                      
__u32 ads_read32(struct map_info *map, unsigned long ofs)
{
        return *(volatile __u32 *)(map->map_priv_1 + ofs);
}
                                                                                                       
void ads_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
{
        memcpy(to, (void *)(map->map_priv_1 + from), len);
}
                                                                                                       
void ads_write32(struct map_info *map, __u32 d, unsigned long adr)
{
        *(volatile __u32 *)(map->map_priv_1 + adr) = d;
        mb();
}
 

Did you try reading and writing chunks of 1, 2 and 4 bytes directly
to/from /dev/mtd0?

-- 
dwmw2
