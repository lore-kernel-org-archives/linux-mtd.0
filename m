Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A392C32773
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Aug 2022 16:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kibbSIsSgPObItdlpy8jqXmZtVVFwm7rw1BTDuSRFVI=; b=QpYYI0f+VjjBmxwXLZNCvdnvhH
	d4tB5mU9zIDBCt+tE0mBlyrX1rSnOTkvOPzGljpeMNLOobUdVB3MbWa0FFM2rixx8YQ3jIKE/K0Q3
	CEATgZjjhbzkFat4S1gz/gpHM3z2fudH1wpW1l9ybl4r3Mxm+Yq9s+d2h48zbdpSsSIh8ekXZLDJR
	w6zxZNKtJhO6ODzBULmKvHGVaAnxVg9VKW+jkBIHBVo5KPwZgL7CXFHgvnjrcYb4xQ3gSNxQHQDJE
	LCsqJFMoXPKulse7UkTVoyuWixMY5AOlz0siw0FgF16nZAz0C9NZtur95db1jj2Nf/F1DsoNNkwY5
	pBwY0vVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP4bY-00AF5x-BX; Fri, 19 Aug 2022 16:12:16 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP4bV-00AF1f-7B
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2022 16:12:14 +0000
Received: by mail-ed1-x536.google.com with SMTP id a22so6224365edj.5
        for <linux-mtd@lists.infradead.org>; Fri, 19 Aug 2022 09:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=KnYLqFOfTWYY/b/wASFwBY5/XeE1x+Rl6PCWj9CZ67IlUPijKlJ/noHOa6QYt0xAZx
         x0xleVdc80RNl3KOPnRE8TJLS4+HZXNj0QW9k2KZwT3h+2KVt9ZzSlpFw0P3shB20KCZ
         +qdu745Lmg3Z4FssunOglFZvo6pruxu11dbbbI72pfySjBBKa6+jXEKP5gyfV0f/rW9n
         RTKpLY++4ezRVXg00g/RveolV1L4jkoH+ClKoTJjXlwahOZvKWcLT5IPGUIiYGCQrYnc
         pw7/1z8wHuV9f7z3shx3r/W0pjM8XbdE8qGHMRpONQ1+K5xDs19khTPQ+OTAtWvZC2JT
         hSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=TXbvpGVVUIKWFoXCUIYb/MB5QRnPjFXBsQbNLPbL/Qml5va0c5mSswd5P77ZCnpp3i
         DQHizuHxq+9MfGJwGg5L2PbJgkhtZnzjzJs0i4ieMiNlYQHnsI8rcCeauj1205h1taSG
         uow0yIvhrWoJ4Ci8p0D4OYL4G14ZtP5O1g0osLTy597jh8ZFhQFixD4axEMQz2Xu9RRd
         PIjpqmpB1aMpX6UTGIhQi2GSz85r0bgczil3X3MBAiMcKmrNMSCpcCS/oNHDN9gBiPb3
         RqkB1cY3oJw8Q7fL3kvbo4TahGjQkTcNMOobA35XQkkDANoWsAIJy2wuQQ8f7kQifBkn
         d1Vw==
X-Gm-Message-State: ACgBeo04m7z9XEqRT/rxsRYkJ89WdF0StHuNAFYVLgBup2GQn3t/u0TM
	CI212oQdAgv4/kk/Wl410O7vVA==
X-Google-Smtp-Source: AA6agR5Q159xd+gFs+0BVDm32Om9PRUe5TZztAdf1O/kGHVDyCGjj/G8h8MC6UNnHeh2A8E+NOAUzQ==
X-Received: by 2002:a05:6402:1d55:b0:440:7104:240c with SMTP id dz21-20020a0564021d5500b004407104240cmr6611287edb.207.1660925528722;
        Fri, 19 Aug 2022 09:12:08 -0700 (PDT)
Received: from ?IPV6:2a0c:9a40:8070:0:ffff:ffff:ffff:ffed? ([2a0c:9a40:8070:0:ffff:ffff:ffff:ffed])
        by smtp.gmail.com with ESMTPSA id ky18-20020a170907779200b0072ab06bf296sm2492530ejc.23.2022.08.19.09.12.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 09:12:08 -0700 (PDT)
Message-ID: <ca25939e-0cef-ed18-5797-4585662c89fd@sigma-star.at>
Date: Fri, 19 Aug 2022 18:12:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [mtd-utils][PATCH] tests: Remove unused linux/fs.h header from
 includes
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org
References: <20220807032139.2218208-1-raj.khem@gmail.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20220807032139.2218208-1-raj.khem@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_091213_618924_891CDEF0 
X-CRM114-Status: UNSURE (   4.62  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Applied to mtd-utils.git master.

Thanks,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
