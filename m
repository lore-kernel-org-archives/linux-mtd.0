Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 802BFC369AB
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Apr 2025 08:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lpIVj2xMVfpFXJGBPpshVKPZu3QjgKQwNVBenHiH2lw=; b=GVpY9iZxyTyunW
	26fgLlO8SRruu4YhxfdfwztgoUhL6G1RoXcA5PGVB3rDe+/nCNk1zjtUMcgz5CpRgMd4M6mFfW/m0
	9St0MzxEoqjdLLfpN8YYcVIqbt7ZSQ2Aw6fd6m8XqR1PTyasYQFhFVLZK6p5sETPPm9TZ/kguN/U+
	TvzzrE2c2qb0dDM0pV5gGMO6gyIYClYgZwY/wM2S5wK3fS+ctEwr0OY/p1bOXYPHQoNb/3K/5OJDG
	5D9PKfUxcL6nKjMq45EWCgTwoEmihHSCKQI1uc+Vgxslh0crHItPjBfvHf9gvNgmh0JHbNwIpdowQ
	W1p4OkIUjlYmHX/ANhyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bSi-00000004xEl-1mPS;
	Tue, 15 Apr 2025 08:16:08 +0000
Received: from mail.startmind.pl ([149.202.34.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4bID-00000004vVh-24Ev
	for linux-mtd@lists.infradead.org;
	Tue, 15 Apr 2025 08:05:19 +0000
Received: by mail.startmind.pl (Postfix, from userid 1002)
	id EB6D424F11; Tue, 15 Apr 2025 10:01:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=startmind.pl; s=mail;
	t=1744704098; bh=dZvZFRKGwxZcTXPz7AZkoF1+C6QCkI8mt9zwq4ep1B0=;
	h=Date:From:To:Subject:From;
	b=w+6CcDooLtHwqc0gOJ4/dLoR/vYRsAZdgCx0SGU7iVNkMox5u3TmZQmWMbL5Iel1N
	 XKJIs4x70iGh8gLWtb8lP4oZXKg7luSVRoXGOnzfFrBy37PHWcWusXT+Mq1M8vCGR+
	 TdQYG4d6Avm1nYRJA5yeceJ28FHYpiHP3IlXJu83F+AmQg7waFW89aSlBR86KO1skg
	 buhXvwE5YAgmAO/DNjZlhIFPntN2lJDJVcnzNSZfoCYaWc8YwjUft5xpWYsmIjEfux
	 TRGaGSgk9eUp/ww7+g1b0g1QdauqeusQ9QMpCtGH8m/l+DJGqU5hbhNL2Y8q9eyoRF
	 kbv+3dWQOThWQ==
Received: by mail.startmind.pl for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2025 08:00:42 GMT
Message-ID: <20250415084500-0.1.h9.1daae.0.fthkzblib4@startmind.pl>
Date: Tue, 15 Apr 2025 08:00:42 GMT
From: =?UTF-8?Q?"Paulina_Soko=C5=82owska"?= <paulina.sokolowska@startmind.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Zwrot
X-Mailer: mail.startmind.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_010518_224881_EFB65881 
X-CRM114-Status: UNSURE (   1.19  )
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
