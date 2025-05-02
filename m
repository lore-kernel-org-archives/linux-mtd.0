Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C86C3ABA3
	for <linux-mtd@archiver.kernel.org>; Fri,  2 May 2025 08:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3nKCpv71CLBRRgWhpu+OW+wqtOss14OfOQ1obXOE3ck=; b=UkctvlQIy/FiRd
	S0a7Wisj2S8qPbgVmYSeBmvboNyRt6j1uN9B/tiMgHxpt4KhtQCFIHUhH2Sy4gktesrpDxITVqjGL
	tClOh8VwRrcLwCEKqHJ1/eICkrSh4dwQbn44/5+567MLOhKMkSm26HCKGLDFduZ62mv7tXWcgOu9c
	nb2oXibOkPMpIkhGk7mTmAxKkd+uJTCatnn3u2rotuuFqmWUskcPReP/hYQqpz2h1R2U6EAzqBRku
	K2xncSAMAYQEoi2FAgc3cpV+emEUanVDfTx9idzcjXh+vYZYeQqUBxrJfE/Z3vfYU/iMdr7+yjwXr
	oghaN61E9OJ6d5grJ1hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAlKW-000000019dm-1GM9;
	Fri, 02 May 2025 08:01:08 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAlCo-000000018xj-1Joi
	for linux-mtd@lists.infradead.org;
	Fri, 02 May 2025 07:53:11 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a064a3e143so707924f8f.3
        for <linux-mtd@lists.infradead.org>; Fri, 02 May 2025 00:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746172388; x=1746777188; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YIYUYTbkSYrP8WnVzdIpYswDWWAUAS3GFOeRKeDzwWg=;
        b=Am7USt9TWkP8xj8HHrHBVWctqBZ+wyhpl9DJjU8OK2N8qJ+Ga9A9vu2a0t6hsrC9oA
         b5HkXswCTSuLKy0yr5yquXlB8EOlvywELkjNMPKengtE2YGnNrm2JgerVSseALr7XY7X
         C2K2c1lT+E7MgONMSEADg+zMimhlnTpgVlh0+GLiVsQx1aEp6OfJJdt+sedrDf6zB0H1
         tOyhERPuQMQd5BKvHkUCi3EOBr6LA6Z+0RAHHEBjy/F+rvRUGkzmsKEV4lHKhI0G6ay7
         g0cGhA3NstTV0R5NHl88Q4rgQ/dqG0wZYf0FkR0j7WiypRzrCEDAUNLbeceLxPj1VUw+
         Ln4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746172388; x=1746777188;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YIYUYTbkSYrP8WnVzdIpYswDWWAUAS3GFOeRKeDzwWg=;
        b=dUXhnVcReurJyt6azPpku0YPtenlau5A7u4j3LiQRK8AYj5dd9w6XQB5tUVpcWxC3A
         XSpEfd48rlNLqbebQBhjCstIQYXxrE+QOhKR3ov6Dv86+Tc75QdsGN1deRdcP/ynzos+
         neEIxdLQ3aB3kXJ8Xcbcqk4iA8BGmaKauQRiyD5nPiZDydMBdneAPAjvsuvUdGqD4bOa
         iSIF+1Baff0asRxMwlAv08Va58HgZ5cCGw1e3DgUAMDjP+7/b8Er/HhkgziFJvScn1he
         iH7+pZnIa424HN7bXynwwNhcA4UAwZ1uk649Y/bnpF6pswiYgbVf3K6Jxau0bxvqZsM/
         9KxA==
X-Forwarded-Encrypted: i=1; AJvYcCXJVEmZf+UUYw9cR7Z+woaNxOg1dwMlzZ/iaDIfX9IBeKGPVnSPcaHl59pLRau/9mOZYsIMn+08KWg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8zDX37VlrdAjIfZElarCm3dWp3VY4UmZZ5D3h/p+X5A2iTLw7
	zERLQmBjpTj2APSRoh0v2I3tuyXEVDALXpRwMtSF66tmpSxpHTivGPckByAbmos=
