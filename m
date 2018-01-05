Received: from mail-io0-x230.google.com ([2607:f8b0:4001:c06::230])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eXWsQ-00086s-Ns
 for linux-mtd@lists.infradead.org; Fri, 05 Jan 2018 18:38:00 +0000
Received: by mail-io0-x230.google.com with SMTP id n14so6676298iob.4
 for <linux-mtd@lists.infradead.org>; Fri, 05 Jan 2018 10:37:48 -0800 (PST)
Date: Fri, 5 Jan 2018 10:37:44 -0800
From: Eric Biggers <ebiggers3@gmail.com>
To: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
Cc: linux-fscrypt@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Eric Biggers <ebiggers@google.com>
Subject: Re: [PATCH v2 0/5] ubifs: switch to new fscrypt helper functions
Message-ID: <20180105183744.GA44929@gmail.com>
References: <20171129204317.91205-1-ebiggers3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171129204317.91205-1-ebiggers3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 29, 2017 at 12:43:12PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> This series switches ubifs to use the fscrypt helper functions for
> open/link/rename/lookup/setattr introduced in v4.15.
> 
> These patches were originally sent in "[PATCH 00/25] fscrypt: add some
> higher-level helper functions".  I've rebased them onto v4.15-rc1.
> 
> Eric Biggers (5):
>   ubifs: switch to fscrypt_file_open()
>   ubifs: switch to fscrypt_prepare_link()
>   ubifs: switch to fscrypt_prepare_rename()
>   ubifs: switch to fscrypt_prepare_lookup()
>   ubifs: switch to fscrypt_prepare_setattr()
> 
>  fs/ubifs/dir.c  | 43 +++++++++++++------------------------------
>  fs/ubifs/file.c | 41 ++++-------------------------------------
>  2 files changed, 17 insertions(+), 67 deletions(-)
> 
> -- 
> 2.15.0.531.g2ccb3012c9-goog
> 

Richard, can you take these for UBIFS for v4.16?

Eric
