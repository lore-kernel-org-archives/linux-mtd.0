Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69618C3ABAC
	for <linux-mtd@archiver.kernel.org>; Tue,  6 May 2025 07:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lpIVj2xMVfpFXJGBPpshVKPZu3QjgKQwNVBenHiH2lw=; b=eetboF7wQw8uPI
	ULtnHOWJHImKarXXX1xAiffFrZ9vEzozmQUVVv1WiNfF9Th5imdWj6aUVy0DebpNTvVQAhRNh1DTp
	7OVEiJ0ZSbtJY/Rh4R4dL/BYD1dxIbZtgyHaFPO3F6+jmiOGQ7HyRC86mbC31PMMME6mmh/lEpd9z
	rDRRJ1cAY91MAjCcHLXcy2L5k9biYMW+b/Dxk7QmJevlJ+/jI9Fppdo+xkjbqUjYrQsuui9r4piSn
	6aq5cAZubA2obFLnJuuFxeAxlET0HM62iudlANwgNJvEJ5MXYba3kp7rw+EllPKim9dbOKGZqh8ht
	58BvwCmSSnIKarekhnDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCD6M-0000000B24K-1nJo;
	Tue, 06 May 2025 07:52:30 +0000
Received: from mail.startmind.pl ([149.202.34.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCD6J-0000000B20Z-00gv
	for linux-mtd@lists.infradead.org;
	Tue, 06 May 2025 07:52:28 +0000
Received: by mail.startmind.pl (Postfix, from userid 1002)
	id 4933F23A96; Tue,  6 May 2025 09:51:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=startmind.pl; s=mail;
	t=1746517873; bh=dZvZFRKGwxZcTXPz7AZkoF1+C6QCkI8mt9zwq4ep1B0=;
	h=Date:From:To:Subject:From;
	b=XFwyBEmvrdeSSJglkZ8DVUhsCW56BUSflHnQyZ6xYUqWSO5vDCtz7G5/OeB/EOr9X
	 9N3FBz9a1oOruG4gRB48Yhdt/PvXwcAtIauu7oeAA8/jz1fBBHyCCOEW4VmdbuFdUN
	 n2/xGOrl4HqK/CJkVVgrSP6Re8NIDa/Sanvqc/Symf7jxJF3xtxiGBYhelXiihnSHW
	 JOtydtGXSjoVt421BjSl9WXxRR02jTCusWp9uVpzn8CusQsh72cpXRKlzXKrwUqGTP
	 2F7+7ApCT6ODTFXoLDkCx8Rk3l0NuF+MsqrRak/C6KFtnis6//xfDfard7LHyqcQri
	 chOqb75P9Kmxw==
Received: by mail.startmind.pl for <linux-mtd@lists.infradead.org>; Tue,  6 May 2025 07:51:12 GMT
Message-ID: <20250506084500-0.1.hl.1gu2w.0.fhgkctu50o@startmind.pl>
Date: Tue,  6 May 2025 07:51:12 GMT
From: =?UTF-8?Q?"Paulina_Soko=C5=82owska"?= <paulina.sokolowska@startmind.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Zwrot
X-Mailer: mail.startmind.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_005227_729026_D054BBC3 
X-CRM114-Status: UNSURE (   1.20  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKY3p5IHpkYXJ6YSBzacSZLCDFvGUgbXVzesSFIFBhxYRzdHdvIGJvcnlr
YcSHIHNpxJkgeiB6YWxlZ8WCeW1pIHDFgmF0bm/Fm2NpYW1pIG9kIEtsaWVudMOzdz8KCk9mZXJ1
amVteSBrb21wbGVrc293ZSByb3p3acSFemFuaWEgZGxhIGZpcm0sIGt0w7NyZSBwcmFnbsSFIHph
YmV6cGllY3p5xIcgc3dvasSFIHDFgnlubm/Fm8SHIGZpbmFuc293xIUgaSBvZHp5c2thxIcgbmFs
ZcW8bm/Fm2NpLgoKQ2jEmXRuaWUgb23Ds3dpxJksIGphayBtb8W8ZW15IHdzcGllcmHEhyBQYcWE
c3R3YSB3IHR5bSBwcm9jZXNpZS4gQ3p5IHPEhSBQYcWEc3R3byB6YWludGVyZXNvd2FuaSBkYWxz
esSFIHJvem1vd8SFPwoKClBvemRyYXdpYW0KUGF1bGluYSBTb2tvxYJvd3NrYQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
