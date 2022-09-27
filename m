Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F6FC07E9D
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Sep 2022 06:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kibbSIsSgPObItdlpy8jqXmZtVVFwm7rw1BTDuSRFVI=; b=p0+gZ/an4e/mj1
	E2LRTYzDfqsOgFTx1pMBOiEEl3IxgHskxADoocf0oq8s7ThnkRBAbm48a16w5RAwlARG1N5YhuaE+
	hXpX7lgsJCRPrdwO8H1AE8/NYayEalDNiLBjztbgvE0edzd4e6Fgv0xeHVUcf6gTjmOffV8pDfeHr
	R4cTPGyKZWOF51JnT+DEDwK1x//nHMv7m0kduOsizbHWnKZNAR3KLlHL9XAUqj5NSSeaqBZZkgqmZ
	sPObW4LCMWMkboJGS+ur5dh2t8/5BpoGWDjy7REDrZW1ehoi9AXuE/n6m7kS1RUH/E9p3UcetqR9K
	1TLkfRXW0kt7cgS/FYrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od4JF-008cxx-Uf; Tue, 27 Sep 2022 06:43:14 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od4JA-008cx7-BS
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2022 06:43:12 +0000
Received: by mail-wr1-x434.google.com with SMTP id cc5so13441803wrb.6
        for <linux-mtd@lists.infradead.org>; Mon, 26 Sep 2022 23:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=G/7y+ma8zIJmQyOgA7cwvLmzEgahjMrljSWYguaTDL0hfvL7SkLlFSGSVygGm68SR5
         qKjFk57Y5sSYQ3rdtC1RensasS4Eo4nhKVwv5pzFbaz5EBTezwINHN3cR/aDvNYWDvaK
         CLU5tU95auKE1g2sM/Ftua8F8KANu2ho51d8Ga7W3wOad17VRIBdgM7EupdNZrZlMCW0
         MJnslPIMFnM1e1EWUQqdF1vEOuCJW6+LIVP8zpkjJ0w5CqX4KCEvP1sx9tzJuCPsuTRN
         8nN083BfhaYEWQ0rDp067u7EpuOMo+X/MVYM07C2qK3CWZUDPQ6ZO0m9VIx3HkONsuH7
         qcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=WP1QE4GTnic3dFRaouIX/d84uKGdWZY29mTP7GnyGakyBs7IT5iRKBX6s97KbgVP19
         jKHhBiT1NuV901u1eo9yGGnTHwDbtTtgy4B2r+u0pHsjA4LpZ0NG4QoV2q+OE+/X9pDO
         sLyWaKzRYrV1XNnNA/P05m52MXNl3hGrJSRMTnJQRojf81pBQ/JtJtufFOAu0ezpBfN1
         mRg+/MFLNUFppF5LAEns+iBlWee94hROLpyDzNpg9XlX0FEnepxyC3G2ArLmHlcjj5eB
         6A4WRiV7iDFQvoXw1gPE66mCvvKb9sagSgCgNFNLdwL9KD5c94/PyvFnBkUOzLrlZ0nj
         N05w==
X-Gm-Message-State: ACrzQf1QffhGKXiod8yY0gNPrVwIEdN9+60IJaG3fHgvk4irwWOPVlvM
	z0p59XdM6qbrCWzy9og5iwNKUV0ClnC13Q==
X-Google-Smtp-Source: AMsMyM7h+Qgac7Q+TYiwORcbiCAIKutKAiYiQ3Rv5PE/11Y51okCRL1uUNRIMmwMYvSdNuvDRFzFtg==
X-Received: by 2002:a05:6000:1788:b0:22b:315b:450f with SMTP id e8-20020a056000178800b0022b315b450fmr16722387wrg.615.1664260986607;
        Mon, 26 Sep 2022 23:43:06 -0700 (PDT)
Received: from [192.168.178.86] (clnet-p04-043.ikbnet.co.at. [83.175.81.43])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b003b492b30822sm835615wmr.2.2022.09.26.23.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 23:43:06 -0700 (PDT)
Message-ID: <ec91261d-635b-6ce3-8493-71b5c7e0e808@sigma-star.at>
Date: Tue, 27 Sep 2022 08:43:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH mtd-utils] libmtd: do not ignore non-zero eraseblock size
 when MTD_NO_ERASE is set
Content-Language: en-US
To: Enrico Jorns <ejo@pengutronix.de>, linux-mtd@lists.infradead.org
Cc: jlu@pengutronix.de
References: <20220819123213.211840-1-ejo@pengutronix.de>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20220819123213.211840-1-ejo@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_234311_096149_52A1CF7B 
X-CRM114-Status: UNSURE (   5.69  )
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
