Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3FCC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 18 May 2022 09:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AynNuIsfnwtcrHLsAsXlDDMvH/HUOKPEgLFAx9GX6CA=; b=c5ys8rTL3RRG7I
	KXsF1awF5lEmAcs0EHX9OirKbHgxB/P9dB2OXl1/00VnvWazCGOi9FNgO/J0frO5EgleXnRnquw9Z
	8nyMMg9LdRLLMK7Zpagr0IjyA6R+3eOWkkO+KSiDlvsow+DETfUceaIF1+Lsnu1TbkhSlDRVIAdpf
	9JYDKjK0+FIxTw2hsgxo1ZwbtdMrKHJhVCc8BcuAwReROfHftFCb50tw2oYvOdMCH5TXN5pr/CQBh
	S393oZkfRBbQfTE+lmht01CVuS09U/cqStQnMjCszjjK93X+yFfd+W9Lidr6s6sMTOp/5s5psjYQG
	ImHRuqaF3Gu9JSG66ANQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrFjZ-000lTX-4n; Wed, 18 May 2022 09:12:45 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrFjW-000lRP-H9
 for linux-mtd@lists.infradead.org; Wed, 18 May 2022 09:12:43 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 o13-20020a17090a9f8d00b001df3fc52ea7so5010736pjp.3
 for <linux-mtd@lists.infradead.org>; Wed, 18 May 2022 02:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=47vXU6jXH02oEd2J9tEVhRXBIAtgqo529/X6Ouj9Nc0=;
 b=B+J05oKuEQ6hODddZGm9w3AxKR02pxofZzcWfAucJPCDmDfLN5IR4fPY1qmeM+ccow
 I0uhULxU1bPihzh0X9CngtnUX5mtmuWpNQwAP5HytVy4ge/uq6aoTQ256ABvank9oqOd
 F6bdBKu9BCkKvaS0BaouwOLIwtCroq7vRKP1BONocpwaYBA7lxRt6uVH4Eyq8naJuueD
 LzpZzmZJLZhNyQoadRkM3U6DHSzzX5w7g03xEbbhhDYkp9yi3ASYM6l/2XXsN31oJe9Q
 /ssDcK0RKZPgkcc/1rp+IjzZjAEcJy8npseTlvvZ+fS07TeLGypNz3Bg/p38kR+DJClV
 gc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=47vXU6jXH02oEd2J9tEVhRXBIAtgqo529/X6Ouj9Nc0=;
 b=NSUazJBwIC/hVtvv2oZ+0Kf95BgaEvkaTzSDc8JwShwpPeoFmkhI5I9KmqVlWq8vAU
 LEn5pwW/dQ1N7opNlvxA6fVvR+pjFQXrka2OEYZolqcgD1930Gq2zXJLmyqWmj5p+5U1
 m/ejSN0sLEYW64UiEsnNNZbrCDni9CdCOSVs8UfeyfLdXomFW9eJCKeDwi8gtfc3dTZ8
 9SJAM/JgOQH7lmFjgdVrl6noErUPnpDTNpQYM0L2iBHr0r0TLzQ3/LbfdkHRWJ7gPczE
 b4o9boL4OoNf7n86891mnrj5WZzSfoOoQKcZJFme1uqFw8bpaBSD1tBo5v4OghL/MQYy
 YAKg==
X-Gm-Message-State: AOAM530wMUHcv+VTW20mZmMLv8979Gg3d0CzjwuYXBb02DyncF9fMNcr
 4mtJ+dF6kw636Bld0cxVt/k=
X-Google-Smtp-Source: ABdhPJyWs83B2rzcZ9byiKeFARxVKSKBsjrjCw/BJy2RpLZWXAfF3DZQELcNE7g6w6YW/T7A9ZiqOQ==
X-Received: by 2002:a17:903:230b:b0:15e:bc9c:18c7 with SMTP id
 d11-20020a170903230b00b0015ebc9c18c7mr26238576plh.29.1652865161862; 
 Wed, 18 May 2022 02:12:41 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a170902c1d100b0015e8d4eb243sm1114886plc.141.2022.05.18.02.12.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 02:12:41 -0700 (PDT)
Message-ID: <977be2c6-3902-a022-9e7c-2c93eb280919@gmail.com>
Date: Wed, 18 May 2022 18:12:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: tudor.ambarus@microchip.com, p.yadav@ti.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <dac51af409be97ab316a9de5c0297359df7d2e2d.1652063152.git.Takahiro.Kuwano@infineon.com>
 <99cf396f9210279e28dc1656a652efb4@walle.cc>
 <93de6975-c734-06d4-7865-bbe7f90cba4a@gmail.com>
 <0eea594f72858ec0ee099d45da71bc96@walle.cc>
 <57fd05cd-e0a7-b41a-53f0-c419ddc53a1a@gmail.com>
 <03b554e5-2182-f1e6-3954-e0128d21b840@gmail.com>
 <e5a57f5e138366da9c97803656fc492a@walle.cc>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <e5a57f5e138366da9c97803656fc492a@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_021242_633793_7E5E8AA2 
X-CRM114-Status: UNSURE (   7.92  )
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

On 5/18/2022 5:35 PM, Michael Walle wrote:
> Hi,
> 
> Am 2022-05-18 08:04, schrieb Takahiro Kuwano:
>> Any comments on how to handle this?
> 
> It's not even been a week since the former mail. Please give us some
> time :)
> 
Sorry, I need to be more patient.

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
