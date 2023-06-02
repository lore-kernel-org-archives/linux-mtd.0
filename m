Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6800AC7EE29
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jun 2023 08:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xYHrfWc7+u8rEoLCFTAZ7H58GC0FNmFVBgutOJEyNQg=; b=M6AKD7z99W3bEi
	ct2jCLVmYguOkFbrPS0qWzov4iUkAkF7T+dRzTPjSR70MQDnFYiCnUZ2expImmab6ypGoJPh3N9O0
	6R2tTs+xmZnhgJ0b3azWx/T4H42FHGiRkmqowwdpqvqXRb4c+LQKTuAOleUiUcYtXLWoE66F2snnr
	4wjf116tNI+HP0jw3L0t38hKEIKsRmPBjoSRn2WZm6yZakjipUJJy3vhltVdEkqJeB09SCSXcaEDf
	F51YBN8uq15381UNK/dToW/YCVTYVIhWHOQ+rD1+o5jAy/c5hInu7aTy/8DYAna2yYtD6u6xvwxwi
	4LaXrzGFNtxANx8P6jvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q50Gf-006AZH-2L;
	Fri, 02 Jun 2023 08:36:17 +0000
Received: from mail.webtopbits.pl ([195.231.64.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q50Gb-006AYd-3B
	for linux-mtd@lists.infradead.org;
	Fri, 02 Jun 2023 08:36:15 +0000
Received: by mail.webtopbits.pl (Postfix, from userid 1001)
	id 79D8BA38CD; Fri,  2 Jun 2023 09:36:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=webtopbits.pl;
	s=mail; t=1685694972;
	bh=Eh8ECMiYd4baGAwPAzhz8mhJACXX7NSRkYjh+plaY18=;
	h=Date:From:To:Subject:From;
	b=UHW4yoTsiiS6weQslPOGrUtcDBKEMLQwVvkTm62zlWzVrAO1yXUsIryxsMgVUBUCB
	 qfQzseeudSJPDX3htLfQ5EpskhSKCLAfgY1L3xNQovv7zxM4k2TZPiYAjzC7sSdzCG
	 i2icQqiDzTMcHZXnJfw+RyG82Uz2vUggkQ3/2blZG/qYag4ECUSDL25koxc4Dw3OiR
	 xhf9WvbbxS76/Pm9XFT3IWJb5C0FjmAJgPm3toeOS+tp9SsCgdDhVOb8G3w17H4DP1
	 HhzcLKMQEBGUdl0JvL5IbAqliadRTptZE6zeGZb5NG3IvAn1yq4oyEe2Vju2DqIRVb
	 JALJ1gIt1DsJQ==
Received: by mail.webtopbits.pl for <linux-mtd@lists.infradead.org>; Fri,  2 Jun 2023 08:35:59 GMT
Message-ID: <20230602085530-0.1.8w.5k7q.0.rg67b10qqp@webtopbits.pl>
Date: Fri,  2 Jun 2023 08:35:59 GMT
From: "Kamil Durjasz" <kamil.durjasz@webtopbits.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Wy=C5=BCsza_konwersja_w_e-sklepie_?=
X-Mailer: mail.webtopbits.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_013614_173948_5543720D 
X-CRM114-Status: UNSURE (   2.16  )
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

RHppZcWEIGRvYnJ5LAoKdyBqYWtpIHNwb3PDs2IgZG9jaWVyYWrEhSBQYcWEc3R3byBkbyBvZGJp
b3Jjw7N3PwoKVHdvcnp5bXkgcG90xJnFvG5lIG5hcnrEmWR6aWEgc3ByemVkYcW8eSwga3TDs3Jl
IHBvendhbGFqxIUga29tcGxla3Nvd28gcm96d2nEhXphxIcgcHJvYmxlbXkgcG90ZW5jamFsbnlj
aCBrbGllbnTDs3cgaSBza3V0ZWN6bmllIHdwxYJ5bsSFxIcgbmEgaWNoIGRlY3l6amUgemFrdXBv
d2UuIAoKU2t1cGlhbXkgc2nEmSBuYSBQYcWEc3R3YSBwb3RyemViYWNoIHp3acSFemFueWNoIHog
b2JzxYJ1Z8SFIHNrbGVwdSwgb2N6ZWtpd2FuaWFjaCBpIHBsYW5hY2ggc3ByemVkYcW8b3d5Y2gu
IFN6Y3plZ8OzxYJvd28gZG9wYXNvd3VqZW15IGdyYWZpa8SZLCBmdW5rY2pvbmFsbm/Fm2NpLCBz
dHJ1a3R1csSZIGkgbWlrcm9pbnRlcmFrY2plIGRvIFBhxYRzdHdhIGdydXB5IGRvY2Vsb3dlaiwg
Y28gcHJ6ZWvFgmFkYSBzacSZIG5hIG9jemVraXdhbmUgcmV6dWx0YXR5LgoKQ2jEmXRuaWUgcHJ6
ZWRzdGF3acSZIGRvdHljaGN6YXNvd2UgcmVhbGl6YWNqZSwgYWJ5IG1vZ2xpIFBhxYRzdHdvIHBy
emVrb25hxIcgc2nEmSBvIG5hc3p5Y2ggbW/FvGxpd2/Fm2NpYWNoLiBNb2fEmSBzacSZIHNrb250
YWt0b3dhxIc/CgoKUG96ZHJhd2lhbQpLYW1pbCBEdXJqYXN6CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
