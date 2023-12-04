Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA695C10DC1
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Dec 2023 07:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AqWZC/Cs5u1KKcRjlMRrUyNwsw8yIs9qw/qCobCJCGE=; b=bpHckTmxt+Lzhn
	laZ/04t56yiumlP7hXzPXQnteBA/P44t98sM84vyS2HpQKFio9jZzpiXMOJWVgvnW3gnbfvqg/Vwp
	E9Gq707AJ/q2APEEniuz9Bpd8kWcteBXoFOCcHNSKzPN5nq5WN8C45F6O+dS/MVmByrsKYyghIFsU
	pk2JEmjNzB5VpnNp9xjDRY7XiITXDur6BTT5B058Ixyway4yD7vgwjyGsNm0opo5F3kSiWsE+F1sz
	pJ0NXJlwaCdQkmxVZzj04f6XOQDlVqPHR71M4DsDFuUaHl/ckCEF8NiAkhrePGpfRyMKphACGp9nr
	2Z4t/92bcN/stJl4RQiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA3Zu-003Ahx-1l;
	Mon, 04 Dec 2023 07:41:18 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA3Zr-003Agr-1u
	for linux-mtd@lists.infradead.org;
	Mon, 04 Dec 2023 07:41:16 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40b27726369so42365685e9.0
        for <linux-mtd@lists.infradead.org>; Sun, 03 Dec 2023 23:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701675673; x=1702280473; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bHnNH52BzwSPE14G/TQHBsQrr6eg0hm0UZHUSzMbFSc=;
        b=a0IP8MA5OaPeE7ykkNh6Ez+Pks6/AwXOwpL3Pq5p6+XYRu3W91ZxQmR+1FoJNen+VR
         k7IbdkBoVTy48Ek+QKuGuIix8So3w+QdgxHupX06bO2raOqCHAzPKUcO4g+1hJzOSWfS
         FoC+fQM5OaNqwbpBaXSMIieVBAsgNm8BrQT8jJBjd8GTCqKD9i8pNh9Tb9xmM1iAiNYs
         kvjmTJfoNZPr4lwXOZI4coDyWwD4fmjHo0MyioSWJFuzN1fC7m90NOXeiGqJV0jrFJzj
         yzLEuj70VxBTxRP8Vt8Z+2BXcPjmqsXJXnUSz8A1+NsT9EGUj9AYSawDf3JM0P3uEtQ1
         IZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701675673; x=1702280473;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bHnNH52BzwSPE14G/TQHBsQrr6eg0hm0UZHUSzMbFSc=;
        b=jdvuIM3UyxOovYJ2NiLJxg5kzvzl4c1HvCfSzpYfd7XUr4oFsS9Od5kG8l4fqRWhCo
         XMFW9Fi6VWBjKmhc/TZwQZJIOuy+fNSVAXsnqak4zwF80JthStwh0qqN09LRtLXHydM9
         wJPY6mP084mgzxt8zm4eAyLqrFkGieQByMWjefWcmO7LyAdQd6fqbs2PQJN4vKz2e8jn
         z9PDTEIF6PGLV4eyl0+BYySWWhtSzJONyqcJlnuXE172wFdxU9Oo7WGZPcEpMnSGGXEJ
         ChLGadK8QOSiWZbOxDrC05Pq3DJsjVP8U8raHZ96oldDY4/zQrn+byg0Mzo9YXDtBVDP
         O2DA==
X-Gm-Message-State: AOJu0YwrVS6HBAAnP9FhQUneKPZtcTcg0RBYTlNoz9B/W4oz85gxqtB2
	NzLDDwMyDC20AGjNLemQYDH6l8wlh7Eeo8zdmS4=
X-Google-Smtp-Source: AGHT+IH564eHMOqnQQlCMJsy5LlhIWzbQjcyWeWeTasTrOwW4EAD9HyP2XrY8COqKiWaGLuX/qEggA==
X-Received: by 2002:a05:600c:ad2:b0:40b:5e59:da96 with SMTP id c18-20020a05600c0ad200b0040b5e59da96mr2260854wmr.169.1701675672807;
        Sun, 03 Dec 2023 23:41:12 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bh6-20020a05600c3d0600b0040b54335d57sm9232324wmb.17.2023.12.03.23.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 23:41:12 -0800 (PST)
Date: Mon, 4 Dec 2023 10:41:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: dregan@broadcom.com
Cc: linux-mtd@lists.infradead.org
Subject: [bug report] mtd: rawnand: brcmnand: exec_op implementation
Message-ID: <77e2f422-2a17-4235-808c-133073aefcda@moroto.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231203_234115_632410_50889458 
X-CRM114-Status: UNSURE (   6.25  )
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

Hello David Regan,

The patch 3cc4718fa644: "mtd: rawnand: brcmnand: exec_op
implementation" from Nov 24, 2023 (linux-next), leads to the
following Smatch static checker warning:

drivers/mtd/nand/raw/brcmnand/brcmnand.c:1701 brcmnand_status() warn: signedness bug returning '(-110)'
drivers/mtd/nand/raw/brcmnand/brcmnand.c:1710 brcmnand_reset() warn: signedness bug returning '(-110)'

drivers/mtd/nand/raw/brcmnand/brcmnand.c
    1693 static u8 brcmnand_status(struct brcmnand_host *host)
    1694 {
    1695         struct nand_chip *chip = &host->chip;
    1696         struct mtd_info *mtd = nand_to_mtd(chip);
    1697 
    1698         brcmnand_set_cmd_addr(mtd, 0);
    1699         brcmnand_send_cmd(host, CMD_STATUS_READ);
    1700 
--> 1701         return brcmnand_waitfunc(chip);

brcmnand_waitfunc() returns negative error codes but we truncate it to
a u8.

    1702 }

regards,
dan carpenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
