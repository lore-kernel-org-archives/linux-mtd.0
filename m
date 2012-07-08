Received: from mail1-relais-roc.national.inria.fr ([192.134.164.82])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SnrCK-0003pQ-1q
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2012 13:06:49 +0000
Date: Sun, 8 Jul 2012 15:06:42 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: question about fs/ubifs/orphan.c
In-Reply-To: <1341751213.2104.7.camel@koala>
Message-ID: <alpine.DEB.2.02.1207081504230.1990@hadrien>
References: <alpine.DEB.2.02.1207081119490.2436@localhost6.localdomain6>
 <1341751213.2104.7.camel@koala>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: linux-mtd@lists.infradead.org, adrian.hunter@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 8 Jul 2012, Artem Bityutskiy wrote:

> On Sun, 2012-07-08 at 11:21 +0200, Julia Lawall wrote:
>> The function ubifs_orphan_start_commit contains the code:
>>
>>          list_for_each_entry(orphan, &c->orph_new, new_list) {
>>                  ubifs_assert(orphan->new);
>>                  orphan->new = 0;
>>                  *last = orphan;
>>                  last = &orphan->cnext;
>>          }
>>          *last = orphan->cnext;
>>
>> After list_for_each_entry, orphan is just an address at an offset from the
>> list head, not a pointer to a real structure.  So it does not seem correct
>> to access its cnext field.
>
> Looks like you've spotted a but - we write some irrelevant address to an
> area within the 'struct ubifs_info'.
>
> I think what the code meant to do is to write NULL there:
>
> - *last = orphan->cnext;
> + *last = NULL;
>
> I wonder if this could be a reason for some of strange bugs we have seen
> reports for.
>
> Well-spotted Julia, thanks! How did you do this - writing another cocci
> script for the kernel?

Yes: http://lkml.indiana.edu/hypermail/linux/kernel/1207.1/00028.html

I'll send a patch.

julia
