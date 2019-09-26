Return-Path: <SRS0=cKKb=XV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F05C4360C
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2019 14:01:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 442D0217F4
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2019 14:01:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vDD36UCn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfYJbrUJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 442D0217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F+aJbNKy3C4u9W6LhXhllT/eubyXTVwJrBVtm19/cq0=; b=vDD36UCnE+aXhE
	41tVPQGOYrOEQq6UHZQsKRcMRmUeLuiXyWE64tMLRVajwpDrJb8MZvV67B5RV1yorwq8RuRoUHWF4
	M81sTTtETsFOXqj1Ebin2xSY8NCnbclgsVInr7aAldKKI9+OgEGIGbIzpGFedcuN6KuZc8/yPBvL+
	cYNuVSVCimABKjbPPhCAguVTXr66JKxB/3cbwUjaUrRTCsmgD+zdt+WXojj/rNuRSy1psgX9KIxSE
	c7Sv+oYsPCk1I9tVTmJGkI3gbySZHSddDuVhIp+omAZF6BHrtjau/RQMHKkpQWUJcC1UKbHl/stIX
	T+9nmrQVQdMZRiQLhxtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDUKO-0008T0-Ci; Thu, 26 Sep 2019 14:01:04 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDUKL-0008ST-Kw
 for linux-mtd@lists.infradead.org; Thu, 26 Sep 2019 14:01:02 +0000
Received: by mail-wr1-x444.google.com with SMTP id v8so2927480wrt.2
 for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2019 07:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zuOCPbahQZK/QVR/8BEIOZS78AVnpRD1F6+hJm6hIgM=;
 b=mfYJbrUJTBl5hvb3jGlDDeybVVS9k1uN5b4Xj74/UXooCDhqpjgyn50OLtU4uCDUeT
 TjWpBAValsZxG+l0muOjSq1C/lys8Od8BtOSVCGCYVZQ4JWX7IH1PAObyNRL0k0sG3X/
 /Nqi9C334kk7DnwYm/ZZdua3aDXTsR3r4770BWo0WUjO4I3zwd8EfZjfOjkWLv0wO1cl
 9QvoCyk32SN8sRO5z0mUpH8IQYOpQOFQFUihfjVH7gm6j3CvpXLrWa/p3AGXVVpPjWWu
 yNVQtmMFrmp/6Jc2bDaUgZMRm0Z+qIF7fKVKfLyrKcYrTS0u0B251ZH7jWslw2UTfLYk
 8DSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zuOCPbahQZK/QVR/8BEIOZS78AVnpRD1F6+hJm6hIgM=;
 b=Y6vJ/tgyW7IWiO9xATQtOsJ8t5NfzzPW5lWD9XshUAZltdZKkT4+7bHkl7Xe+SsgUA
 92gqrzNPa6sEEWmjSLB+LfWC4rEIiDuobu83qnwU665Xtm9CzDAoYrjC/7vpdAbkfZ4/
 qhRpdF9UFNxnJeGzgUkf7ZHgKjJBiFg+vx+iNSM4ulPK2FGWpOlVPUYVJ2nCTE0xCTzi
 UXr0HIbRaUzXRbJ8l0c37TmAsBJI2URpAx6oXE4gCHTR5nMyD2KF1gI9RvsXni9XL1yZ
 IiO1+iAzjjpVd45P4NH/9ddQqEIZbpTXM9elS7WHEYOXVN+JeYycrnmKj1GOSNF4q4yc
 ZJsw==
X-Gm-Message-State: APjAAAX29He3oisB1+vDFKxq+tbGHqMfS9v0lVHelbpEG4aPkwKgXtCC
 cJcjaGO0+vvxt6X1YMymWPBkBDgQgufMr6SCRTP7wYph
X-Google-Smtp-Source: APXvYqw0vZ9jZV2H1865f4dZ5Ebib+p+d1BBZkrifVWE4zAAsLpJ1NDgGUukxw1HkHjQgjhdxceG3jXQox9X6Ld9Iss=
X-Received: by 2002:a5d:5708:: with SMTP id a8mr3033677wrv.240.1569506458952; 
 Thu, 26 Sep 2019 07:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190725203442.29795-1-richard@nod.at> <1846895.TZtMPCjSJF@ada>
 <242144136.6776.1569498254158.JavaMail.zimbra@nod.at>
In-Reply-To: <242144136.6776.1569498254158.JavaMail.zimbra@nod.at>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 26 Sep 2019 16:00:47 +0200
Message-ID: <CAFLxGvw2WpY_Rx5ZwAVhJ=L--jFS-8KC0fZ9KHnFfoB5OYruYg@mail.gmail.com>
Subject: Re: [PATCH] ubi-utils: Implement a ubihealthd
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190926_070101_714335_143801C4 
X-CRM114-Status: UNSURE (   6.38  )
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
Cc: Alexander Dahl <ada@thorsis.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 david oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Sep 26, 2019 at 1:44 PM Richard Weinberger <richard@nod.at> wrote:
> The new UBI machinery which allows userspace to control scrubbing was added in 5.2.
>

ups, 5.1.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
