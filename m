Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30467C282C5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Mar 2025 09:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lpIVj2xMVfpFXJGBPpshVKPZu3QjgKQwNVBenHiH2lw=; b=hhWQ1RfLagwpnx
	FWSpYF2DQgtTKEGtzJ4MJo/9Bhzuuu66ZH7+g1DuQI/XudtNcS4L8Y2UMwCVy+6EpG+8QrUMPrP9X
	K5Nhw09B/ZMEif3o/LVkdGC7JcV6klq5ERoWXR1bHxi4YuxNN+QtPDUXIfgRdp3gSzlWwtVoGNcDE
	LIgssTIbTrSWXdalUXVG5EpPeekJy1VKi4pnWdRxClR+4TxeQ5RxZ83YOhbi2BoLbBdxKdMKyG7WP
	UrLHtBDwwSx800yfInMa/dK9aS1igDt+d67fL3DsmcwpN+P+UjvLuDL1l0EvGYaqQ3GFR0plG7xNR
	4pC9hgDI67FftQs6bysQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1eW-000000002Xs-0vPc;
	Mon, 03 Mar 2025 08:59:56 +0000
Received: from mail.venturevistas.pl ([149.202.34.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1b1-0000000016m-3lGZ
	for linux-mtd@lists.infradead.org;
	Mon, 03 Mar 2025 08:56:22 +0000
Received: by mail.venturevistas.pl (Postfix, from userid 1002)
	id C24F9240EE; Mon,  3 Mar 2025 09:55:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=venturevistas.pl;
	s=mail; t=1740992163;
	bh=dZvZFRKGwxZcTXPz7AZkoF1+C6QCkI8mt9zwq4ep1B0=;
	h=Date:From:To:Subject:From;
	b=Fx2TvaVpczHfoRIewdcjgG8DtIarMS3e/JRlcNr7vM4Z8eDCeAQqC/1ph9V/1ywwd
	 nrAEAzxN6nQMsOpnPzmBfH7O7KSDr0Y91Sz3HZpf/XXBMi/3Bo2MaUiN83/GUSnkdQ
	 RVR4aYrCyL/QWdgNobKC9iuKahFdbXYn6i9HvxnG0HwKISmSEwtiapkN2XkhhREjyq
	 iw59RoP62YyX4gXTEVv64AD0x083lbwHTCqb4IAwJAGZyfVi9kNVm+QyyW0yWC0zHW
	 yiQWZYEOyN+DMoZsT05gWcNwXYbBYDP5CV45hkFS73GgaM999k5r0u29Se+gbsqNzZ
	 ymDNFBLdU3lkg==
Received: by mail.venturevistas.pl for <linux-mtd@lists.infradead.org>; Mon,  3 Mar 2025 08:55:44 GMT
Message-ID: <20250303084500-0.1.ge.18htl.0.t9jdyflpj4@venturevistas.pl>
Date: Mon,  3 Mar 2025 08:55:44 GMT
From: =?UTF-8?Q?"Paulina_Soko=C5=82owska"?= <paulina.sokolowska@venturevistas.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Zwrot
X-Mailer: mail.venturevistas.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_005620_615475_F16BA1C7 
X-CRM114-Status: UNSURE (   2.33  )
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
