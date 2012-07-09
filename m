Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1So7jn-00054R-Fg
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2012 06:46:30 +0000
Message-ID: <4FFA7E60.8060404@intel.com>
Date: Mon, 09 Jul 2012 09:46:56 +0300
From: Adrian Hunter <adrian.hunter@intel.com>
MIME-Version: 1.0
To: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: question about fs/ubifs/orphan.c
References: <alpine.DEB.2.02.1207081119490.2436@localhost6.localdomain6>
 <alpine.DEB.2.02.1207081122250.2436@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1207081122250.2436@localhost6.localdomain6>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/07/12 12:22, Julia Lawall wrote:
> There is another occurrence of the same pattern in the function consolidate
> in the same file.

Yes. It needs the same fix.  Will you send a patch?

> 
> julia
> 
> On Sun, 8 Jul 2012, Julia Lawall wrote:
> 
>> The function ubifs_orphan_start_commit contains the code:
>>
>>        list_for_each_entry(orphan, &c->orph_new, new_list) {
>>                ubifs_assert(orphan->new);
>>                orphan->new = 0;
>>                *last = orphan;
>>                last = &orphan->cnext;
>>        }
>>        *last = orphan->cnext;
>>
>> After list_for_each_entry, orphan is just an address at an offset from the
>> list head, not a pointer to a real structure.  So it does not seem correct
>> to access its cnext field.
>>
>> julia
>>
> 
> 
