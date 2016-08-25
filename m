Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bcpFf-0002e2-1S
 for linux-mtd@lists.infradead.org; Thu, 25 Aug 2016 07:39:04 +0000
Subject: Re: UBI: Race between fastmap_write and wear_leveling_worker
To: Anders Olofsson <pingu@mazeda.se>
References: <7595faa3-6baa-a3d2-0bd6-ea0468a007f3@mazeda.se>
 <CAFLxGvxzNZqcFGfZzN4Lw28_czzKXBb0tukQrbF41HatnTMeBw@mail.gmail.com>
 <2022685b-c766-b37a-c6cb-5d662b260008@mazeda.se>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <34d645bd-3c72-5d93-dd26-3215db9f92b9@nod.at>
Date: Thu, 25 Aug 2016 09:38:20 +0200
MIME-Version: 1.0
In-Reply-To: <2022685b-c766-b37a-c6cb-5d662b260008@mazeda.se>
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

Anders,

On 25.08.2016 08:52, Anders Olofsson wrote:
> On 2016-08-24 17:04, Richard Weinberger wrote:
>> Anders,
>>
>> On Wed, Aug 24, 2016 at 1:37 PM, Anders Olofsson <pingu@mazeda.se> wrote:
>>> After enabling fastmap I sometimes get the following warning at boot:
>>>
>>
>> Hehe, you're lucky I've recently fixed an issue in this area, can you
>> please try:
>> http://lists.infradead.org/pipermail/linux-mtd/2016-August/068919.html
>>
>> I did these fixes on top of an rather old customer kernel and started
>> upstreaming
>> them.
>>
> 
> Tested it and from what I can tell it solves my problem as well. I've run a bunch of reboots and the wear leveling worker no longer runs while the fastmap is being updated.
> 
> Good work and thanks a lot for solving it so quickly.

How do you test? I wonder how you can trigger this so easily.
The said patch emerged while a customer did excessive Fastmap testing
and the race appeared only once. I found it while staring at the code.

But it is good to see that finally after years embedded Folks start
using Fastmap and non-obvious issues can get sorted out.

Thanks,
//richard
