Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEB2p-0006fc-D3
 for linux-mtd@lists.infradead.org; Mon, 04 Aug 2014 05:42:52 +0000
From: bpqw <bpqw@micron.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: Subject: [PATCH 1/1] mtd:nand:fix nand_lock/unlock() function
Date: Mon, 4 Aug 2014 05:41:54 +0000
Message-ID: <CB9F11E856CFD04BB18EC1C68F2598931B16E2@NTXXIAMBX01.xacn.micron.com>
References: <CB9F11E856CFD04BB18EC1C68F2598931B1112@NTXXIAMBX01.xacn.micron.com>
 <20140728061006.GC3095@norris-Latitude-E6410>
 <CB9F11E856CFD04BB18EC1C68F2598931B1342@NTXXIAMBX01.xacn.micron.com>
In-Reply-To: <CB9F11E856CFD04BB18EC1C68F2598931B1342@NTXXIAMBX01.xacn.micron.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "ron@debian.org" <ron@debian.org>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "b32955@freescale.com" <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brain,
How about my patch? Do you have any other doubts?

Br
White Ding=20
-----Original Message-----
From: bpqw=20
Sent: Monday, July 28, 2014 3:47 PM
To: Brian Norris; bpqw
Cc: dwmw2@infradead.org; b32955@freescale.com; artem.bityutskiy@linux.intel=
.com; ron@debian.org; u.kleine-koenig@pengutronix.de; ezequiel.garcia@free-=
electrons.com; linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org
Subject: RE: Subject: [PATCH 1/1] mtd:nand:fix nand_lock/unlock() function

Hi Brain,

>> Do nand reset before write protect check If we want to check the WP#=20
>> low or high through STATUS READ and check bit 7, we must reset the=20
>> device, other operation (eg.erase/program a locked block) can also=20
>> clear the bit 7 of status register.
>This description doesn't really tell me why we need this patch.
If we want to use the lock/unlock function, we must confirm the WP# is high=
, if the WP# is low, the write protect is provided by WP#, we don't need LO=
KC/UNLOCK function.
So before we use the LOCK/UNLOCK function we must confirm the WP# is high.
We can check the WP# is high or low through READ STATUS and check the bit 7=
, but this only correct when we READ STATUS directly after RESET or Power O=
n.
If we don't add this patch, We can't check the WP# high or low just through=
 READ STATUS and check bit7.=20

>First of all, where is the 'lock' sequence specified? I see the commit tha=
t introduced nand_lock() (without any users) which says Micron parts suppor=
t it, but I don't see it documented in the datasheet:
The LOCK/UNLOCK feature not apply all micron nand, only 1.8V device have th=
is feature.

>  commit 7d70f334ad2bf1b3aaa1f0699c0f442e14bcc9e0
>  Author: Vimal Singh <vimal.newwork@gmail.com>
>  Date:   Mon Feb 8 15:50:49 2010 +0530

>      mtd: nand: add lock/unlock routines

>Now, supposing this is documented somewhere, are you seeing some kind=20
>of out-of-spec behavior? Is this a controller quirk you're seeing? Why=20
>should I need to reset the chip? I would presume that

>  chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);

>would refresh the status properly. Is that not the case?
chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1) can refresh the status properly=
, but we must do some operation to trigger it.
For example if we do rease/program operation to a block that is locked, the=
n READ STATUS, the bit 7 will be 0 that indicate the device is write protec=
t.
Then if we do erase/program operation to another block that is unlocked, th=
e bit 7 of READ STATUS will be 1 indicate that the device is not write prot=
ect.

Now if we don't do any operation just through chip->cmdfunc(mtd, NAND_CMD_S=
TATUS, -1, -1); to check the WP# is high or low.
Suppose we check the bit 7 of READ STATUS is 0 then we judge the WP# is low=
 (write protect), but in this case the WP# may be high if we do erase/progr=
am operation to a locked block.



Br
White Ding
____________________________
EBU APAC Application Engineering
Tel:86-21-38997078
Mobile: 86-13761729112
Address: No 601 Fasai Rd, Waigaoqiao Free Trade Zone Pudong, Shanghai, Chin=
a

-----Original Message-----
From: Brian Norris [mailto:computersforpeace@gmail.com]
Sent: Monday, July 28, 2014 2:10 PM
To: bpqw
Cc: dwmw2@infradead.org; b32955@freescale.com; artem.bityutskiy@linux.intel=
.com; ron@debian.org; u.kleine-koenig@pengutronix.de; ezequiel.garcia@free-=
electrons.com; linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org
Subject: Re: Subject: [PATCH 1/1] mtd:nand:fix nand_lock/unlock() function

Hi White,

You've responded to one of my messages, but your mail server is also sendin=
g bounce replies. You might want to contact your I.T. about this.
(I'll let you know if I ever stop getting bounces.)

On Thu, Jul 24, 2014 at 01:00:01AM +0000, bpqw wrote:
> Do nand reset before write protect check If we want to check the WP#=20
> low or high through STATUS READ and check bit 7, we must reset the=20
> device, other operation (eg.erase/program a locked block) can also=20
> clear the bit 7 of status register.

This description doesn't really tell me why we need this patch.

First of all, where is the 'lock' sequence specified? I see the commit that=
 introduced nand_lock() (without any users) which says Micron parts support=
 it, but I don't see it documented in the datasheet:

  commit 7d70f334ad2bf1b3aaa1f0699c0f442e14bcc9e0
  Author: Vimal Singh <vimal.newwork@gmail.com>
  Date:   Mon Feb 8 15:50:49 2010 +0530

      mtd: nand: add lock/unlock routines

Now, supposing this is documented somewhere, are you seeing some kind of ou=
t-of-spec behavior? Is this a controller quirk you're seeing? Why should I =
need to reset the chip? I would presume that=20

  chip->cmdfunc(mtd, NAND_CMD_STATUS, -1, -1);

would refresh the status properly. Is that not the case?

> Signed-off-by: White Ding <bpqw@micron.com>
> ---
>  drivers/mtd/nand/nand_base.c |   18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c=20
> b/drivers/mtd/nand/nand_base.c index 41167e9..22dd3aa 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -965,6 +965,15 @@ int nand_unlock(struct mtd_info *mtd, loff_t ofs,=20
> uint64_t len)
> =20
>  	chip->select_chip(mtd, chipnr);
> =20
> +	/*
> +	 * Reset the chip.
> +	 * If we want to check the WP through READ STATUS and check the bit 7
> +	 * we must reset the chip
> +	 * some operation can also clear the bit 7 of status register
> +	 * eg. erase/program a locked block
> +	 */
> +	chip->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
> +
>  	/* Check, if it is write protected */
>  	if (nand_check_wp(mtd)) {
>  		pr_debug("%s: device is write protected!\n", @@ -1015,6 +1024,15 @@=20
> int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
> =20
>  	chip->select_chip(mtd, chipnr);
> =20
> +	/*
> +	 * Reset the chip.
> +	 * If we want to check the WP through READ STATUS and check the bit 7
> +	 * we must reset the chip
> +	 * some operation can also clear the bit 7 of status register
> +	 * eg. erase/program a locked block
> +	 */
> +	chip->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
> +
>  	/* Check, if it is write protected */
>  	if (nand_check_wp(mtd)) {
>  		pr_debug("%s: device is write protected!\n",

Brian
