Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gBFBV-0006O3-1A
 for linux-mtd@lists.infradead.org; Sat, 13 Oct 2018 08:22:06 +0000
Received: by mail-wr1-x434.google.com with SMTP id d2-v6so15753584wro.7
 for <linux-mtd@lists.infradead.org>; Sat, 13 Oct 2018 01:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <44aa413b-cc4c-c1c5-ebc4-895d07b5a159@infradead.org>
In-Reply-To: <44aa413b-cc4c-c1c5-ebc4-895d07b5a159@infradead.org>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 13 Oct 2018 10:21:41 +0200
Message-ID: <CAFLxGvxEP+j07s8gnVw9DiJZeedxgrk1xtEkaXAMvkfa9HHvCw@mail.gmail.com>
Subject: Re: ubifs: WARNINGs
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Randy,

On Sat, Oct 13, 2018 at 3:48 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi,
>
> Linux 4.19-rc7, x86_64 laptop.
>
> I don't have an ubifs filesystem.  When I just modprobe ubifs and then
> rmmod ubifs, I get 2 WARNINGs from these 2 lines:
>
> static void __exit ubifs_exit(void)
> {
>         WARN_ON(list_empty(&ubifs_infos));
>         WARN_ON(atomic_long_read(&ubifs_clean_zn_cnt) == 0);
>
> Is this normal/expected?

Nah, in -rc1 I rewrote all UBIFS assert code and these two are a corner case.
I've messed up the logic, ubifs_assert(exp) is WARN_ON(!exp).
Patch sent, would be great if you could give it a try.

-- 
Thanks,
//richard
