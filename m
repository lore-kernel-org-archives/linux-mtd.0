Received: from ug-out-1314.google.com ([66.249.92.174])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FwK6s-0003rt-Ls
	for linux-mtd@lists.infradead.org; Fri, 30 Jun 2006 10:36:48 -0400
Received: by ug-out-1314.google.com with SMTP id q2so340352uge
	for <linux-mtd@lists.infradead.org>;
	Fri, 30 Jun 2006 07:36:41 -0700 (PDT)
Message-ID: <625fc13d0606300736x17b65cday54aa633cd08db257@mail.gmail.com>
Date: Fri, 30 Jun 2006 09:36:40 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Angelos Manousarides" <amanous@inaccessnetworks.com>
Subject: Re: MTD device with multiple regions & JFFS2
In-Reply-To: <20060630135646.GA12360@inaccessnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <44A519A8.4030800@inaccessnetworks.com>
	<625fc13d0606300613q770a7f8cq57d90eea42255df@mail.gmail.com>
	<20060630135646.GA12360@inaccessnetworks.com>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/30/06, Angelos Manousarides <amanous@inaccessnetworks.com> wrote::
>
> The code in mtdpart.c does not propagate erase region information to the
> slave device. I have ckeched with the git repository online and it is
> still the same. Here is the code I am talking about, it is the only reference
> in regions in mtdpard.c:
>
>     if (master->numeraseregions>1) {
>       /* Deal with variable erase size stuff */
>       int i;
>       struct mtd_erase_region_info *regions = master->eraseregions;
>
>       /* Find the first erase regions which is part of this partition. */
>       for (i=0; i < master->numeraseregions && slave->offset >= regions[i].offset; i++)
>         ;
>
>       for (i--; i < master->numeraseregions && slave->offset + slave->mtd.size > regions[i].offset; i++) {
>         if (slave->mtd.erasesize < regions[i].erasesize) {
>           slave->mtd.erasesize = regions[i].erasesize;
>         }
>       }
>     } else {
>       /* Single erase size */
>       slave->mtd.erasesize = master->erasesize;
>     }
>
> I have changed this to allocate slave->mtd.eraseregions and set
> slave->mtd.numeraseregions properly.
>
> If this is not needed, then definately I am missing something here.

It should really only make a difference if a partition actually spans
two different erase regions.  And even then I'm not sure it really
matters much.  But I suppose there is nothing bad about doing it
correctly.

> Now that I think of it, my first comment about the JFFS2 might be wrong.
> The jffs2 layer calls mtd->erase(). Because normally all "small" sectors
> are enclosed in "large" sector binaries, the erase() function will
> probably handle the erase properly. The JFFS layer might be thinking it
> is erasing a single block, but the mtd->erase will actually erase a few
> small blocks. This is probably the reason that the erasesize in a
> multi-region flash is set to the maximum block size. But this is just a
> guess.

Good guess.  That is what should be happening, so JFFS2 should be
fine.  Unless I am the one that's missing something :).

josh
