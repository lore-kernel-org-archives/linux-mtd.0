Received: from mail-pz0-f195.google.com ([209.85.222.195])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MZQP0-0005U2-T4
	for linux-mtd@lists.infradead.org; Fri, 07 Aug 2009 14:26:47 +0000
Received: by pzk33 with SMTP id 33so1643011pzk.15
	for <linux-mtd@lists.infradead.org>;
	Fri, 07 Aug 2009 07:26:36 -0700 (PDT)
Date: Fri, 7 Aug 2009 10:26:32 -0400
From: Josh Boyer <jwboyer@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: Re: [UBI UBIFS] replace vmalloc with kmalloc
Message-ID: <20090807142632.GN3095@hansolo.jdub.homelinux.org>
References: <2df346410908070202i6c16008ckc145559a474129c6@mail.gmail.com>
	<4A7BF1C3.4050602@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4A7BF1C3.4050602@nokia.com>
Cc: "Bityutskiy Artem \(Nokia-D/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	JiSheng Zhang <jszhang3@gmail.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"rmk@arm.linux.org.uk" <rmk@arm.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 07, 2009 at 12:20:03PM +0300, Adrian Hunter wrote:
> JiSheng Zhang wrote:
>> If nandflash driver use DMA to support UBI and UBIFS i/o, there will
>> be panic like
>> the following. This is because UBI and UBIFS use vmalloced buffer
>> somewhere while
>> nandflash driver put the buffer under DMA and DMA support doesn't like vmalloced
>> memory.
>> [  412.369280] UBIFS: default file-system created
>> [  412.374879] Unable to handle kernel NULL pointer dereference at
>> virtual address 00000000
>> [  412.383177] UBIFS: background thread "ubifs_bgt0_0" started, PID 887
>> [  412.389656] pgd = c0004000
>> [  412.392419] [00000000] *pgd=00000000
>> [  412.396117] Internal error: Oops: 817 [#1] PREEMPT
>>
>> Yes, I know kmalloc may fail when memory get fragmented, but I grep the UBI and
>> UBIFS's source, there are six .c files and seven .c files using
>> vmalloc, the function
>> which call vmalloc are all called during the ubi being attached and
>> the volume being
>> mounted. In embedded system, this mainly happen during kernel boot, it
>> should succeed.
>>
>> After replacing vmalloc with kmalloc, ubi and ubifs runs fine on my
>> board. I can alos upload
>> a patch.
>>
>> Comments are welcomed!
>
> vmalloc allows large (> 128KiB) buffers, but kmalloc doesn't.
> So we presently have no choice but to use vmalloc.

You could use get_free_pages to get up to 2MiB, no?

josh
