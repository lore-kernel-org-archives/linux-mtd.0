Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16177E9381C
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Apr 2026 05:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4yLKP8nV1MWHh/4KtPOg+w1mcMDFKZJ3Z2VBVAwBbw=; b=QAh5P1ugqGfCQK
	rFiLSw5f3YWaRS1+kG0vNUH8SdCZsoPjG3v4tNZeP8YBpl+XK6sBFbkHk62lg/aAv4I5qGK4wNyQr
	WeLXx08TYeNzb9sRxYJ5OTAWgBIlZhn5TsaQw7vOKkbkUv8MbztjFehfXy1nY7JpM5uBOnzz2BgI8
	20geKEZqOVsZnMNio4eB7YAzbYIJOXcIjfiuxQI4w3cJVH+i0yTRts50RjIs2+Yza+DL6i/yhPeU1
	kN7Hwx+YSkml1/6Jgu0sHPytc/RyaFXSegvxuVsVSWxm3ngsHNq1kg33ogWbRRB7se57OX5aW5sAA
	nuSp0pw/yW9m0xc8QOZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC9vy-0000000F1KA-1da0;
	Mon, 13 Apr 2026 05:34:06 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC9vv-0000000F1J8-2L45
	for linux-mtd@lists.infradead.org;
	Mon, 13 Apr 2026 05:34:05 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-488c21c636dso22835055e9.2
        for <linux-mtd@lists.infradead.org>; Sun, 12 Apr 2026 22:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1776058441; x=1776663241; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=th14Ky8fVhNN0lt72SY7XhvaQN6UgsQJF4ar2RqU3cau/r2QUBJtCYBFmulSy4LZ+7
         VAWehTKe9zg8xU1VoueJGy3CpKmESZnXqOpD8RA2tcznZwQDvROahqo+f1OwMowbjv+6
         w65ipyGLCrM0llm1nZ0jRImq8BnT4VGIi0bPtrZRUhB1l+879UJzCzwAoz/71ZKky30q
         MbkOSsQHpfaoXiTqE0QVbEc4Je1rO9LGWE5SLI/zJEpm5OgycJX+DvHSFSflNmVe4Mf3
         0hsRd55N5KaPq6p04geCTnNZSW+7Jfq2YXdaEbBlalG9TzoOfPJ/W3gdL8IXjf1NBlwi
         iWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776058441; x=1776663241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=ix3Am7piz0HJf5ktdZY7Yo8zxnju15QhKoQXwEPFnJe72seQyy2zcSM7hr2GgsAJGy
         ofY4qZj7fJem4VrMbnVEq3ydXQx8RiG9JFKbyaVDq/xnN1HCIcf5Iw0sCK12K39UpYyI
         NT4zBj45RMGF6z1rZruJCtDRdaqpLfdzxIm2RhKUZ6nf33ArjJvH/2YPb7dZ/8lDc4yk
         50ScySXr4jMrM5gkLomPZTehSLifmSpylNPtVhsovAoFmFM6v4c+g8wThE01ulfE5kiR
         kwiXXqvEacSuMovwzThTTQuVstp8xIYYanq/yw/7k1Rl1h6Cv5m+75wpZLDI7e8Fng5X
         Fmbw==
X-Gm-Message-State: AOJu0YzQpQd6lkQliW/p0N8O8FLw/MkWaJI3l413Wr5dFnPh1/gykv6y
	AWwse7zZRJjMkcVUmXBNttCgJd15iw3JM9hl9l3xWxxUl5BoOY9ffBzfVywWJRakYAY=
X-Gm-Gg: AeBDieu5jZdqzjEMKapBhMdVVO0m/os7RRAMwceZq5ThoK7urOTkqkAeGhUNZSmOoRh
	shxZDrU51DUbgbFOypd6PkFmM3FjOPx8UrKnz05ra17M4xhrDUilJQlfFQbayZyAttzlOhGmwdj
	1eW+NTEs9WyhGS53MxFHkNpuoMtQ8dDYFN7/wXIfQSCcEb/8Do4o7Fny0CHtGes85WUt+R8h6vj
	gehIfq0B3Y1VAI7H0R560MpmDHwtNgBfkq3nQlf430Bd1ZyaYdhXRE71u3ucG1o67OE2FfylYE4
	M0s2tZxd1AbJSuR6eqnFP/ug6yB2FDw4OJMcm46M5Hcd7cn2w7LAspxXZGVKPLOIBf7k0ivg0Y5
	TxB1a5EtSWY9zNK4/RwIqXkkQG7D0/jzpvg+7/3NZ9YGIYIxBc1HOH1hfb0bgiC9rzrVCcvFKJZ
	oPwkWITZzKttRCmccYmkNvaUPgXLAeLXH15dcY/f0CQTovXQ==
X-Received: by 2002:a05:600c:a411:b0:488:ac01:72de with SMTP id 5b1f17b1804b1-488d67ec72cmr127133365e9.5.1776058440878;
        Sun, 12 Apr 2026 22:34:00 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d532ef00sm300113665e9.5.2026.04.12.22.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 22:34:00 -0700 (PDT)
Message-ID: <0ea25558-f92a-4a46-8028-a2014c1361c2@sigma-star.at>
Date: Mon, 13 Apr 2026 07:33:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ubiattach: fix wording in usage example
To: Zhihao Cheng <chengzhihao1@huawei.com>,
 Mohammad Rahimi <rahimi.mhmmd@gmail.com>
Cc: linux-mtd@lists.infradead.org
References: <20260212013542.22699-1-rahimi.mhmmd@gmail.com>
 <41f7b452-5d9d-5bca-62db-8b997ce3ed1f@huawei.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <41f7b452-5d9d-5bca-62db-8b997ce3ed1f@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_223403_896240_A7D28A28 
X-CRM114-Status: UNSURE (   3.43  )
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
