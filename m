Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPVjG-00030k-Po
 for linux-mtd@lists.infradead.org; Tue, 19 Jul 2016 14:10:35 +0000
From: Kalle Valo <kvalo@codeaurora.org>
To: Brian Norris <computersforpeace@gmail.com>
Cc: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 linux-wireless@vger.kernel.org,  David Woodhouse <dwmw2@infradead.org>,
 "open list\:MEMORY TECHNOLOGY DEVICES \(MTD\)"
 <linux-mtd@lists.infradead.org>,  open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: add arch dependency for MTD_BCM47XXSFLASH symbol
References: <1468912123-14899-1-git-send-email-zajec5@gmail.com>
 <20160719072613.GA96986@google.com>
Date: Tue, 19 Jul 2016 17:10:10 +0300
In-Reply-To: <20160719072613.GA96986@google.com> (Brian Norris's message of
 "Tue, 19 Jul 2016 00:26:13 -0700")
Message-ID: <87d1m9vhvh.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian Norris <computersforpeace@gmail.com> writes:

> On Tue, Jul 19, 2016 at 09:08:32AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>> We dropped strict MIPS dependency for bcm47xxsflash driver in:
>> commit 5651d6aaf489 ("mtd: bcm47xxsflash: use ioremap_cache() instead of
>> KSEG0ADDR()") but using ioremap_cache still limits building it to few
>> selected architectures only.
>>=20
>> A recent commit 57d8f7dd2132 ("bcma: allow enabling serial flash support
>> on non-MIPS SoCs") automatically dropped MIPS dependency for
>> MTD_BCM47XXSFLASH which broke building e.g. on powerpc and cris.
>>=20
>> The bcma change is alright as it doesn't break building bcma code in any
>> way. MTD_BCM47XXSFLASH on the other hand should be limited to archs
>> which need it and can build it (by providing ioremap_cache).
>>=20
>> Fixes: 57d8f7dd2132 ("bcma: allow enabling serial flash support on non-M=
IPS SoCs")
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>> Cc: Brian Norris <computersforpeace@gmail.com>
>
> While I might prefer we have a better consistent set of portable I/O
> accessors (it's really a mess), it seems quite reasonable to restrict
> the damage to ARM and MIPS here if it saves some short-term hassle:
>
> Acked-by: Brian Norris <computersforpeace@gmail.com>
>
>> ---
>> That bcma commit breaking building landed in the wireless-drivers-next.
>> Is that possible to get this patch through the same tree?
>
> That's fine with me.

Great, thanks. I'm planning to apply this later tonight to fix the build
error.

--=20
Kalle Valo
