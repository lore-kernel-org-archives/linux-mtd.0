Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dzp4c-0005uV-95
 for linux-mtd@lists.infradead.org; Wed, 04 Oct 2017 19:11:16 +0000
Received: by mail-wr0-x241.google.com with SMTP id v38so5448158wrc.4
 for <linux-mtd@lists.infradead.org>; Wed, 04 Oct 2017 12:10:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <607D25F7-8DC9-4B2D-844B-F2359BCD642D@sigma-star.at>
References: <CAFadFHRqVe5SmQBZAaFHt2d6+GY5p1mbE9_G40AApfK29oHh8Q@mail.gmail.com>
 <34D12043-D369-458C-BEEA-B0B7463B3242@sigma-star.at>
 <CAFadFHQLbHNpQCP6tDsGFOSw7ZsujRaiBzQBbXx7-_QOjZwuPw@mail.gmail.com>
 <607D25F7-8DC9-4B2D-844B-F2359BCD642D@sigma-star.at>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 4 Oct 2017 21:10:51 +0200
Message-ID: <CAFLxGvyXVHnz9zirg9pQwaLxkvSWqMepKt=n5OHJvg7A6PvqXw@mail.gmail.com>
Subject: Re: Issue with encrypted filenames on UBIFS
To: David Gstir <david@sigma-star.at>
Cc: Nicolas Feignon <nicolas.feignon@mobile-devices.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-fscrypt@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David, Nicolas,

On Wed, Oct 4, 2017 at 6:36 PM, David Gstir <david@sigma-star.at> wrote:
> Hi Nicolas,
>
>> On 4 Oct 2017, at 18:14, Nicolas Feignon <nicolas.feignon@mobile-devices.fr> wrote:
>>
>> I was indeed using a hardware crypto accelerator on a Atmel SAMA5D2 platform.
>> It works correctly after removing it. I'll work on a patch.

This class of bug seems to be epidemic.
We should add a self-check.

-- 
Thanks,
//richard
