Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4954D2E9D1
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 10:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cCqTwyNtOWJAoynnLKscr9WpMsDnQ+IvpkxXMtb1FXU=; b=0i0pontoK+zwva
	GjRXEsrAuHOfs0t9ugkO5t8YwTQ4b9sG3ba36O3cJYTIkTXFtKPFGKBo3nnvu7rFv2NLByrAuTma8
	jUtYHdC7HGi7fqx1yjr4iSVm9lXLZXwa9qIJ1RtQkfj2x01oNe+ilCXNuUpqwyOp3G9ADeMnlC0T7
	57cnST2Qj1TX2MPleNj56CMDvpX6VKAWf79Vz43BctG+pSMBdbORB3sGvP5bLUDvTBFAzTKL3dzi1
	wJtmlU+eg9VglOLwCJYuFD5VOzzAu4BTtZJXAc4Xd9V8jByqCKw3N0ZMD7TLdWjUeqKxc28C3vWO4
	l4If9d9sIG9dgtS0AXww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tARIB-0000000HDUm-1Lsl;
	Mon, 11 Nov 2024 10:05:07 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAR6C-0000000HBZe-2DrO
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 09:52:46 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4316a44d1bbso34782785e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 01:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1731318762; x=1731923562; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1wdsqq0q4QSCRRBSM/JxYJ+l3kQ9b3FdImbopvE3SEI=;
        b=wJGWQDnH1etre0A2eJxViDw78S67QhmNVmJ8zxZgsgALMrEIilOjsRq7etpOyO5evk
         XbI4Fbt6Ho4mXPKzmGveXhWcFY/gtPOyo0K+vDfnhEohEkX1VXbuW2I0otOwwa5UGvYd
         2hRFn0OppBv/RUkpnJq3SspKSrHa+l6bDXKFwcMGSr/PZDeT7UrRTOKCJAc10y2DH6En
         y/5+m/pp4qjD4ExYfhCJTJQtSqqWCF++c6pt5lU/79fF0NI30g6mqhtpdeCry5ughF2z
         SGoidqus0YMSs0oq2j8QIb6ofjfJRdX5J2OH3lN/9e/5Q4xXEQoUaMrf9bTAafQVtyv8
         H+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731318762; x=1731923562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1wdsqq0q4QSCRRBSM/JxYJ+l3kQ9b3FdImbopvE3SEI=;
        b=SREZui8B2pbmSp6hCSL9+twe5MRVFfJGvN5TaqeKtwiK4CTkDqYQEfLEfxHCPzOMga
         fsG+DfxmOPLLW4eGgrkZtBiiy7LJxq+gImH9mCrm5/w6fns5z+WdTz3ABMpMmCKYfBSc
         Gw8d6CDvBbDbgL4+y7qZlH1CEl89zWDvEfIMa/FmeQuwt1kze5PQgjXihY0AQb4jgs7O
         xyIWCXcwXv6MX2B/R3UfkLotcIVgSj31sFyPWEOuLUQ4GqiSS+Gt5PasXWKcBTVgO9KO
         BNTLCeBVH7WALRGqmv1iBMQX9Bl27htxflZ4W1GQoUdz6hkoRlE5RefWBfn+2yEPLYSe
         nc1Q==
X-Gm-Message-State: AOJu0YzlSDE0bABNIxczVVYY4Cxw42ZffzEgSNvDxqR82UJi5s3T+4WA
	3LlzYP2O1V87veoawU7jaC1JopklL4PQsr2TBVn5ctq6UztmrLfp7yzojMNwXow=
X-Google-Smtp-Source: AGHT+IGJtjNYGEsMhYqb7yGI5iJGz3FedkUo4qyDGtd30wW7iV0LipSuAP02wIf0fk+pXAIooXcVEA==
X-Received: by 2002:a5d:64ed:0:b0:381:d890:b554 with SMTP id ffacd0b85a97d-381f1848a0amr10792785f8f.53.1731318761780;
        Mon, 11 Nov 2024 01:52:41 -0800 (PST)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9707bdsm12761452f8f.4.2024.11.11.01.52.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 01:52:41 -0800 (PST)
Message-ID: <7905b16f-1e7a-44b7-b16b-3f2a84e23390@sigma-star.at>
Date: Mon, 11 Nov 2024 10:52:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mtd-utils v2 RESEND 000/102] Add fsck.ubifs support
To: Zhihao Cheng <chengzhihao1@huawei.com>, richard@nod.at,
 yi.zhang@huawei.com
Cc: linux-mtd@lists.infradead.org
References: <20241111083711.1916125-1-chengzhihao1@huawei.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20241111083711.1916125-1-chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_015244_911753_ECD55B3B 
X-CRM114-Status: GOOD (  12.30  )
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

Hi,

I'm sorry for the long wait. I had your RFC patch set applied locally
and at one point even pulled your updated version from gitee.com. As you
noticed, I cherry-picked some of the fixes for the last mtd-utils release,
hoping to get around to reviewing the rest that mostly adds features
afterwards.

Due to the sheer size of this and the previous patch set, I only reviewed
small parts of it at at time, always post poning the rest back "for later"
which ended up constantly slipping further away.

I think by now I've managed to look into all of the RFC set in several
sittings and IMO that looked good so far. We even did some limited testing
with broken UBIFS images as well.

I applied your v2 patches and did a diff against my local branch with the
previous version. From what I can tell, the diff is quite small. Besides
autoconf plumbing for ASAN support, the changes seem to be mostly cosmetic.

If nobody else has any objections, I would like to *finally* push this to
upstream mtd-utils.

P.S. I typed this up ~1.5 hours ago as a response to the v2 patch set. I held
of sending, when the RESEND (and resend attempt?) came in. The git-diff from
the RESEND to the v2 I had already applied is indeed empty, so that should
be fine.

Greetings,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
