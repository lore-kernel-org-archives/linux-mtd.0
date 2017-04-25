Received: from mail-oi0-x232.google.com ([2607:f8b0:4003:c06::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d30fa-0004EK-9L
 for linux-mtd@lists.infradead.org; Tue, 25 Apr 2017 13:38:20 +0000
Received: by mail-oi0-x232.google.com with SMTP id y11so139280711oie.0
 for <linux-mtd@lists.infradead.org>; Tue, 25 Apr 2017 06:37:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170424170013.85175-6-ebiggers3@gmail.com>
References: <20170424170013.85175-1-ebiggers3@gmail.com>
 <20170424170013.85175-6-ebiggers3@gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 25 Apr 2017 15:37:56 +0200
Message-ID: <CAFLxGvxdanXJhzioJmgvr3mzSkS=Bxfh1bbtAn1L+t6CoSaHcA@mail.gmail.com>
Subject: Re: [PATCH 5/6] f2fs: switch to using fscrypt_match_name()
To: Eric Biggers <ebiggers3@gmail.com>
Cc: linux-fscrypt@vger.kernel.org, Ryo Hashimoto <hashimoto@chromium.org>,
 Gwendal Grignou <gwendal@chromium.org>, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Eric Biggers <ebiggers@google.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Kazuhiro Inaba <kinaba@chromium.org>,
 David Gstir <david@sigma-star.at>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Eric, Jaegeuk,


On Mon, Apr 24, 2017 at 7:00 PM, Eric Biggers <ebiggers3@gmail.com> wrote:
> From: Eric Biggers <ebiggers@google.com>
>
> Switch f2fs directory searches to use the fscrypt_match_name() helper
> function.  There should be no functional change.

> -#ifdef CONFIG_F2FS_FS_ENCRYPTION
> -               if (unlikely(!name->name)) {
> -                       if (fname->usr_fname->name[0] == '_') {
> -                               if (de_name.len > 32 &&
> -                                       !memcmp(de_name.name + ((de_name.len - 17) & ~15),
> -                                               fname->crypto_buf.name + 8, 16))
> -                                       goto found;
> -                               goto not_match;
> -                       }
> -                       name->name = fname->crypto_buf.name;
> -                       name->len = fname->crypto_buf.len;
> -               }

Sorry if this is a stupid question, but why do you have to compare hashes _and_
the last few bytes of the bigname?
A lookup via bigname gives you two 32bits hash values, and there I'd assume that
this is sufficient for a collisions free lookup. Especially since an
resumed readdir()
with a 64bits cookie has to work too on your filesystem.

-- 
Thanks,
//richard
