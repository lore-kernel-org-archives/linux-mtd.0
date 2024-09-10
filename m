Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF154EDE9A6
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2024 16:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SyAq0574jdiGIKg1ag5A6ZKdaJZQYGISlappM9xOw7Q=; b=FDS0Pp6pP21qRE
	khxraJwKqoq1xYzH44W0a3/uuKDPsFGjeTefoNGLP981nJ0kix46Lg58Vz9d/73BoYNy+Sp5gpJ8+
	1w9EQFmASWk0UuegjxtA4IvOgIFm4FQ4iF49EclcGEiYrgDU0Tl9KQkmEYPFtjVkNZIHfC/13qobu
	cyKyASeM3l7DY8IvPD3pnuEvicFhHlnk+II0SFwnypXr4xq3Bf8E7x87w9qnRH8aSRUSGixI/AXOD
	gBImPJPQKCJVl7+jBmQLjo8osTMfCxomUGvQ3uUIhhHm7QWlaaMXqRB2yM4nkpF76f9T21wCzTItw
	iUOkNdK9mBp4H05lAnEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so49b-00000006R2k-3LdY;
	Tue, 10 Sep 2024 16:55:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so49Z-00000006R25-2UdC
	for linux-mtd@lists.infradead.org;
	Tue, 10 Sep 2024 16:55:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 28DC35C03B5;
	Tue, 10 Sep 2024 16:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA44DC4CEC3;
	Tue, 10 Sep 2024 16:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725987344;
	bh=JScXB/yDn/yMAalsJJVsnq7kUH4Esc0s3LoE68Z1fOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EjkB9ZE6VOjrqBUcRfRB/IGW/03aiRntCIPbyiZBeqvHxaI5jKv9MwDaEG8DDCVms
	 WBhJcAiQ4Cq9+12kFHqyGjbeONBmBIgn0n72KfpVQYgC8Cyl9UroP9T+nGG3iddOaY
	 zmVEODx+AgQcJsB+zhOqAoZB7x3hKqjF50j3BlxAU9gjugH8ptsITaLY+Elxlr7MZi
	 CpuAiqBlceiAqOg8kIcTrYvnqA9Bp0rCsSxI84V/pvG0URubh74hfOPnisgrrcm4Vb
	 x73mUjdHWviA8aqphwPn8GbvnM48SNF3nyS6Gs/iX7VRUUVMeRdWM4apgyyiY+yvcF
	 habjts3Llgr0g==
Date: Tue, 10 Sep 2024 09:55:42 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-crypto@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	"Theodore Y. Ts'o" <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Subject: Re: [PATCH RESEND v2 07/19] fscrypt: Include <linux/once.h> in
 fs/crypto/keyring.c
Message-ID: <20240910165542.GA2642@sol.localdomain>
References: <20240909075641.258968-1-ubizjak@gmail.com>
 <20240909075641.258968-8-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240909075641.258968-8-ubizjak@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_095545_697178_1374D1AF 
X-CRM114-Status: GOOD (  12.71  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Sep 09, 2024 at 09:53:50AM +0200, Uros Bizjak wrote:
> Include <linux/once.h> header to allow the removal of legacy
> inclusion of <linux/prandom.h> from <linux/random.h>.
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Eric Biggers <ebiggers@kernel.org>
> Cc: "Theodore Y. Ts'o" <tytso@mit.edu>
> Cc: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
> v2: Include <linux/once.h> instead of <linux/prandom.h>
> ---
>  fs/crypto/keyring.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
> index 6681a71625f0..82fcc5683649 100644
> --- a/fs/crypto/keyring.c
> +++ b/fs/crypto/keyring.c
> @@ -22,6 +22,7 @@
>  #include <crypto/skcipher.h>
>  #include <linux/key-type.h>
>  #include <linux/random.h>
> +#include <linux/once.h>
>  #include <linux/seq_file.h>
>  
>  #include "fscrypt_private.h"

Acked-by: Eric Biggers <ebiggers@google.com>

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
