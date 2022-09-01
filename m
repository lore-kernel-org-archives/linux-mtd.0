Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32A5ECAAD1
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Sep 2022 07:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qFJpZNQ97QU21oJMLjD30LFWJS9izGqG1ZPAkdYzSYc=; b=2QZvpIJwKooSAV
	XGjRTspaEgbTEHPp+USCR75ZP2P2wrB4fR2x5eBSCZh+ekZPzu6DHA8lF1kZVCKwlvXGVsOOxGWY8
	k4ahMxnSowKPBABg60iFWBnXyJTMAwzlSHdv8iIggxWvsL50BMiJTgBRuRsC73e+LlcrOy1G7NNBZ
	Td8yEnEfO1efERSKIcegTsH+eU+h3Ws/Kkz5pFikdyrzWSBdXpY7ATHDD0Dvi9kxMeC79qBd8rJrV
	a6SY3JiIn8mLVb1dQGJh6/fEFMOd2L34GvVqRXPImZr61ty7V0M0GAD1/MbOLq0QzXhF+/+u9d9gg
	w/frbYvi5Q/eNzRfvV/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTewu-00AOmp-QL; Thu, 01 Sep 2022 07:49:16 +0000
Received: from mail.fadrush.pl ([54.37.225.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTews-00AOm8-2X
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2022 07:49:15 +0000
Received: by mail.fadrush.pl (Postfix, from userid 1002)
	id 7894222438; Thu,  1 Sep 2022 07:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fadrush.pl; s=mail;
	t=1662018151; bh=bD6j9gIFU6CLTaCGl0Ow9oeIxtirvTfMeNZSfLEZQ+I=;
	h=Date:From:To:Subject:From;
	b=FftHZ/hUqPqLfUMuS0o1frzh+FpCO6R3H50XOe8E+xuZtwvQlaa/HtWbhAby/ApDz
	 0dt/mzsLERA70mGmiVJbn0w/VzQpMM9b2KAkp82Mf36NIxSZBi+XWo+F57PWcdE5Ga
	 kD6pp+zL+W8gxYvjsNvpxmU0nk1J75jwhP5go99AZYGE57mXqJkLZSdF4a4idKnph/
	 unLVNYXUOYAz8HH3bvxwCRVJkCBTZiPAVftlyE17tRqwJ+8aKpwrnAGU2FvtjWGGm/
	 1pW0yLEe6x/heiS6Y6aQY9xBOAdMu5ZpHN4QQXAlOMg5GjL93MaXkUyqdOzMb2nU9M
	 h+kmkQ636R+7Q==
Received: by mail.fadrush.pl for <linux-mtd@lists.infradead.org>; Thu,  1 Sep 2022 07:41:15 GMT
Message-ID: <20220901064500-0.1.1d.bpfu.0.ju5cilp2fy@fadrush.pl>
Date: Thu,  1 Sep 2022 07:41:15 GMT
From: "Jakub Olejniczak" <jakub.olejniczak@fadrush.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Zwi=C4=99kszenie_p=C5=82ynno=C5=9Bci_finansowej?=
X-Mailer: mail.fadrush.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_004914_265114_FF7C96E6 
X-CRM114-Status: UNSURE (   2.34  )
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

RHppZcWEIGRvYnJ5LAoKa29udGFrdHVqxJkgc2nEmSB6IFBhxYRzdHdlbSwgcG9uaWV3YcW8IGNo
Y2lhxYJieW0gemFwcm9wb25vd2HEhyB3eWdvZG5lIHJvendpxIV6YW5pZSwga3TDs3JlIHVtb8W8
bGl3aSBQYcWEc3R3YSBmaXJtaWUgc3RhYmlsbnkgcm96d8Ozai4gCgpLb25rdXJlbmN5am5lIG90
b2N6ZW5pZSB3eW1hZ2EgY2nEhWfFgmVnbyB1bGVwc3phbmlhIGkgcG9zemVyemVuaWEgb2ZlcnR5
LCBjbyB6IGtvbGVpIHdpxIXFvGUgc2nEmSB6IGtvbmllY3pub8WbY2nEhSBpbndlc3Rvd2FuaWEu
IEJyYWsgb2Rwb3dpZWRuaWVnbyBrYXBpdGHFgnUgcG93YcW8bmllIG9ncmFuaWN6YSB0ZW1wbyBy
b3p3b2p1IGZpcm15LgoKT2Qgd2llbHUgbGF0IHogcG93b2R6ZW5pZW0gcG9tYWdhbSBmaXJtb20g
dyB1enlza2FuaXUgbmFqbGVwc3plaiBmb3JteSBmaW5hbnNvd2FuaWEgeiBiYW5rdSBvcmF6IFVF
LiBNYW0gc3RhxYJ5Y2ggS2xpZW50w7N3LCBrdMOzcnp5IG5hZGFsIGNoxJl0bmllIGtvcnp5c3Rh
asSFIHogbW9pY2ggdXPFgnVnLCBhIHRha8W8ZSBwb2xlY2FqxIUgamUgaW5ueW0uCgpDenkgY2hj
aWVsaWJ5IFBhxYRzdHdvIHNrb3J6eXN0YcSHIHogcG9tb2N5IHd5a3dhbGlmaWtvd2FuZWdvIGkg
ZG/Fm3dpYWRjem9uZWdvIGRvcmFkY3kgZmluYW5zb3dlZ28/CgoKUG96ZHJhd2lhbQpKYWt1YiBP
bGVqbmljemFrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
