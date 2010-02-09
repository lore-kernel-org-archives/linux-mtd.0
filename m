Subject: Re: mtd/maps/ceiva.c: possibly uninitialised local variable nr
From: Artem Bityutskiy <dedekind1@gmail.com>
To: d binderman <dcb314@hotmail.com>
In-Reply-To: <BLU108-W25DE0DC220AD6F99A8C5879C580@phx.gbl>
References: <BLU108-W25DE0DC220AD6F99A8C5879C580@phx.gbl>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 09 Feb 2010 13:47:41 +0200
Message-ID: <1265716061.2006.128.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-02-01 at 10:26 +0000, d binderman wrote:

[snip]

> static int __init clps_setup_flash(void)
> {
>         int nr = 0;
> 
> #ifdef CONFIG_ARCH_CEIVA
>         if (machine_is_ceiva()) {
>                 info[0].base = CS0_PHYS_BASE;
>                 info[0].size = SZ_32M;
>                 info[0].width = CEIVA_FLASH_WIDTH;
>                 info[1].base = CS1_PHYS_BASE;
>                 info[1].size = SZ_32M;
>                 info[1].width = CEIVA_FLASH_WIDTH;
>                 nr = 2;
>         }
> #endif
>         return nr;
> }

I've made a patch for this in my l2-mtd-2.6 / master, thanks. Here is
the URL, but it is not persistent:

http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/331d53a3eca96f7ae0a216aa9eb3addffccc9e6f

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
