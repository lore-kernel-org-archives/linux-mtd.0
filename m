Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74DEC32773
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Aug 2022 12:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jkRvHqAHEbIBULK09osS3X+kaRTd3l03BsuE6P0BedU=; b=g2ZFzd8IuEyx37
	5Mp/JG5VRWIrpquwANkQn72f7PTqwA4Tgn7+btZI5csug/utlAwNhexmmOcm1fb+8mlChju4m/yxG
	1x69wzlYJpzHrlfwT8QuIqkBp/zqOJciIwgGlyhn16iWP2szWdJUNzbAV6eBNjGial4Puwj2NSUwg
	8+IAK3SO/I46/oztud9GKo1450UFAbESxcTjhoxwdjo9CsFbtsDxhoQjc4Cvb7YjXJbXVtyVBQvp4
	S/wiK/aZBT8nYrKih/aE3bBh5HgjdDneWHG265fA9jAdJgInMW/LvpKKIWdFKoj3ssBxT0Wx1Lv/t
	RcR1J2buynAO9QzHxWxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1B1-007wA8-UB; Fri, 19 Aug 2022 12:32:39 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1Az-007w4J-Fp
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2022 12:32:38 +0000
Received: by mail-oi1-x233.google.com with SMTP id s199so4615659oie.3
        for <linux-mtd@lists.infradead.org>; Fri, 19 Aug 2022 05:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=miHosOGvMyDWceTJwnfCfeYwLeOJw/Q3DaavWcy4qPA=;
        b=grwKnEmWVxw2gxBsz//wD/TWNqWsv1I1KXDpVd3+3Aks2e/GKb1jFXXn44LJgTZ/Z4
         1yYDBbbHkBQc9T7ZFj8A3dV8wQxyMRA6/S4asVaL2GIxfUD93FvYZ7YFWwmno32T/hRr
         qS0jrW15RFSeUWz+TTnw6L1jzNyS7dlZ41+qQ5BkSm6QDkLRcT1IbixJPp+ZMSfWAZQa
         z0ySlso5ZeKun6PZurzpqWxwnauKSOLlTFcfGeEuR15iOr6hf4ehGChbA8iCFgqsLjiu
         oc3Kykz8Btar3mqpXhsuEUFHNVmtrAsJUmS6WIUICTImC7M8YHxpCYHpbH1EOKFuNGOs
         EuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=miHosOGvMyDWceTJwnfCfeYwLeOJw/Q3DaavWcy4qPA=;
        b=O0YHxnqsG25Eu2qoO2N0rHRlyqUX950plOOkV7ZoHGsA68nwDck7JbuFyMseyyXDqK
         b5dkzGa67bXbhKwERgx0q2OkvyID2jmbHQws0MwN9AN5OqDiBfKnxg7j9hoJRm48Cp87
         o9is8JnlotRUnMGyqS71o/MkDYR0uvA+Jj+BloR7tqoWsEURrvwBwSxzruexfKfTrI7W
         yunsSh5eX/oNLzv7eQTfU1shH8xGCD7X0QDEkOoIJvQymR8gOIVSoWoQwVRXDicKCVU2
         wFfiR8Ka96IQw5NNEiA2x4muojFNMgXhMOg8t93Cg730NbRJquuZJF1n9OnDJDtvswCV
         n9Nw==
X-Gm-Message-State: ACgBeo0sPYLUjKAIWDeGuuU8j+1ZnSpQWRM6X+eDj/JuQW83hwTtbi3Q
	71FKUvFHlsSVKULFaOanoDuhhDDNpxdk0jUYtOETCS5VTXj0Gg==
X-Google-Smtp-Source: AA6agR5wb+jBpQ3eYJkvZstWrBSONkjMuQ4ReuWz3TSFdo7YP0SDhUrTYDfklRTx4byhGs4s6IT3OQg49bkdTNaoMZg=
X-Received: by 2002:a05:6808:2026:b0:343:616f:94ba with SMTP id
 q38-20020a056808202600b00343616f94bamr5488787oiw.212.1660912354055; Fri, 19
 Aug 2022 05:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220818093548.1932952-1-michael@walle.cc>
In-Reply-To: <20220818093548.1932952-1-michael@walle.cc>
From: Sergei Antonov <saproj@gmail.com>
Date: Fri, 19 Aug 2022 15:32:22 +0300
Message-ID: <CABikg9y3YP=XU4h09PsoWpTSvMnrOrKO7j0DUKH+3Zdg+jz=-g@mail.gmail.com>
Subject: Re: [PATCH] mtd-utils: flash_otp_dump make offset optional
To: Michael Walle <michael@walle.cc>
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_053237_561790_3C096A71 
X-CRM114-Status: UNSURE (   8.00  )
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

On Thu, 18 Aug 2022 at 12:36, Michael Walle <michael@walle.cc> wrote:
>
> Commit 0a5e2fa5c1e4 ("mtd-utils: add optional offset parameter to
> flash_otp_dump") introduced an offset parameter. This should have
> been optional, but there was a typo. Fix it.
>
> Reported-by: Sergei Antonov <saproj@gmail.com>
> Fixes: 0a5e2fa5c1e4 ("mtd-utils: add optional offset parameter to flash_otp_dump")
> Signed-off-by: Michael Walle <michael@walle.cc>

Reviewed-by: Sergei Antonov <saproj@gmail.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
