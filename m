Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B2AC02185
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2025 11:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H62FYFZINCloG3SGPbOyfOOTORtafRc9dCKpqJwXem4=; b=DtRWv1trKyLs56
	PDQ3Qrx9gZ3uDLRR3o9YXkBesbCJvQX30a1x7Q9a2uWy2ihZxC7S9JzWQiUnWE1ZlVoD45Mf1pEMy
	GCAYP6sk/KCSrQ+XMf8/1q3w2kvtHcQ36/9Lq2J2RbppRLalVNdZDSXndU4bEe1pzIYRrwl9Pn8fV
	vEbgurUv34B156K7f/n2q/l+fW7+GDlnQEpUuaqgGLukGwJStMHGc3fTXfF2uxjr0jJtsunZH5paj
	6zN6YqWua1rN2i9hlXK732ihn4H4r07Zx/olpkQewz7mIxP6ISTmSJRv5o8JLTjTFFsVFJzzIg9WH
	RQJQygbWVcCM+N9s0BPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1Yk-0000000BfuI-3zb3;
	Wed, 15 Jan 2025 11:27:42 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1Uf-0000000BfCm-0InC
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jan 2025 11:23:30 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aab925654d9so524436466b.2
        for <linux-mtd@lists.infradead.org>; Wed, 15 Jan 2025 03:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736940207; x=1737545007; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X5k8+OJ5ejqrLbIGYGlpMbQVDmM7FZ3UgP8bKfKkL5I=;
        b=qCvrxU18tL8hx7VcYmkc09Sv+lsPSRi2GTCTJkfGPMUn9C4L3LwCzOsp4jF5k0jn2b
         3BeL70eKKXwE+6pTqLLbTknc2mLwtVkUQ/C/OZ0NdDuZWptrGaeWx3n9gsn3/DrFIrLG
         xROIw+68Abrw6fJKwmgGXfQdJ8j9hXVA5SoXI+hoQSDOnWB7tOmrTWrdWgefRjxyRIeR
         y2M0dSjGy5lpPoYNcHaWM8V+i3r7ntTA66N4x5lg2wTFOyO3tlf9ORGTlKzdGHPbRyBl
         00Pb+e8Kwl8JBBI7eZxubh+8tGdFU0slleBLJxUDRxYV25OIHB3MzhmiexYRMZ9OMc/8
         qYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736940207; x=1737545007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X5k8+OJ5ejqrLbIGYGlpMbQVDmM7FZ3UgP8bKfKkL5I=;
        b=BWIzuDK2AO6DBf/gDxZbaCuwYyrHnUoUDWJWpfYG+8gakjRDXV/EU8w/AODtqImJUZ
         WaH86cP6n+nhl2H2XVcoQv406Gb1OBI6M+ZPmWGIt+1uM9oG3EnrTCfWXV5jupYJN/jg
         AHy2KOo1QZN1/6y1c7cdJ/QM6caK5ovlGN6SVOBTQAE1Uo4tj2Ne2FIC1WPhTfJ43r/X
         xs2L9Y38HeB13tFKlRzkGOXGbcXwAcly7iUWiGjZ9RwR1ZlELMKj4uHTO3EWp4hJJoQJ
         9yqma15oOtsW9lC/MGDiHLZ3f6tXnh8Hbmt8sO5Y2x/iChwf9kGnx72TmBxtn1fQdUNH
         lfnA==
X-Forwarded-Encrypted: i=1; AJvYcCVYPseBOa4U0Lyi6QBsRs5MZLMVk6Xi78+AOJtaTrk8OtoEhHIwwOYRCh+hQFuGbgZToVR/x+u5yI0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwhDRVFFGO9k9Uy4SQ7pBWfo3q309aZA6gPvd1zpFq0VlCgwkxw
	HNFjQXgSAu4SA0Yckss9EP7rrIvfs8ynKmA00Y7JCYPMGciN+gtjltsEiipc2Gk=
X-Gm-Gg: ASbGncvdZ9oMlym8igd1OqO03uMuMXjgkPw488Av1AlmFrd99x/RlrxEv5gm42E1RZG
	MCjqXYl5pNsssDA/7pPo7/D0Fw4lC2vY3YZ+/WgufQ7VRBNJO7SbxSZeLf67j2klJkLaHLx8lb9
	cyazeeyHmfNDxM4hrCq7HpdyK9HBd636oREdKLCSGOM+6XStKQ3uBT7G8nMYNdXL2QkHozDMKZQ
	fz6xmFwN0clUYwTAzbuZtUHppA55khoj+A3gbVwIrXzSyFBQaC0mD6zFZT5Bd7MKw==
X-Google-Smtp-Source: AGHT+IFk5MMyA+1d2Zl6FX5Dhni23RIDbxiGdapJIYxNXzk66XoA0UgHt0YmH3/tASNlujTIyQJqgg==
X-Received: by 2002:a17:907:d1a:b0:aa6:a501:9b3b with SMTP id a640c23a62f3a-ab2ab6fdbb6mr2173281966b.19.1736940207425;
        Wed, 15 Jan 2025 03:23:27 -0800 (PST)
Received: from [192.168.0.14] ([188.26.60.120])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9647711sm749547566b.173.2025.01.15.03.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 03:23:26 -0800 (PST)
Message-ID: <fc968363-823d-4470-8cf9-1a118c01158b@linaro.org>
Date: Wed, 15 Jan 2025 11:23:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "mtd: spi-nor: core: replace dummy buswidth from
 addr to data"
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Cheng Ming Lin <linchengming884@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20250115101659.55882-1-pratyush@kernel.org>
 <878f66c3-83a4-4f83-88d8-ea2917d82d76@linaro.org>
 <mafs0cygo5p2f.fsf@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <mafs0cygo5p2f.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_032329_115755_2232A37D 
X-CRM114-Status: UNSURE (   7.16  )
X-CRM114-Notice: Please train this message.
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



On 1/15/25 10:50 AM, Pratyush Yadav wrote:
>> fixes tag please
> Hmm, I thought a fixes for a revert might be pointless since we have the
> commit hash in the message anyway. I don't have a strong opinion, so
> will add the below when applying:

it's useful for scripts searching for fixes of fixes.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
