Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43692C83F11
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Aug 2023 09:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yi7fAmuGudAPeIbjTv5V8BocwiYU3EsuibqT3Sqd1zk=; b=cOB0jfcYzyhw8pFiGMH5tD8KNJ
	fZmyWbDK3NehV8/UzGjwtXZ0uydofE/B5FWZmDwKL09NsscMpnQboB3lF2gtMe6e2+0Papc7zJxvw
	dNbeIRdBZnDUaEJNfOt/GyBSh9TkF+jSK+mWVJRLLiWuKIUn0h6+cS5PuPao3yg3KCoIA0n6jDGeZ
	AVfeRk8P0d0pA1OlY1e7wKsv0DEMEUyqPxSHCCbSWlOkytXPRtcv9ooOxbEP1Fh1f+OOOQrL3jz/s
	PaQEgzqKeR1dp62BRt2IFfK08QMb6rmAUfu9ycBAwfdEovfVTcXhd86+PcQwQyY14gzH13rfmIxdl
	LFy0LsMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaYcs-009EaI-1S;
	Mon, 28 Aug 2023 09:33:38 +0000
Received: from www62.your-server.de ([213.133.104.62])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaYcp-009EZG-0x
	for linux-mtd@lists.infradead.org;
	Mon, 28 Aug 2023 09:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=iogearbox.net; s=default2302; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=uHxuq2I8/ZyhsPIJmnm5XYbNAhRPkS8ziwT5zTbeJps=; b=lO8mubL68pHZiPHcvvPCwSD50I
	uex7iY0O9aXpWaBriDkeZBCETSv7sEcsAyNKdE/OHPrADmuQHX02Ze/3A6Mi8r92DsYCorXkBAH9C
	PRVkyOCr/jR1d6nYpa3K3KVQGEPKyQI0Maa0WkE2MFYz/sjPUt35p8d6QCX6WaK/cJjK8p9U+j/a5
	BiFLoXm+c4QvzqDbv2mYgaUyr4chWFHNNOfHfjJ5rFyllD3wZT0q+2HozNJw/+UGJ8S0qOZNV30GO
	j5pw+8Hn6XbiAqG6geKRCBIfWB5toKYt68QhCVW085lRCPhWiewmJvE9UsI9zBCw8GPBY6UgTvpAL
	6/puGIWw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www62.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <daniel@iogearbox.net>)
	id 1qaYcN-0007aY-A4; Mon, 28 Aug 2023 11:33:07 +0200
Received: from [85.1.206.226] (helo=linux.home)
	by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <daniel@iogearbox.net>)
	id 1qaYcM-0000ba-24; Mon, 28 Aug 2023 11:33:06 +0200
Subject: Re: [PATCH] KEYS: Include linux/errno.h in linux/verification.h
To: Herbert Xu <herbert@gondor.apana.org.au>,
 kernel test robot <lkp@intel.com>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Eric Biggers <ebiggers@kernel.org>, "Theodore Y.Ts'o" <tytso@mit.edu>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-fscrypt@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 linux-bluetooth@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
 Xiubo Li <xiubli@redhat.com>, Jeff Layton <jlayton@kernel.org>,
 ceph-devel@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>,
 "David S. Miller" <davem@davemloft.net>,
 Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org,
 Matthieu Baerts <matthieu.baerts@tessares.net>,
 Mat Martineau <martineau@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Neil Brown <neilb@suse.de>, linux-nfs@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, linux-inte@web.codeaurora.org,
 grity@vger.kernel.org, "Jason A.Donenfeld" <Jason@zx2c4.com>,
 Ayush Sawal <ayush.sawal@chelsio.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
 David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
References: <E1qYl9s-006vDm-IW@formenos.hmeau.com>
 <202308261414.HKw1Mrip-lkp@intel.com> <ZOm5mX0+oUGzO3xh@gondor.apana.org.au>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <8481f02f-7dad-0459-bd2e-536ff8ab6896@iogearbox.net>
Date: Mon, 28 Aug 2023 11:33:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <ZOm5mX0+oUGzO3xh@gondor.apana.org.au>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.8/27014/Mon Aug 28 09:38:26 2023)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_023335_333379_33A89EFF 
X-CRM114-Status: GOOD (  17.39  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Herbert,

On 8/26/23 10:36 AM, Herbert Xu wrote:
> On Sat, Aug 26, 2023 at 02:58:48PM +0800, kernel test robot wrote:
>>
>> All errors (new ones prefixed by >>):
>>
>>     In file included from fs/ubifs/auth.c:12:
>>>> include/linux/verification.h:23:11: error: use of undeclared identifier 'EINVAL'
> 
> ---8<---
> Add inclusion of linux/errno.h as otherwise the reference to EINVAL
> may be invalid.
> 
> Fixes: f3cf4134c5c6 ("bpf: Add bpf_lookup_*_key() and bpf_key_put() kfuncs")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202308261414.HKw1Mrip-lkp@intel.com/
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
> 
> diff --git a/include/linux/verification.h b/include/linux/verification.h
> index f34e50ebcf60..cb2d47f28091 100644
> --- a/include/linux/verification.h
> +++ b/include/linux/verification.h
> @@ -8,6 +8,7 @@
>   #ifndef _LINUX_VERIFICATION_H
>   #define _LINUX_VERIFICATION_H
>   
> +#include <linux/errno.h>
>   #include <linux/types.h>
>   
>   /*
> 

Looks good, do you plan to route this fix to Linus?

Thanks,
Daniel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
