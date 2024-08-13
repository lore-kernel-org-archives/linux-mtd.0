Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7B2C52D7B
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2024 08:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vGKIN1dAht938CpTfosyP8PUkoM/XOOyuLI10RvaBW0=; b=VCUSOcJN/jnOOb
	f9HasffLPmKMqqBm864GZ6Z7bib3WXPUYgReadpzEmOHmWHlTrGr1FSlhhuK6C+Rs1qGXczP4HjAf
	FZSYEDAxBZvvbTM8BnVs+VIdlsgJ8vweGd3l92r+0JcoFsV56VFPwLzGZvPxIGtMdDncuyobBOEY+
	LTXqBNYe9WvDptwJixOe9A44FyFfm8iX0kW3SmfhobW7gHkBDVWZi5NasmrIeVrt34p4D9JsqI0Aq
	/BA8UI4HmY5FWRn9KOvVdgHW+imfcOnNG/tAA0XuAQBdFW5Ny/gbt0XwW+yBrzFh58ocVQQyq62MW
	FjSRIf4kJ4rHBqTOXJlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdmSj-00000002oHS-2XZS;
	Tue, 13 Aug 2024 08:01:01 +0000
Received: from mail.widebizscope.pl ([51.77.245.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdmSg-00000002oFx-2UW5
	for linux-mtd@lists.infradead.org;
	Tue, 13 Aug 2024 08:01:00 +0000
Received: by mail.widebizscope.pl (Postfix, from userid 1002)
	id 621912468E; Tue, 13 Aug 2024 10:00:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=widebizscope.pl;
	s=mail; t=1723536056;
	bh=7b2Hseb9QY/049WYSH5jOQc1GsDAtRo2MBj6O2PAhWg=;
	h=Date:From:To:Subject:From;
	b=CmBJLlL15q4AM5kP7OuYpaJtbvrGf42dxsykBdS++Artbyd5Y5Y9XTpfsLjgeU+t1
	 CWUGkrTWq8SQrpULZ5PVDRcxDA29O9b9EObkBuKAazCryApIo9tqLlpyMiwdt8WILW
	 j4NOKr0OXFjcOEJycSOJXK0hcr9ead36AyajWEcAdBHejCP5MKSPqjfF0COUYRvqw5
	 OAZ2wiQ1d9ooAPGsvbgsZPK1EKrletr8Xkcu1i4I43xUfBV4Ss1Upk75P+nQlWJKcG
	 5NPxRCMunr/KQKb+gFQuHoS1DzeZ/SAJXr2p1KoEehLp0rhMR3LVGA1GZxG+UHLQ9R
	 KRNvdCw1/0qTQ==
Received: by mail.widebizscope.pl for <linux-mtd@lists.infradead.org>; Tue, 13 Aug 2024 08:00:44 GMT
Message-ID: <20240813084500-0.1.d2.rm22.0.60rjcllgx0@widebizscope.pl>
Date: Tue, 13 Aug 2024 08:00:44 GMT
From: "Szczepan Andryszczuk" <szczepan.andryszczuk@widebizscope.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Faktury
X-Mailer: mail.widebizscope.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_010058_786474_090442CD 
X-CRM114-Status: UNSURE (   0.58  )
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

U3phbm93bmkgUGHFhHN0d28sCgpDenkgem1hZ2FqxIUgc2nEmSBQYcWEc3R3byB6IHByb2JsZW1h
bWkgcMWCeW5ub8WbY2kgZmluYW5zb3dlaiB3eW5pa2FqxIVjeW1pIHogZMWCdWdpY2ggdGVybWlu
w7N3IHDFgmF0bm/Fm2NpIG9kIGtsaWVudMOzdz8gCgpOYXN6ZSB1c8WCdWdpIGZha3RvcmluZ293
ZSBtb2fEhSBiecSHIHJvendpxIV6YW5pZW0sIGt0w7NyZWdvIHBvdHJ6ZWJ1amUgUGHFhHN0d2Eg
ZmlybWEsIGFieSBzenliY2llaiB6YW1pZW5pYcSHIHd5c3Rhd2lvbmUgZmFrdHVyeSBuYSBnb3TD
s3drxJkuCgpKZcWbbGkgemFsZcW8eSBQYcWEc3R3dSBuYSBuYXR5Y2htaWFzdG93eW0gZG9zdMSZ
cGllIGRvIMWbcm9ka8OzdyBmaW5hbnNvd3ljaCBwbyB3eXN0YXdpZW5pdSBmYWt0dXJ5LCB6YXBy
YXN6YW0gZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpTemN6ZXBhbiBBbmRyeXN6Y3p1awoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
