Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13803C6FA86
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Sep 2022 06:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dF6D7uITXo/mIebSxbTiIA8GKsAPJPZLsVcBavFDIY=; b=ISxijpPF8qFvgU0TYX/rfUU8EV
	NK6gosh/2wQpMZsYCV+ukgz3UhLTdAzmifIKyeJqb8NL2NSC/rgdqO9M/i0ET5Wic1HE0IMp4yZ4D
	b0D9hQiO2mj9AaEWw0+icR7Iuh9omC+OWGS1deQsobGobG0krun8v6oPEwq132Jf79xZc3UPbV+s9
	raFVZJGgC3SA5ib2klSn2oxuswQzrmVM2mmnqGowayjBoIfersBY6f2zkyQ7Q/JXEVAsUygv1v7Lc
	W5aHegTeJCU5rI3BnRhJXBpQUxxTtkeB3EZ0LO9eGLfwx7KSwq1hmevsRR9Z5tDZBzwCbg7JWiSmI
	3WtqE+dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od4B7-008aaG-Ds; Tue, 27 Sep 2022 06:34:49 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od4Aw-008aXn-EJ
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2022 06:34:47 +0000
Received: by mail-wr1-x42e.google.com with SMTP id s14so13499229wro.0
        for <linux-mtd@lists.infradead.org>; Mon, 26 Sep 2022 23:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=CJur2IfjilQLONY5G5zrL5mZc6JOIFn2Q5Eu4Xl5wj8=;
        b=K8ndp5bhyMUjq8vGE9KGWqBLaz072ZiUXo9ztOPfp5JzPfCn6JVXmJHQpaf2oxgiRj
         JKEoReJT82bhQUvakpNw/OCiazKTGLIaHTCXc2k19EgfCs3DO8b6IvM6neGlBSLZlerI
         RTXOyetVXgg9WwP3OHTDW69YJJU4iP8LE5dDUfBI2OBPlhQmc1S+asQdS1WnCtu2zj4l
         0c3/6AJzdzEayjVBSsc+1GFki7n43Li0bXGhDUiAnxbSV9TYHJWZKoCkRUgildifWHEC
         gMfGevezH4yYSQVSbm2k6awu8BFD6hkizpY8NiO1Gj8zDlJAKVEDYliB0dEtihDvnwIx
         r8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=CJur2IfjilQLONY5G5zrL5mZc6JOIFn2Q5Eu4Xl5wj8=;
        b=1473pWA9u4dgKvmHrj1sRzsagy5ZXj2G28BBDvKXpNY46NFTHKl/QGMB6hlEZRkPnn
         Qt5FCW9zgMkUh7f2CtZSjNE/K3fjMMf0fuZOOdLMy8Yjk/MoFriG2HLMPk9dltZzqjTP
         nqZenn/c0vwPIjlAlLdEkk2WXbF0xqaTFtqeT+qkV0OkAI/Wbdh3ZFdBW2Gy8xSMNBQM
         rv0mJ7hrqXEh43oLsums4h4ksK+1Wfvq/ZejOYpw32KHmaVjwAq8cANxfQfCjaMRvzpp
         /5QF6vi40qPBB8iugZ6ulYczY5x4/MY/gZCdr27Cbhpkx0n9f9cgtDZVc5yeVpXJ6JCY
         36+g==
X-Gm-Message-State: ACrzQf1KxeNNftCdNZmZaAHcOHuh2+netiCGExy+Clv/W/cFJ30YOtJf
	mPbJncX0yIiSBI0k98i3C0j/Tw==
X-Google-Smtp-Source: AMsMyM7VcIWzVIN4wbnUyvg1y7j+4BqC+SHzdG5hwrdBnwmGudzJlvFFtPhV0uitChcT5oqZ5hv7tg==
X-Received: by 2002:a5d:5963:0:b0:22a:47ed:f98f with SMTP id e35-20020a5d5963000000b0022a47edf98fmr15410700wri.155.1664260474907;
        Mon, 26 Sep 2022 23:34:34 -0700 (PDT)
Received: from [192.168.178.86] (clnet-p04-043.ikbnet.co.at. [83.175.81.43])
        by smtp.gmail.com with ESMTPSA id bk8-20020a0560001d8800b0022af865810esm827339wrb.75.2022.09.26.23.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 23:34:34 -0700 (PDT)
Message-ID: <4f838d58-6ee0-5249-2589-b62a7ba17687@sigma-star.at>
Date: Tue, 27 Sep 2022 08:34:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] mtd-www: UBIFS: fix some incorrect hyperlinks
Content-Language: en-US
To: Martin Erik Werner <martinerikwerner@gmail.com>,
 linux-mtd@lists.infradead.org
References: <20220920221352.1253593-1-martinerikwerner@gmail.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20220920221352.1253593-1-martinerikwerner@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_233438_559402_C6AD16D5 
X-CRM114-Status: UNSURE (   5.53  )
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

Applied to mtd-www.git master.

Thanks,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
