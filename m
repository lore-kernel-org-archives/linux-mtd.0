Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED8DC433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Nov 2022 11:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SVOSgimudfoqxLBivlGEaB23k5OQf5ju1jtqWSJ4scc=; b=Q91xdBbBRXDBOj
	I6R+D2dN8LfQaFbAEsz43LnqFO8fJCukxJ1rn6FG7eQViUMAvY0iZU5AEe/MqPdMhFB2xJcrsGfk9
	rg1ShFCMruv9HgNLP4mcZyU5GPbTzktsrBKm8VO4U5AgdO9r2BMOCktzZNZI5OnccgLY+Bhm2HL0H
	moD1i9eu0G1AJV6cwYVeqRgccMRITOmY3OKJYCrsKr9c6Q0ThQ0Vbob91lZbdVVH915usm5JJvmkR
	qTfEg05x9AR+E1hgXrjxoX9RqpglvqUbtH9T7Io7vJ2nwxmGq+bRFAGlK8st/x4nzfIO2S2ysFjW7
	DaTpN5N1fItVfX4NVs4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyAhS-008BKF-3S; Thu, 24 Nov 2022 11:47:26 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyAhO-008BGu-Es
	for linux-mtd@lists.infradead.org; Thu, 24 Nov 2022 11:47:24 +0000
Received: by mail-qt1-x831.google.com with SMTP id w9so870208qtv.13
        for <linux-mtd@lists.infradead.org>; Thu, 24 Nov 2022 03:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SgUK8+C+P84jnn4mPFsvd+MDz8e0Zg/WY7xfiup5DA=;
        b=4M0mnp20F24FRahiYaJ82l4gm6RfSBmCpRU6BnbrYq+suNgie3rrWTOP9t3Hz06wdq
         8JuZpvNwf+mEp+N11n21A9wexXOf2Q/zqQEKRl6IBbAXBVrbvhIY0xybi6kuMGVgrOGG
         WesrgNT6wsqt/yHaUTH1D5zRMHxpfduYcvELm49lfsOOqHq8MW/bCjz9PYJrvbmrRm2g
         jjC41Qgo42fGVoxS/FIUSxG/QlLuT9nqcPip8ewKXTB7FhgyG3/BN4dlEB3sc2LHDU2f
         DzgtNY5TSyFsX9hpgDOxYJFpkc7IOQteQJDtshzH8Bo0fqxig3IwFwSLFvKb6BwGsMyk
         /PkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8SgUK8+C+P84jnn4mPFsvd+MDz8e0Zg/WY7xfiup5DA=;
        b=pMqSoda2pwhpB4Tco8BRMvyNO90fOGOLG74yEyrHOboPtPxcYu+HOl8x32BxKoQAgr
         Vk67PDibqkuK1z/+TGhcXdfcO1IssNAfrwq8TrF+KzsxwlYF6aFUTu9xiBdBHc1vdIkY
         5jIYnj1NqUaKUKANxvIKefPevfSwGkljkdByfFVK/09+c0hSwdvoDhSibxIwmcj9dLHK
         YER8EDTUl455OAClqVN+ogYdxhzKyu67DBcG64tOqZzO94nn1/YnZvY7i4AOyAw9Ohr1
         QndxJuF+sC4Fyghq5/Qw79nTeYAkFF0oI2DDbr5Vwy79ZZq5/ISpuKOyrt206uioY7al
         oyPg==
X-Gm-Message-State: ANoB5pl7UPVsyHaGZUze1eB7q6g7WATh1xn/Fd4/zT+0CbPAAI4VHLj2
	gFiPEX7oZe+6FBCDBwjNQthUXA==
X-Google-Smtp-Source: AA0mqf4M6w6V8t3BsLfx3krwufUht6waa3tlVU6wdp5SKBKVv7RsMfoHiwFX2f0ypN1pXQZwyIk5Xg==
X-Received: by 2002:ac8:4e37:0:b0:3a4:f140:f707 with SMTP id d23-20020ac84e37000000b003a4f140f707mr16043854qtw.317.1669290435194;
        Thu, 24 Nov 2022 03:47:15 -0800 (PST)
Received: from nathan-ideapad.. (d-75-76-18-234.oh.cpe.breezeline.net. [75.76.18.234])
        by smtp.gmail.com with ESMTPSA id bq10-20020a05622a1c0a00b003a582090530sm454146qtb.83.2022.11.24.03.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 03:47:14 -0800 (PST)
From: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
To: michael@walle.cc
Cc: greg.malysa@timesys.com,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	nathan.morrison@timesys.com,
	pratyush@kernel.org,
	richard@nod.at,
	tudor.ambarus@microchip.com,
	vigneshr@ti.com
Subject: RE: [PATCH 0/2] These are the required patches I found while adding
Date: Thu, 24 Nov 2022 06:47:13 -0500
Message-Id: <20221124114713.132514-1-nathan.morrison@timesys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <bb6c006a27184ffa0e4ab9303cffcc72@walle.cc>
References: <bb6c006a27184ffa0e4ab9303cffcc72@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_034722_651865_BA72DF84 
X-CRM114-Status: UNSURE (   9.93  )
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

Hi Michael,

Ah yes, I just realized we're effectively using the device in 1S-1S-8S extended SPI mode, so the 0xC7 setting is probably not required.  We were never able to get DTR mode working on the IS25LX256.  I can fix this patch up so it's more explicit about what's going on here.

The 8S-8S-8S support in core.c is still going to be used for another OSPI device I'm porting over from an older kernel.

Would you like me to separate these patches, fix up the ISSI once, and resubmit?

Sincerely,
Nathan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
