Return-Path: <SRS0=KHzd=5S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CDA3C43331
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Apr 2020 21:48:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB1D720737
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Apr 2020 21:48:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XJ9eMXEV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="pEvJFIoP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB1D720737
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ms5Hgvnd69ixBGR1VJLPrYtUZTZmGMIDQxEjuhpdHY4=; b=XJ9eMXEVvdTDIA
	gjHDN7EOGrT1MG6zlOdwnU/tHBPqJamJ4+OtRjpJ1eY3VQWW+qo38UckujLTOij9azByvsX4rmlP5
	5qfGIolbakiWxhJ4vSqh2+FCu/sdfsGTCXP85I3c5vjxjhcXYE/eJIUOnKh2Xe2ezy2jVXEZYI6+R
	F+b8P2icEChUY849Luuf30TCd9314iDd3/LUmAxMUe8tltCp1xlgyQowyCXZ6BQMPo5iTmHHmL9/R
	bVREvmdfcQ21D5419Q6Ewwq/4YjyCvEWL7UJQ0a0+13GOavgfwmUI+RdReDxTzW//GsqAuDAYVtYW
	bXeDCrWCy4t80k7FpGdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jK7h0-0004sY-60; Thu, 02 Apr 2020 21:48:06 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jK7gx-0004s5-Sc
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2020 21:48:05 +0000
Received: by mail-lf1-x141.google.com with SMTP id c5so4066755lfp.5
 for <linux-mtd@lists.infradead.org>; Thu, 02 Apr 2020 14:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=axKmQo46WjU16byxW5PvxK6kAgVjTo6T5C4Qee74E4g=;
 b=pEvJFIoPzFHnZbTHRiFs1KjowNvG1ebE01sYKiM5F0DaxtNVM0AhV7v+OnGqqoBtFi
 lRYU/neaPp7l2UqNxbW7AW6v73tNl30PT7AyN6RTsuOkr0Qaamv1oIItusSmRcUHjM/6
 3ewaFg2CGIVMU99OaTrk6mpB3/EOr5Z68A74jCH9uzJ9o6eDPhs1Ku5MDQTrJvsXLJse
 w0BnWz66gr0JDhdFGi4z1IcbdlP3OgbbGBT4BJ9mg9sh46h5aFM7HhLR1X9QUxSpyBf3
 2LnKQ2kVjfLvtjJywahbvlLv51Nk8ZvaPyCNV+pFLHJq8Wa2j+3TlXwAbhLbOjEz1lIk
 SD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=axKmQo46WjU16byxW5PvxK6kAgVjTo6T5C4Qee74E4g=;
 b=I3UqlN9+qMYms8Vwy0t9u2JPhgYXcRXWfykMZvb6hfP86D2rewAAK6XuHzGO/8ZZ3C
 9nO4Gb/cP88vJbrE/lrJ4AgqOFVB36Vlz6mt4cbCmFsAyA2fS/DXoGWZLiNQFxInCKYB
 /jTNwWNOxXup0DkMRGK6bvuNmKg1TDBUDaOMKrvDgd9jdgFwF+2SSB5JT4ijebzYR2qL
 I686mctEhr85WuzRM9hmctvu3miF/yQhNVUmDTjRSnofYZL0G43TzlRkk5r+GvE2r2Ni
 U/otUZ1GE/A1kOARYxTFKVNGB9DDqpKQC+lzxT8NNvZtr0P20jneQceAQvtawhJ6NmKT
 DOWA==
X-Gm-Message-State: AGi0Pub6Z/8KBMKqEhIqXp+zHWXOt48xIzurSr4BDvufwbUPMvOZyNAI
 w7O14Sc/FtpLDPP9MEIohJlK2K6zR64=
X-Google-Smtp-Source: APiQypJs5KfzX4hArhqvtQvktLvUqVElVFwtvriPF7qb35e0rUODJtrhscNAFHtDOsfd7RfxYpm8mA==
X-Received: by 2002:a19:9141:: with SMTP id y1mr3375578lfj.168.1585864082193; 
 Thu, 02 Apr 2020 14:48:02 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:638:9d01:50cb:2c0c:a09a:3ff3])
 by smtp.gmail.com with ESMTPSA id j14sm4732672lfc.32.2020.04.02.14.48.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Apr 2020 14:48:01 -0700 (PDT)
Subject: [PATCH 5/5] mtd: spi-nor: fix kernel-doc for spi_nor::spimem
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <a2577f42-a21b-e7c4-c550-f6ea1cf94cf0@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <32653bcb-da84-4602-03ae-5370d17d051c@cogentembedded.com>
Date: Fri, 3 Apr 2020 00:48:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <a2577f42-a21b-e7c4-c550-f6ea1cf94cf0@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_144803_944887_1A8853AF 
X-CRM114-Status: GOOD (  15.41  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When adding the 'spimem' field to 'struct spi_nor', a grammar mistake
("point" instead of "pointer") was made -- fix it and convert the SPI
acronym to uppercase and fully spell out "memory", while at it...

Fixes: b35b9a10362 ("mtd: spi-nor: Move m25p80 code in spi-nor.c")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 include/linux/mtd/spi-nor.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: renesas-devel/include/linux/mtd/spi-nor.h
===================================================================
--- renesas-devel.orig/include/linux/mtd/spi-nor.h
+++ renesas-devel/include/linux/mtd/spi-nor.h
@@ -557,7 +557,7 @@ struct flash_info;
  * @mtd:		an mtd_info structure
  * @lock:		the lock for the read/write/erase/lock/unlock operations
  * @dev:		pointer to an SPI device or an SPI NOR controller device
- * @spimem:		point to the spi mem device
+ * @spimem:		pointer to the SPI memory device
  * @bouncebuf:		bounce buffer used when the buffer passed by the MTD
  *                      layer is not DMA-able
  * @bouncebuf_size:	size of the bounce buffer

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
