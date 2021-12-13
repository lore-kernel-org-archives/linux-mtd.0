Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622DEC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Dec 2021 18:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CyWZOCZzxcQBrvWrMjm8Ds++r0qIXx36UyLOksXv12g=; b=FUYFgRYKvutIwn
	STWjCE9nn7FwbAH4ha5kCRDjKVMX7IyRCDxqwZZVlHUVqFlIVeFFnIjRZoOfvT2ExEyjpzUXALNG6
	2BFyjRxiuUdI7HsW7ytXPLAkAjGTfr+5xgF1KlIl5WSXYMZVfl0u5E1OQpg0LLrhm5eHYyRlcaxZf
	B7Oey7Xf++v5JH3aj70A18ALASuwTMEqqEBmZ3xmjkzD6/0NOb334A5oZjA7KjIJ0T27fc8ZHtF4v
	royiB3As2+x1DvOm8HyTNC8q8cMFDFItC1WXkKBnSplT46YDNqwPyQQwIHZrd5gUmNE2sM83zcx10
	IdmQ5KYFE7f5UM0xCtwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwq5E-00Awbr-SV; Mon, 13 Dec 2021 18:29:56 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwq5B-00Awb2-7e
 for linux-mtd@lists.infradead.org; Mon, 13 Dec 2021 18:29:54 +0000
Received: by mail-oi1-x229.google.com with SMTP id o4so24322200oia.10
 for <linux-mtd@lists.infradead.org>; Mon, 13 Dec 2021 10:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:in-reply-to:references:subject:message-id:date
 :mime-version:content-transfer-encoding;
 bh=yAnwtDa+Q46YbQ3nbqcUNlbKe1HKgMvVM13990TJIfw=;
 b=cK7QtU/ftWtLVr9hCGNn0l5JhTkdh48uSBw5hHxcjSpA8/K3daDdtiIvM5mnNJuJ1w
 XwugPjbs60t3Fn3RV+E2xcQIxFYXfjB27Nu34u8B5lj+JcMzpRLlybA71DY3zK4mA5f3
 f1FBsji4xv4D4xtGWPT+A6OXEV7DCa/ILyxxpN9BL8VI582wMMjjsU5ZJ0lCGKGQZ+Dd
 1+F4xxLAVgRylVruw58Kd7qkZRx1MbVMDr6EFlyTMVsdpDHx3yAvNOUSNjdf+HR3jqLV
 rmE4WgieLqibx4Egc0/Ia/D2Glhg+QeXECZ22Dbqzg7n0rcodFNeSqADFYgVsNXGAAHU
 oSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
 :message-id:date:mime-version:content-transfer-encoding;
 bh=yAnwtDa+Q46YbQ3nbqcUNlbKe1HKgMvVM13990TJIfw=;
 b=DhcfXHLIxw+pWuaW/f7eISAPEho+I+0Yj5NHujY7D+Qo2cpi+AMgTyrhn5Vmj1lMAk
 HdTds3uHUFKVgR/E6WFw1oD/b4XKsWb4NzC89R+RZp+nrvZMlYR2FCWpMqYkVTd8fXhW
 YuxHhu3XD/W3KeumeSeNYBg9qFNTbvPaf/JQgswAGKngbIPuqKJ1eh0uT2uskIkc4Ezw
 t3W4zzohVOYKUNuKNQ2tTEg/mIEaFn/BfPRKOoZVLAnPimNeNuzHEMRvs+RBg0/vse9Z
 PNCLlU/5wGd6+vr0dIsLXz8Sud4YFx4z3dANEJMLHa6tACHeSeDcJfkI29Fli8BcLZM6
 I8Mg==
X-Gm-Message-State: AOAM533AuLcbFcAQIGTI2qH58v0Bq4Mh309mCRoAoThV6e3t02kdj38+
 qD1abV39C100Xm8RihGP/ee3tg==
X-Google-Smtp-Source: ABdhPJxXIDuiQECtaU8qcFckWJ9ftSmkDTm/b+nJlQHcWuZisuaqTqTMi8FEDwvUBQlcg1KxH1UyCA==
X-Received: by 2002:aca:d606:: with SMTP id n6mr29171252oig.76.1639420192292; 
 Mon, 13 Dec 2021 10:29:52 -0800 (PST)
Received: from x1.localdomain ([207.135.234.126])
 by smtp.gmail.com with ESMTPSA id v12sm2285374ote.9.2021.12.13.10.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 10:29:51 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-block@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
In-Reply-To: <20211206070409.2836165-1-hch@lst.de>
References: <20211206070409.2836165-1-hch@lst.de>
Subject: Re: [PATCH] mtd_blkdevs: don't scan partitions for plain mtdblock
Message-Id: <163942019142.141720.8766753069617616299.b4-ty@kernel.dk>
Date: Mon, 13 Dec 2021 11:29:51 -0700
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_102953_345438_1178722A 
X-CRM114-Status: UNSURE (   6.27  )
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

On Mon, 6 Dec 2021 08:04:09 +0100, Christoph Hellwig wrote:
> mtdblock / mtdblock_ro set part_bits to 0 and thus nevever scanned
> partitions.  Restore that behavior by setting the GENHD_FL_NO_PART flag.
> 
> 

Applied, thanks!

[1/1] mtd_blkdevs: don't scan partitions for plain mtdblock
      commit: 17f81f9d4b41d57e474975c3a5ca2a2c4c01e2ec

Best regards,
-- 
Jens Axboe



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
