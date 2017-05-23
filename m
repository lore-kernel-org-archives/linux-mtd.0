Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDAa9-0007Pg-Pz
 for linux-mtd@lists.infradead.org; Tue, 23 May 2017 14:14:43 +0000
Received: by mail-oi0-x243.google.com with SMTP id h4so28006948oib.0
 for <linux-mtd@lists.infradead.org>; Tue, 23 May 2017 07:14:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170523003945.14279-4-ebiggers3@gmail.com>
References: <20170523003945.14279-1-ebiggers3@gmail.com>
 <20170523003945.14279-4-ebiggers3@gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 23 May 2017 16:14:20 +0200
Message-ID: <CAFLxGvxaiWFKH5L_BwPXGuG9PxA+0BkJ1qMvaDgAeVwBw+nCoQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] ubifs: don't bother checking for encryption key in
 ->mmap()
To: Eric Biggers <ebiggers3@gmail.com>
Cc: linux-fscrypt@vger.kernel.org, "Theodore Ts'o" <tytso@mit.edu>,
 Eric Biggers <ebiggers@google.com>, linux-f2fs-devel@lists.sourceforge.net,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 23, 2017 at 2:39 AM, Eric Biggers <ebiggers3@gmail.com> wrote:
> From: Eric Biggers <ebiggers@google.com>
>
> Since only an open file can be mmap'ed, and we only allow open()ing an
> encrypted file when its key is available, there is no need to check for
> the key again before permitting each mmap().
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Acked-by: Richard Weinberger <richard@nod.at>

-- 
Thanks,
//richard
