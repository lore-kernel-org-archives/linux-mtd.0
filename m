Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40138C433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Apr 2022 00:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=57LEEdTsTvS5j2jAb90MB2qw8RH+EWUDkmXUZxKMX+E=; b=uBfjQ11LrWqgo5jRNg9AZu2dgq
	3+xHsPbdSuj3KgmKxCLfjnXo/n5+bAlSb3mY+8IsqAV1xisW0swT6+1L86Eri7NSDDnLGQCnDe5k2
	3q3YWxvDLbkk4SVy9I5hIaU8yhhxpxRdbr8PAO8HOs5of8Li53j7y9PF68ePniW5WUWoni24fqPik
	23qDhDRM7dXcldmze1LY92ktXSSkWjDwtuX2ooqJqBM8HfHMuNaQOfeG6jwBfuEaJ5mT7nMcDM+UX
	iKs6Yz0T/4lKQdf1y2Qh3oZWy7av+43CRkWVZQoqUAzN9G5WwEkCTIeTj4HY8BTBRARDbOFmirBRe
	h8NX6qPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf9b9-007rdS-Oh; Fri, 15 Apr 2022 00:14:03 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf9b6-007rdA-IZ
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2022 00:14:01 +0000
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-2ec44c52e7fso55812447b3.3
 for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2022 17:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Gevz/8s4aTZa7UyionFqz1/O0wnMKNH0sOq9DFAK64A=;
 b=cHodgi5G8YDwnd+F/sUNqeULiv5a2otEAcRL114qBW2xlh/SRBZdEjfgDO6fZYvM9R
 GtJUidXJWIGyT1Zh7fpPTknVt1yHFQuF8CFz6t7PG9weYbfNqhof9A9p89iBAkI8y6am
 LSuEfH52/f6DDWKQ9Jsx6fwiO8Xs+rfy+L3Zvt5WbTTwi0r6ydjYRJNAG4WL37wtwl2g
 4i4oER60OYbZN2a8k5A7ZeCxDarZ1wQh6jy7gCtcHBTG1gDTqUriLYsr5e7L8BmRU+gi
 XNaDNDKN0Dbqv23g+jRYNirSlFXxOeDq+JuwLn6yngSyjxEafTxEIguTTRcBwof4Cvjr
 Y0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Gevz/8s4aTZa7UyionFqz1/O0wnMKNH0sOq9DFAK64A=;
 b=MVs5jci6jrGN4QLFiXEZoi7E443/Tr1Km5hmepF9+D2nkh3efsaIpasvzC+J/wEK+4
 XOINCv5q1b7BW904x7TFN5BdF8XYmTenjaD+mxeU+NBMQcLhZaz/X1buuOzbyOe5HZoV
 v6PCH7tl3HZ/D9IbUVIwAkUkiP9KzZ50s8QKD+3yGb78VTQOBfx9D0EJY1pvY5Rf/URB
 B5CelSGrrnef+lLzbum2RtDS8tf28K5hUQcEL4Fmj9ip4pZAtMPqf0Wc5Eo+AvZIPbwe
 5HQj5Kgo0kjJABS8cU3JvubTUVPS4yR98x5vLL1zvkV+EafmFLM7tphNgew0SYp4Abgl
 fCeg==
X-Gm-Message-State: AOAM532emq/BKVpaiAcJTtfMi8sTygEGp63Q8ssZzYaYeyIXk31YxPz1
 pC2kFh/B8tA9qzBKPyyVpRf00faOmCyP
X-Google-Smtp-Source: ABdhPJwrid+hNYnF7HPIwgJoxOUopxCoZtb7MzlmmsoaM3mFgprbZJzVZz1qPEl6JzQ5fEmn7MaTLTvwmK31
X-Received: from pigloo.svl.corp.google.com
 ([2620:15c:2c5:13:7d77:8cae:9dfe:95c])
 (user=jmeurin job=sendgmr) by 2002:a25:fe0c:0:b0:63d:958d:bf5f with SMTP id
 k12-20020a25fe0c000000b0063d958dbf5fmr3696825ybe.353.1649981638133; Thu, 14
 Apr 2022 17:13:58 -0700 (PDT)
Date: Thu, 14 Apr 2022 17:13:18 -0700
In-Reply-To: <20220207163409.19c3bc4c@xps13>
Message-Id: <20220415001321.252848-1-jmeurin@google.com>
Mime-Version: 1.0
References: <20220207163409.19c3bc4c@xps13>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
Subject: [PATCH v3 0/3] mtd: mtdoops: Add timestamp to the dumped oops header.
From: Jean-Marc Eurin <jmeurin@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jean-Marc Eurin <jmeurin@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_171400_670784_8D81DD33 
X-CRM114-Status: UNSURE (   9.11  )
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


The current header consists of 2 32-bit values which makes it difficult
and error prone to expand. This creates a structure for the header.

Some oops only have time relative to boot, this adds an absolute timestamp.

Changelog since v2:
- Add a timestamp to the header

Changelog since v1:
- Create a header structure to simplify code.
- Patches in series.
- Patch prefix.

Jean-Marc Eurin (3):
  mtd: mtdoops: Fix the size of the header read buffer.
  mtd: mtdoops: Create a header structure for the saved mtdoops.
  mtd: mtdoops: Add a timestamp to the mtdoops header.

 drivers/mtd/mtdoops.c | 61 +++++++++++++++++++++++++------------------
 1 file changed, 36 insertions(+), 25 deletions(-)

-- 
2.36.0.rc0.470.gd361397f0d-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
