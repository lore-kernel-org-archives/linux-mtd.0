Received: from mail-io0-x22f.google.com ([2607:f8b0:4001:c06::22f])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQZb9-0006ng-PB
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2018 14:39:41 +0000
Received: by mail-io0-x22f.google.com with SMTP id t5-v6so7872214ioa.8
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jun 2018 07:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAFwEtmo=tXCckkQFn2VDoNV4tto7MBr0Tj3xVqLroxfJzZ=Fkw@mail.gmail.com>
In-Reply-To: <CAFwEtmo=tXCckkQFn2VDoNV4tto7MBr0Tj3xVqLroxfJzZ=Fkw@mail.gmail.com>
From: Steve deRosier <derosier@gmail.com>
Date: Wed, 6 Jun 2018 07:38:50 -0700
Message-ID: <CALLGbRLLZNOOOO8k-vF20Daf_ivDU8RuWfX5e48_+pCJ-kVAeA@mail.gmail.com>
Subject: Re: testing UBIFS with zstd
To: michele.dionisio@gmail.com
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Michele,

On Wed, Jun 6, 2018 at 5:56 AM Michele Dionisio
<michele.dionisio@gmail.com> wrote:
>
> I'm testing ubifs with zstd compression. In my opinion it is a good
> idea to start to insert this "new" compression algorithem because the
> performance is paragonable with LZ4 and the compression is much
> better.
>
> I attach patches for mtd-utils and linux too

When you send patches upstream, please send them in-line as plain text
in your email instead of as attachments. They can't be reviewed and
commented on as blobs.
https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#no-mime-no-links-no-compression-no-attachments-just-plain-text

Thanks,
- Steve
