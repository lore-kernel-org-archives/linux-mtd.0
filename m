Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC49C36017
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Apr 2025 15:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9DDp6xZvLTu+JEay4DNvX3gdPUgNbdezUUdR4f0DZM=; b=UYlSO1Uz4wfBPx
	yMU4HNKYviMEBs7TgGrEQzXSrIVV+39Y+eDxEU8nnn//H9um3PGwRO6GeGxC/Ux/U9jtzVpDpDGNH
	MbjCHVRkrfNHX5Wu/saDvh7I6bN4JkJq0+oJhpF73Ej71pQH0X3xk/zCskNrfOA1HfcTZAr/KMESg
	SmBemUi19qEb/eYovPZg6AEFZ9vZP0J1B61yH+H5R9rb4+ZTC5SVfWqd+WiVuhRTw4estqrQZm/Hl
	XHW4aeIH/iIvHJm8VvpAhzg29JKKhP7kAdYBGr4GruhCSUp/1Vj5WHQQ1rnhk0BTYlkMA8aouOWYr
	W19Nqw2pFs+RgRral8fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzm6-00000006TzT-0sTv;
	Wed, 02 Apr 2025 15:13:06 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzm3-00000006Tz5-23va
	for linux-mtd@lists.infradead.org;
	Wed, 02 Apr 2025 15:13:04 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3913d129c1aso786588f8f.0
        for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2025 08:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743606782; x=1744211582; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=LOo0j7C0P3WuSWSyLRV0YnKQksv5M1oPshlkacVJe80DhlUVb7TRdk3liNS+WDf6jz
         Gnbr29VY6DOafzdcidt0ZSSAPgZi0Z4a0BKu32vdLonuvmmp574MazgfNYRBlCxYW6d2
         BdRAqntoFrPnPDvYSMhicH5JpFNy6pMyaNTdCbyap8OG7LxVFuJbC9sCAMJs5ebXzXQp
         /0sdueOPDu42qpAs/NRQR77ookPRogWERb+cT6iknDqI894EhBGlZEHYlcOqQLovYtwA
         1YMeSbBL27oKw8qaNdWc8pOa+h1zFUUiwJad4hxMIx91VoUMj5ekpgvKp/G9R9Yi3fyj
         +UOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606782; x=1744211582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmsS7TeoR5lfEkPA/4hWMzBs7ZLo8pjbDxlnDnyGR5I=;
        b=DqTgKV2gd236VIcKg54NXsp89QeJpTmKOHhoPe32m+f1kq/dx1Nui0JNiKUVeZQy68
         U4jetbH+DZSb9eyzoVSO0FTKeoFnKBw2OhSGU/wB0HvrDzp9ecpXgb8L4OuMhx5uIHnY
         Zy8k3WEzpItFr8rL+8EWUFzDDvufALLhkzTafpfT8MBAKYvcllt0lxo2h6QpbrCGoXi9
         SEiBtXIE/tlYKCHQo7DKmnY5oONkxS9VUffEh9lLrX7M6ab7LMq38mgFRQjGXVgF81gt
         5qBoKn18A2rEjEzG7SxFkgU1zEJ64Bpmu2/dHQqhe2Tr7yfsj25bM2GKPbUhmh2AHQIu
         uF4A==
X-Forwarded-Encrypted: i=1; AJvYcCXZEhMjA4TGj9yMiOvfRLNWfr61GpiLHKvF61q6MJg3k6fQ3usfupkD6N43Ujz3otMOVtt7HzOvpCA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyfu3mENcUXjBz8wU9mG0k/OCNkp9T9K1zwTtA3+n4cQ8Wdwvxt
	6w9XnVdUTss9+0SCosZnANjTLL+xxde8Wk9TP7imP2cjDS9LjL2I/zW44zczsjs=
X-Gm-Gg: ASbGncsdfAdXDYpc65HlWrzlh7M0FGED5f9EID7obAsrTQimhrg1f3E83r8S13WW4+S
	nBEQ+xK8df4EYEB7KDURgTFVglLcFr8r7t1FDNHcmTHTEIudYpSks+S2Mk2x8ByFh6jRUcYE3PO
	MIUVSB43ugy7VKgCt5HRcCwSRnBXiZw32baaF4iB6KiMljJYdkyqCvbti5cRl6HtAvIXoKhRtCw
	N3Fv7KBeToU2HlABOcLEpH3/mLiOXkio5Y0GdKqdc4aCkaqywFSM1yHu0F9Wn94grA70/am7pQg
	FwbX84SOXVtpzR15QN8Z1zQ//cur8/OP65OceT2MtYrYYWG+iW5c2VJTncByuMy9
X-Google-Smtp-Source: AGHT+IFV9QpbI0qs8JcCYzb2VYhkvSErn0rn2p4Rwg2Fm5QGA9G1fELHCwW5wiHnCk/8OuEs+wna5w==
X-Received: by 2002:a05:6000:2406:b0:39c:266b:feec with SMTP id ffacd0b85a97d-39c2a668a72mr2107256f8f.7.1743606782017;
        Wed, 02 Apr 2025 08:13:02 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a41e8sm17495162f8f.92.2025.04.02.08.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:13:01 -0700 (PDT)
Message-ID: <660f020c-1a33-4514-8946-2527053795a7@linaro.org>
Date: Wed, 2 Apr 2025 16:13:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/21] mtd: spinand: Use more specific naming for the
 (single) program load op
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-13-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-13-45c1e074ad74@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_081303_522648_259E250E 
X-CRM114-Status: UNSURE (   5.23  )
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
