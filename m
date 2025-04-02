Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67229C28B20
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Apr 2025 15:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9DDp6xZvLTu+JEay4DNvX3gdPUgNbdezUUdR4f0DZM=; b=aiwB7XteH7toPC
	8SitsEqq7pZmLzylfHq0wxamj6tGC6hw/Ijv5xfqL6z6/RsjesRpExMLEjakWQIWX/LMjiJiZusAT
	zPL+iaa6BLJDWBAEGummASQF79QyW2FwCJpovcz1m2YJ6F3L5Pwnu8lFawC4ZrORd8Dto2exTVsY/
	L3UwsjXdpUbUS3HPKjuhAVHmzsIqsu0fkctMaT1IkeYRdVz3Z9bGBl3Kf7XlWc7EBMOYOAk0A7DkG
	GBf8qIoXs9k8NH8MYlU9m7+sCBNip9EyXEQjh8tRssdMImO1CnITVl+Pp0yfm4Q8UIL3aP6CYvH3x
	vXYnG4kGqEE/nGcsjxzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzgj-00000006SrQ-2ZUL;
	Wed, 02 Apr 2025 15:07:33 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzgh-00000006SqI-12tg
	for linux-mtd@lists.infradead.org;
	Wed, 02 Apr 2025 15:07:32 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4394036c0efso47373635e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2025 08:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743606449; x=1744211249; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=V+NgGmyR6+E15UNZgCSvMQQbq8j/xO7GJO09X7Csn2IoafMNFmkbJFttFnml60J+v7
         5QRFjt68hR1yyQ1xO2KoFTliZtbPr42pPHsPVi6k82nnk7m3sMWH7Y5zvB73e0SyfeM3
         vVA0pFY04Ed2hKdhqajhn/e0lfP/R64Bm3hlprkTYwIV3E30WZPGXj2+5AJGikNqKwrM
         qWByKx1yE2wOW0Bu8n0lU8dOIJtSJXrZJmhdAIaWn5UyJ3oAvkIJyU1vNaER1u11mRyP
         vSxaPDQfgncUg75c/gC9uhrxhucT9WF5q/yfJnDYZsfkBw8RsZI+Op1QMzAXYvOlCexD
         LJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606449; x=1744211249;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=VPmMJsDjwmPRmU+jiMT2FI0O8I7igFbD3GA1mZAnOCsGf2g9CNwC5A8EviywSEZd1n
         2Vxd2LAWP0i5nuSXzCzu00lumtz+zolnQbsRXNuaA0CEUalmdz/oo/SvxXg8tqea7LMS
         agk8U8VQQ4SwZfO1w40YWEHQbCjghsBM3i0Vws2sK9Vp3g9R2CwVzEaQpgoYHmfnYXg3
         t4sE/ut313p7TquyzVcGV5M4oiWCNo8IXL0Lw3ZzL2vHfdzZL4N0aOr1Dwc9fcaqfL38
         35XFfdhn9/z/5OWT65TkFU0frzZRL2vybZkmwE7q3I9l78G9TRlY3KqNCvAEv8uI4+qk
         5Hew==
X-Forwarded-Encrypted: i=1; AJvYcCUG5Z7Wgz+NCq6XeuDNbz8RXQhX3NskuaRyq4yLTu9eT2GTsI6Rtpja2sXYVulR0y4WhCbs0SWY9Uw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb4+o87AOdQR1ZeUWrsLC7mDjlerg7DvD0k239FWW+WkZbJwU3
	7DcGOiChOTo15Vc0jGs3Cv9K/O7K+JWb5w49SgdBgq6VXP/el2kTRaqz8wMlJuw=
X-Gm-Gg: ASbGnct4SLtOjXhGaUvwWKxjUVPwGtore6xadjnJKlWuJh8xn7/w5vMmsBrWM9J2s9j
	fO6cHFoWYwKGG/TO3+pXLcDgAfUUr8FD7lhGEOY3zIF989Mf33B2wj5GU1UWF7Yk2yfH0hDahyV
	t0hOmc4wcNAX6FLBDRHgEXNY5CVuMpswlke3c25FJeor/22VzhT9Di65pa8qLepxDTza0GKHKw9
	95njeXfxe8IIEPE+DtzhZDUsvOc3UskdjyFx9ZvJh9K++9t13y+rQ88iVOh0GSRxx52ueKf1YTn
	sBOQuD9u8eG2XMnMZ47h9ny6a2StJBXXgUCkL0nYww1doOFi8afqh7KGG5E6MLwa
X-Google-Smtp-Source: AGHT+IFMWY5ft/pWh29TsxRnhJjL8o/h7m4mXeET6Pc3AiclHVvt0+wB9flt9C+WfTpG9ahC7hQIXw==
X-Received: by 2002:a05:600c:c86:b0:43c:f050:fed3 with SMTP id 5b1f17b1804b1-43db61d1becmr158392515e9.11.1743606449564;
        Wed, 02 Apr 2025 08:07:29 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fc662fsm23950335e9.8.2025.04.02.08.07.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:07:29 -0700 (PDT)
Message-ID: <48ffe3aa-391b-4803-8be0-72ac23cbee5a@linaro.org>
Date: Wed, 2 Apr 2025 16:07:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/21] mtd: spinand: Use more specific naming for the
 (dual IO) read from cache ops
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-9-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-9-45c1e074ad74@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_080731_279818_D8F0FA22 
X-CRM114-Status: UNSURE (   5.24  )
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

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
