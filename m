Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA183C43217
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Nov 2022 19:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kibbSIsSgPObItdlpy8jqXmZtVVFwm7rw1BTDuSRFVI=; b=o81GvYDL5fyUX3POKkVwIPqHe0
	K5KiTXpWDY05yOr4GhWCRPGFtpGhNTvH9Ha/3yGuaEOLTPE73joaPDu+TJBUh3ZVDzt4L3p81kUL9
	MFnASO4zink3R1OLNhhKZtQrVAmacqFya70nm4Woa86vTIFe9Hl6wnNaw11bUHsWG3A5ku7GXXlAC
	i/zOTXchOIW+U7xwuZj5ozbNwIdjB7ZjesIQkQE6YJwK3r88xRXFNKevujI191Byz5r1GSGQCU9z0
	3piPuNTn2jlL7bAi276lU9391pUeq3Je7hDvwq6mp4uHF9+jpXMTSLAEVetFYUpO+XLDzw9TCGCT3
	O3s8YoHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osqvV-00GeRr-QK; Wed, 09 Nov 2022 19:39:57 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osqvS-00Ge3n-59
	for linux-mtd@lists.infradead.org; Wed, 09 Nov 2022 19:39:55 +0000
Received: by mail-ej1-x62d.google.com with SMTP id q9so49823640ejd.0
        for <linux-mtd@lists.infradead.org>; Wed, 09 Nov 2022 11:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=Un4wVtLo/clEbN/2KV+opsBPJ/zd9/oLWGFyUJLDDQ1DED/5b6JjFugXeECN8PF6cn
         QrB4HRrYE/2WKCcu8EhwAB6r2ckbsqMIwCzHfG137C3DLbpnGUh5+e9KzGiaRz4F2aGg
         vkWNux5/ekGqEq0WmNHsa61WKyZ7S6OsmWOvizuITngXO1xDo43H8aU/96lQLjHrS+TH
         Y2yJskfyCsAn39/hWtri6Xk2JwNL/yobJ+GdNTQHJkq7kAbfafjVaUSnwpTGsouagBpE
         SS0qKK6oQV3r59DYtqFo6weMlYBIjOy/K3K9Bciallq6Tem29B8M/Jrn+PAXriGkOtXa
         0bSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=KeYYakczp6hLmftuoyZixnthhE79K/ZzNQo/Tj0IaMYdFBiVbIrgY3jvCYXhrH+zqr
         ii/AEUwS/6yvBP8xCvSao7giMarA5eXNE2qPEvj5nq1jJGkQjHgzv9CsEOLql8uXZJoy
         RzqZ7gFcO0bZrQLrRDR7+zdo6BOqXB0wSRXK6YOVqTWQidDByLHE6BU3LoPihwzPy4u5
         Zfaa0gGVn78oZu0KZ9vw5WnbdUQ3hzmePnxM0Qjm3HKBYuwEytcLKHStokCJoiIJNBJh
         fX7m5PobslYvz/NUMpMGEx+19GmJovkkNb9ZTay+zBokaGrTdq5q0WuICf0KiyZSzP2w
         /ejw==
X-Gm-Message-State: ACrzQf17nqjR/opkSpnGQ39a3g/2XIimPeOOxbX1QRhr+a05nyjRB5IB
	ijAbD/ppYIdBYZIgCONZYvJD0g==
X-Google-Smtp-Source: AMsMyM6YEx8/ps0cl6IT/fxZC9CjL8vBEL0Z7qv8TAZMb3qOwJYfi/UDF2LSf1fIworqBKdEoiC9Yg==
X-Received: by 2002:a17:907:2bc4:b0:7ae:2d6f:5a48 with SMTP id gv4-20020a1709072bc400b007ae2d6f5a48mr28085859ejc.478.1668022785946;
        Wed, 09 Nov 2022 11:39:45 -0800 (PST)
Received: from ?IPV6:2a0c:9a40:8070:0:ffff:ffff:ffff:ffed? ([2a0c:9a40:8070:0:ffff:ffff:ffff:ffed])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906211200b00781ea761407sm6184298ejt.161.2022.11.09.11.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 11:39:43 -0800 (PST)
Message-ID: <563c70a2-2f89-f45a-ef27-7d7adf4d6f55@sigma-star.at>
Date: Wed, 9 Nov 2022 20:39:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH mtd-utils 0/7] misc-utils: flashcp: Bugfixes to
 --partition
To: Brandon Maier <brandon.maier@collins.com>,
 MTD Mailing List <linux-mtd@lists.infradead.org>
References: <20221102224757.58012-1-brandon.maier@collins.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20221102224757.58012-1-brandon.maier@collins.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_113954_560149_7F3FE5B5 
X-CRM114-Status: UNSURE (   5.66  )
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
