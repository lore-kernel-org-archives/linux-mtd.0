Return-Path: <SRS0=WWUw=ZN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC645C432C0
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Nov 2019 19:55:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D08520659
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Nov 2019 19:55:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GLhgGFVf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCPaWRIy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D08520659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=RnrU9z0Hkqt/gXoWPf4uu9ZHZyboNtRhO91uN5QLV0k=; b=GLh
	gGFVfPtakv7EtUlTzOq94V9Au8/68fOcJlyZxnQ0VSuL+Sh+Q1ouSsQ+33a0qZkRhiMC2AehNuKHc
	ClrVjgK4nVfk/2MXLcOEGqPeksWC9QiK8u5CaRsHtwMxHfHjVS5d1R2Ej/FG8jX/7gmFCHKcOAbfw
	fTYkD2dy11YFVUC2FwDRBH2qV3Bv53HKGa0qga42+gNYlWT8Wv1Q9crxv8Mun1kp2HRinPq4zqzH4
	M+3hD+cnbATpbdIKBXY7QM1nBZmvE7EF7fxPIYEwab5815isnTGoQm9yFGRhme5Ut4bbfSOx2YHkr
	yunDEfVEyAsDj9X49Ice0zEAp5fDnbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXsXQ-0007fZ-NI; Thu, 21 Nov 2019 19:54:48 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXsXN-0007ah-Ns
 for linux-mtd@lists.infradead.org; Thu, 21 Nov 2019 19:54:47 +0000
Received: by mail-io1-xd2e.google.com with SMTP id x21so4963940ior.2
 for <linux-mtd@lists.infradead.org>; Thu, 21 Nov 2019 11:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2eu0F0T8oU0bzUVUCsIqoDUK61prCYJNl0UzXCdMdoI=;
 b=NCPaWRIyilUWcVU+jLB//KQCfMY8EVAKpZme0SfrqbjJjRy3HLXxHZQ5qbB+Ri0zgq
 gSe7p4faq0cVWqXoXGUtSWHRg8HZxWnZpwsRb4JaCOJVxDDoEl5UREY9gqLvEnZezfNq
 nJZh6ww/55Nx8n+/zT+7hW1d5YX/hUGCmhM0TlZ8eoTNgCW5SYGVXJqtdXhCkCOQQGXG
 hFsuDR/60myS8fpSsYV/ns4fWSUz2bUAYToa/pQ7UhPEj27nW7/9IeJwO9K5mAe4w8pZ
 maOaSa0MoQ+pggs+9rYudh8Fs/9+BNmY6USWAYtYXqkhAEgJzwVJ2aep6RZVGYvmhGu/
 BpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2eu0F0T8oU0bzUVUCsIqoDUK61prCYJNl0UzXCdMdoI=;
 b=getBjKSuFYMmQk5BKcqPjTZXikxhBBUNskfq9BvdQfJKs2+b7zN7m1qRn4eoiTI81N
 bscYdf2RZ5l717FrsMSsHHirfWRI4az0Ue8pjVepjjxPKH5aJDNNHjfEEw17OYDwP30g
 d2ijNrFoml1TGcDc1xAhDSP7V7kMyOuKKuMzDmqcc7UO7MFoo9Xw+FsV/xQnpd4+uZpn
 KyCPlsONxM12QRCf7VnwYwFiWldZ1HLr6q6nQcd7x6+cui/odQ32pOil/SeqZ6JVxxTk
 sN0KfVcPlBUjxEDpOGe/JiHPefccHbo2x8M7Cs/+PbxmWWqvU49V24idnM5msDw03X7f
 B3uA==
X-Gm-Message-State: APjAAAUQRxk4KUl50BAVGPcrnTHhUdyFmmr6zDo/6zosJRDdiUMFqS0p
 tsp7fBIAHrsorwWM8XWk7cG7cOvJ2ylYeY/LXhyXA3eW
X-Google-Smtp-Source: APXvYqw398P/e36DkUmaCdWHywkrN2YdzifMUnroDMMCn7n1U1WsIJGme8iwI9z9ZHjVt6km79FyYCYY+nfxmDaNzYw=
X-Received: by 2002:a5d:9602:: with SMTP id w2mr8806916iol.34.1574366082789;
 Thu, 21 Nov 2019 11:54:42 -0800 (PST)
MIME-Version: 1.0
From: Otto Blom <oblom586@gmail.com>
Date: Thu, 21 Nov 2019 11:54:32 -0800
Message-ID: <CAOfSrV1CNn6EpPkAkP8F2VQUrit_B-t89sSxW=08zyKVOdt9AA@mail.gmail.com>
Subject: mtd-utils io_paral test fails on NAND
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_115445_804477_A088A83D 
X-CRM114-Status: UNSURE (   7.69  )
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

Hello All !

A couple of updates on this problem. Turns out io_read also fails in
the same way as io_paral - A page of data comes back as all zeros.
Interestingly I added a retry option to see if it is a read or write
problem and turns out every single time so far the data is correct
when I read it a second time.

In summary when I run runubitests.sh it passes about 70% of the time,
io_paral fails 25% and io_read the remaining 5%

Any recommendations on what to try next ?

Thanks in advance

/Otto

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
