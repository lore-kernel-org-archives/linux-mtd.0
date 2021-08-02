Return-Path: <SRS0=IJUr=MZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A1FC4320A
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Aug 2021 11:18:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46B4A60F36
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Aug 2021 11:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46B4A60F36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+mJeybn2IaVs2xT1eITNIW0GAIncZ+URgZUrnxazkQ=; b=GFrJ1vAsKjsipHlVfp7Kvot64i
	JB7RBBAqhIQlt4/lWaKi0Ygx5wmYogfo1VrkNfxaCV2Q52dH84Uo5w04mJc9XVhSYA2MKFKN9Z8Jw
	sXjDii69h/UW0PUqiaeGpH1yTOIFKUiezn6qVvJqKYg0EAeMm2o6rl+NMQ0453bJ7r82BiltSleb7
	Hv5jIfj81sgUiZSVBiq/IG0fd7x18jOTAsA11wXlRs3x+IL4wKoQEI7MNzu/NrsaFiAGIzVIOTjJt
	HDVdGnANjSzsFj8CZ8bXw3Q0EuPpjEN3fZfQb0V3iFrNUSAy1f8bzRn47Hl8+W2fxOPaNHCCUaL1E
	Qlioyyzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAVwC-00FtOr-OO; Mon, 02 Aug 2021 11:16:52 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAVw7-00FtNs-IG
 for linux-mtd@lists.infradead.org; Mon, 02 Aug 2021 11:16:48 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 g23-20020a17090a5797b02901765d605e14so24132811pji.5
 for <linux-mtd@lists.infradead.org>; Mon, 02 Aug 2021 04:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R6GXUz7kzvPzppSdt3z4/dwHpwHS0zM/rSsMW9Edp1o=;
 b=IB3AOEneq/zsq6WG+K9Dx+tGjfWRzwSos4X1zR4PK+YOdHjaXNYL+0d057isGuH2bp
 U1W2OX/daOjme+rPee8zQnzgqRJAaGgxNrWL0BzDRHlIRLSoBhqcfSAbhSGu9/V/5ZGX
 pNXt5U9rcLjZaMOLU5H4hquh/+M0URu80NcCEFuDGcn/C6XhLUpotKnW6HWdgmRsr7i5
 YdLHgFQcEcMvs9YG3QjLXQwRP3jCFCoIewoczCg5c3CpsUT9AGa5ZJqy/aDQdLiVANFk
 iS3wKFtJaCr2GGVr7SSUY99Te33U+xpiBOFLChL37z3CgkwBq+XxxT0cm3YNiAnUGEps
 nhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R6GXUz7kzvPzppSdt3z4/dwHpwHS0zM/rSsMW9Edp1o=;
 b=gttXV1OWYG5ntFZTuFZlRxmisZg2d/2WnuTaqeL02sjbfJhKn6hDnzzPneLAjOE29C
 u8T+5GeaaHQAfvzEtfIYfOYJplQMLsvm9MQKszVfz2AEFPOPGrwhhtR97jjP5inCdpOZ
 XUcDc5AG650ydbaY0rrD/uLARAOeV9xocdbHRC3D4RP9E8xwqMtt619R0f74aXe/2ypF
 3KeKR7eDk95mABG1TSDFbHduir8PkIMbso+Di+YH/j6/uIwoFlaE3Mhlh3NpKWB/s3AT
 VZvxtHKj9lujGz9HwWD/F3M+pSso2wnLkEpnIzAXMFPhT07AiAzqHV52pVFORg8q0U28
 115A==
X-Gm-Message-State: AOAM531BoWDkCzUotl7jNpk9M2JZzodknJmG9JoRgKKMWIErVJe9sKuE
 LEmfU+YXQJsTMOyEUpB0u5c=
X-Google-Smtp-Source: ABdhPJwfTXmmpUNkLpa4I7JfKlBw46SS76hdMpnno6UD5NxuaRk4EFtZTA3ZOXumH8zJRoqx6KSJCw==
X-Received: by 2002:a17:90a:e2c8:: with SMTP id
 fr8mr16316205pjb.131.1627903004035; 
 Mon, 02 Aug 2021 04:16:44 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id p11sm10231087pju.20.2021.08.02.04.16.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 04:16:43 -0700 (PDT)
Subject: Re: [PATCH] mtd: fix lock hierarchy in deregister_mtd_blktrans
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Hillf Danton <hdanton@sina.com>
References: <20210717100719.728829-1-desmondcheongzx@gmail.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <999b1450-949e-fd90-6bf2-7fd4452158bb@gmail.com>
Date: Mon, 2 Aug 2021 19:16:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717100719.728829-1-desmondcheongzx@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_041647_658961_B7973EA1 
X-CRM114-Status: GOOD (  20.52  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 17/7/21 6:07 pm, Desmond Cheong Zhi Xi wrote:
> There is a lock hierarchy of major_names_lock --> mtd_table_mutex. One
> existing chain is as follows:
> =

> 1. major_names_lock --> loop_ctl_mutex (when blk_request_module calls
> loop_probe)
> =

> 2. loop_ctl_mutex --> bdev->bd_mutex (when loop_control_ioctl calls
> loop_remove, which then calls del_gendisk)
> =

> 3. bdev->bd_mutex --> mtd_table_mutex (when blkdev_get_by_dev calls
> __blkdev_get, which then calls blktrans_open)
> =

> Since unregister_blkdev grabs the major_names_lock, we need to call it
> outside the critical section for mtd_table_mutex, otherwise we invert
> the lock hierarchy.
> =

> Reported-by: Hillf Danton <hdanton@sina.com>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
>   drivers/mtd/mtd_blkdevs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
> index 7d26cfe24d05..87e26788ef60 100644
> --- a/drivers/mtd/mtd_blkdevs.c
> +++ b/drivers/mtd/mtd_blkdevs.c
> @@ -563,8 +563,8 @@ int deregister_mtd_blktrans(struct mtd_blktrans_ops *=
tr)
>   	list_for_each_entry_safe(dev, next, &tr->devs, list)
>   		tr->remove_dev(dev);
>   =

> -	unregister_blkdev(tr->major, tr->name);
>   	mutex_unlock(&mtd_table_mutex);
> +	unregister_blkdev(tr->major, tr->name);
>   =

>   	BUG_ON(!list_empty(&tr->devs));
>   	return 0;
> =


Hi Miqu=E8l,

Just a friendly ping, this patch is part 2 of fixing the lock hierarchy =

inversion between major_names_lock and mtd_table_mutex that was =

identified by Hillf Danton.

Best wishes,
Desmond

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
