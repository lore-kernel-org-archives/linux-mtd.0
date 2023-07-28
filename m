Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7999BC001E0
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 02:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RbEI8cohgqZZd8srPBXH86H439EDGx9hvWioVcCuiuY=; b=ZweqtHXoxVGRC3
	uFWXZ4VwYdUsLFHTxsWxppdJnDumn5CKNX4UZ/g07kuNCYiz/IjInSFrBxXyT619mcdbMvShxPp+E
	G9U3MEb8bdIevkLP+1YbwzGpqtYFxglK0/3p2VqmIdwI7EIzyy78OUXF/KvtYpYxHHoFwIF/1GFUV
	BOx8G31a5zvtmmaZlP4RnbETLO5jk2qtRd+I3xKya3engN8MHWtGIGxELvPABoYjh/CDcvRO+lhUm
	3/C57//uVVy/IdEEf3atbNUNjEAx4MG37iFrqEpJR+XraTO6aI/gaFhDAXJO7o6y07qfY4eEMNqWj
	ptLX6Qemgflajh6qHDKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPD3M-001Gnk-0c;
	Fri, 28 Jul 2023 02:18:04 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPD3I-001Gle-2c
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jul 2023 02:18:02 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fbfcc6daa9so17064335e9.3
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 19:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690510677; x=1691115477;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JnW8o15THYx3booJmREdJc/nm3RKYULp6RY5K/jCnu0=;
        b=VlYum72Bf66btrKEo1x2tyb5A1Ek8DmZEbty+RbmZRI6Son/x/XnfrB7qIBcQmjc3F
         +/pk5oRVBkV7i220nVy+uObZkXe0OVyJ7+PMP6bu/GM/I1l9fHu2JiILCMAloI8AGmWZ
         I6UCt1IwLk96q/UUNaDVd1ZNNq/LXE1LM+8KslNTMfgY0OThfVhlY70iO9TRUmmXz1RI
         ZPpGZwxKagDjpMvDeCY2a8vBTMY7bS1k4COzupZhtg4m0YtMJqktdWDmlmX8bhSzhtfW
         J5ZU8q4NGRT938TSh4wDVa2mG3CID8bD+bgFvnpYOM8XicWrb45buUmo9UUQ7r0YczEO
         accw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690510677; x=1691115477;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JnW8o15THYx3booJmREdJc/nm3RKYULp6RY5K/jCnu0=;
        b=PizDISh5gcOTUSZKmJNvkXLAXw8V+W6lFFOWRpsd5vXKQ+u6n9NimvebnobGLvo4R4
         qpzbccruqjTUncFjBMvwN9sgbYBHlBRUoe0QHz3GdjLWJQNL7hq0kFGtmjnBdaXac56y
         P5JCJmwjG12TbXBsK6sZjJY+1dhWhRqLInVV1P2Gk2oeTqQys6kvY44FIsXry2ELbSd6
         sFaLggKIKriaVaHyUN3vuvxN3J6FXitibCvCSFbiCFonV2xKwM/vRzmn6vde2qL3wiyp
         sVPgitbZIjK47zpNLXzQ/njEsYzhmpyM3Q/0YyuzAuBHWb+a07gOpaj/wEPefidl0Dxy
         WQdQ==
X-Gm-Message-State: ABy/qLZIYACSdEo8mepIMAMR/ejTq4IHEYyy3fvFP9z8YPj54BCeEm7M
	veDxHszm3ZZDaNKEhyibLge+NlgQpMZOY2Zuw3M=
X-Google-Smtp-Source: APBJJlHdrVEA5IW7coApMt0TFJiwXdSU7TtfpTTnMiQLrl9W+vnY3WPX6laLsgTI+3ic+r6eT6nmRA==
X-Received: by 2002:a7b:cd1a:0:b0:3fc:b86:d3fa with SMTP id f26-20020a7bcd1a000000b003fc0b86d3famr530287wmj.1.1690510677281;
        Thu, 27 Jul 2023 19:17:57 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id m25-20020a7bce19000000b003fbe36a4ce6sm5980343wmc.10.2023.07.27.19.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 19:17:56 -0700 (PDT)
Message-ID: <6a53da3f-0a64-5436-3243-cf885f594a8f@linaro.org>
Date: Fri, 28 Jul 2023 03:17:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/8] mtd: rawnand: qcom: Fix alignment with open
 parenthesis
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Md Sadre Alam <quic_mdalam@quicinc.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230716144612.32132-1-miquel.raynal@bootlin.com>
 <20230716144612.32132-4-miquel.raynal@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230716144612.32132-4-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_191800_925685_7A72E4F1 
X-CRM114-Status: UNSURE (   7.44  )
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



On 7/16/23 15:46, Miquel Raynal wrote:
> Fix the following checkpatch warning:
>     	"CHECK: Alignment should match open parenthesis"
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
