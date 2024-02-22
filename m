Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B985C48BF8
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Feb 2024 10:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dhb//ZopPZxtT+dgEcLvfGpTFVAf/FHJbd2XLrkT25c=; b=wedCfajH2Fh98R
	X8zqgRUVmZs6/sftIa7Ajx7NIO7gFBhWxzgyMd/fgBG7KZIcqqMBkXLcwbLsmFKFgwEu3rnm4dfXH
	ng34HT+kAJ44H31E1uhRYgkbHCa9ZT9pRaZ9gYAwL3a5IXt2OqbywQuellbnwlsmSPffGZmio0h6l
	qNDmbapIJ5OwMvVmVBbMd14wHc58DtYfCKkDsbI/MCwU4X60G6fv8/d5tM2ZeL1plKYcpw47hTop5
	U6B7ckT9jkQyZ5YLgoTKNSZ5ZDtciDSKhJtZgzmuMvPVWFQSJaiVdJi+fKejQAgNxpbRgU+D1VXlQ
	sMMabIjBgHduVKKh7aPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd6IA-00000004TFX-31QI;
	Thu, 22 Feb 2024 10:27:02 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd6I7-00000004TDu-0prZ
	for linux-mtd@lists.infradead.org;
	Thu, 22 Feb 2024 10:27:00 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6e486abf3a5so1561084b3a.0
        for <linux-mtd@lists.infradead.org>; Thu, 22 Feb 2024 02:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708597618; x=1709202418; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=36YR/TUJB7vezVUPUs1MPW4NYfSOhNJ9KinqYl/7uD8=;
        b=H608c1ftsKPYzoDRQ5jlxNRz9mcZns/u3gj49YH9c6jIesSGMAkrYkkRsU8niXe78h
         AW37dR0//h+NRKXd5TfstbmIBDAGc+zfQreoNgV5P0qqO+hOJ3OnEKWHSBt2dqG0E/le
         BFZMjBEHZEaCTiZZSKNfGubj40R1sI7nywofia0avddVA6mgCpJHdL3IKUM2fvE/mggT
         8UUCyEzBug3h++giCFgddbmCLyQ31nbDLtAlKwMMbRXm+nQ14Fg2f5E4+MVs1kTWGlKm
         hC/LNzpFBQXcsbmOjV6J7DK+Xfgt8fXMHVJnuwwHEWSLKxGIbbcH4YN1MSPn7PXHvaFO
         7BSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708597618; x=1709202418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=36YR/TUJB7vezVUPUs1MPW4NYfSOhNJ9KinqYl/7uD8=;
        b=IrS6zJfplOC+CtMt9+jXd3D02P0gFDrGE7NmZkciamGGH/F3NQhrJxloe4v+j4B4mq
         fIwl7ieGZK7g6VqchWji//W/8XVGIRzmXLqKcfrYpUnhR1+vH3H/u/G0RFYwoHqATRjc
         zs3I6YEH2z0IOj5japRyajZ6azYjf6E+jS6AVUJu/fuTr7XmuIE98bFxbtBDg0u3sxyC
         hIKsvdIHsrhysLkcSTGUYbrHED62uu8v3jZIm9EFeKRdlemSWQdQ/zQUgeo9BcuNONGL
         XTilTS3LteG73nEYH+MYGODZldj52/VMNzoWWVC8u1QfwlQC6lP9jG6F+OWESma4dKV8
         q+mg==
X-Forwarded-Encrypted: i=1; AJvYcCWslGX7e0fzQu8qt0fxVdiaBOtHkYDz1JVERlqMN5oKVeMhX6P+yBJPpO+fOhfN5IUUUI2fJWR0VeRgG8MPk4If6WD2F25moTzDHYjQfg==
X-Gm-Message-State: AOJu0Yxv3g2qBDM9PAQZ/wF98KE6bjJuCfzw4pvOyafSakdPhPvrkCQS
	ayGStGMyilZIkgLS+TwxKhjxLtjT4NVx0W5StLexYJ32Rio/wnGW
X-Google-Smtp-Source: AGHT+IFgbDW264LgC03dgOmEmVcLIcLgEET8NB2yeDHYAMlzhdIf6yv+H5eT+ACuIy3fapesGRlngw==
X-Received: by 2002:aa7:9dcd:0:b0:6e4:86a4:e201 with SMTP id g13-20020aa79dcd000000b006e486a4e201mr6301797pfq.14.1708597617827;
        Thu, 22 Feb 2024 02:26:57 -0800 (PST)
Received: from [192.168.0.9] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id t22-20020a056a00139600b006e47ccc2e2esm5150333pfg.5.2024.02.22.02.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 02:26:57 -0800 (PST)
Message-ID: <d333ca3e-af37-41d8-9e9b-cf1337199886@gmail.com>
Date: Thu, 22 Feb 2024 19:26:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] mtd: spi-nor: core: set mtd->eraseregions for
 non-uniform erase map
To: Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1708404584.git.Takahiro.Kuwano@infineon.com>
 <242f1bbd-a9f8-4781-b553-681385f1489d@linaro.org>
Content-Language: en-US
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <242f1bbd-a9f8-4781-b553-681385f1489d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_022659_291773_467910F8 
X-CRM114-Status: UNSURE (   7.49  )
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

Hi Tudor,

I tested with S25HS01GT(hybrid config) and S25HL01GT(uniform config).

Thanks,
Takahiro

On 2/22/2024 6:16 PM, Tudor Ambarus wrote:
> Hi, Takahiro,
> 
> I'll try to review this today or tomorrow and queue it if I'll find it
> fine. Please let us know if you tested the series and on which flash.
> 
> Cheers,
> ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
