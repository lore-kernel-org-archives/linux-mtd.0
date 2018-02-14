Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1elycG-0000zr-E6
 for linux-mtd@lists.infradead.org; Wed, 14 Feb 2018 15:05:01 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 0BDC918199B9F
 for <linux-mtd@lists.infradead.org>; Wed, 14 Feb 2018 16:04:49 +0100 (CET)
Subject: Re: [PATCH] mtd: unittests: Stop testing stat() calls
To: linux-mtd@lists.infradead.org
References: <5a78e349.16c6620a.3eb02.9d3c@mx.google.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <afa41602-1af6-b6dd-8f16-a0c9b2582c74@sigma-star.at>
Date: Wed, 14 Feb 2018 16:04:47 +0100
MIME-Version: 1.0
In-Reply-To: <5a78e349.16c6620a.3eb02.9d3c@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Applied to mtd-utils.git


On 02/05/2018 11:31 PM, Balint Reczey wrote:
> diff --git a/tests/unittests/Makemodule.am b/tests/unittests/Makemodule.am
> index 0ecdaa9..569866e 100644
> --- a/tests/unittests/Makemodule.am
> +++ b/tests/unittests/Makemodule.am
> @@ -1,6 +1,6 @@
>  ubilib_test_SOURCES = tests/unittests/libubi_test.c lib/libubi.c
>  ubilib_test_LDADD = $(CMOCKA_LIBS)
> -ubilib_test_LDFLAGS = -Wl,--wrap=open -Wl,--wrap=close -Wl,--wrap=stat -Wl,--wrap=ioctl -Wl,--wrap=read -Wl,--wrap=lseek
> +ubilib_test_LDFLAGS = -Wl,--wrap=open -Wl,--wrap=close -Wl,--wrap=ioctl -Wl,--wrap=read -Wl,--wrap=lseek
>  ubilib_test_CPPFLAGS = -O0 --std=gnu99 $(CMOCKA_CFLAGS) -I include -DSYSFS_ROOT='"tests/unittests/sysfs_mock"'

I took the liberty of duplicating this change for libmtd_test defined below in the same file,
otherwise it wouldn't link due to a lack of the function your patch removes.


Thanks,

David
