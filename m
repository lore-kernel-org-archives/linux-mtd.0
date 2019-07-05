Return-Path: <SRS0=jTzi=VC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2EE3C46499
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jul 2019 15:48:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ACC72184C
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jul 2019 15:48:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g0VdIjBh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="M+W2/dTn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="edsyrJE6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2ACC72184C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=coLOBIvbkV3MnkUt3FHqMiipPRl7tRv6bjgvsMgPGmo=; b=g0VdIjBhm4UG9r
	OgvnM/NjNHb4zuhfjXizsciLW7lACj63dlDZvCiQzK5f+NvN2wpVRfvTOYVKnnBoQOCiNRcMqC8QH
	k1zq1lgYqfe79PGoT8iCdu9VoyWjiuGESxMR6omFqPtcGkbpYpVMQHGu+merjL3CXHHeQbWXA/LWI
	qRnJQDVXtW5QK2Mjw7nZkcjh09hp+fZky1dMbbRvaw+P2vnUp9vmdn1Yk6SRDlnc4AvwtmMV+czIm
	vug8/AscKlYcHO2KkVbk23WBDBDreiqr6ortiQSGvE/UbXzMi9KiRxztbkPX099TI9gU1GSXnKCXA
	5wUhXolUh3s3gsXNgdUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hjQRy-00034c-Gy; Fri, 05 Jul 2019 15:48:38 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjQNm-0005x1-Ax
 for linux-mtd@bombadil.infradead.org; Fri, 05 Jul 2019 15:44:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VwGkRG58YJWXqfMjPdvMJBfTTw2kDvU56q8LoW9OQ0M=; b=M+W2/dTnV0Q+bt8bVe3VxwLiEp
 tgMwVXlrlMpGDK4tKYTGE1/ok2yaQsr/goYElILdyZlvB1QXq3VaAzd+Et+iUeP5DHEvsxYvkq6XZ
 iEdtGI8TjRCVDRH7ZsqVCnlXpfpSPZwholemMFcK73MtJjoajiX5xWiJSfWkB9DGxXOMzdtHaZ0wL
 oYmbeGXLoJBSIjvziOfJ505inAZVSq4odRPfiwetArls9wvJ2ODjfonoUSSidMUH7ORmfkUXbg9JI
 Ab25JZW/UAeuB1zB4d20O5UgfaojexFp9WVm30hwLF2d6YGsaecn+emExnpnX7FRx9HK3aVC+/oCu
 jKGAYWcw==;
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjLqo-0001ET-QJ
 for linux-mtd@lists.infradead.org; Fri, 05 Jul 2019 10:53:59 +0000
Received: by mail-lf1-x142.google.com with SMTP id u10so6019331lfm.12
 for <linux-mtd@lists.infradead.org>; Fri, 05 Jul 2019 03:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VwGkRG58YJWXqfMjPdvMJBfTTw2kDvU56q8LoW9OQ0M=;
 b=edsyrJE6LKExWpqlURip/OecvNiJ0TVs8OBgeHboE3kcE5CZklSjXsT8o+y3oU/fBj
 M6eW4NKXPvXuudi3L1dT8HxSSlPYBV0l6y7l1KZ2la0+OdW0+l9Wt0Ne7aA/Csh0Nv+B
 pACq2URaS8/vcfMcwIZlZziweXou+WugEsNKcZMCrjDazv1j2zvxfLkfUFcfCaNYH1/g
 Ne8G8rAMzFqFBmrKhF/S93f0sgOnov2Etd93Uhp7UI95iy0dxA+VNeNB1mJbSJ4wZDl9
 64TS8liUwmt2jkCZr8B7rA5fXMGsij+XpXi4jlLWY7mU/vNYp0QcAUVrFnetA7d7Mpf1
 BFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VwGkRG58YJWXqfMjPdvMJBfTTw2kDvU56q8LoW9OQ0M=;
 b=hbS7FvO5qfEnmb8XBDsoKazJIapkNtRfRoTwcoEQ+b98Wc/ZYbM6b2SRuRxRX58FJQ
 3haIVsW6N0ZrmPAuDXkaX6C2a7c8kPrjeiZHg6/TS2IeuEfWwqgDu4OqXJfDCm7kr3NG
 Trqo6gyyWlVcL1xcRCo28qJWNie+fgE4qJhhOlUPgFjcIlwsJRqcL/y4yvo4Z7ZZao/a
 0a9NVoSUxN8uKSKxR/37n37BMeVVwBwmLGAI9Xgigiaq50H+xZFrfJuqgTT00wwJyG70
 SHN0urJaA6zrefWBAY0FwLQRDNSeTeXqNIQdJm49R2xECC5cd6F70EH6rxtatS3kpr8s
 ABAg==
X-Gm-Message-State: APjAAAWqo7iAqV90rG/ekp+h67N4lvRJ3IVTfOqIV38jDOIKOsrbZDqm
 gzdWWHm++u839ndudB8LtzZGww==
X-Google-Smtp-Source: APXvYqzqsZ2siwTv0SZ25QHM3z8b+2e8nmY5KGt7/399QR/9911RNhaynjvWUTgno+kO1378QiWopw==
X-Received: by 2002:ac2:4c3c:: with SMTP id u28mr1734061lfq.136.1562323914982; 
 Fri, 05 Jul 2019 03:51:54 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:4863:dea5:8b6b:ab5a:b1b5:6435])
 by smtp.gmail.com with ESMTPSA id a18sm1734290ljf.35.2019.07.05.03.51.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jul 2019 03:51:54 -0700 (PDT)
Subject: Re: [PATCH][next] ubifs: remove redundant assignment to pointer fname
To: Colin Ian King <colin.king@canonical.com>,
 Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
References: <20190704222803.4328-1-colin.king@canonical.com>
 <b5e7709b-3494-d415-b36c-b19939a15fb5@cogentembedded.com>
 <4741f358-7c21-f721-e9fd-59d73876c62c@canonical.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <e97cc68c-c59a-1f5f-6580-40868bf16e90@cogentembedded.com>
Date: Fri, 5 Jul 2019 13:51:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <4741f358-7c21-f721-e9fd-59d73876c62c@canonical.com>
Content-Language: en-MW
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 07/05/2019 11:31 AM, Colin Ian King wrote:

>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> The pointer fname rc is being assigned with a value that is never
>>
>>    rc?
> 
> Oops, cut'n'paste error. Do you want me to resend to can this be fixed
> when it's applied?

   That's the question to the maintainers...

MBR, Sergei


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
