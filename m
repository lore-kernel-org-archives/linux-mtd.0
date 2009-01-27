Received: from mail-ew0-f20.google.com ([209.85.219.20])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LRomD-0005vs-6F
	for linux-mtd@lists.infradead.org; Tue, 27 Jan 2009 14:18:56 +0000
Received: by ewy13 with SMTP id 13so1835723ewy.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Jan 2009 06:18:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1233061619.7085.14.camel@localhost.localdomain>
References: <1233047506-30435-1-git-send-email-seed@uffs.org>
	<1233061619.7085.14.camel@localhost.localdomain>
Date: Tue, 27 Jan 2009 15:18:50 +0100
Message-ID: <71cd59b00901270618q78f9c711q89f13f5828358236@mail.gmail.com>
Subject: Re: [PATCH] UBI: ioctl instead of CONFIG_MTD_UBI_DEBUG_USERSPACE_IO
From: Corentin Chary <corentin.chary@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Sidney Amani <seed@uffs.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 27, 2009 at 2:06 PM, Artem Bityutskiy
<dedekind@infradead.org> wrote:
> On Tue, 2009-01-27 at 10:11 +0100, Sidney Amani wrote:
>> Introduce a new ioctl UBI_IOCSETPROP to set properties
>> on a volume. Also add the first property:
>> UBI_PROP_DIRECT_WRITE, this property is used to set the
>> ability to use direct writes in userspace
>>
>> Signed-off-by: Sidney Amani <seed@uffs.org>
>> Signed-off-by: Corentin Chary <corentincj@iksaif.net>
>
> But I have to warn you, that now you are responsible for writing
> eraseblocks properly:
>
> 1. Sequentially, from the beginning to the end.
> 2. Writes have to be aligned to min I/O unit size
> 3. You cannot write more than once to the same place
>
> Be careful.

We are aware of that =).
We are currently working on a libubi in userspace wich will provide
the same interface the kernel does (and will also do the same checks:
aligned writes, etc ...). It should be finished this week. I'll send a
mail here when it's done.

Thanks.

-- 
Corentin Chary
http://xf.iksaif.net
