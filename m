Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CB8C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 08:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUuaUMDZJDWVT5NrIDiNwAq4Aw+UAWR3Ex/3momsWdo=; b=jqp+Wj6b/f6zDn
	7FaU0V3sPakkDE9/HWoy/Rj6wIVu6oi572D45wM5hH1kzexaHQknHdlpLoXZLmdHwSuRewXorI4TD
	c44U75VJHEeKHoxaCePjj7E+stsh2RKK9R94TQS7+uQB/XzgvKJxf/22wVJpj+ET+JVvUfyMoBW+j
	KOg17yOhBfbKEYgLPVJpPOeOFJBbNqEPo8iuFtNnXicyELXdOwyMAuxLQeDhGFS4OgOYagq7D7AAY
	oLKId/vbqKge6laS+65ukp3ugXm7Pq8KM9S9aJByrgD2Vo/TQJGptV/pAY1OFq8p7yBoEhm5uF7HU
	jwkF79mt7EKi+Uq6SECQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhRjw-00CGET-IR; Thu, 21 Apr 2022 08:00:36 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRju-00CGDo-1E
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 08:00:35 +0000
Received: by mail-pf1-x42e.google.com with SMTP id x1so4289235pfj.2
 for <linux-mtd@lists.infradead.org>; Thu, 21 Apr 2022 01:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CnGUjwjUb2126txvBCKTNXG24rw/ye3V7j6FphnKtmU=;
 b=NU95irdP8JJGPiA+GgflxAvPqWluPHHJ4viqVpw5gqBDps9A4q+B2ZMR1/UJyintu8
 PlhIpb7FvxBLaIRlCoYk6NNTn1pgH/oOZ2v+QB9O3wFlVorHg2jgqnD4lxRvaFFnIuIo
 F181DE40RDrZZ0EOT5rTyiiVfCULIfcvUDxK06HN4Mzp1KUiTnow6hpJ/yzgXh9aAVdb
 OR8daoQVSI9hnD934PRF7VFhNwaBYVFQmPlXU9gGKOUx/Q4YtIpaIt6Bk9yxvXXR4Mz2
 CVwdGpxHe7o6bQgKTp+DqyFhwFEg53i80/Wub0vDmL3MesLXSiPglmoklnrof5yeHRu9
 7ORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CnGUjwjUb2126txvBCKTNXG24rw/ye3V7j6FphnKtmU=;
 b=1SjVoQMB9hABbzq4Q0dDQkZUvaAwEZU/+reG0dimnPnlAgwhzSkINuvKQ2Ie7t6sjq
 V3njnSfW7wbsa4E2UMTQVPmbh3yJlfLfgIDHVihIR1cNiMXJCofj2wAyVxUsmpNDH069
 totaz5DUjS2DiZNovN2F36GTobTfqE/Vex4eSqptNVVpjzRWF3SWEqtphkWfpigExwF8
 54sTX7LXz7f/ThzMAGX5KLhBzm8ra/yyI4iIk5rCr6JASc1krd+dnu4PouFt4iGYUmJW
 /H1E/FTMiewFOsj6hQBliF0uN/nVJmtcdbFyLzvyJ76K+e+rk5vfRJGTA1jsp9Yj7SKv
 v66Q==
X-Gm-Message-State: AOAM5327YC59/TCfPgAuwMca3kdaa2XnWqhwE8ekvKEJ7New4NotAUwO
 yQgKbQxUGSv3SxIxwT8Afu0=
X-Google-Smtp-Source: ABdhPJw/z0hZnVMWnzuXhS2WHBgJTwIO0Mepytq6qT+ncMfnAgPvVPf5k15L9MSh0loqAVK98SW81A==
X-Received: by 2002:a05:6a00:a94:b0:4fd:c14b:21cb with SMTP id
 b20-20020a056a000a9400b004fdc14b21cbmr27370398pfl.53.1650528033196; 
 Thu, 21 Apr 2022 01:00:33 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 ck14-20020a056a00328e00b0050a3c5f415csm20482568pfb.23.2022.04.21.01.00.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 01:00:32 -0700 (PDT)
Message-ID: <86c0b914-81b2-aea4-118b-bb33840f230e@gmail.com>
Date: Thu, 21 Apr 2022 17:00:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v12 3/6] mtd: spi-nor: spansion: Rename local macros
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 p.yadav@ti.com, Bacem.Daassi@infineon.com, Takahiro.Kuwano@infineon.com
References: <cover.1650519576.git.Takahiro.Kuwano@infineon.com>
 <e7d067a754e3361c29960dec266671f0371c38ef.1650519576.git.Takahiro.Kuwano@infineon.com>
 <b0b37533-f3ed-5445-8ee5-265e399a9945@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <b0b37533-f3ed-5445-8ee5-265e399a9945@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_010034_121743_E79F3851 
X-CRM114-Status: GOOD (  12.47  )
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

On 4/21/2022 4:37 PM, Tudor.Ambarus@microchip.com wrote:
> On 4/21/22 09:40, tkuw584924@gmail.com wrote:
>> -#define SPINOR_OP_CLSR         0x30    /* Clear status register 1 */
> 
> This is a legacy spansion op. So you end up with "spansion" flashes that
> use "cypress" ops, which is confusing. At the same time I don't care
Agree. Will use SPANSION_NOR_ for CLSR.

> about the name, but if you want to change it, I suggest to change all the
> defines and get rid of the "spansion" name if that's what you want.
> The driver name has to be changed as well.
> Other thought is that cypress was acquired by infineon, so what will we
> do in few years? Will we rename all macros and methods to contain infineon?
> 
No, we should keep using legacy names.

> Let us know your thoughts and if you do this kind of change, explain why.
> 
> Cheers,
> ta
Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
