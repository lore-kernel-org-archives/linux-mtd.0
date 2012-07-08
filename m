Received: from mail4-relais-sop.national.inria.fr ([192.134.164.105])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Snnoj-0001Ps-JH
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2012 09:30:36 +0000
Date: Sun, 8 Jul 2012 11:22:46 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
To: dedekind1@gmail.com
Subject: Re: question about fs/ubifs/orphan.c
In-Reply-To: <alpine.DEB.2.02.1207081119490.2436@localhost6.localdomain6>
Message-ID: <alpine.DEB.2.02.1207081122250.2436@localhost6.localdomain6>
References: <alpine.DEB.2.02.1207081119490.2436@localhost6.localdomain6>
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

There is another occurrence of the same pattern in the function 
consolidate in the same file.

julia

On Sun, 8 Jul 2012, Julia Lawall wrote:

> The function ubifs_orphan_start_commit contains the code:
>
>        list_for_each_entry(orphan, &c->orph_new, new_list) {
>                ubifs_assert(orphan->new);
>                orphan->new = 0;
>                *last = orphan;
>                last = &orphan->cnext;
>        }
>        *last = orphan->cnext;
>
> After list_for_each_entry, orphan is just an address at an offset from the 
> list head, not a pointer to a real structure.  So it does not seem correct 
> to access its cnext field.
>
> julia
>
