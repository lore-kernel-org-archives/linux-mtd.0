Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446C9C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jun 2022 06:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TNALOUlnGYst4WVQ52Fcz6WQEN1wyyLwGKu8tgfMya4=; b=O7zDy9borhu8xv
	y9wtxfK/Umr6fDhJLM6COp+2WWN1bciY8Y10jnIr2ZaKAtQfXlFyC5FW3THvNCGooyLsZbpDUOKQD
	wV2gIkgLFHPJUJG8jLNY0eJ5F/UVQBViYwu6R8tUL7qKfo4w2W22YKoBOvWP6cxD349mbxLCAm3U2
	CZXIIBLidW8j5/gScyY+ulspeT1Z6qLfFMW390g/9vTDwsroLRYNkeDVVodZwe3lhO4oOhoHB6s8w
	G/jNLyGxiNB0gf448t52zKmQtnnOfrKWXzetuXmRRJ6VSNyeplg4cziEkoEI3anRkcagMThhXKyBS
	F8FeeRl+mnVj6z6a59BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5hq5-00Fww2-Ou; Mon, 27 Jun 2022 06:03:14 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5hq0-00Fwse-9f
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2022 06:03:10 +0000
Received: by mail-ed1-x52d.google.com with SMTP id cf14so11410823edb.8
        for <linux-mtd@lists.infradead.org>; Sun, 26 Jun 2022 23:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2JA6OF5giONCzBIvAT6R4r7IVTuA+8tJsxC7EPk7bcA=;
        b=fhfgG34MO+IT6NWt8rwf3YE41k8vuO5mOskGjJ6dAL7wQ4FbbDzTOP8uucNbhn7M2H
         ont0e25yRULr51tOCvV8JWebfaPM9hXuTwmKtSnq4aWv/5f6iwiGX+y5YK1u+mX9OCKX
         9al9eIu7vmVMKYwXaHTc1+IxC4RM1DxBZsbqunBOdqNnpYXQHYU+3kLEg3Ir3mrOoBg7
         +iLp3Vxj1xodQcJKk6XJHgT147kTOSEV2AH/12Oj4BHn607qv9F8H97vtrbu3QiXA84V
         cBdJYfUx/zE9RwdwCzbg/by7eaSrSLLcwJAxBEk13gaMaoblSm7bKwJHvuqCNcYNwC1u
         eXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2JA6OF5giONCzBIvAT6R4r7IVTuA+8tJsxC7EPk7bcA=;
        b=SHCuwmMdWbcyjNxCxYz/sqJgFBKfnAc55jZCNYVMxZDqr6nIuwnhxLBanXhje2pNki
         6aAsTbN7FtyK4zFWe5tFlOun/HAvU8cJaJyAQD2ZlvgemeiCHvJ4Vq54RG4d7vyGAD+q
         HTfBb03SE0+msw5Dkht0S4/OBZnmjy5NENL9RFP5CxYiHzutURdAXT7JZZ26VDNYWte3
         kFYl19FqNO0QoBoyUZZHphc/tuPHNAw0nh1U2/fuqnIpObAtLnjPk7qx5TaGh/wI10cF
         IUaDo4ha3Tn8vFUIu0SkkFEJIWEz89PO6Nr4AZnmlR2uoLieFJA8yZ+f6ZgBnwefq/df
         53Qw==
X-Gm-Message-State: AJIora8wAKW/GJMw8KAj7MvEeco26PuPulzmgJQpgd0FiSgEti/FAPzD
	774je+XwN2qX+DE7v2fbrZM6mw==
X-Google-Smtp-Source: AGRyM1vzg4Dqa7ba+5JyzVEwAMkquSiLnQj553D+y4oTUcfF+355EaqfbduIYfzvVP8oBM47nGAXPg==
X-Received: by 2002:a05:6402:329a:b0:435:8935:e95d with SMTP id f26-20020a056402329a00b004358935e95dmr14596774eda.257.1656309784872;
        Sun, 26 Jun 2022 23:03:04 -0700 (PDT)
Received: from [192.168.178.86] (clnet-p04-043.ikbnet.co.at. [83.175.81.43])
        by smtp.gmail.com with ESMTPSA id s7-20020a1709066c8700b0070c4abe4706sm4612450ejr.158.2022.06.26.23.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 23:03:04 -0700 (PDT)
Message-ID: <96171ceb-4125-87b5-f029-9beaaa1d1057@sigma-star.at>
Date: Mon, 27 Jun 2022 08:03:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH mtd-utils] nandflipbits: fix corrupted oob
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20220616073943.669332-1-christophe.kerello@foss.st.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20220616073943.669332-1-christophe.kerello@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_230308_732363_0D5DBED2 
X-CRM114-Status: UNSURE (   4.74  )
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

Applied to mtd-utils.git master

Thanks,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
