Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAB6C282EC
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 10:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d+AgeLDVlBbCouRdvt3JHre3e5Yb74I2EettglTjzsk=; b=DEwSL4hdvNHlnu
	/GtCEFP9SswfHr4rBUAZFNSxoH5DCv94eAB/w/1bmO0pu47rIzrd71x3HSmAuy+HeTb2n/9Cr2BXt
	Bqdauw26SxjM25qsM6dHN6Y/d9cSBab0v2rduWuePr1CSgBteQy4iYX97fljbO9fI/FdW3ieKVzV4
	t5iCEJ710DVDYmBy7vO7r220mo+BK+1JJ3DbaxpMR/3trYWdrqbK5zeRhX8lVtFP2XBNM22hiBpzY
	bW843KPpE98diWoyjwKBtTvkTn4cvZLpOKBq+Mms2XwCUQvuT7TBfS5QTvpPfyKMGszDowGWL79PG
	2xSQiMdEeb8OitZWrlGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8wj-0000000AiEl-1RIg;
	Thu, 06 Mar 2025 10:59:21 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8wS-0000000AiCB-3obz
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 10:59:06 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-abf48293ad0so76723166b.0
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 02:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741258743; x=1741863543; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5C4QvBoLeZikw6Ba3FtTxQ35mEOL0q6BZ1Y7nYSxoZs=;
        b=i+JSD3BKLdLuAMAJI5Fmip+cNlPddo1x4pUPGyClO/UnO6QiBq64oTmtpq152aW1jE
         M+ZirG5FvgjqOy5SIlKxxylAI1+eBNw5wCabQ8d53snXaW3U84W9N+evCBDz3w+Vt1X+
         jnINuQWgtoLt7rywtevCjTAcXq484SCt5Aj7EYftg/dk1VLajnQN4lznnWukGCJJEhUa
         w96F3YHZ2CCxYNmPTO/dQ+/Pid9eBF+dH6l0cdAjiKOSqmRB1OK76JfyfT9r80zdEmVD
         OdGBRb8QO61JrClPAuUxc6iR2NJqIMCysZQzqqGQJl89+dEBuO4Foanyi9EXGGLxVhVa
         2VsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741258743; x=1741863543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5C4QvBoLeZikw6Ba3FtTxQ35mEOL0q6BZ1Y7nYSxoZs=;
        b=s6IxZMPRFPfHw5bziyhAiPToChhXIi0K2LgKE14nLZrjN3/6H6R4keFksYfL7X7DqI
         /lbupwy3PDqKfVySvusvF73Ax1WynaGTg1xzUBq67zEHqEXwwspokIqIeuhHMcxpsDoC
         tZfI9heI4+z26qDYcDCwFYj83EF0TK7QA9T2TvjpKm7fbWO6NXXo+YKtEn5VrmPc2gOl
         lX7qmCUMaIHCUfJ8jZRYx83M9tFf+MAER1f6QwSaBWKrnlRWcBxiNtbUT+28JV1AqkS8
         T10ytvbnSD5fueLJwDIMMzaZ+3FfmiX4+dxP6AkyT8dA7G4YNnnZdGgu0Q4G6sWcLg5K
         KnpA==
X-Gm-Message-State: AOJu0Yw98iAvlWrNqMmMJK/9Vf6Gs7I8SdUuPRIUIPDs79HCsYUfAVcp
	DTCljhifkLHyhmrWkXpKqni9xb86+FHPWgJbRJxl8/4y3Dq9pp0i5N+Lus8vNSk=
X-Gm-Gg: ASbGncs72P2wwIbaMV3z7/+WYyAiiCubKqOobyBL59F/f/+8Lu2d6ao8l8jEFpmIepD
	wkwejicW6ABzUpY0z6BMmLz/UupqvwlJU13sWilHnzy2Ov19rtJKRnn8V9WRdLjkJ5T1xymmgc8
	XSnGimHyXQRAhYKjftykzfpaB1zqbod5SaM74Efxs+M64lSbiQ5qYI1PJRbUycKCT1EIhtcMYny
	qaIRKZEAUxCouSLjze0gOyiD28qTGZHK03qxrrdKzEUiNTMrofNkvL++/3zbEVOySxjP+qAy+O3
	v1utaGUUaPGXzr6rjDecnTj5Miq/B9hdwtubOkZ+rFsWlWSZQ0Lnqw==
X-Google-Smtp-Source: AGHT+IG3/CY7InOwwMBI/hfcDuQEgBl4AqRr2kCLu+MvY8UuxbbqY8rrrCYNac5oXeHpEKekKLqWoA==
X-Received: by 2002:a17:907:97d1:b0:ac0:527c:9cd5 with SMTP id a640c23a62f3a-ac20da97be0mr585758766b.42.1741258743166;
        Thu, 06 Mar 2025 02:59:03 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239483628sm77212966b.53.2025.03.06.02.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 02:59:01 -0800 (PST)
Message-ID: <e19e9d0d-ed70-45a5-917d-0142c4107fe8@linaro.org>
Date: Thu, 6 Mar 2025 10:59:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spi-nor: add support for MRAM Everspin EM008LX
To: Claus Fabig <claus.fabig@emerson.com>, mwalle@kernel.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240809132246.3395-1-claus.fabig@emerson.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240809132246.3395-1-claus.fabig@emerson.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_025904_977168_E29A3643 
X-CRM114-Status: UNSURE (   4.82  )
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

Hi,

Please consider moving this flash to the at25 EEPROM driver:
https://lore.kernel.org/linux-mtd/20240604074231.1874972-1-mwalle@kernel.org/

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
