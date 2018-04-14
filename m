Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f7S5Y-0004Xr-6u
 for linux-mtd@lists.infradead.org; Sat, 14 Apr 2018 20:48:01 +0000
Received: by mail-lf0-x241.google.com with SMTP id i18-v6so1919214lfc.7
 for <linux-mtd@lists.infradead.org>; Sat, 14 Apr 2018 13:47:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5440387.JeuAFZVGCe@blindfold>
References: <20180414201859.GA20327@jordon-HP-15-Notebook-PC>
 <5440387.JeuAFZVGCe@blindfold>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Sun, 15 Apr 2018 02:17:46 +0530
Message-ID: <CAFqt6zYcgj0HQ3Z+xyEstkMCdQ6gnLZ616FiypvM_cys1Fk9vw@mail.gmail.com>
Subject: Re: [PATCH] fs: ubifs: Adding new return type vm_fault_t
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>,
 adrian.hunter@intel.com
Cc: linux-mtd@lists.infradead.org, Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Apr 15, 2018 at 2:00 AM, Richard Weinberger <richard@nod.at> wrote:
> Am Samstag, 14. April 2018, 22:18:59 CEST schrieb Souptick Joarder:
>> Use new return type vm_fault_t for page_mkwrite handler.
>>
>> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
>> Reviewed-by: Matthew Wilcox <mawilcox@microsoft.com>
>
> Can we please get a little more context?
> Is this part of a patch series?


The plan for these patches is to introduce the typedef, initially just as
documentation ("These functions should return a VM_FAULT_ status").  We'll
trickle the patches to individual drivers/filesystems in through the
maintainers, as far as possible.  Then we'll change the typedef to an
unsigned int and break the compilation of any unconverted
drivers/filesystems.

The return value of page_mkwrite defined in vm_operations_struct has
changed to vm_fault_t type. So this patch is part of patch series which will
convert fault handlers for vm_operations_struct in each driver/file system.

The first patch is already merged into linus tree.
Commit Id -  1c8f422059ae5da07db7406ab916203f9417e396

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/patch/?id=1c8f422059ae5da07db7406ab916203f9417e396


What is the target tree to carry this?

Target tree I am not sure.
We have plan to push it in 4.17 release.
I think Matthew is the right person to get this info.
