Received: from mail-lb0-x231.google.com ([2a00:1450:4010:c04::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm8dH-0002oj-WE
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 22:00:52 +0000
Received: by mail-lb0-f177.google.com with SMTP id z12so1437437lbi.8
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 14:00:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20141105205706.GP23619@ld-irv-0074>
References: <CAHrpEqSum1__d5Y1tysEzpa_MGuQSWfOW=m4idSxzCTdGbNKTQ@mail.gmail.com>
 <20141105205706.GP23619@ld-irv-0074>
Date: Wed, 5 Nov 2014 16:00:29 -0600
Message-ID: <CAHrpEqTQQ+YBnBY-fj9uW1bAMn-t_dmdVR9KuJR+2E+uA4vZ2Q@mail.gmail.com>
Subject: Re: mtd: nand: lock unlock function
From: Zhi Li <lznuaa@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Huang Shijie <shijie8@gmail.com>, White Ding <bpqw@micron.com>,
 linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 5, 2014 at 2:57 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> +
>
> On Wed, Nov 05, 2014 at 02:31:34PM -0600, Zhi Li wrote:
>> Does any know the reason why there are nand_lock and nand_unlock
>> function in nand_base.c, but
>>
>>         mtd->_lock = NULL;
>>         mtd->_unlock = NULL;
>>
>> Not set to nand_lock and nand_unlock?
>
> Possible answers:
>
>  * Lack of testing
>
>  * The LOCK/UNLOCK opcodes are not supported by all vendors
>
>  * Even the vendors that support them don't do so consistently (not sure
>    about this one; I know Micron supports this in some cases)
>
>  * The opcodes aren't even documented (again, I'm not even sure about
>    this one; but many Micron datasheets I see don't mention LOCK/UNLOCK.
>    I recall that other similar lock/protection implementations are
>    secret to some extent, and are intentionally omitted from the
>    datasheets)

Yes, we recently met a problem with micron flash. Need send unlock command.
The datasheet I get from micron
MT29F8G08ABACA, MT29F8G16ABACA, MT29F8G08ABBCA,
MT29F8G16ABBCA, MT29F16G08ADACA, MT29F16G16ADACA,
MT29F16G08ADBCA , MT29F16G16ADBCA

support it.
But not sure if it is public document.

>
> I'd be happy to be proven wrong on any of these points.
>
> Brian
