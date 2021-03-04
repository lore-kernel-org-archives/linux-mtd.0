Return-Path: <SRS0=6kki=IC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137A8C433E0
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Mar 2021 13:36:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A698164F09
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Mar 2021 13:36:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A698164F09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Message-Id:Subject:Date:Mime-Version:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7QfudFagO0Y7k7Cus3fABtF55uu3uW0caJZWhJa4nMY=; b=TYATNJhGiauUrl
	LOi5p4AWPYmO4vYzYDOMPhv56g7XqL5bMvEg0fYYNCze+lJsG/eq1wlEFDAEuuzGNSuXVXDRnqm4d
	tTVh/0cQzmVe2yQ5jDJThklz3xR/+yNas09yh2hH7iqT4E2nbFfJyzECREEVL6SD1WjZnDkZCVcUT
	jebn0TDnN5ky2ph0Kuls7uVDjVvOQ91+EKZY3V/JDa3QxIUom4fXA19Ch67uYvDmGB4/OpWZJRCOp
	P4KWRDzjslArRCnCYJwgrdwbmEeHhIkb6BcUQa0u/nkcVXTdq2QyVQn7N1+hBvosF88yUS3rRMYym
	DDmVhmrwjBE+AHtz8gRw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHo7a-008lLv-Fe; Thu, 04 Mar 2021 13:34:30 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHo7V-008lKl-4d
 for linux-mtd@lists.infradead.org; Thu, 04 Mar 2021 13:34:27 +0000
Received: by mail-qk1-x72a.google.com with SMTP id g185so8393809qkf.6
 for <linux-mtd@lists.infradead.org>; Thu, 04 Mar 2021 05:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:date:subject:message-id
 :to; bh=0xfU8fHy2pOMkIB+S1kXIdp7nFisNA/HAD9cKVED4Fo=;
 b=boauo+hgWv0mrBvf5Sid1qjveYpHXhIH79UxwimmexszoCbk0b0V14deCMoY4HApBW
 XcI5Dqjr10HTuorlncTJU6JXykQDlwlni5tT3QGE/G1EiwYRoLDROOFn+66XWi12bSYf
 s6pGNGBrihx9KGu7pz6nj3Opmp3VMTBXHCJh6ml+bZtqXgxByBcjV3E8eKP3WJwdFPRb
 RmxQW8txSnOgJABI6DgNsLJKs789rpT3QjI5uUoAqnUPPagY6ukGQ/HlkIHUqaC2RXAx
 WnLqMTq0ivrOo7jWdRhZ5jICkxt2mNy8D4IGLDFQbdPmxoaVQpHE+JxokknWjTSuDuri
 mGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version:date
 :subject:message-id:to;
 bh=0xfU8fHy2pOMkIB+S1kXIdp7nFisNA/HAD9cKVED4Fo=;
 b=FwGFfzRbHHc5TWUrdl+jLfCKj0cQZ6sakhPM84clgfmAB7Jhz8TKB8g5oQrgEhS/K8
 4Zpxnha9N1YI2rczlUBmXwRXQZ/n5qyAOZLjwjfD82fnMuFQr8RDH/Sv3FWqaprabMPG
 EN3aa1NhTo+CXOhwRgP5SCHOITJyKXleNlsQnI1ZxCgw/CcE34iGngvHaBrbjT/Horat
 m8yJRERcoNP8uhrocoNP+/3myyNu2430ghNnWtzABU09gYEjFD17vld+YRA4p+YJemiU
 zl6RavLCMNQ3/q0cftE9ujiPl+/y91hf/hGJ8JQyJHfoGwnEXQXs57U0qlrbJOS4LehP
 qLKg==
X-Gm-Message-State: AOAM532x0CiRVIoW7oUQ7oIEjkggoKQ2nZ4WhczGlwpPuF26tX++tXYG
 j6D3/+rWJ9c5GLZG9Z9pkPj0PKEj4+0=
X-Google-Smtp-Source: ABdhPJyOBuRFMXlOw2f4TuA+/tCc/vUidN0EasbeA5JnCv22YpvgGKMxO5rOoT/dzSxHx5WVmEQ/Og==
X-Received: by 2002:a37:9e88:: with SMTP id h130mr4006183qke.301.1614864862559; 
 Thu, 04 Mar 2021 05:34:22 -0800 (PST)
Received: from ?IPv6:2600:380:8c22:c962:7d26:1409:5811:9654?
 ([2600:380:8c22:c962:7d26:1409:5811:9654])
 by smtp.gmail.com with ESMTPSA id p1sm2882839qkj.73.2021.03.04.05.34.21
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 05:34:22 -0800 (PST)
From: Justin Mitchell <mitchell.justin.d@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 4 Mar 2021 08:34:20 -0500
Subject: Artem Bityitskiy
Message-Id: <0F6EA409-8DEF-4759-80A8-2B5DDB1A5138@gmail.com>
To: linux-mtd@lists.infradead.org
X-Mailer: iPhone Mail (18D52)
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

Hello,
I am trying to get a hold of artem to help with a serious issue I am encountering with Nand flash and bit flipping. 
Can you pass along his email kindly! 
I am open to hire him as consultant if required.
Thank you! 
Justin 

Sent from my iPhone
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
