Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUKhB-0006gk-QD
 for linux-mtd@lists.infradead.org; Wed, 05 Dec 2018 00:05:43 +0000
Date: Tue, 4 Dec 2018 16:05:28 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Chandan Rajendra <chandan@linux.vnet.ibm.com>
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-doc@vger.kernel.org, linux-mips@linux-mips.org,
 linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, tytso@mit.edu,
 adilger.kernel@dilger.ca, jaegeuk@kernel.org, yuchao0@huawei.com,
 corbet@lwn.net, ralf@linux-mips.org, paul.burton@mips.com,
 jhogan@kernel.org, green.hu@gmail.com, deanbo422@gmail.com,
 schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, richard@nod.at,
 dedekind1@gmail.com, adrian.hunter@intel.com, viro@zeniv.linux.org.uk
Subject: Re: [PATCH V2 3/7] fscrypt: remove filesystem specific build config
 option
Message-ID: <20181205000528.GH70682@gmail.com>
References: <20181204095650.12562-1-chandan@linux.vnet.ibm.com>
 <20181204095650.12562-4-chandan@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181204095650.12562-4-chandan@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 04, 2018 at 03:26:46PM +0530, Chandan Rajendra wrote:
> diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
> index 952ab97af325..6ba193c23f37 100644
> --- a/include/linux/fscrypt.h
> +++ b/include/linux/fscrypt.h
> @@ -2,9 +2,8 @@
>  /*
>   * fscrypt.h: declarations for per-file encryption
>   *
> - * Filesystems that implement per-file encryption include this header
> - * file with the __FS_HAS_ENCRYPTION set according to whether that filesystem
> - * is being built with encryption support or not.
> + * Filesystems that implement per-file encryption must include this header
> + * file.
>   *
>   * Copyright (C) 2015, Google, Inc.
>   *

There's still a definition of __FS_HAS_ENCRYPTION in
fs/crypto/fscrypt_private.h.  This patch removes everything that checks
__FS_HAS_ENCRYPTION, so that should be removed too.

Thanks,

- Eric
