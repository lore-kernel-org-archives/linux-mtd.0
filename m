Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE95ECE582
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2024 17:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mRpC1aygZSKmfYIdioPhulw6uNbWmYq6v9cHWjrn/7E=; b=wEXKB2WsRAcl+D
	Ux6Ox6U2w0LeujfYmQu10G2K+Sf5AWDjQHvsXRRQMxrH7Jj9JcarAx4fCZ7wqNpJ+2lZNUd/gV9Mq
	eRnnGXY7gg8/mU3+cf/T/czeDHAW83FNrMPM+g3Qza5cRf6sr8+jSF7BdAm4t4oyMvhyzYeAHqd51
	QbfTLv0bH5M5BXzHAOFxDSyiD6uccdWRidoM+Hyn6glXZFlrXEaxPglQFasN0CJ+PmWuYXYcpbyUT
	fGNMhvvwPkTbkjz6h0bqLWj1W4H2IjFp8wObfMe+IEhhyRZewFOaBtv1iG4HATF+S81q5k9FWxB6Q
	5AndqnQtAXygsgb0ZLhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so4Qm-00000006URR-0qwd;
	Tue, 10 Sep 2024 17:13:32 +0000
Received: from 008.lax.mailroute.net ([199.89.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so4Qi-00000006UQr-3uVk
	for linux-mtd@lists.infradead.org;
	Tue, 10 Sep 2024 17:13:30 +0000
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4X39Jk3hpPz6ClY9D;
	Tue, 10 Sep 2024 17:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1725988399; x=1728580400; bh=VhmV9oFSRsxf1YqVbemrPn92
	eKvNnqMS4KCaVT2K6OM=; b=MYo1X4XBYoXLUfKyol0i8lFTKOk2NaIWDRTxGCNG
	uKoOnMI5w0U/6b5FFZd7UDUCiRVlwq3oiJI1zW7xRRP9uh6nBg+9sKN2B77TnJlD
	bK/HawOGs8m00YgCnYQArT/y/BXi0U3IF9GyHWceEUD4s7nvcfCoTduzTohYzQd1
	T5zxUZJzoANEJAm5mOx4eOC1GzXwU2EPY/98crXPajt9SMVhFG6BlrjSLBNXDaBL
	fQB2LsOA4sytKDzRLjEV2g0NCquB8k+r9wdP1omWTldl+WHfRRwrP7Snlo6Cfdoc
	jD3Yx88NwPaTj5WXKdkwZwp7VMrPnTzVXqyqTshgUDsmaQ==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id tJodp6nfa-sQ; Tue, 10 Sep 2024 17:13:19 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4X39JZ1wvqz6ClY97;
	Tue, 10 Sep 2024 17:13:18 +0000 (UTC)
Message-ID: <7ea6ad5b-a569-4f0a-8fc2-fd66bff19387@acm.org>
Date: Tue, 10 Sep 2024 10:13:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 08/19] scsi: libfcoe: Include <linux/prandom.h>
 instead of <linux/random.h>
To: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org,
 linux-crypto@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fscrypt@vger.kernel.org,
 linux-scsi@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
Cc: Hannes Reinecke <hare@suse.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
 <20240909075641.258968-9-ubizjak@gmail.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240909075641.258968-9-ubizjak@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_101329_019912_4579C7F8 
X-CRM114-Status: GOOD (  13.09  )
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

On 9/9/24 12:53 AM, Uros Bizjak wrote:
> Substitute the inclusion of <linux/random.h> header with
> <linux/prandom.h> to allow the removal of legacy inclusion
> of <linux/prandom.h> from <linux/random.h>.
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Hannes Reinecke <hare@suse.de>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
> ---
>   include/scsi/libfcoe.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/scsi/libfcoe.h b/include/scsi/libfcoe.h
> index 3c5899290aed..6616348e59b9 100644
> --- a/include/scsi/libfcoe.h
> +++ b/include/scsi/libfcoe.h
> @@ -15,7 +15,7 @@
>   #include <linux/skbuff.h>
>   #include <linux/workqueue.h>
>   #include <linux/local_lock.h>
> -#include <linux/random.h>
> +#include <linux/prandom.h>
>   #include <scsi/fc/fc_fcoe.h>
>   #include <scsi/libfc.h>
>   #include <scsi/fcoe_sysfs.h>

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
