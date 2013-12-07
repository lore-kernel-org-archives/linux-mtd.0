Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VpJsj-0008NX-PG
 for linux-mtd@lists.infradead.org; Sat, 07 Dec 2013 15:33:26 +0000
Date: Sat, 7 Dec 2013 12:33:13 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH] mtd: nand: gpio: Remove unneeded CONFIG_OF
Message-ID: <20131207153312.GA4273@localhost>
References: <1386427686-30190-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1386428072.693656580@f164.i.mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1386428072.693656580@f164.i.mail.ru>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Dec 07, 2013 at 06:54:32PM +0400, Alexander Shiyan wrote:
> Hello.
> 
> > Since the of_mtd header provides dummy stubs for !CONFIG_OF, it's safe
> > to remove the #ifdef CONFIG_OF. Build tested only.
> > 
> > Cc: Alexander Shiyan <shc_work@mail.ru>
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ...
> > -#ifdef CONFIG_OF
> >  static const struct of_device_id gpio_nand_id_table[] = {
> 
> You should add "__maybe_unused" attribute here in this case.
> This will avoid warning when you build driver without OF.
> 
> ---

I don't get such warning, maybe because the GCC is smart enough
to remove the symbol?

Actually, I realise now we don't need to of_match_ptr, so let
me push a v2.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
