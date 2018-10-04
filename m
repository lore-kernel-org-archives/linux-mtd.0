Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8BhT-0007up-5Y
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2018 22:02:28 +0000
Received: by mail-wm1-x329.google.com with SMTP id q8-v6so50378wmq.4
 for <linux-mtd@lists.infradead.org>; Thu, 04 Oct 2018 15:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAGkQfmN6PguBRdL68ZRuOEgC2GWEW4-XxeE3=7epLGODTqHqeQ@mail.gmail.com>
In-Reply-To: <CAGkQfmN6PguBRdL68ZRuOEgC2GWEW4-XxeE3=7epLGODTqHqeQ@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 5 Oct 2018 00:02:02 +0200
Message-ID: <CAFLxGvyEfMtyoWb6517+mjSSBkU=Ofx7Vs1vKPBa7U+Q3zuTjQ@mail.gmail.com>
Subject: Re: Nandsim, UBIFS and memory concerns
To: romain.izard.pro@gmail.com
Cc: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 4, 2018 at 6:52 PM Romain Izard <romain.izard.pro@gmail.com> wrote:
> My questions are the following:
> - Has UBIFS been tested in low memory conditions? Is there a suitable test
>   suite to verify that everything works correctly?

The smallest device in my office with UBIFS support has 32MiB RAM.
But the kernel is not fresh, maybe recent kernels consume more memory wrt. VFS.
To answer your question, it has been designed to work with low memory.

> - Is the nandsim file mode working as expected?  What can I do to be sure
>   that the read and writes are committed to the file?

Nandsim works in memory. The file backend is a hack and what you might expect.

Please tell me more about the corruptions you're facing. Even in UBIFS
runs out of memory
it must not corrupt.
-- 
Thanks,
//richard
