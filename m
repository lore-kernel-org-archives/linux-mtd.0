Return-Path: <SRS0=O+nk=6A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC50C352BE
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 15:45:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF16420732
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 15:45:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="izJ4WDzs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Mq3ssRHn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF16420732
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=zGKiAmB2/qehyR+LzKQ+Yil5xishPljBhAV5STJqEEM=; b=izJ
	4WDzs0oKnS+rkGy3+5rSYilMTrEyXZ+Hz9372xiu5DLsIEMFjMBa0Mc8aW/diSdYHeQqwijsDFJfm
	pxyt0i0uMalvNuhP47wtd2NW+uVPURthcDk++Z3rhf9BKTTqGMz9hDDBh/uCG23EZMhNrtR3vN4lH
	CgCgCa25w1X8KQzpqYzHAw4NjmuINQMmJUnDjdYUy6HCQzvOo+m+szJyb92eGU7aVQlWRYdtjfWhj
	+4Djz3SqUvNvL3aAotQFM4z7XTlikrMR+b8MqZcPVRc0XwCmAAw7Bc0hFOU0AC8yRhkZQ8Z+dDA13
	RrxfMijUf8xjYEqCVpuUITQO5gLPi2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP6hW-000873-D7; Thu, 16 Apr 2020 15:45:14 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP6hT-0006sz-1O
 for linux-mtd@lists.infradead.org; Thu, 16 Apr 2020 15:45:12 +0000
Received: by mail-io1-xd34.google.com with SMTP id b12so21467356ion.8
 for <linux-mtd@lists.infradead.org>; Thu, 16 Apr 2020 08:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Zu6/BaNZDVgKF+RS0/LZnF2fl8mMzQ5ttsphanChzWg=;
 b=Mq3ssRHnaGa6Sg8BQFjhSzhdMNkImkUMm/QP93J7AzK+9GDlBq5O/9VQxK/HzUCsoa
 Eciz2+9rxhqiPaL9x+7lILMHglMUCWx+Y3Q7BLbVz+2j3LsYeK3dbLKBqMfXqp6JNzGw
 s8ba0ebjCmRflGmRnqNDZ5Ky4xzrAQgT32Hp9CBFFOprU7pJoTxM3d0dva7BT2DY3dxz
 QgSuYzsLdjjt8/0eCcRL0a3+hN0Y45GUdw6rshwkm9Y06C06H/zKPz1/Uf/rXAIuHFWq
 QNcRwyfswcoUh3+/AkSPVe8Mn1Zorv+KuTP57X0A3bCWPua+GwflfS7YTesSsJVRDBSX
 0exQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Zu6/BaNZDVgKF+RS0/LZnF2fl8mMzQ5ttsphanChzWg=;
 b=tluhvvRqgs2fNpZK7FYKvk+ypuziJQ4QJ3UkrIhWXxUQm9Z2Ct7kqmEj/sArobU/nz
 3lHYAj5GHq88IgfoH5giVS4cUoC75oIDxDv+oWMM8E1MMSvKa4ayWFC3/YH5++C3EZyg
 6Ny0g56TVeTWxYg+KG0j473q4rwhuBSuwjZ0l5TwT5oL62rTvYfdKYiUCrSA5T1tht/y
 eDOcERDdMwae2DCubytj+nnSQ2LlNOtjgnkDrtikCN2ndFgZjCgk0Q55tO7OGDwuNlz9
 6rVm4Eav79S8wmjvQ7d9XXTq9ZZwI5nhIcRb/mZTKOM9Ehmnj0yJYrYINokzJU6uQmY4
 NMEA==
X-Gm-Message-State: AGi0PuYuUaOu7WAq2IiyvviuGGS40qPn6K3DjWFidiShZA9tf3ZhzT4P
 nr5RvjA0J1wIz/UBN1UT57I0I36SfNl9qC/ro7PYIxw490c=
X-Google-Smtp-Source: APiQypIea8rsD9u1jAKPuRascNi68BTBZ0WL0jdwYplE61SQQzVIAxKV/Gfss7vjLZiADzaX0HNPhLuYvBqqrEmYAZU=
X-Received: by 2002:a5d:8744:: with SMTP id k4mr9050027iol.62.1587051907550;
 Thu, 16 Apr 2020 08:45:07 -0700 (PDT)
MIME-Version: 1.0
From: Ron Minnich <rminnich@google.com>
Date: Thu, 16 Apr 2020 08:44:56 -0700
Message-ID: <CAPAv03NygZR1vOCHrhVcSotkCHKVxxwe0Y6Bpz9_LLKFhqS0bQ@mail.gmail.com>
Subject: question on spi-nor/controllers/: nothing builds it?
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_084511_122992_67B1C4C1 
X-CRM114-Status: UNSURE (   5.04  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

I'm looking at 5.7.0-rc1, and I notice there is now a
drivers/mtd/spi-nor/controllers Makefile, but for the life of me, I
can't find anything that builds what is in there.

Am I missing something? When I enable CONFIG_SPI_INTEL_SPI_PLATFORM it
does not get compiled.

thanks

ron

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
