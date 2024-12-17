Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84458E7716A
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Dec 2024 09:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lpIVj2xMVfpFXJGBPpshVKPZu3QjgKQwNVBenHiH2lw=; b=jTF3WSBQzfIj+o
	VhIoMIOWl7HmAH7XjhQZVhpulRDk3VGbAZTJwYoKj2JTOPrFxCn/pzKECNQR2klDr2BF3EmbJRLV/
	DTRBNIlAx99Q9rBPa6lYj/7RVwZI/ioGAR5HLRnDxKsffPzTRz2JzyWSZXX7ExeeZ4PENGX9pcctP
	6At/hwvq7l+qt55tCqWo1TzoZXCAVAAtLPDv0LJmuNRYoTMpN+ttb1Mi3DftooSzxwkGjIqrDBkZI
	/AbMUBXnAZ5RWqdRsUNbjctZ7XgGHaCubJiqewrs8ZRhhk2JG+ha1lEsfSsAVau7HMerH9KjXD5am
	j16RCgyfIj6efrDtLokQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTlP-0000000CtGY-2NMf;
	Tue, 17 Dec 2024 09:21:11 +0000
Received: from mail.venturevistas.pl ([149.202.34.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTcR-0000000Cqqx-1MP6
	for linux-mtd@lists.infradead.org;
	Tue, 17 Dec 2024 09:11:57 +0000
Received: by mail.venturevistas.pl (Postfix, from userid 1002)
	id 15BA42494D; Tue, 17 Dec 2024 10:11:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=venturevistas.pl;
	s=mail; t=1734426709;
	bh=dZvZFRKGwxZcTXPz7AZkoF1+C6QCkI8mt9zwq4ep1B0=;
	h=Date:From:To:Subject:From;
	b=Rk7A7qv5mPOdgfe/wvN7CXbJh+0PpRfBlbWBQ84tStS+mFvg1o042CpmtfYTg6Vzv
	 626lHWVOfxCuEUP4CfznaU/xGbeepRuMwT7a1fEa+Le1q9xj5tALe4Ig5Tlxaxhg8N
	 afyGMyQtNMiFxK1iqlP6uZ/NNxAaagWzlot/LkyzzHgIEDPcm3Kvx+Js9Jxu0Ob7JX
	 9CRduChB4aGSRef0RB9sWIfCNxTZ6DnuYFOLxjAXwtQm2DRfWDchXrizrzfJdbX+6C
	 bzRXtvHpZwzoWnYo24/6pkcvpjyVbmIIEHR+UMJ/Zq3/5ZNRRJcC3x4fNmzM5AsT8l
	 bzD2mza2v2vWQ==
Received: by mail.venturevistas.pl for <linux-mtd@lists.infradead.org>; Tue, 17 Dec 2024 09:10:55 GMT
Message-ID: <20241217084500-0.1.f0.wjzf.0.q6mv6y62hc@venturevistas.pl>
Date: Tue, 17 Dec 2024 09:10:55 GMT
From: =?UTF-8?Q?"Paulina_Soko=C5=82owska"?= <paulina.sokolowska@venturevistas.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Zwrot
X-Mailer: mail.venturevistas.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_011156_040211_6DD9AEB0 
X-CRM114-Status: UNSURE (   1.83  )
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
