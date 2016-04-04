Received: from mail-lb0-x22f.google.com ([2a00:1450:4010:c04::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1an6bW-0006A5-TU
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2016 15:39:52 +0000
Received: by mail-lb0-x22f.google.com with SMTP id u8so166688222lbk.0
 for <linux-mtd@lists.infradead.org>; Mon, 04 Apr 2016 08:39:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160404173347.40a1b563@bbrezillon>
References: <1459546164-6269-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1459546164-6269-3-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20160402155524.55e34fe4@bbrezillon>
 <20160404172048.6a76b472@bbrezillon>
 <CAAEAJfA2wYAR+ZO0CL1dAy=OPi4gEUBf1zoT1JHO076UyvZmQQ@mail.gmail.com>
 <20160404173347.40a1b563@bbrezillon>
Date: Mon, 4 Apr 2016 12:39:28 -0300
Message-ID: <CAAEAJfDp+ApBsgwiUk9p8N=hStbBQyox_TS9ZvaKjuoww5h-3w@mail.gmail.com>
Subject: Re: [PATCH 0/2] nand: Remove BUG abuse
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4 April 2016 at 12:33, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Sat, 2 Apr 2016 12:37:06 -0300
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
>
>> On 4 April 2016 at 12:20, Boris Brezillon
>> <boris.brezillon@free-electrons.com> wrote:
>> > On Sat, 2 Apr 2016 15:55:24 +0200
>> > Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
>> >
>> >> On Fri,  1 Apr 2016 18:29:24 -0300
>> >> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
>> >>
>> >> > There's no reason to BUG() when parameters are being
>> >> > validated. Drivers can get things wrong, and it's much nicer
>> >> > to just throw a noisy warn and fail gracefully, than calling
>> >> > BUG() and throwing the whole system down the drain.
>> >>
>> >> I'm fine with this change as long as all callers are checking
>> >> nand_scan_tail() return value.
>> >
>> > Actually, the s3c2410 driver is not checking nand_scan_tail() return
>> > value. Could you send a v2 addressing that?
>> >
>>
>> Hmm, I don't see how that relates to this patch.
>> As far as I can see, it's two completely independent issues.
>>
>> Or am I missing something here?
>
> Well, you're removing BUG() calls and are returning an error instead, so
> if existing nand_scan_tail() callers don't check the return status you
> may hide an existing bug...
>

Yes, I am removing a BUG() - thus replacing an oops (potentially a panic),
with an error return.

However, nand_scan_tail can already fail and return an error
for several other reasons.

> I know it's unlikely to happen, but I'd still prefer to have all
> nand_scan_tail() callers to check the return value before removing
> those calls to BUG().
>

It's not about unlikeliness, but about correlation and bisectability.
IMO, the fact that some drivers don't check the return of nand_scan_tail
is a bug on its own, and has nothing to do with this patch.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
