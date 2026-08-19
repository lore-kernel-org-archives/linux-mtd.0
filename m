Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A27C5DF6D
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Aug 2026 05:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sepTlJ5cXhBx6JlfoshLG+VFbx1a+nQqInQYDy+CZLA=; b=w5TJ3t4Yg1j6h7
	S1n2Iolhbe4filaNbr9t7hZcHelRaNmd57fKIdgrkTXI1j9z1cVoQCSTA+TeHgG4WnBAykar2Io3I
	Mju0xDpPN9RvUgTnfXQnF/+A9IuIqtvz4LEiq+rjubNzugfMZWssvybsz5DfREE9hJ4bDtBTXneza
	WdTSTQb1Dpj0zYNDUp6+ZARFssjd7LaRRuTMY7H2ruf5CLQh5aEYj43CmD9WoR4G528D3qyWixf5n
	ceUKg3fnmDFeZ4Lww+gdnrXseF8DRSQ4lbDCZ43NbsJJ1N2b6V3IacjI0SY7U7F61AzESUfqbDvqU
	Tvgo3wETZSbE3HyiAqKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwZIC-000000093Go-0FBC;
	Wed, 19 Aug 2026 05:56:52 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwZI9-000000093G0-2bER
	for linux-mtd@lists.infradead.org;
	Wed, 19 Aug 2026 05:56:50 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4957eefd361so4325015e9.1
        for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2026 22:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787119007; x=1787723807; darn=lists.infradead.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BWWT6Y+7n6aqb1ZdhCg1wzuPPwCJp/t5bh6V7Joa01U=;
        b=kNSGKbI88YYDTF9XJO3/6c02aE3dL5RWQwyGECKbHyQfhXURYzqCxuITTLCCrneTKG
         Sm1EL3DCJAEllX/BFdh4D13U82YYqQuuBeRbdoEYOhJakoIZQAOFIN8FCTBOieLvoUks
         tnUWORPO0QiPm/kp4hmIWPFjZxZ4kD5qe0YPMhTrsNIOH6OH9vwxsn4Bhi+zX/3cZuAA
         V1kaYcgi7eU+eOPImiTntF7Ehy7vh5ej7rlEExDv1i0pg4naGFr/4ZeDqQL2Eg+hOOcl
         PA+yrDLGCeBEFzqt/YNBJxVIeKzFfvm4DPkEdPen/8O3BKlyOnZaqAs+9+VkEOFZwPtw
         x0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787119007; x=1787723807;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWWT6Y+7n6aqb1ZdhCg1wzuPPwCJp/t5bh6V7Joa01U=;
        b=MCInUtyyWyBdMiOLPy3iY6EtBRRDKm+tSXMTwmITiUkiM+ZwdIHaGC7Q6hDDjsZ1wK
         ZslPZ/Tqu957Y5PjQ820LDck9uQ7F4zJHPF/JnTbrGbVaY5Uovyl5AwjIdEZEZGErFKO
         ncP/R6h5NNMuwcIJUYaH+pgn7iVVRqultqqJpY6efpnnu6+yk4RS0m19OsHigLFmLyyR
         FV026jdDYL7f3BZzN9K4zHiqrhKZSCsF2KOkoTpPm2MPHwnXhZ3zxfJymIXPufvR7HfL
         5IDNqiQRFKiM7NJuwK6D1hCiKq3UJ+wMTMYn0xoVldcCKooZoFHKpuQu0yOmu91qsAd4
         P30Q==
X-Gm-Message-State: AOJu0YzcmyLhXLBf/zU494BSmkKA+u83PapA3q1tNN3JphdBoPrRt2T9
	HFfJScUf7ZI+uSCoo1vIp8g05lWY9PUAgSa+xzcaBEJ0/qVaUTcRJ3qAOFJOu+/wfqKtDgcd
X-Gm-Gg: AR+sD10o0XX5RQS6WSR3r74poM4WMB6C29UMa68+QaDLa2WghtkxKPhkHIf1FT2GB9d
	B4ag9Eqf6iiwUGLsfprU6liLzIRTNaeuLeQIcMsNsbHgSw4r3lbcNMhGAd8yZ1vVvmdJo0hiJfI
	1Vp0JWQj1030X6N52lAwtMz5Fm3zZmU5rQ3rx0ao7vrVZMkT//rtDY+Ir9WRYguqVD1e4RDk9QL
	n/E2/kDSsLHASc9FGqt/693eTDPZAITd3lo25J1LXiTGNmOPQ0Ss93RzMfbhGw+hs7z21tTWXH7
	ctXvnUWm+prQKQRFlORvpjwzHtKVqdPH481DsUIIpt9BotNe+NCHAcWG9kFxZ+CBdLeKaWQ3o/2
	rLCUCiQ0d0k9B4vWynp4nLrZty1srp1T6MHPCloi8NElrI5aHnCr09JUpM6O0xPQNW8Vm7pm8d8
	0vqHW09Aw3Z/OyU2QQzCF1ktVaYhH9yep/HNPeVbtl4vaRSsGzX9uOaRqZBmwBJle8pqJ3
X-Received: by 2002:a05:600c:37c6:b0:499:858f:2653 with SMTP id 5b1f17b1804b1-499aa14b457mr36256255e9.2.1787119007066;
        Tue, 18 Aug 2026 22:56:47 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0fd728sm48089655e9.3.2026.08.18.22.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:56:46 -0700 (PDT)
Date: Wed, 19 Aug 2026 08:56:42 +0300
From: Dan Carpenter <error27@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org
Subject: [bug report] mtd: rawnand: ndfc: Stop using nand_release()
Message-ID: <aoVFmrEnQcDuI1fQ@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_225649_673129_D7A61229 
X-CRM114-Status: UNSURE (   8.49  )
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

Hello Miquel Raynal,

Commit a9384f95fe77 ("mtd: rawnand: ndfc: Stop using nand_release()")
from May 19, 2020 (linux-next), leads to the following Smatch static
checker warning:

	drivers/mtd/nand/raw/ndfc.c:254 ndfc_remove()
	error: dereferencing freed memory 'mtd' (line 251)

drivers/mtd/nand/raw/ndfc.c
    244 static void ndfc_remove(struct platform_device *ofdev)
    245 {
    246         struct ndfc_controller *ndfc = dev_get_drvdata(&ofdev->dev);
    247         struct nand_chip *chip = &ndfc->chip;
    248         struct mtd_info *mtd = nand_to_mtd(chip);
    249         int ret;
    250 
    251         ret = mtd_device_unregister(mtd);
    252         WARN_ON(ret);

This WARN_ON() would trigger if the use after free were a real issue...

Smatch is complaining that the mtd_virt_concat_destroy() function frees
mtd->name and mtd.

    253         nand_cleanup(chip);
--> 254         kfree(mtd->name);
                      ^^^^^^^^^
So this is a use after free double free.

I feel like the free in mtd_virt_concat_destroy() is done at the wrong
layer and should just be removed.  But I haven't looked at it very
closely.

    255 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
