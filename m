Return-Path: <SRS0=yEN0=UX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E50BC43613
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 20:00:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28D0F20663
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 20:00:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nLYooL8a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoBnvsY4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28D0F20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=vLwBYEupdHTycDy/iMyWhJyRQe45fiMKVOkB/pEKGgA=; b=nLY
	ooL8aeTowwonPR3JIV5doYNaET3uJdgIICPYX4N7cntqO9WGgov0jBAfnr1imhsSaE0jAFaEEqZGS
	qDYAb5GoXJ39OHhyWAOq12J5naR0hAv93I3islcJqZ/aAUE/OAjeCl6WLD6vIwYZ1fqArcc7A69AW
	h7Xht+0oC25fg8KxJTaylBL3XSLDw6WtWJniVldTjFSQeJ41G9M2ok746ChHMNhOGkscf+pzNNDDg
	zasoijKJrAiQXmZUV7JaPk4g5VZe+Iv/GnuO9JNk6RVuHjrbhr69xN8mo9glZWpbZ7HUzyYoKVSB6
	D1fMnxHgyrfhSAqj6JO4TKBBSDU8/bQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfV8P-0001oN-0t; Mon, 24 Jun 2019 20:00:13 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfV8L-0001gE-Tn
 for linux-mtd@lists.infradead.org; Mon, 24 Jun 2019 20:00:11 +0000
Received: by mail-io1-xd29.google.com with SMTP id s7so1713550iob.11
 for <linux-mtd@lists.infradead.org>; Mon, 24 Jun 2019 13:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=qSMh7lCSAAHfjGolU0k6izU00P1ZnGJafP4RF6FZWxA=;
 b=RoBnvsY42msOTqvxHdVqY2cn7euwhUVqE5k0WOEuLP8CAOlJGbaRrl0wx2Z8m/+jVl
 8bt22l+ajq/D6gmnnsqhVI4iW9ZjioKXCIb70BQXWkx/UBdgagZ8X0/LyXln8P8vUmNK
 sYTffkkcJ+Ddhez7K+cQgBvPx9BA1yXtHJhbw+EQ+xWN39rSL5nZZ9Rzl1YMAfw+vZEU
 9POVd3kjtVPNqJomVoVUMQLfCsYmXhN/Oo1CGIbqfTaHw3tQRbnJ7VnePhtvDQLZk3WQ
 1v3y3VeEu8kIIsHgir/LH9xGy/dMDH1lfDbSTTzjp+hsnuL6+HPhiodDehez5m6hC3HO
 QyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qSMh7lCSAAHfjGolU0k6izU00P1ZnGJafP4RF6FZWxA=;
 b=SUbpKBr+/Ja1I0NTA5yotRV5aBc3SqnLsoFbkIFQqrOpHmeLzUmNaQSXAPneUTnCot
 eXq30GX8AdI88SmJh01Ws5OL17mRvencCl7d7uJsOtXvKGeU4C85Ez8jgZMl+zufr56Y
 MBgzxB8pp3lYVV73CPmPNvAR2b5Dy03O+DKQKfdlr7C1lWeiPMNI6FMATrXCRwwvNjwd
 ThjKi7lqdoL+gvCiqRAtZ8xlc4Z33lf0DBOdzqlkFUtN8FQW9XTpwCZMaGsgQSrmg99F
 nOr2m6FCm+wzHi1uTzwglEuiwznhpcYpolVwkUa8yumwuGrx8CTAKu8c422DR+5h2TXw
 exdg==
X-Gm-Message-State: APjAAAUYYU8Uj8rIzP4Fc6PEgzGeN3FOtLipNvEBX5ABsel3tYEBMtf5
 2TDoRpTThHFoTvTOHJ5vaGBSydKovOuTYbjj7fnqHgVW
X-Google-Smtp-Source: APXvYqwWJeCBHN5qZhx8l9V9vGOmfnmcrRObkR0zQRnQQySB7Q7TbI4ialJ0HpWuAsbu/3ijeDEAJYzekVDTld8tvrM=
X-Received: by 2002:a5e:db02:: with SMTP id q2mr265056iop.306.1561406407240;
 Mon, 24 Jun 2019 13:00:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:8a3d:0:0:0:0:0 with HTTP; Mon, 24 Jun 2019 13:00:06
 -0700 (PDT)
From: JH <jupiter.hce@gmail.com>
Date: Tue, 25 Jun 2019 06:00:06 +1000
Message-ID: <CAA=hcWQdnUZ22XApaiDKdJ1zS3MOMNW5xrOsVKDkGmk496hQXA@mail.gmail.com>
Subject: How to test NAND bad blocks management?
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_130009_965616_BA047FA0 
X-CRM114-Status: UNSURE (   5.95  )
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

Hi,

I learned from the list that the kernel is capable of handling NAND
bad blocks to use the mtd-utils "nandwrite" which I believe has
already included in kernel, is there any test problem to test the NAND
bad blocks management? What will be the symptoms when hitting the bad
blocks, segmentation, kernel error ...?

Thank you.

Kind regards,

- jupiter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
