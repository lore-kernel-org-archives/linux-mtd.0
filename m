Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmFgs-0007c5-2O
 for linux-mtd@lists.infradead.org; Mon, 19 May 2014 05:00:47 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v2] mtd: nand: omap: fix BCHx ecc.correct to return
 detected bit-flips in erased-page
Date: Mon, 19 May 2014 05:00:07 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EACDE66@DBDE04.ent.ti.com>
References: <1395730699-14687-1-git-send-email-pekon@ti.com>
 <20140512203626.GS28907@ld-irv-0074>
In-Reply-To: <20140512203626.GS28907@ld-irv-0074>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

>From: Brian Norris [mailto:computersforpeace@gmail.com]
>
>On Tue, Mar 25, 2014 at 12:28:19PM +0530, Pekon Gupta wrote:
>> fixes: commit 62116e5171e00f85a8d53f76e45b84423c89ff34
>>        mtd: nand: omap2: Support for hardware BCH error correction.
>>
>> In omap_elm_correct_data(), if bitflip_count in an erased-page is within=
 the
>> correctable limit (< ecc.strength), then it is not indicated back to the=
 caller
>> ecc->read_page().
>> This mis-guides upper layers like MTD and UBIFS layer to assume erased-p=
age as
>> perfectly clean and use it for writing even if actual bitflip_count was
>> dangerously high (bitflip_count > mtd->bitflip_threshold).
>>
>> This patch fixes this above issue, by returning 'stats' to caller
>> ecc->read_page() under all scenarios.
>>
>> Reported-by: Brian Norris <computersforpeace@gmail.com>
>> Signed-off-by: Pekon Gupta <pekon@ti.com>
>
>Pushed to l2-mtd.git. Thanks!
>

Just forgot to ask, Is this patch candidate for stable?=20

This one fixes the long standing issue of returning bit-flip count of an
erased-page to upper layers. So that upper layers take correct decision.


with regards, pekon
