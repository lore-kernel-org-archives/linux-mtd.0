Received: from mail-ia0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tbfmv-0007QJ-5k
 for linux-mtd@lists.infradead.org; Thu, 22 Nov 2012 23:02:29 +0000
Received: by mail-ia0-f177.google.com with SMTP id u21so5853108ial.36
 for <linux-mtd@lists.infradead.org>; Thu, 22 Nov 2012 15:02:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1353510354.2701.10.camel@sauron.fi.intel.com>
References: <1352565322-8731-1-git-send-email-elezegarcia@gmail.com>
 <1353510354.2701.10.camel@sauron.fi.intel.com>
Date: Thu, 22 Nov 2012 20:02:26 -0300
Message-ID: <CALF0-+X9M3eQOBXerRCtmnZHaLP01CdW0PWxv88D3EZ2J-_fMA@mail.gmail.com>
Subject: Re: [PATCH] mtd: sm_ftl: Remove unused kthread stuff
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 21, 2012 at 12:05 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Sat, 2012-11-10 at 13:35 -0300, Ezequiel Garcia wrote:
>> This driver uses workqueues, not kthreads.
>> Remove kthread header and thread related comment.
>>
>> Cc: Maxim Levitsky <maximlevitsky@gmail.com>
>> Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
>
> Aiaiai [1]!
>
> Aiaiai found out that this breaks the build!
>
> drivers/mtd/sm_ftl.c:1025:2: error: implicit declaration of function 'IS_ERR' [-Werror=implicit-function-declaration]
> drivers/mtd/sm_ftl.c:1026:3: error: implicit declaration of function 'PTR_ERR' [-Werror=implicit-function-declaration]
>
> Include <linux/err.h> instead, I guess.

I can do that. But I can't get that error here :-(

Mind me posting your config?

    Ezequiel
