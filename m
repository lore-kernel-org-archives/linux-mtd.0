Message-ID: <54FA6DFC.1070904@free-electrons.com>
Date: Sat, 07 Mar 2015 00:18:20 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
To: Antoine Tenart <antoine.tenart@free-electrons.com>,
 sebastian.hesselbarth@gmail.com, dwmw2@infradead.org,
 computersforpeace@gmail.com
Subject: Re: [PATCH v3 5/9] mtd: pxa3xx_nand: add support for the Marvell
 Berlin nand controller
References: <1425555085-29531-1-git-send-email-antoine.tenart@free-electrons.com>
 <1425555085-29531-6-git-send-email-antoine.tenart@free-electrons.com>
In-Reply-To: <1425555085-29531-6-git-send-email-antoine.tenart@free-electrons.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Cc: thomas.petazzoni@free-electrons.com, boris.brezillon@free-electrons.com,
 linux-kernel@vger.kernel.org, zmxu@marvell.com, linux-mtd@lists.infradead.org,
 jszhang@marvell.com, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Antoine,

On 03/05/2015 08:31 AM, Antoine Tenart wrote:
[..]
> +
> +static struct pxa3xx_nand_flash berlin_builtin_flash_types[] = {
> +{ "4GiB 8-bit",    0xd7ec, 128, 8192,  8,  8, 4096 },
> +{ },

IMHO, supporting a specific flash shouldn't be part of this patch.

In any case, why do you need this? If you can share the details about
this device, it would be interesting for me to take a look.

This driver's open-coded, legacy-style flash detection is nasty, and the
only reason I've kept it is to avoid breaking some wacky user with some
old board. In fact, maybe we can just kill it so nobody thinks it's sane.

Flash detection is the NAND core's job, and duplicating it in the driver
is not nice. Let's try to avoid it.

BTW, nand_ids.c seems to list a similar device:

  EXTENDED_ID_NAND("NAND 4GiB 3,3V 8-bit",  0xD7, 4096, LP_OPTIONS),

Have you tried this?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
