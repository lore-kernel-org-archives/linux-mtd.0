Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0E7CD6E79
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jun 2026 13:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tj2/S578iKhx8msVvkEw1zn5RQ8MiVKSUdIJ6kq0e+A=; b=Ck9RQWcCwE17oo
	ADLu5GT1Gsmna1+TMr0LqYjXytV+fOnMdZ+JSGj2vbuvlF/6Jrkn48pUj8OIDE2sqWV8TPrec45dg
	KxJgrPL9SqegR8tX4h1kQH5Ns2aYwplQhNF3wotkXTD15BJ50R0+wdTXgWKoDJZmkOTsGhp8qrbwh
	Z+XDxFh7pG4Q1vq7+vral3QWaV+EkyfdObk5KopILqLAmcyfIiKtIbXzR99zdNCo7tZ4wEBXBWIP1
	4/0TaxkCBcfPlHiWBKCXCKYRdM3SePh4RS1O9MKUDVDw38kjOc7wHrVqbnuxIF1f3DcdLZp5ftIOq
	Xk5veQpYHlnIUvfer3jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVUEw-00000000ecm-1PR8;
	Fri, 05 Jun 2026 13:05:34 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVUEu-00000000ebv-1erU
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jun 2026 13:05:33 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-45ef5146b56so1934425f8f.0
        for <linux-mtd@lists.infradead.org>; Fri, 05 Jun 2026 06:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780664730; x=1781269530; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=Bshf7rhauFC9kKuN/xHTMhMC2BwfoJ7ZEDYCMZBDsOMchqhSBPjAUA/QzsSodMSF+W
         aA/d2F+SC/6rhXIC2/6c7KD9iyoagnG5k0jONLtY1Iz8kIxdzwl++rrlfPlQvfBba8S9
         YRn/CI5LqoA932HnGs4u8znC/3PumfM54RxHtQiSh0eIh2WBdU9FBglvzOujAu35ziBu
         /nQid9DZWEIkKgF8UC+qYyP/VqfDOPVXIYY4ePVE/2iTgD40idqhNz5cQSZFea2/oUr8
         Y1UAnzoPGWf1vbfIGwC8Tjlxu57YG0bbgofZqZjgj1EHAdLaqds2BfGZopArjWdf9kra
         KysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780664730; x=1781269530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=cADuHC1AIa10IQPbPlYbaYNcU78Jr/qOkB+UmAr7endB8zfnLj8rT+N1qPe6PzqWrZ
         Elo/Uhbz8//hc5SbNeJqKyVEUG1PWmwZS/xHewac6lIS6P1SF065CJVnY5ClpJ69Wiez
         ggMHlAXVfKParbdmSQ5qZPeZqES0ZGIOchzsTgPbcyN9YjWsFNPxrCw97GWVF7Km0SrU
         pJ3lMi1TQ9XGqvYPqA570HLvRrDiBB3bSDC0dKVIVWVjD6eMwn1ate+OVaIuwsdxThA4
         DtG95X9e7deEohBSPySZIgtwoj6uI5roAkbDVzZ9ObwhEqJZBYmspOr4wLTep+eeGw1J
         JEGg==
X-Gm-Message-State: AOJu0Yzaw1c/x86rQRPb/bpcoAKmECDGJPGYF45v5ES7lJyHY61eSk1C
	YQe8D+H5kkrLZNiTeY6o33VO7MGI4529amXxq1JqecxaluiiIFNYxb1SUcj4nBq4JsQ=
X-Gm-Gg: Acq92OH/+zA9M3zuju5eQEaOdQkDMDJNyC+3ow//bnyMcx4HuHlJ4TBx5wY+jLXLqwj
	NyP56pF3/YFnlll8nV0+g6N8oTNw5uHaDd2oE2DJ21OiNFkC3m8DJ3KoHa/dFNo+62s07c/eMxn
	vjt4vj8V9dPpi24ARTF/dmRusWVmS3pdH9KyE/6U1QcZQ6HtoTFSaTVNqjHwhEfk27s3er9Ui+q
	RvnszgFJUm3GUTofGzbsO156LmpbEOmEv4Qm2eV0eZ4mTwJXpvFiwX7Z9tKze1tcytCyz5+W5SX
	Bv10zoNjwPIyvdlv1n/JJm2j+LHoEo1iTFAQ/yMFjgp9Ew93K/C3a5wMeNOviGJap7UXTqCKQc8
	N/lOj4O5Awlci9lUyh6k6/nDu5i4AtSHhSJsiOYZGlAXKjVrRB+hOKzL1BJBoytMrHQZkAEGONQ
	gDtFdWug4TURlzl01JiUJ0UvHZ7bXYJzmVSjkMdUHZBg==
X-Received: by 2002:a05:6000:2994:10b0:45e:8edc:dacc with SMTP id ffacd0b85a97d-46032dcf608mr3068097f8f.27.1780664730096;
        Fri, 05 Jun 2026 06:05:30 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm25515760f8f.19.2026.06.05.06.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 06:05:29 -0700 (PDT)
Message-ID: <9785d808-6db9-42b7-aa1e-ac2ff3f6f642@linaro.org>
Date: Fri, 5 Jun 2026 16:05:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] mtd: spi-nor: spansion: s25fl256s0: remove
 SKIP_SFDP flag
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260601125438.3481722-1-mwalle@kernel.org>
 <20260601125438.3481722-2-mwalle@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260601125438.3481722-2-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_060532_455463_D026DFC7 
X-CRM114-Status: UNSURE (   3.86  )
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


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
