Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agaKj-0000aM-Ut
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2016 15:59:36 +0000
Subject: Re: UBIFS question
To: Martin Townsend <mtownsend1973@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
References: <CABatt_y2rOZAvuamVoOxWSzkkGXNFFGvSQ5di4gb4EBFGYV7oQ@mail.gmail.com>
 <CAFLxGvwwQgKNT6=cL_hc05ZODtWyonA8MWyRWQJN_pXVf9SZOQ@mail.gmail.com>
 <CABatt_w_hXqUA45-MzU3_DRox0P9CwraTCY_TYPthdA3O0N-eQ@mail.gmail.com>
 <56EA7148.7050008@nod.at>
 <CABatt_xRMWwByY2nE8cpcjOL2jgt4yMhH9Gm4cWkxG_uhO7T5A@mail.gmail.com>
 <56EA943C.4000505@nod.at>
 <alpine.DEB.2.02.1603171240030.29358@lnxricardw1.se.axis.com>
 <CABatt_zxp-6s++zLeWfijdTT4fevgTPk97sue-3GGj_6wGgF0w@mail.gmail.com>
 <20160317155544.3b43bbb9@bbrezillon>
 <CABatt_woB8fGT0xK_UkvE73XwX=z5sqX3dwR7j2U4R6-350OGg@mail.gmail.com>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56EAD44B.3000908@nod.at>
Date: Thu, 17 Mar 2016 16:59:07 +0100
MIME-Version: 1.0
In-Reply-To: <CABatt_woB8fGT0xK_UkvE73XwX=z5sqX3dwR7j2U4R6-350OGg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 17.03.2016 um 16:39 schrieb Martin Townsend:
>> I guess you're more worried about bitflips than blocks becoming bad
>> (which, AFAIK, can only happen when writing or erasing a block, not
>> when reading it).
>> If bitflips detection/prevention is what your looking for, I guess
>> ubihealthd (developed by Richard) could help.
>>
>> [1]https://lwn.net/Articles/663751/
>> [2]https://lkml.org/lkml/2015/3/29/31
>>
>>
> 
> Looks very promising, thank you for the links.  Bitflip detection is
> definitely something I am looking for.  If I could get some metrics on
> bitflips detected even better :) I will take a closer look.

To clarify, UBI does already bitflip detection and then
"tortures" a block to figure whether it is good or not.
But only upon read. So, if you very seldom read from a
page read disturb may hit you.
This is why I did the ubi-healthd, it allows you to trigger
read of all data (UBI meta and payload) to detect read disturb
soonish.

Thanks,
//richard
