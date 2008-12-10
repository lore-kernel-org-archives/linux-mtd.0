Subject: Re: [patch 1/6] physmap: make map_info customizable
From: David Woodhouse <dwmw2@infradead.org>
To: anemo@mba.ocn.ne.jp
In-Reply-To: <200812012223.mB1MNbjl014522@imap1.linux-foundation.org>
References: <200812012223.mB1MNbjl014522@imap1.linux-foundation.org>
Content-Type: text/plain
Date: Wed, 10 Dec 2008 16:14:39 +0000
Message-Id: <1228925679.21454.69.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Atsushi Nemoto <anemo@mba.ocn.ne.jp> wrote:
> Add a hook to physmap_flash_data for map_info initialization.  This makes
> platform code can customize map operations.
> 
> Background: I wrote this patch to support RBTX4939 board, which requires
> custom map->{read,write,copy_from} function.  I think extending the
> physmap driver is better than adding a new map driver.

Hm. I'm unconvinced -- surely you're calling into a function which does
everything that a 'new map driver' would have to do anyway?

Would you advocate that we remove _all_ the dedicated map drivers and
replace them with this method?

Can't you enable physmap without CONFIG_MTD_COMPLEX_MAPPINGS being set
anyway? The 'special' functions can't be used in that config, and we
just assume that direct access works.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
