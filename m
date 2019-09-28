Return-Path: <SRS0=Gxb9=XX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 692C6C4360C
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Sep 2019 22:48:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 390EC2054F
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Sep 2019 22:48:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WrbbS5Xn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rnpNs6xF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 390EC2054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=deWpBx9q3VPrFDpx+USUC1l9g6oKdiXKfOjZKylJfWg=; b=WrbbS5XneS/LzC
	udzFQh9487pflqfxxAKjtP2eVpGlPrb6qkwJG+czgG0WGMMElxiN+Hb15NT7Q364hyhi6sP5lEmRM
	xYCEdrAu+zAyYsYVKchPQnRIyZpzJBvxG027nQ/Ei081adk5XaeHEO4YEcKrrSs9n0a2aL4hxZdh2
	ta3iZHJIBpqjFxEzdhiHip/3E+2HLWcOVwlimmd6zw+pknWAYyQ1yarOVRV15rY4/YfcF62L9GfDB
	uFW3X6FyNh/NFJQtVBt5xKWWLDmskHXChN5DQx/bNCz/w/ioEJyjNkPXssK8JUY5wmu4NNmdDUkDr
	1tMGJ99tzDVGT8FSvXWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iELVg-0002tD-P7; Sat, 28 Sep 2019 22:48:16 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iELVe-0002sp-7i
 for linux-mtd@lists.infradead.org; Sat, 28 Sep 2019 22:48:15 +0000
Received: by mail-wm1-x341.google.com with SMTP id v17so8915154wml.4
 for <linux-mtd@lists.infradead.org>; Sat, 28 Sep 2019 15:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cBMojEhRg2G4NCIUMMdJMxrVt2frIhb0+YVICZDbG3A=;
 b=rnpNs6xFdZYNxVN+rhiXCfPTQlJaLK6NSQWjMTstjIFf4+jU+kLWR6jr9xL9aMxdk8
 +7jiS83OrdCcgnJMNYzc8FwS4vTeSxUYGVEMky1VNueeuTqkWkLRrvV4VNnkc12SCA1Y
 A7ChkiGEphshoeOqHNvr+flZlRCD25gQr8UntecG/o5ckZGZ1FRRO2gY9XU0Z9BV+pmr
 V8UE6wVBGimtWt3yccsia95STL5+StW4+ZGEelHw9WrKfNEcQ2ipMpNrzc3PSrQ3zOy0
 P+QJb0P90MXNkfapiWdGf/5Ahb6Ztp5hMotQsRpgWhQi4cntCdgDOLy7u2cTKJ7X1sbW
 INrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cBMojEhRg2G4NCIUMMdJMxrVt2frIhb0+YVICZDbG3A=;
 b=A5PWbIE9OXuXjIiNxz2M8VUuCKKRY/jyCtufoGq9T2T3BnRWbROomBDqf6JpFg9usT
 Bsjvvo0ELp8VjITz7WidmfYJHQoUcCVKwK94TaJ8LyKcPS7jEL5LI0dTg2j1Mbkmvowz
 Z5ep2PfgwRW3i4GGBe+YMJa/oQGIut+3hxKL+pGUhR0stRGbTJiYgPp0QzX5tmIlBZJe
 Jsh6Hr2NsFWcUiYh3WwPZKFXjeQHR6mAWZOV3cn6a5DnOHZNeeD9Oiu7UNBKoSkEb6Oe
 DA46Z30Wdes9k7dQ59wmc9Fl2hunGiN9EVZHZK2FO62pX/lo++Zf3GcbVdW1L4y/na8F
 UpRg==
X-Gm-Message-State: APjAAAUe7zQUshyMThStseNzdt5p7fQPDbwqgWc9v4p4Q8Yfgj6DsOvA
 reBeGcwHs/9Gq6fQoQRqHJrNgxe6pYxEYDu35iw=
X-Google-Smtp-Source: APXvYqxDtaLdbUaTOfKnUJwpMNqqChuBoz39Qc3Ymvuf9RQ6CrCqBDSMsHKG0wJZqdAJS0I9Wm4uJWcni2VyKtF0LMg=
X-Received: by 2002:a7b:c7d7:: with SMTP id z23mr11918258wmk.137.1569710891595; 
 Sat, 28 Sep 2019 15:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <1fc7208e-145f-aeb5-61c5-cc6a8a8aedf6@mclink.it>
 <CAFLxGvy67vrX9t==UK5U+P+LW=h0aGt_MGFFfAvCspi9GnayRQ@mail.gmail.com>
 <0d603876-f7ac-5dec-5345-7e4369ab038f@mclink.it>
In-Reply-To: <0d603876-f7ac-5dec-5345-7e4369ab038f@mclink.it>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 29 Sep 2019 00:48:00 +0200
Message-ID: <CAFLxGvwHg6F9_1htqWHrx4dZZpFNO_vLAnLGO-dbi9DKDOT_Qg@mail.gmail.com>
Subject: Re: mtdpart add/del usage
To: Mauro Condarelli <mc5686@mclink.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190928_154814_277841_B5DB0C5B 
X-CRM114-Status: UNSURE (   9.65  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Sep 28, 2019 at 6:08 PM Mauro Condarelli <mc5686@mclink.it> wrote:
> Is it possible to retrieve (or re-create) the master device in an older
> kernel (3.18)?
> It does not have MTD_PARTITIONED_MASTER config option.

You can backport the feature, it should be hard.

> I know it won't be able to del/add partitions, but being able to write
> to the whole,
> unpartitioned device would be *very* useful nonetheless.

MTD partitions are allowed to be overlapping. So you can create
a partition schema which contains one part over all others.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
