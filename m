Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1So7k4-0005A2-RO
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2012 06:46:46 +0000
Message-ID: <4FFA7E7A.7030708@intel.com>
Date: Mon, 09 Jul 2012 09:47:22 +0300
From: Adrian Hunter <adrian.hunter@intel.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: question about fs/ubifs/orphan.c
References: <alpine.DEB.2.02.1207081119490.2436@localhost6.localdomain6>
 <1341751213.2104.7.camel@koala>
In-Reply-To: <1341751213.2104.7.camel@koala>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Julia Lawall <julia.lawall@lip6.fr>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/07/12 15:40, Artem Bityutskiy wrote:
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

Perhaps not because in that case c->cmt_orphans is zero so the cnext list
is never dereferenced.

> 
> Well-spotted Julia, thanks! How did you do this - writing another cocci
> script for the kernel?
> 
