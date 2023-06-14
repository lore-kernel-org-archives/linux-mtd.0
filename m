Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7942AEB64D9
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Jun 2023 11:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=66FvlsGjbnBdoiFrKvvUyIaj5+cHGV+dErh8TjG4hkc=; b=gb4
	WS5nobOvpZJttB60dGCcqzQaCoSAAAjogs2lwe6TMvkotzX1h3qxz5aj8KL+tfRomrCoU+KbyOquu
	lCFJoQNZhhNLCSmQYu9+/F4ObwjDRGqAf5FR+4zQxguN6ZngwUH/69eWzsj3/1eEegWy9UGaCCm/g
	OAKgFO1WGIhPjpku6mH4nLQjD+/maXjGeSnW7o/L4Zqu9HEz3BjjtKiskCiKe29d9Ali3zFRttryr
	+hHAAWwaBo1u2rXbxxwNl/PxEz7EyQJFkFxx5kcqGsxKr2pdYqabhnjJh1ZPSNYuzCs5SXIujSote
	Q9WTp4BaJi6wiiEmYEu2PUuKj9UGqqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9OGL-00BPyx-3A;
	Wed, 14 Jun 2023 11:02:06 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9OGJ-00BPwG-0W
	for linux-mtd@lists.infradead.org;
	Wed, 14 Jun 2023 11:02:04 +0000
Received: by mail-qv1-xf43.google.com with SMTP id 6a1803df08f44-62fe3f0905aso1125366d6.0
        for <linux-mtd@lists.infradead.org>; Wed, 14 Jun 2023 04:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686740521; x=1689332521;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QGhaNsS7W/dmFyZfmhMJXui24jjSS9U0u092+cgeJ+M=;
        b=i0MT49wh6+Z9DoAZkZuytprga+LkTgwGUdHNAXr5M18wWov3SIhzChEurdfHsrG0EG
         JTZ5nWt0aKPL6gPJsSot/Z5X4gBLzzwjPPPghkVogUy/nOli+JEHKvQqYG9q1AyOmZiS
         qWF6naBfHPfEY4S3Ji1kUXfIM8MsMBH5U+NMj0PKaVN7LsFIwrlJwgHfdRhVoHLcH53A
         G66R47qh+G5aDoXo3sYqCHOUrzz6GZW555HRUcrYPAMW5+8uCFv8jIoWjzJTuKps7ilZ
         jgc99Im626AgmGcpUrCqz5Dsvv6ykZKcxs4Mhjkqk5urYY9Z7rnK3Uy0lAm9BSqF7SV7
         PEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686740521; x=1689332521;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QGhaNsS7W/dmFyZfmhMJXui24jjSS9U0u092+cgeJ+M=;
        b=JNwd1llS2MNAoE5aGOWVfCoY9g5NuC/lVpKUHk5q6piw2NGeeXUfa+LMxI/8WXloQq
         OqMM8FFQLFMYxDXXWNxmRlGuedCmu3jVywhppwNpR0Ywec4Nzz/hqq3Ar1DmxJ50XCtj
         vhm6bsdTCRb+iWFKbqEm5i8sICoMSIFOD7pUT3lGAvQrHAAQklH+VjIVfnFw+jacfrVY
         +hshf9w0FKoNruVIz/d1/eookEJFtZwLc/l+kEgew18MAqy58BRxlLhd0zDo0W8EGnsY
         gibplxiy4FilMCQgC5txnHVAvXcnSpNSNi1NMeeEu2nMj2OSADwjkkr50WgUgfF9rUKV
         3jvA==
X-Gm-Message-State: AC+VfDxgLxgl/UM/uJ8HRJhYUTD0ZnG/JODkXxb5tB++GuHi6aEt3cp/
	TPFzrosrt8ydGg+lcVqLmXBLBZs66NWcHA9P/Q4=
X-Google-Smtp-Source: ACHHUZ4jfL2Dpcw2lgF50Qm7+oc8D7fii//jt4OgUhBfwdc4E41IWNBEZ9BBKecqcoLrgS6VL6QhoWz6ZSvGubczlK4=
X-Received: by 2002:a05:6214:411b:b0:62f:e386:1e45 with SMTP id
 kc27-20020a056214411b00b0062fe3861e45mr1441995qvb.1.1686740521222; Wed, 14
 Jun 2023 04:02:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:622a:1207:b0:3e6:3c7f:5aec with HTTP; Wed, 14 Jun 2023
 04:02:00 -0700 (PDT)
From: Xavier Cuenca <xcuenca1993@gmail.com>
Date: Wed, 14 Jun 2023 11:02:00 +0000
Message-ID: <CAHDEakqCyWm7qrrr59k-dpL+=3Zh-ExUSFQ99DY1t0YvJBa-uA@mail.gmail.com>
Subject: nik_bin_nek_alwi@yahoo.com
To: Linux m68k <linux-m68k@vger.kernel.org>, linux mm <linux-mm@kvack.org>, 
	linux mtd <linux-mtd@lists.infradead.org>, 
	linuxppc dev <linuxppc-dev@lists.ozlabs.org>, Luis Alves <ljalvs@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_040203_205306_0FEFC5DF 
X-CRM114-Status: UNSURE (   2.92  )
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

http://tracking.groupon.com/r?tsToken=US_AFF_0_206880_212556_0&url=https://je4zs.app.link/069stfNFxAb

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
