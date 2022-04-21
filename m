Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBC6C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 07:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hw/UiBkGoBuGKJmkCcE2HMFirdKR1QcMD8zLIrugrjc=; b=Q4lbUkertqqOdP
	Aj6uFlmdkVnmtmQdJBqf3RZvcXFZ/+5ROFAm8rcxCgdrAFdCDsVgO2Wd/SbdaACg3yBScZKAQ9f8x
	W7TCNUndFSGQjafkGAaVODZAQXEiqCwUFFvCzQWmfVkPF+ERbhqb3WaLRyTaf0XPCtej89SdDgHSL
	l7aVEl+Zpvk9xLUSZBaFQWP7chfo/ZsUA9XO7xz0CIZP5YDETziSzNY0+j5VGewE6WuI6fo+lIB5D
	6yr3tyqDo4RV2Mi+JAumON20pzQKc4N5t4oVi0Jk3OgTJb8IVWChioF6VRgnGu4hT+DIF+cxXPJp/
	QNtu3zMBzRg9tH4zPrwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhRbg-00CCv5-Qp; Thu, 21 Apr 2022 07:52:04 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRan-00CCSO-EO
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 07:51:10 +0000
Received: by mail-pf1-x430.google.com with SMTP id bo5so4260838pfb.4
 for <linux-mtd@lists.infradead.org>; Thu, 21 Apr 2022 00:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bmQnF8drposHjRT7H5B3JhGZlIULfjY1/102MMaabWI=;
 b=PfZYVOY8gtUYCXOMU6mxX/saf4GHj6N04kYclA3IVI3/UcDftpQNjwPXGSbjWihUqU
 PzMbRcR4xm3dSTDtqUTZZKk2SNO6nxn4BC42xk0sXQ32S6A88aeDR1I94w1/y65jl+Ca
 TVTcLStrQx9D9SEd55B0QPvhUF5zIHyEFYing2T/kqIUXsd/dlf8SHgXV+VcUhOveNDg
 DBNlx5CE+5UiyEzat/5AZXUnZgdH4QcxS1DhvoIW8Yu1xOup+SKpZgwykP8kb55Y+CWo
 oBvV2ohKEg0ACaf+0c0AaqYRmfenIvgRC7VxlmZk18ge96qjRONT3fhwN6SNubSYCOrA
 nDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bmQnF8drposHjRT7H5B3JhGZlIULfjY1/102MMaabWI=;
 b=oRzTkt2TmfOltA2XvT+Y/tkGTbIKIkK1lVSVYHqfER8nmNx7u+KjhLzu7hvQ3km6ZP
 CbO9GMmi3nFeaNPuQvvVkinbgjlF6EBlHhL07efmg6tjuyS7O9BcaFSk62vdY39m2bs+
 HEzpbOn+xgaOaRh+1rrV3jhJuGvlav+R1kJhgrzrnofqgA+/jX7e6rF7cMrk6OrcsF6h
 UM/b6sWK0mXBw+H0nBPTIfNbj2Vl3PtcJxWntH6AN5uwm9amPLaZBnuT8h7EdIZiz9ZW
 lPOna3rPk4Y0eyB25Hq2Cvig9C7lH4gdPddAmRrIGSJRE3/W3D1/2M2ofghj6YewKUJj
 D0lw==
X-Gm-Message-State: AOAM530Sdh3WQdcaB+Hmn9FFmfaNnPUHFaC+21I7p2yDFDij8dtHF6sY
 ecF4cjMch7LnsYmsWjj0RSU=
X-Google-Smtp-Source: ABdhPJy9BngvKCoNHD/tEA2UmxFbsIQW/mzMINFjgjsIKPqjxwxlruNYcuASCL8CsG+L1AZHKom2sg==
X-Received: by 2002:a05:6a00:230d:b0:4f6:ec4f:35ff with SMTP id
 h13-20020a056a00230d00b004f6ec4f35ffmr27519982pfh.53.1650527468414; 
 Thu, 21 Apr 2022 00:51:08 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 br10-20020a056a00440a00b0050a777cd10csm13091834pfb.91.2022.04.21.00.51.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 00:51:08 -0700 (PDT)
Message-ID: <c72141ec-8cfd-b43a-9c72-a98110b8ef29@gmail.com>
Date: Thu, 21 Apr 2022 16:51:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v12 2/6] mtd: spi-nor: core: Call set_4byte_addr_mode()
 before spi_nor_quad_enalbe()
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 p.yadav@ti.com, Bacem.Daassi@infineon.com, Takahiro.Kuwano@infineon.com
References: <cover.1650519576.git.Takahiro.Kuwano@infineon.com>
 <ef57dc6cc0b8b4dbd39cf1bdd2fd64203f08d15b.1650519576.git.Takahiro.Kuwano@infineon.com>
 <3ca94230-1dbb-6cf9-1c78-f2a591d96113@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <3ca94230-1dbb-6cf9-1c78-f2a591d96113@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_005109_543172_7D937496 
X-CRM114-Status: UNSURE (   8.04  )
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

On 4/21/2022 4:32 PM, Tudor.Ambarus@microchip.com wrote:
> On 4/21/22 09:40, tkuw584924@gmail.com wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Hi, Takahiro!
>>
>> The part specific quad_enable method for s25hl-t and s25hs-t relies on
>> address mode. Flash's address mode needs to be set before
>> spi_nor_quad_enable() call.
> 
> Maybe I haven't understood something, but I thought you were going to use
> 3-byte addr for enabling quad mode. Can't you enable quad with 3-byte addr?
> If not, why?
> 
You are correct. I can use value of 3 directly instead of nor->addr_width in
quad enable method.

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
