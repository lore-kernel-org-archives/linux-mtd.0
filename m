Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B456C07545
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Oct 2023 08:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CJLgxzJ644rRJ+zT4DngATRaIfhSyvcK0D7r/OgW+YI=; b=ed71QcfEDZDuYb
	T0ruc+NLdyoTl4Ef9obE1aAVZwkiRayXILQmvWujYrcn7ceTkNVeExg0auVqU2We7XoYjp8BHEENj
	5guBmyVxVS8A+xWbTk9v3w3RvQkff0arEYab29mn054Z9aZvYkVtfKmzuk6OIP7dpAIAiK0ftAsp4
	MrYY5rWqfVdLKBgNGL/vaF5DEj7PUtynKmb1w4pz6BNdVL2AhUzLNbGsKkzG3UJyPZsL+mdMVNO/e
	Q6OcQ1L3EN6mj/FzMWtiRt9Jd0ARLq5YI3CQwOPKVf+01hQqaCMe+p6XtOozDsAH7Wfcmr3z7IRHp
	38ZnDHtzUzC8S2b7fPJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvCQb-0098px-1L;
	Tue, 24 Oct 2023 08:06:17 +0000
Received: from mail.citycodes.pl ([158.255.215.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvCQZ-0098p5-1D
	for linux-mtd@lists.infradead.org;
	Tue, 24 Oct 2023 08:06:16 +0000
Received: by mail.citycodes.pl (Postfix, from userid 1001)
	id 2784C21422; Tue, 24 Oct 2023 10:05:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=citycodes.pl; s=mail;
	t=1698134774; bh=fClkhHu/p6gIm8tbpvFwCqGX3kXIMdqjiuDdSiYGEkk=;
	h=Date:From:To:Subject:From;
	b=ALGhSgxV3YHGWiLr9ggdnsGUQDENwyGACmHhPhEHDNpLuqyeLEn3+ri2rIJxUd6gE
	 eaxbeF+XR0Hawv4nbla2zxJ7lM//r+6ifi+hjO1j0ynCYElx3/Ke/pE+lDHR+Rw/eo
	 s/CQMYrXIMk2+N83fnZ/gZre5mEWC6Jen8kMuuoedvtuIA1sw98BIhoiSHOOyvU9ab
	 U2IMJluAsvXJXuyGJpJZcL6Uj99ozdATSxLFR9PWQrUm01Nvn7C08ZN7dPj52bb0d6
	 fK++4PAckIWdydkM3ALH3qIq+O8hkAyYtKXVGlXPN5hubUitTwL3LTnb90VvwrKObQ
	 +deeXrm25Dj2g==
Received: by mail.citycodes.pl for <linux-mtd@lists.infradead.org>; Tue, 24 Oct 2023 08:05:40 GMT
Message-ID: <20231024084500-0.1.8a.l7rb.0.1h8jbb9a6e@citycodes.pl>
Date: Tue, 24 Oct 2023 08:05:40 GMT
From: "Kamil Lasek" <kamil.lasek@citycodes.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.citycodes.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_010615_550361_E25B0F96 
X-CRM114-Status: UNSURE (   1.46  )
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

RHppZcWEIGRvYnJ5LAoKZG9zdHJ6ZWdhbSBtb8W8bGl3b8WbxIcgd3Nww7PFgnByYWN5IHogUGHF
hHN0d2EgZmlybcSFLgoKxZp3aWFkY3p5bXkga29tcGxla3Nvd8SFIG9ic8WCdWfEmSBpbndlc3R5
Y2ppIHcgZm90b3dvbHRhaWvEmSwga3TDs3JhIG9ibmnFvGEga29zenR5IGVuZXJnaWkgZWxla3Ry
eWN6bmVqLgoKQ3p5IHPEhSBQYcWEc3R3byB6YWludGVyZXNvd2FuaSB3ZXJ5ZmlrYWNqxIUgd3N0
xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sCkthbWlsIExhc2VrCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
