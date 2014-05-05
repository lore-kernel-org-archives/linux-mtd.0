Received: from arroyo.ext.ti.com ([192.94.94.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhGc9-0003m1-1P
 for linux-mtd@lists.infradead.org; Mon, 05 May 2014 10:59:17 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: RE: [PATCH 3/3] nandtest: Introduce multiple reads & check iterations
Date: Mon, 5 May 2014 10:58:54 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EACA6B9@DBDE04.ent.ti.com>
References: <1398690859-11494-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1398690859-11494-4-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20980858CB6D3A4BAE95CA194937D5E73EACA5DB@DBDE04.ent.ti.com>
 <20140505103335.GF2873@arch.cereza>
In-Reply-To: <20140505103335.GF2873@arch.cereza>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?iso-8859-1?Q?Guido_Mart=EDnez?= <guido@vanguardiasur.com.ar>, Artem
 Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

>From: Ezequiel Garcia [mailto:ezequiel@vanguardiasur.com.ar]
>>On 05 May 10:07 AM, Gupta, Pekon wrote:
>> >From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org]

[...]

>> >This seem to apply more pressure on a NAND driver's ECC engine
>and
>> >has been
>> >used to discover stability problems with an old OMAP2.
>> >
>> If you are just re-verifying "reads", then you may be testing
>unstable bits [1],
>> which is not a valid driver's fault but a problem arising due to sudden
>power-cut.
>> If you really want to test driver then iterate all the steps (erase ->
>write -> read)
>> multiple times. Same as what is done in torture_peb() test.
>> 	@@ drivers/mtd/ubi/io.c: torture_peb()
>>
>
>I'm sorry Pekon, but your comment makes no sense to me.
>
>First of all, we're adding a new nandtest capability. The tool *already*
>handles multiple erase/write/read cycle (by using the --passes
>parameter)
>and one can already use it to stress drivers. This is not under
>discussion.
>
>However, while testing the OMAP2 NAND driver provided in TI SKD
>6.0.0
>(the one with a v3.2 kernel) the nandtest was left running a large
>number
>of times, using the --passes parameter each block was
>erase/write/read
>lots and lots of times. So, *that* particular test passed without issues.
>
>And still, since we were still observing instability when doing
>filesystem
>operations we developed this new test, which consists in
>erase/write/read/.../read.
>
>Now, since each block is *erased* before the write/read/.../read
>loop, how is
>this related to the unstable bit issue?
>
>In case it's not clear, we never did *any* power-cutting, and still this
>improved test quickly showed ECC read errors in the mentioned
>driver.
>--
>Ezequiel Garcia, VanguardiaSur
>www.vanguardiasur.com.ar


Ok.. I now get the background.
But ideally by re-reading the data you are just invoking the same data path
Again, And so it's unlikely that you are un-covering any driver issues.
However, re-reading the device may introduce some read-disturb errors
which are causing some additional effects in subsequent reads.
Therefore, I'm not sure having re-reads is a good test or not, because
re-reads is changing the underlying testing scenario by introducing _new_
bit-flips in neighboring regions pages because of read-disturbs.


However, I know of some issues in OMAP NAND driver bundled with
3.2 kernel, which might be helpful in nailing down your specific issue.

(1) 3.2 kernel does not have concept of bitflip_threshold, so by default
scrubbing and peb_torture happens even for single bit-flips. So please
pull-in following patch series.
[PATCH v2 0/7] mtd: Change meaning of -EUCLEAN return code on reads
http://lists.infradead.org/pipermail/linux-mtd/2012-April/040945.html

(2) OMAP NAND in 3.2 kernel does not factor bit-flips in empty pages
Hence if empty pages with bit-flips are encountered, then it treats them
like programmed pages and expects a ECC correction on them. But as
empty pages do not have ECC stored in OOB, the driver bails out giving
'uncorrectable ecc' read errors.


with regards, pekon
