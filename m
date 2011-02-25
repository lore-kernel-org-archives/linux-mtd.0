Subject: Re: [PATCH V4 0/6] pxa3xx_nand update series set version 4
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lei Wen <leiwen@marvell.com>
In-Reply-To: <1298019428-7809-1-git-send-email-leiwen@marvell.com>
References: <1298019428-7809-1-git-send-email-leiwen@marvell.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Feb 2011 12:39:31 +0200
Message-ID: <1298630371.2798.43.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Eric Miao <eric.y.miao@gmail.com>,
	Haojian Zhuang <haojian.zhuang@marvell.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, adrian.wenl@gmail.com,
	linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-02-18 at 16:57 +0800, Lei Wen wrote:
> Change from previous version:
> rework the patch set accroding to Eric's suggestion.
> Move the recode judgement to the after command execution.
> 
> Lei Wen (6):
>   pxa3xx_nand: make scan procedure more clear
>   pxa3xx_nand: rework irq logic
>   pxa3xx_nand: discard wait_for_event,write_cmd,__readid function
>   pxa3xx_nand: unify prepare command
>   pxa3xx_nand: mtd scan id process could be defined by driver itself
>   pxa3xx_nand: clean the keep configure code

Hi, could you please make checkpatch.pl happy and re-send the patches?

There are many issues. OK, some are fine, do not try to fix them, e.g.:

WARNING: line over 80 characters
#127: FILE: drivers/mtd/nand/pxa3xx_nand.c:221:
+{ "512MiB 16-bit", 0xcc2c,  64, 2048, 16, 16, 4096, &default_cmdset, &timing[2] },

but some are clearly stylistic errors:

ERROR: else should follow close brace '}'
#249: FILE: drivers/mtd/nand/pxa3xx_nand.c:539:
+                }
+                else {

etc.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
