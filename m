Received: from mail-ob0-x229.google.com ([2607:f8b0:4003:c01::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbquS-0003RA-2w
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2015 14:08:40 +0000
Received: by obbda8 with SMTP id da8so135399279obb.1
 for <linux-mtd@lists.infradead.org>; Tue, 15 Sep 2015 07:08:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1659571442320272@web21h.yandex.ru>
References: <1659571442320272@web21h.yandex.ru>
Date: Tue, 15 Sep 2015 16:01:13 +0200
Message-ID: <CAFLxGvz3U31Jys+fkKsZ0gE2F44-4tZBia3v3hEYR8g1KGH_hw@mail.gmail.com>
Subject: Re: Backporting ubiblock to Linux 3.3
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Konstantin Tokarev <annulen@yandex.ru>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 15, 2015 at 2:31 PM, Konstantin Tokarev <annulen@yandex.ru> wrote:
> Hi Ezequiel and others,
>
> How do you think, would it be feasible to backport ubiblock to Linux 3.3 without large amount of work? I don't need latest and greatest version, just anything to get working and stable squashfs on top of it.

Backporting the state before my blk-mq conversion should be trivial.

-- 
Thanks,
//richard
