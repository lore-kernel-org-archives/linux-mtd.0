Received: from mail-qg0-x236.google.com ([2607:f8b0:400d:c04::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1an6WE-0002fb-3w
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2016 15:34:22 +0000
Received: by mail-qg0-x236.google.com with SMTP id f52so58464388qga.3
 for <linux-mtd@lists.infradead.org>; Mon, 04 Apr 2016 08:34:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <570288A2.2010401@nod.at>
References: <1459546164-6269-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1459546164-6269-3-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20160402155524.55e34fe4@bbrezillon>
 <20160404172048.6a76b472@bbrezillon> <570288A2.2010401@nod.at>
Date: Mon, 4 Apr 2016 12:34:00 -0300
Message-ID: <CAAEAJfCuqAB_io_XG1wjH7ce-de+yixh5A81RFk--Vbaw_DVmQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: nand: Remove BUG() abuse in nand_scan_tail
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Richard Weinberger <richard@nod.at>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
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

On 4 April 2016 at 12:30, Richard Weinberger <richard@nod.at> wrote:
> Am 04.04.2016 um 17:20 schrieb Boris Brezillon:
>> On Sat, 2 Apr 2016 15:55:24 +0200
>> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
>>
>>> On Fri,  1 Apr 2016 18:29:24 -0300
>>> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
>>>
>>>> There's no reason to BUG() when parameters are being
>>>> validated. Drivers can get things wrong, and it's much nicer
>>>> to just throw a noisy warn and fail gracefully, than calling
>>>> BUG() and throwing the whole system down the drain.
>>>
>>> I'm fine with this change as long as all callers are checking
>>> nand_scan_tail() return value.
>>
>> Actually, the s3c2410 driver is not checking nand_scan_tail() return
>> value. Could you send a v2 addressing that?
>
> And maybe add __must_check to nand_scan_tail() such that we catch issues =
like
> these.
>

In fact, why not adding must_check to all the functions that can fail
in the kernel?

That'll help catch even more issues ;-)
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
