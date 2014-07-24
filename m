Received: from devils.ext.ti.com ([198.47.26.153])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XANGC-0002gH-Vx
 for linux-mtd@lists.infradead.org; Thu, 24 Jul 2014 17:56:57 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>,
 "ezequiel@vanguardiasur.com.ar" <ezequiel@vanguardiasur.com.ar>
Subject: RE: [PATCH] mtd: nand: omap: save Bad-Block-Table (BBT) on device
Date: Thu, 24 Jul 2014 17:56:14 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EB06B91@DBDE04.ent.ti.com>
References: <1406116461-27089-1-git-send-email-pekon@ti.com>
 <20140723120510.GA19677@arch.cereza>
 <20980858CB6D3A4BAE95CA194937D5E73EB064F3@DBDE04.ent.ti.com>
 <20140723202746.GA26346@arch.cereza> <20140724015438.GC3711@ld-irv-0074>
In-Reply-To: <20140724015438.GC3711@ld-irv-0074>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Nori, Sekhar" <nsekhar@ti.com>,
 =?iso-8859-1?Q?Lothar_Wa=DFmann?= <LW@karo-electronics.de>,
 Huang Shijie <b32955@freescale.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 "Quadros, Roger" <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Brian Norris [mailto:computersforpeace@gmail.com]
>>On Wed, Jul 23, 2014 at 05:27:46PM -0300, ezequiel@vanguardiasur.com.ar w=
rote:
[...]
>> In fact, you do have a simple way to solve this. Just support BBT throug=
h
>> the "nand-on-flash-bbt" devicetree property, so a user can tell if his f=
lash
>> has a BBT or not. See pxa3xx-nand.c, which should be correct.
>
>Yes, you can use the 'nand-on-flash-bbt' property, and that probably
>makes the most sense.
>
>The only real backwards-compatibility concern you'd have for
>unconditionally enabling on-flash BBT (like in this patch) is if you had
>previous file system data in the last 4 blocks; nand_bbt will just
>clobber it, breaking your file system. For this reason, using DT is
>probably a good idea -- you're opting in, rather than being forced in by
>a kernel upgrade.
>
>Beyond the backwards-compatibility concern, you still have other
>concerns about on-flash BBT's robustness. Limiting yourself to a region
>of 4 blocks is one potential issue. There are others (e.g., lack of CRC
>protection), but none that have been real show-stoppers. I have a few
>generations of products running it here.
>
>BTW, there's a recent thread about GPMI and its "bad block mark
>swapping", which has led to somebody wanting a new DT binding for
>'on-flash-bbt-no-oob-bbm' or something like that, to mirror the
>(excellently named -- by me) NAND_BBT_NO_OOB_BBM option. I'm not real
>happy with adding a random assortment of configurable BBT flags into the
>DT ABI, without fully describing and standardizing the BBT format. It's
>kind of a vacuous target right now, which is just defined by the
>70%-baked solution in our current implementation... (I guess I need to
>go reply to the GPMI/NO_OOB_BBM thread soon!)
>
>Brian
>
>[1] http://lists.infradead.org/pipermail/linux-mtd/2014-March/052666.html
>    http://lists.infradead.org/pipermail/linux-mtd/2014-March/052796.html
>    http://lists.infradead.org/pipermail/linux-mtd/2014-March/052988.html

Thanks much to both of you.
Yes, "nand-on-flash-bbt" devicetree property seems the correct approach.
I'll study the above threads, and then get back with appropriate patch.
So, please ignore this patch.

with regards, pekon
