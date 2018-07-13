Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdz5K-0007Fw-Qs
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2018 14:30:16 +0000
Received: by mail-lj1-x243.google.com with SMTP id l15-v6so4548588lji.6
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2018 07:30:04 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <61251850.EbJPfQiGNC@blindfold>
References: <20180620081311.126158-1-arnd@arndb.de>
 <61251850.EbJPfQiGNC@blindfold>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 13 Jul 2018 16:30:01 +0200
Message-ID: <CAK8P3a1bfy0xDninx0Er-L-2bbEh5-5ZOE6g2ZAVa-UcLNZMAA@mail.gmail.com>
Subject: Re: [PATCH] ubifs: use timespec64 for inode timestamps
To: Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 y2038 Mailman List <y2038@lists.linaro.org>, Eric Biggers <ebiggers@google.com>,
 Jan Kara <jack@suse.cz>, Deepa Dinamani <deepa.kernel@gmail.com>,
 Souptick Joarder <jrdr.linux@gmail.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Hyunchul Lee <cheol.lee@lge.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 2, 2018 at 4:20 PM, Richard Weinberger <richard@nod.at> wrote:
> Am Mittwoch, 20. Juni 2018, 10:12:58 CEST schrieb Arnd Bergmann:
>> Both vfs and the on-disk inode structures can deal with fine-grained
>> timestamps now, so this is the last missing piece to make ubifs
>> y2038-safe on 32-bit architectures.
>
> Acked-by: Richard Weinberger <richard@nod.at>
>
> Shall this patch go through the ubifs tree?

Sorry I missed the question earlier. Yes, it would be nice if you could pick
it up there. I'm resending both patches now for your convenience.

       Arnd