X-Gm-Gg: ASbGncuuSU+LTniOqiQPQuyxALIV1IJxB77s84cUqGjOvqCSM+fm+JZED9qcEt57ggD
	dfgVeX12CIHVvNvEdfxCk5FuK7WMHwPFENq9vHvRN/8VRRUwhUFhnEi6aB2CjCrD1qDID8vV8Y6
	H0IetcxG1Ia8n/U2E+QuFfgv3OlB48pYIvTNFJifh7e1BxiLxN6NS+MZHITkYsXyBygCLvQ5OWk
	ejgw0YUDJSWVWMlnBQxGt4/V/lpvtVLhCypw8JbtUIAOqzoKJTtWR8wjv5rRQlXULhhVzTpczR8
	7lqI4UyQjn/syC38znNKK5MFcnPq9LyWGEjm/D5MY0sS2Q==
X-Google-Smtp-Source: AGHT+IFUF0mleYLp1kLBLB8JmgDr7cOlyFKFxJ+vLZzJOkd+YMspUaspCgieTiAUbD8s7VruSkm7fQ==
X-Received: by 2002:a05:6000:1008:b0:3a0:99b1:bab5 with SMTP id ffacd0b85a97d-3a099b1bae6mr1003895f8f.57.1746172387978;
        Fri, 02 May 2025 00:53:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b8a315d3sm36125375e9.36.2025.05.02.00.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:53:07 -0700 (PDT)
Date: Fri, 2 May 2025 10:53:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org
Subject: [bug report] mtd: rawnand: Add Loongson-1 NAND Controller Driver
Message-ID: <aBR535RZZT-sa6QZ@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_005310_352782_DD57F835 
X-CRM114-Status: UNSURE (   8.21  )
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

Hello Keguang Zhang,

Commit d2d10ede04b1 ("mtd: rawnand: Add Loongson-1 NAND Controller
Driver") from Mar 20, 2025 (linux-next), leads to the following
Smatch static checker warning:

	drivers/mtd/nand/raw/loongson1-nand-controller.c:730 ls1x_nand_chip_init()
	warn: inconsistent refcounting 'chip_np->kobj.kref.refcount.refs.counter':

drivers/mtd/nand/raw/loongson1-nand-controller.c
    690 static int ls1x_nand_chip_init(struct ls1x_nand_host *host)
    691 {
    692         struct device *dev = host->dev;
    693         int nchips = of_get_child_count(dev->of_node);
    694         struct device_node *chip_np;
    695         struct nand_chip *chip = &host->chip;
    696         struct mtd_info *mtd = nand_to_mtd(chip);
    697         int ret;
    698 
    699         if (nchips != 1)
    700                 return dev_err_probe(dev, -EINVAL, "Currently one NAND chip supported\n");
    701 
    702         chip_np = of_get_next_child(dev->of_node, NULL);


The of_get_next_child() function drops the reference on the current
child.  That's probably not what we want to happen.  This is similar to
a discussion we were having earlier about of_find_node_by_name().

Then it takes a reference to the new child.

    703         if (!chip_np)
    704                 return dev_err_probe(dev, -ENODEV, "failed to get child node for NAND chip\n");
    705 
    706         chip->controller = &host->controller;
    707         chip->options = NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA | NAND_BROKEN_XD;
    708         chip->buf_align = 16;
    709         nand_set_controller_data(chip, host);
    710         nand_set_flash_node(chip, chip_np);
    711         if (!mtd->name)
    712                 return dev_err_probe(dev, -EINVAL, "Missing MTD label\n");

of_node_put(chip_np) before returning.

    713 
    714         mtd->dev.parent = dev;
    715         mtd->owner = THIS_MODULE;
    716 
    717         ret = nand_scan(chip, 1);
    718         if (ret) {
    719                 of_node_put(chip_np);
    720                 return dev_err_probe(dev, ret, "failed to scan NAND chip\n");
    721         }
    722 
    723         ret = mtd_device_register(mtd, NULL, 0);
    724         if (ret) {
    725                 nand_cleanup(chip);
    726                 of_node_put(chip_np);
    727                 return dev_err_probe(dev, ret, "failed to register MTD device\n");
    728         }
    729 

I think we want to call of_node_put(chip_np) before returning on the
success path as well?

--> 730         return 0;
    731 }

regards,
dan carpenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
