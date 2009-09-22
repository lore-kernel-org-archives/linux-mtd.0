Received: from mail-ew0-f205.google.com ([209.85.219.205])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MqEy5-00083w-7P
	for linux-mtd@lists.infradead.org; Tue, 22 Sep 2009 23:40:25 +0000
Received: by ewy1 with SMTP id 1so53960ewy.27
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Sep 2009 16:40:19 -0700 (PDT)
Date: Wed, 23 Sep 2009 03:40:16 +0400
From: Anton Vorontsov <cbouatmailru@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/2] mtd: m25p80: Add support for CAT25xxx serial EEPROMs
Message-ID: <20090922234016.GA1021@oksana.dev.rtsoft.ru>
References: <20090818214449.GA12848@oksana.dev.rtsoft.ru>
	<20090818214628.GB22651@oksana.dev.rtsoft.ru>
	<20090922162548.3e20e67c.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20090922162548.3e20e67c.akpm@linux-foundation.org>
Cc: dbrownell@users.sourceforge.net, dedekind1@gmail.com,
	linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org,
	linux-mtd@lists.infradead.org,
	Anton Vorontsov <avorontsov@ru.mvista.com>, dwmw2@infradead.org
Reply-To: avorontsov@ru.mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 22, 2009 at 04:25:48PM -0700, Andrew Morton wrote:
> On Wed, 19 Aug 2009 01:46:28 +0400
> Anton Vorontsov <avorontsov@ru.mvista.com> wrote:
> 
> > CAT25 chips (as manufactured by On Semiconductor, previously Catalyst
> > Semiconductor) are similar to the original M25Px0 chips, except:
> > 
> > - Address width can vary (1-2 bytes, in contrast to 3 bytes in M25P
> >   chips). So, implement convenient m25p_addr2cmd() and m25p_cmdsz()
> >   calls, and place address width information into flash_info struct;
> > 
> > - Page size can vary, therefore we shouldn't hardcode it, so get rid
> >   of FLASH_PAGESIZE definition, and place the page size information
> >   into flash_info struct;
> > 
> > - CAT25 EEPROMs don't need to be erased, so add NO_ERASE flag, and
> >   propagate it to the mtd subsystem.
> 
> This patch (still) doesn't know about the mx25l3205d, mx25l12805d and
> mx25l12855e devices.

Yes, support for these chips commited on Fri, 4 Sep 2009 08:40:27
+0000 (09:40 +0100). And the patch dated 19 Aug.

> I randomly did this:
> 
> ->	{ "mx25l3205d", INFO(0xc22016, 0, 64 * 1024, 64, 256, 3, 0) },
> ->	{ "mx25l6405d", INFO(0xc22017, 0, 64 * 1024, 128, 256, 3, 0) },
> 	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 256, 3, 0) },
> ->	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 256, 3, 0) },

Looks correct, thanks a lot.

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
