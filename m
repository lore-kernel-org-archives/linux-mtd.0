MIME-Version: 1.0
In-Reply-To: <1298630371.2798.43.camel@localhost>
References: <1298019428-7809-1-git-send-email-leiwen@marvell.com>
	<1298630371.2798.43.camel@localhost>
Date: Mon, 28 Feb 2011 10:25:34 +0800
Message-ID: <AANLkTi=BeURLvXuzm7P_y8-Ngfzu6uf86kHBn6=nvZNN@mail.gmail.com>
Subject: Re: [PATCH V4 0/6] pxa3xx_nand update series set version 4
From: Lei Wen <adrian.wenl@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Eric Miao <eric.y.miao@gmail.com>, Lei Wen <leiwen@marvell.com>,
	Haojian Zhuang <haojian.zhuang@marvell.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 25, 2011 at 6:39 PM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> On Fri, 2011-02-18 at 16:57 +0800, Lei Wen wrote:
>> Change from previous version:
>> rework the patch set accroding to Eric's suggestion.
>> Move the recode judgement to the after command execution.
>>
>> Lei Wen (6):
>> =A0 pxa3xx_nand: make scan procedure more clear
>> =A0 pxa3xx_nand: rework irq logic
>> =A0 pxa3xx_nand: discard wait_for_event,write_cmd,__readid function
>> =A0 pxa3xx_nand: unify prepare command
>> =A0 pxa3xx_nand: mtd scan id process could be defined by driver itself
>> =A0 pxa3xx_nand: clean the keep configure code
>
> Hi, could you please make checkpatch.pl happy and re-send the patches?
>
> There are many issues. OK, some are fine, do not try to fix them, e.g.:
>
> WARNING: line over 80 characters
> #127: FILE: drivers/mtd/nand/pxa3xx_nand.c:221:
> +{ "512MiB 16-bit", 0xcc2c, =A064, 2048, 16, 16, 4096, &default_cmdset, &=
timing[2] },
>
> but some are clearly stylistic errors:
>
> ERROR: else should follow close brace '}'
> #249: FILE: drivers/mtd/nand/pxa3xx_nand.c:539:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else {
>
> etc.
>

Thanks for point that out...
I would post update patch which include the fix for that.

Best regards,
Lei
