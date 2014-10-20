Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgJdS-0005LG-6P
 for linux-mtd@lists.infradead.org; Mon, 20 Oct 2014 20:32:59 +0000
Message-ID: <54457160.6040404@nod.at>
Date: Mon, 20 Oct 2014 22:32:32 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Andrew Murray <amurray@embedded-bits.co.uk>
Subject: Re: [PATCH] mtd: ubi: Use UBI_METAONLY constraint for renames
References: <1413750419-7020-1-git-send-email-amurray@embedded-bits.co.uk>	<5444ECD2.2010107@nod.at>
 <CAPcvp5FhtmD3s+4goCCET5wxJtcvzoWkNcNg_PvCpBgprv5RJA@mail.gmail.com>
In-Reply-To: <CAPcvp5FhtmD3s+4goCCET5wxJtcvzoWkNcNg_PvCpBgprv5RJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 20.10.2014 um 13:32 schrieb Andrew Murray:
> On 20 October 2014 12:06, Richard Weinberger <richard@nod.at> wrote:
>> Am 19.10.2014 um 22:26 schrieb Andrew Murray:
>>> Renaming a volume does not alter nor read volume data - thus the existing
>>> UBI_READWRITE constraint can be weakened. This patch provides a new
>>> UBI_METAONLY constraint and updates the UBI rename logic to use it.
>>>
>>> This change permits the rename of a mounted volume which enables support
>>> for additional methods of firmware upgrade - see discussion at
>>> https://patchwork.ozlabs.org/patch/398784
>>>
>>> This patch differs from that of the original discussion through the addition
>>> on an additional 'break' statement.
>>
>> Thanks for pointing out. I fat-fingered that.
>>
>>> Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
>>> Tested-by: Andrew Murray <amurray@embedded-bits.co.uk>
>>> Signed-off-by: Richard Weinberger <richard@nod.at>
>>> Signed-off-by: Andrew Murray <amurray@embedded-bits.co.uk>
>>
>> This is not a valid SoB chain. You are not the author of this patch
>> nor went it thought me. Please don't resend patches as your work.
>>
> 
> Apologies that wasn't my intention - I got this wrong. I attempted to
> clearly attribute the author through the patch description and
> patchwork history and through the signed-off (I'll ask next time). I
> added my sign-off due to my (very trivial) addition.

No big deal. :)

Thanks,
//richard
