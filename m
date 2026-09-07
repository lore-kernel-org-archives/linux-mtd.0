Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B3FC79F89
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2026 05:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kibbSIsSgPObItdlpy8jqXmZtVVFwm7rw1BTDuSRFVI=; b=sd586PDSg+rZMe
	IswOA6+gfqGL3cQOBNlpDVgvrzuN4Zkl8znX1Q366D6/WdZW4rXHSj8pZlBjqtsIkfNjKFlJ2PHPX
	M4cMBaKR9BbhrD/ACogOVFXjqy3rJEDIKTts/TGqvkQu781d/w7nno86fAHI+kmBbwfCARz7povWA
	7onIT9oIcrGsxxIX2uax3HqBlxjY2nxdlGMHOL91EqcFvD+k7IfIGW3u0cxiWyTaR5562JezmZtn+
	Ygdx86n3j5wBSP18MaQIj3zvRrJvVOBtJKgVMSM8dE7z8zH2iF4Oh/0teJ7tyXsCbydFsXeITOrfW
	Q6deFwWK/VIRJTSHKX9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RzZ-00000005wIw-3Dr1;
	Mon, 07 Sep 2026 05:34:05 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3RzW-00000005wI8-36PY
	for linux-mtd@lists.infradead.org;
	Mon, 07 Sep 2026 05:34:03 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso25740165e9.1
        for <linux-mtd@lists.infradead.org>; Sun, 06 Sep 2026 22:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1788759241; x=1789364041; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=SRJXuEwJNbXHQZcKWo2GzlkKgpY/DaGgQaLiaDduYrbZSRrcL9BhUw3IPP1zlv6z4c
         4cyPmR5OEp+mK56QBBZnTYJLYvJYDy/+sB1Y1IXjEBGnbjqecqagKMwux0KzzAJDBamk
         fOtxUtLldG45BlIx/KAePx6w9R192scPfV4MQC1w0EBadryptNuWHbvXTxY/L1ksunKF
         bEO+FELxPPzGOp9kdDkv637gcAkFQYsZSz6z/xdYaVxehbVcSqAp+pZkVIQqdB69dCAx
         7uAzH0oWuvmJVnDmmHv9OBnJCKvSFqpGyMFBm3O4pPhEE3+HAyvBG9FND5qn3OrPn7k9
         O2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788759241; x=1789364041;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=LkMHUa0W8OfJYcGvr5umXR+tmryQ/c18cMSrSnwFPGsokyZXQRD86Dwm5O80oW3S2j
         d5vUua+xGoyBgIKIhHQlj8LmIvfO7/bdvzV6TgQ9edan/GIsS1fX94yWpwzgUsckGaHA
         ryX/BSaUUKsXYolb59h6vQnAitsTn2/f+Tmx0r2PzTkALNHn6NLF/bARnLPQkwBim0w3
         gs8cQUGY7Eff9pAN7dI/8QaTpnzzk0Apz6GwEW3mS7GUtuS3FZjRebR5JgoOJh6egRVH
         cZYF19mIJ/iH9w0XL7rExGCnKbIyLxTWCKsiF3UdyEaXU7mFVVD9c1LkFUvjkxIXyNWr
         O3cw==
X-Forwarded-Encrypted: i=1; AKwUvBy0EvKHuYc0Mw0HJJfnBpBvi+REDHNhKx9yEoc7rStiN84r3CoBN/RljyZ9U0c8C6HvTzNEIhZOE1o=@lists.infradead.org
X-Gm-Message-State: AFuF++k7EB/25uHNkYmztFFUXQsZJ3Od5deNASpdqmTT3gNffHe49m0R
	K1F0p92tUEq2EsAGZ6RRD6Q0Ci2NLg9bQHp0hAMimURxUS5R74IDA4GxfEv1DoQHNTE=
X-Gm-Gg: AYBFou2XvXjw9JewW+G3RKOCFWQ6k4LaVioI5Ziqmg7SDIcaR/ucOryD9xJacyA/z4k
	hSqLulpYqSKOxsWQaaWmhHVe7Vpqg7egkH9NkhZnaCO32iWOi73htzI7L8q6oCaKysza30mgeTE
	Rv3KEK6VxVpKIIBlp1OZ3xC0Z3nZFAIcNAs2YJfYkO9DmjLxADEDFGR3T0JLu4yeR7QtZHNPhpp
	Yf1QKu02xh5VmfcD2Rh9TNRVoK+FdADON2Lw4iKc0vbOIdIVquQZKRc8pQjsB9HbMY5UD8elx3z
	P4uWKmPTaQIEAZDINanP90oBOEqCGnfMBN+rIqMQ2U7K7b1L8NDuho/bSYbiXzD6ji/xdtO7CSX
	Fl8ab7zU62FY3bJ9KQ/R2mSdHSOgoF3ZfMO3KSGeJ9aPZRRmVooqptdJ40zgk+JIWND7RVcNu9a
	r73r2RCRvAUeDGxPh8iE8TK0SLmeeNNHBMrCO/PB+hSoXnt5/+zeWBm2PuaPwfJz5EgFtyl8Zkn
	wuntVMTEQ==
X-Received: by 2002:a05:600c:4e90:b0:49c:f3dd:e166 with SMTP id 5b1f17b1804b1-49cf826ca60mr197930645e9.13.1788759241174;
        Sun, 06 Sep 2026 22:34:01 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75cd8d0sm262611655e9.2.2026.09.06.22.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 22:34:00 -0700 (PDT)
Message-ID: <819875df-3449-4de3-bbea-46ca5d4b6fce@sigma-star.at>
Date: Mon, 7 Sep 2026 07:34:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mtd-utils] ubi-utils: add wear-leveling threshold
 parameter to ubiattach
To: Ran Hongyun <ranhongyun1@huawei.com>, linux-mtd@lists.infradead.org
Cc: chengzhihao1@huawei.com, yangerkun@huawei.com, yi.zhang@huawei.com
References: <20260723023706.3568783-1-ranhongyun1@huawei.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20260723023706.3568783-1-ranhongyun1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_223402_774605_9D046460 
X-CRM114-Status: UNSURE (   3.90  )
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
