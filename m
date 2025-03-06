Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD14C282D1
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 10:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nVCwm+ZHIFJ1CL8p8yx2Uz9waobnzno0jntWrGg0VBk=; b=cw4kOAwx5WRaUa
	Zn75liKjmEWpIsDjUOsNV+Tvd/+lkmgd/0pw4SM/458aio+yC0Fu5QNkPLI+hAFk9FOLCmzpErq7T
	msvv360t5fhj1Gh1XjPgpBuvk1Gy87Ffzk8xJPjBvlUs3nOnQb85Pu/Gks4q8zAqBeaxOc5FpVQlO
	Gjy65Oi4fWY2t0p3aUyXnJWPMtcF8IT8A3xyYJnhHfZaBgQwt0etKon6PwtbIxMXBDcTEAy44/qW/
	Z21v/wheKnXbK+FKLGgHLR/iWY3Ff6qE9erkaNal4RyYs9DEMmJQRlNiJaw5SgOO0LruxG1KI6nad
	+qzZ1lpjdiCqsnrUFTqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8gR-0000000Afy9-3aZE;
	Thu, 06 Mar 2025 10:42:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8gP-0000000Afy2-0wXx
	for linux-mtd@bombadil.infradead.org;
	Thu, 06 Mar 2025 10:42:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=9dzw3QA0jv1GIJ19Wgyx9MGA+JB12BFFOKSX1GCsROk=; b=j6Y+UKRVLYAeYzSF53V9bVbaQg
	WBuoEit1xZDOrX0jKlmXQbBgz1Not/g/lgaKk216jhJpl+wlQd/99Z/Rjwi21cIxDoRQPIqByChZj
	0ShPh6s7hFDL9rugbgepXdKeE5aIyKMebYQEC7C3DdDy6MJlM0KFxFsdT46+m42BjJ8WBOKUsTD8a
	jxlFDIu/Ktq0WWXsHJ7qA+Lcwsr9ERhcGU7JIwNRZoQK+SA24ktKtSPMFfwApscNuqOjrzsAyACyv
	cM/XZyGhaImwmSb2APzbuVrD12pokDngHX+JzvBIxl4sX69JUFjb5pK5nozJdBeR6bjIfLlHPLsBE
	tA4m5hkg==;
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8gM-00000007G9L-0CRF
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 10:42:27 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-abf4d756135so84300666b.1
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 02:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741257743; x=1741862543; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9dzw3QA0jv1GIJ19Wgyx9MGA+JB12BFFOKSX1GCsROk=;
        b=ETo41Cv+KW+cwvDhy7vpgXRRmKh/gRIwcJVidW2ntj5RMtboBYVTP8/H/Z+I324u8q
         NgzZpIn+Jl6y7sKS7nXuYjMg3MEpKHkMdt62y3F0e6gl0eVQsbPeMexPvVHM45QaBoTt
         6aWXaGLqiRbTrnPI2opF+50/mU65ELYbZEQpmPFdIP8BuvanEWSmVyf/pNMlnI+k9FSd
         /mh6qqQ+YzMlaqnIWhkLdwqwgXAZyZBVV2/F7t+Q/gpPfxbFF7K6Q4/BJR1KXiLJyIyI
         VRDEcm7KzwkX4ceeukOK0fwzGwQe56SKZp/lowbea5OjP6pUBfVCkcU5sqY1jjYmD5av
         UirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741257743; x=1741862543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9dzw3QA0jv1GIJ19Wgyx9MGA+JB12BFFOKSX1GCsROk=;
        b=cdl7OrMuwSrPtol7Kos8UA6pzMl+CDp8OJUM3r7SjE1aAhy6obCqKhhUUTWQ1qBRNQ
         dqgp2uztEKHUcu50uGdyheRODVlVAZXterK7ITX9yJ1dJxzi5xPSsZCKoLjqOhhOeCo9
         17mWyJ5Pd7xEaqyEiv21SYQxWC6pTdwj8kHrswlWIbzbh7IOpvpE5N3zRr4N96Ki38TJ
         DiMVJrgZp+2N/RYDc+x8pDvm9LzcDnX8MqDtsZwHiwnEUp6/1jNlAksaeQ6obW5DFUgw
         Bqr0FI4DdoHSNEGLRu8sjWkTkp5SAzoQx8A1XIBIwHuYQqbUyRF4TnyZ5WSLKw7MiPcM
         EA1w==
X-Forwarded-Encrypted: i=1; AJvYcCW/rOqoCWs6UiHLq1Jwep0BQIQoRBFZz/RXPZ7r1fGihpSr8ofyXj05j28Y5/fyaTlm4jchWJX5UxU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx14LKgTfX1Jawh3ejf0c0T9MRoRmtJEk8LxJygg3kDYtTv1VJ3
	FpVMmn8x4VmQbt5CGBca0SXw01HDPJOebVc6R5749umLMmfX7Ddx2ehC6HJffYI=
X-Gm-Gg: ASbGnct5hKrrfu+fJfZUOLw9sCbmRIDzAQpIfgfoiXLlAaDMw/xOTlwl4t7gQZ1Ujwr
	1cAibjsFFaSOsTZ6Up3sLiVsJaGN8b4yk0XmW+wXyiJmyVnhpRi6GEGwp17aPDXxcDx34Yi6MGs
	cgbt9GVMBva7Oi4Hsbd+NMMFWZNuSDfktK4F5f3R0khVKLN/1CFVsS2ovvNCzRFHv3LlsFQws0q
	opLqORJQcYvB5nX7MGOOkYrESBhzELz0Ceu3Xtj2wO0SFnAbvkVaAJxWjk6rNcIF8G9V5G1YRLZ
	Z9MALJ3emiP8L0ZobyJdbzLHsWhmAj3Ts53Fhpej+RZMsExRuZ3IBQ==
X-Google-Smtp-Source: AGHT+IH5OynE94iO6/68ke+w+5S+jaWiXN/fMuyniBxWME65WNCUZ6zE3HTrQlHjLNO0DjIF7/LKIA==
X-Received: by 2002:a17:907:97d1:b0:ac0:527c:9cd5 with SMTP id a640c23a62f3a-ac20da97be0mr580236066b.42.1741257742944;
        Thu, 06 Mar 2025 02:42:22 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239438758sm73363566b.25.2025.03.06.02.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 02:42:22 -0800 (PST)
Message-ID: <3f5a150f-0a12-4055-8224-010c678ada02@linaro.org>
Date: Thu, 6 Mar 2025 10:42:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spinand: Improve spinand_info macros style
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Cheng Ming Lin <linchengming884@gmail.com>
References: <20250304110539.2290873-1-miquel.raynal@bootlin.com>
 <mafs0a5a1j7om.fsf@kernel.org> <871pvc296e.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <871pvc296e.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_104226_117619_C53D7C56 
X-CRM114-Status: GOOD (  10.62  )
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



On 3/4/25 1:54 PM, Miquel Raynal wrote:
> Hi Pratyush,
> 
> On 04/03/2025 at 12:34:33 GMT, Pratyush Yadav <pratyush@kernel.org> wrote:
> 
>> On Tue, Mar 04 2025, Miquel Raynal wrote:
>>
>>> Let's assume all these macros should not have a trailing coma, this way
>>
>> s/coma/comma
> 
> I think I never spelled it correctly, but as the word 'coma' also exists
> (the medical term) it never got underlined by spellers.

:)

> 
> Thanks for the feedback. I'll see maybe I'll fix it while applying.
> 

It's always good to address review feedback, even on typos. Otherwise it
may encourage reviewers to not point out typos anymore.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
