Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C14EEC43334
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jul 2022 10:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3NPWS/PU15zOmKwnf1BSn+olB25B40QKFaoFV/wZ+Lk=; b=O+yb3RmD5R6wF/
	urmTqbHj9ttnFwg/v3kWQ/wX4YWG85B+f/OPnuZEiRKNb4eXlb3oIVATGXQUUyaRNJfwIsVOaO6bB
	YnjUYTdzDALMq+XfrN46gsQv8MNW/ebWPHIdo4nhg6FESa/edQKIZ2KSF1pRB1n/C9wx+Y+IZpJ0G
	e1ZC6/J6s5i/aYYNLcn0Z4VjyyzNuvfXkaQx09NCqVbkO2hEZR/bXs8orKTGTDYBz0FCuMePIuw7E
	CUrhQ0QI+JVbirVz2SOtx6PudP4d48PKW4z65lH9u+uYRsqkfU5iP9MoCfEaUlsL8JkvATVha1dEs
	lnsakgpI4rAgKl8L1i1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGHR7-00CCPT-Hy; Tue, 26 Jul 2022 10:05:09 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGHQu-00CCAC-IX
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2022 10:04:57 +0000
Received: by mail-pj1-x1031.google.com with SMTP id e1so2420127pjl.1
        for <linux-mtd@lists.infradead.org>; Tue, 26 Jul 2022 03:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=MARNitJXpUp5V5BqpBLjV9YJ/Pj5d0FSUQXbA2ZWy9s=;
        b=Bjms2BIL/r5q0wlImvQaJVgGSYwlBJEzjGedddfY7ujHmeDYCbYQH8q+Bd8CjPTThq
         Xhwh1Dwh+q8pEHYJ8a5tYFNbtbBaReuTMtx4/dAkjtHluHvcRlvpxXln00zfRmJG/ovw
         Kn3zZqBGi2LNyOuiNZ22qTHu6PFrpAz0+Vu/l0kL7ysE0z7tzvs/LKNjUlrHkM0wMRus
         VrJvi8OfOkYPdcmbg1qVuVNFcsfjK8efxKFOOfjBqQ7B0ySJPndjDhUuIlvujYA8ApWO
         tOAZjtio1vEWAzqVpEW35VDaZ0pQeD8IAVW5cTRekbU6/aS9VchnK0LvitGvxzhfDqxL
         xHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MARNitJXpUp5V5BqpBLjV9YJ/Pj5d0FSUQXbA2ZWy9s=;
        b=k5FWr9VO9DmFSO4Rva6XWfBGF/g0MND5HbFcGz7AmAtzE2lG/yQ7Dab53hXX3MkSiM
         T/pAJXaATdegy++JxXnwpr2g1czZeyI2k5ik7pWTg/CbIE/tnYydReo//By2m1jgjW3T
         HeUxKdbZSmhLOwFbZ7Oo9r0WnF6qhJUZ/8W8A4Fs3IdJkpf110u/hDWg0p6mhEP2D6Qg
         w+GmUgRUUq8OX5ylby4ncsMNvkWXtNOWvaqckpi0C0Z5NtjAlLCL5i3sUHjhJFtGlOWD
         1qz6qyZaGCUgXa1qGn4KGyv3x4NHUjtibXA9CmN47hG/etarfxV06oYPwSOloHwPXBGG
         /B3Q==
X-Gm-Message-State: AJIora8hmr3cp0eXqtPtHhthiWac0w7O45xuZNGdcK1MLMiRhTAW+6yf
	IoT+YAXYbdMPCP074t3BX9w=
X-Google-Smtp-Source: AGRyM1st2n7Fokw/bin1aNCoebxGddLsDbdZIiVPrvb94cWGdXRY/ZNxQtQzGIamm/LeM69ZrQtfow==
X-Received: by 2002:a17:902:db04:b0:16d:82e7:72c2 with SMTP id m4-20020a170902db0400b0016d82e772c2mr6762400plx.100.1658829894601;
        Tue, 26 Jul 2022 03:04:54 -0700 (PDT)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id x8-20020aa79408000000b00527dba9e37bsm11254510pfo.73.2022.07.26.03.04.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 03:04:54 -0700 (PDT)
Message-ID: <87d956a8-ef14-6556-1cc9-eb2be735501a@gmail.com>
Date: Tue, 26 Jul 2022 19:04:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/6] mtd: spi-nor: sysfs: hide manufacturer if it is not
 set
Content-Language: en-US
To: Michael Walle <michael@walle.cc>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20220513133520.3945820-1-michael@walle.cc>
 <20220513133520.3945820-3-michael@walle.cc>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <20220513133520.3945820-3-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_030456_661073_E8DF0CCA 
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

On 5/13/2022 10:35 PM, Michael Walle wrote:
> The manufacturer may be optional when pure SFDP flashes are supported.
> Hide the sysfs property if no manufacturer is set.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Reviewed-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Best Regards,
Takahiro


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
