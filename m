Return-Path: <SRS0=QRHZ=WD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D71BC32751
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2019 17:28:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5800222FC
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Aug 2019 17:28:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KaIcL8+j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XgqsCZZw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5800222FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SlOW8rvC01uY4ehKGe5n5M7kMLBbCrFKSWFB04nDZFk=; b=KaIcL8+jM9hsFL
	AGb2RzZorhjDgEgsRgya96AJZ6+o8pIIRhHAltckCT6D32hzXN/6oPdhJMo27gD2qS4P/3xGIAWCg
	ZbzxVdVNNOM0TMQIfqFCbs3DD0PXW27X4aM8bTAym7nXeehBEgMaMSFSDife9yRyazPmg0nA55TZg
	uhbTiwAZQ4R+YQ0AC5+RI9nuL35OQpdvFYyx5h4K51fDHCYT2c2lL4GlJWWqTZit8bIJE0zo/GWD9
	FZIliI9+mn0XJIaTW6Y5ZiqKXphewhdrWg+q9URQPZ2c13KgMkbCuihW1n17m84WfdcosfYyV60Jx
	k3nTwzqanytHsgienkKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvPjA-0006Wk-Vp; Wed, 07 Aug 2019 17:27:56 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvPj8-0006WS-Re
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2019 17:27:56 +0000
Received: by mail-wm1-x32c.google.com with SMTP id g67so845276wme.1
 for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2019 10:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version;
 bh=SlWMD/mY8njctmHF5gyM6BBV0H8KZOr3+hM1c07UsBg=;
 b=XgqsCZZw5IuVsAvHoP34Ygn49UuZabbtfFXRwRFYjcFiWsylHvaRY/3+0pba9KhPok
 AeIalZT2HQjTrjL2zTSRbR/I78V+PQbBgGfu1UAZeDX741R0QS9nVN9hSRvdHk1rZcy9
 bDYgrxaiOs3Fpji2Y9MbrVwWVOm4to0ME8w9T0lU33x/ndDrby0msdA4cc1jvuRnBG1A
 WgxARfQnls/3FyhjOXM001m51OpoudCFskPFbNianw092FZjRlUzHVNcrHwUKlDt3chQ
 +2UOp3zSDVGHj8PiXZxmdNr6F9ZjBvHGV4OZ/mzJEb+jKVRDs8shCSFvrmiOboY37U8B
 JpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version;
 bh=SlWMD/mY8njctmHF5gyM6BBV0H8KZOr3+hM1c07UsBg=;
 b=KoqIH+nnzW4Qmrih0XAq7WVhpYlfTP8yUgcNumaMHuZJHxvv2fUwaP08AozFusI5b1
 /eNCGOcoOQXAXqyvFG1hClh6cbZHISc17i7an0YoVNqzkarBH8fznsZ/NAhbQpEI2RHB
 M+E8yw7VKlQCeRIQr40dQPzoDy8yBlbDj7+VXxz3qnQy9pG1Yc7D/u6v72vLnb6Rdt+v
 9nCry+aJDsX6i8mh7t9NleOByvX/w+dhalBGeoVUcOJsN4PkrON84PA9fvBOw9t0+KL4
 +S42EvehzTWLjRFDdoILm3WBYAe00UzIoQdJWRPl8292MULdk/dO4Fw2FfBmThkVgCNc
 i2uA==
X-Gm-Message-State: APjAAAUmAIzCvhqD15ldR6dmO0oru+Qk27XEqs8DSMwY822HN5DAHRLa
 ghCtdmmlRN3MwSB7b2CguuBC6rbX
X-Google-Smtp-Source: APXvYqwcOMXA8Eq0PtPvjJJ6v7b5cqb4kPZeOZ0B4/eSzYv41M1HfOexv101HOJZB4RQ/raWBi8dxQ==
X-Received: by 2002:a7b:cd84:: with SMTP id y4mr966579wmj.62.1565198873145;
 Wed, 07 Aug 2019 10:27:53 -0700 (PDT)
Received: from localhost.localdomain
 (host235-138-dynamic.251-95-r.retail.telecomitalia.it. [95.251.138.235])
 by smtp.gmail.com with ESMTPSA id o20sm232353471wrh.8.2019.08.07.10.27.52
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 10:27:52 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
 by localhost.localdomain (OpenSMTPD) with ESMTP id 7eefdcb8
 for <linux-mtd@lists.infradead.org>;
 Wed, 7 Aug 2019 17:27:49 +0000 (UTC)
Date: Wed, 7 Aug 2019 19:27:49 +0200 (CEST)
From: Enrico Mioso <mrkiko.rs@gmail.com>
X-X-Sender: mrkiko@localhost.localdomain
To: linux-mtd@lists.infradead.org
Subject: [mtdblock] reading regions where %512 != 0
Message-ID: <alpine.LNX.2.21.99999.352.1908071924030.11090@localhost.localdomain>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190807_102754_921469_CCA8408B 
X-CRM114-Status: UNSURE (   7.26  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello guys!

first of all - thank you for your great work!

I've been experimenting an issue with OpenWRt on a TP-Link Archer C60 V2 device, where an mtd region has been defined so that it's not 512-bytes aligned:

mac: partition@1fb00 {
  	label = "mac";
  	reg = <0x01fb00 0x000500>;
  	read-only;
};

So the region is 1280 bytes long; still reading from the exported mtdblock device will results in a 1024 bytes read.
This prevents users from making proper backups of flash regions. I don't know how many instances of this exist in the OpenWRt tree right now, but it's not clear wether we should fix this issue in the mtdblock or defining regions differently, changing their sizes.
Any help, suggestions or ideas very welcome and apreciated.

Thank you very much,
Enrico



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
