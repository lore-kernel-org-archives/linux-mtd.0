Return-Path: <SRS0=qhal=MM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A959BC07E95
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jul 2021 09:39:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 724D2611F2
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jul 2021 09:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 724D2611F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=tk4cfpUVeXRc2IERtqxb03rLrTy4kymdqnZNJCEj6vY=; b=0cv
	Hu2RYV5jTHer50pzzKcqEuCTto8Trd05vp0Vcif0195mbleNyKuSJpAz0u7hne0pUZmfpanZUDlu+
	tQ89cseCVLThOW6BJELkmo6bGbYNu3h/c8IREz2u4Mm5SC1ASAq2mTXkSAP3JazAVAm45wgQQx9EU
	F0j+1g8lDUhfUG1VWv0OWnq2C9+dBcxBfflk+rK79j62KszKQCMGAdSRA2jaXypHdz/VTO0/4qelR
	WdgaEtgtDIG24oSkVDzdNphI0Wlt+kF26biLo9ELRPR/wL6QNaQr1QngJYbnaCA1lnSCo225a3Uct
	ZudvaM+oPSzOl8MyGFMLsn3hSbcBp4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5mDD-00CPsd-Aa; Tue, 20 Jul 2021 09:38:51 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5mDA-00CPsG-2i
 for linux-mtd@lists.infradead.org; Tue, 20 Jul 2021 09:38:49 +0000
Received: by mail-ed1-x52b.google.com with SMTP id ec55so27688940edb.1
 for <linux-mtd@lists.infradead.org>; Tue, 20 Jul 2021 02:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=ob2cL9xsCuqI2PtZCWk4ZnfruGA/KtiWAaZc2Xrr4AE=;
 b=goq6yCQPn/6AnEsFbyX2k+3qh8cv1+Kn3s6p2QPPbSaOJTqpkvxalHq2CtwvJ/x9NH
 MaPHlgNqCVgT0yrQoPQxlanIWryDj5GNQkebvgmavNwAyt/sLhZiRD2uU5/FshixSweE
 tRXovwpnIBJCdOuFamWmlVnIT1wMpzyAMwBvzlS+a9nGB1U9InErKigu4UuRtbMWEgej
 +1URvihDMERpFLKHK+LbEJWBuGdVDbsLAVEZiMgl502Je1yTiPvO/TPBJmegUQ5BMwH8
 0j0F8SxJQwBCpjDjI3gJ60pAY8W7DKaVDx/cwN+afAu/BiQoS3u8r++tINTjkE9mR8aP
 o7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=ob2cL9xsCuqI2PtZCWk4ZnfruGA/KtiWAaZc2Xrr4AE=;
 b=aTXlHspLgec5SKC9quGYs6q4ijJpOTgeihv2kJuwFUzlYMe3shSsQSx1v/E5+7K2FH
 4pe/PsXe9sJXhoEJh/KeudUwcrOznTG1e6+CPJUsMkn6dSM3gNcfwT/PpsgqwKafnnil
 ovXsZfY5/tjL4wihIrgRTboN/YJqOffcaQ6wBMkJcLI7FOyAL4zYprdEc9ixs3n0C63x
 v4KNww3kUcNCd5AzJRpNOXOlAaQpF0T0djgD8rSw2Rl64BQQV9pbQTKBcm+ri9eMUd3g
 vWY/wjLjwIoBhUiLo16oNJTENlXhuhUWcTPQLP6m2xARys934M3M0l3M6INhgSbKSD1Q
 88wQ==
X-Gm-Message-State: AOAM530Nn9nJGdI+GLO68evKoWqahzGlvoGPo3lul0IXqZnM6q3qDVha
 3wgRATqtOQGbR5rc45hWUANGLgBxiEdGX04nZCU=
X-Google-Smtp-Source: ABdhPJyFYULltN0VLmruKU6gln2nBG30ldbFf2khnefL2E+dRSChweVniLR25706q27205hxMP3yUCyt6LutA6yXFB8=
X-Received: by 2002:a05:6402:5209:: with SMTP id
 s9mr30408240edd.92.1626773925557; 
 Tue, 20 Jul 2021 02:38:45 -0700 (PDT)
MIME-Version: 1.0
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Tue, 20 Jul 2021 15:08:34 +0530
Message-ID: <CAOuPNLhqSpaTm3u4kFsnuZ0PLDKuX8wsxuF=vUJ1TEG0EP+L1g@mail.gmail.com>
Subject: Kernel 4.14: Using dm-verity with squashfs rootfs - mounting issue
To: open list <linux-kernel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 dm-devel@redhat.com, Kernelnewbies <kernelnewbies@kernelnewbies.org>,
 agk@redhat.com, snitzer@redhat.com, shli@kernel.org, mpatocka@redhat.com, 
 samitolvanen@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_023848_186382_863C2391 
X-CRM114-Status: UNSURE (   9.82  )
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

SGksCgpPdXIgQVJNMzIgTGludXggZW1iZWRkZWQgc3lzdGVtIGNvbnNpc3RzIG9mIHRoZXNlOgoq
IExpbnV4IEtlcm5lbDogNC4xNAoqIFByb2Nlc3NvcjogUXVhbGNvbW0gQXJtMzIgQ29ydGV4LUE3
CiogU3RvcmFnZTogTkFORCA1MTJNQgoqIFBsYXRmb3JtOiBTaW1wbGUgYnVzeWJveAoqIEZpbGVz
eXN0ZW06IFVCSUZTLCBTcXVhc2hmcwoqIENvbnNpc3RzIG9mIG5hbmQgcmF3IHBhcnRpdGlvbnMs
IHNxdWFzaGZzIHViaSB2b2x1bWVzLgoKTXkgcmVxdWlyZW1lbnQ6CldlIHdhbnRlZCB0byB1c2Ug
ZG0tdmVyaXR5IGF0IGJvb3QgdGltZSB0byBjaGVjayB0aGUgaW50ZWdyaXR5IG9mCnNxdWFzaGZz
LXJvb3RmcyBiZWZvcmUgbW91bnRpbmcuCgpQcm9ibGVtOgpkbS0wIGlzIG5vdCBhYmxlIHRvIGxv
Y2F0ZSBhbmQgbW91bnQgdGhlIHNxdWFzaCBmcyByb290ZnMgYmxvY2suClRoZSBzYW1lIGFwcHJv
YWNoIGlzIHdvcmtpbmcgd2hlbiBlbXVsYXRpbmcgd2l0aCBleHQ0IGJ1dCBmYWlscyB3aXRoIHNx
dWFzaGZzLgoKTG9nczoKWy4uLi5dClsgICAgMC4wMDAwMDBdIEtlcm5lbCBjb21tYW5kIGxpbmU6
IFsuLi5dIHZlcml0eT0iOTYxNjAgMTIwMjAKZDdiOGE3ZDBjMDFiOWFlYzg4ODkzMDg0MTMxM2E4
MTYwM2E1MGEyYTdiZTQ0NjMxYzRjODEzMTk3YTUwZDY4MSAwICIKcm9vdGZzdHlwZT1zcXVhc2hm
cyByb290PS9kZXYvbXRkYmxvY2szNCB1YmkubXRkPTMwLDAsMzAgWy4uLl0Kcm9vdD0vZGV2L2Rt
LTAgZG09InN5c3RlbSBub25lIHJvLDAgOTYxNjAgdmVyaXR5IDEgL2Rldi9tdGRibG9jazM0Ci9k
ZXYvbXRkYmxvY2szOSA0MDk2IDQwOTYgMTIwMjAgOCBzaGEyNTYKZDdiOGE3ZDBjMDFiOWFlYzg4
ODkzMDg0MTMxM2E4MTYwM2E1MGEyYTdiZTQ0NjMxYzRjODEzMTk3YTUwZDY4MQphZWUwODdhNWJl
M2I5ODI5NzhjOTIzZjU2NmE5NDYxMzQ5NmI0MTdmMmFmNTkyNjM5YmM4MGQxNDFlMzRkZmU3Igpb
Li4uLl0KWyAgICA0LjY5MzYyMF0gdnJlZ19jb25uX3BhOiBkaXNh4paSWyAgICA0LjcwMDY2Ml0g
bWQ6IFNraXBwaW5nCmF1dG9kZXRlY3Rpb24gb2YgUkFJRCBhcnJheXMuIChyYWlkPWF1dG9kZXRl
Y3Qgd2lsbCBmb3JjZSkKWyAgICA0LjcwMDcxM10gZGV2aWNlLW1hcHBlcjogaW5pdDogYXR0ZW1w
dGluZyBlYXJseSBkZXZpY2UgY29uZmlndXJhdGlvbi4KWyAgICA0LjcwODIyNF0gZGV2aWNlLW1h
cHBlcjogaW5pdDogYWRkaW5nIHRhcmdldCAnMCA5NjE2MCB2ZXJpdHkgMQovZGV2L210ZGJsb2Nr
MzQgL2Rldi9tdGRibG9jazM5IDQwOTYgNDA5NiAxMjAyMCA4IHNoYTI1NgpkN2I4YTdkMGMwMWI5
YWVjODg4OTMwODQxMzEzYTgxNjAzYTUwYTJhN2JlNDQ2MzFjNGM4MTMxOTdhNTBkNjgxCmFlZTA4
N2E1YmUzYjk4Mjk3OGM5MjNmNTY2YTk0NjEzNDk2YjQxN2YyYWY1OTI2MzliYzgwZDE0MWUzNGRm
ZTcnClsgICAgNC43MTQ5NzldIGRldmljZS1tYXBwZXI6IHZlcml0eTogc2hhMjU2IHVzaW5nIGlt
cGxlbWVudGF0aW9uCiJzaGEyNTYtZ2VuZXJpYyIKWyAgICA0LjczNzgwOF0gZGV2aWNlLW1hcHBl
cjogaW5pdDogZG0tMCBpcyByZWFkeQpbLi4uLl0KWyAgICA1LjI3ODEwM10gTm8gZmlsZXN5c3Rl
bSBjb3VsZCBtb3VudCByb290LCB0cmllZDoKWyAgICA1LjI3ODEwN10gIHNxdWFzaGZzClsgICAg
NS4yODA0NzddClsgICAgNS4yODc2MjddIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBWRlM6
IFVuYWJsZSB0byBtb3VudCByb290CmZzIG9uIHVua25vd24tYmxvY2soMjUzLDApClsuLi5dCgpO
b3Qgc3VyZSwgd2h5IGlzIGl0IHN0aWxsIGxvY2F0aW5nIGJsb2NrICIyNTMiIGhlcmUgd2hpY2gg
c2VlbXMgbGlrZSBhCk1BSk9SIG51bWJlciA/CgpXb3JraW5nIGxvZ3Mgb24gZXh0NDoKWy4uLi5d
ClsgICAgNC41Mjk4MjJdIHbilpJbICAgIDQuNTM0MDM1XSBtZDogU2tpcHBpbmcgYXV0b2RldGVj
dGlvbiBvZiBSQUlECmFycmF5cy4gKHJhaWQ9YXV0b2RldGVjdCB3aWxsIGZvcmNlKQpbICAgIDQu
NTM0MDg3XSBkZXZpY2UtbWFwcGVyOiBpbml0OiBhdHRlbXB0aW5nIGVhcmx5IGRldmljZSBjb25m
aWd1cmF0aW9uLgpbICAgIDQuNTUwMzE2XSBkZXZpY2UtbWFwcGVyOiBpbml0OiBhZGRpbmcgdGFy
Z2V0ICcwIDM4NDQ0MCB2ZXJpdHkgMQovZGV2L3ViaWJsb2NrMF8wIC9kZXYvdWJpYmxvY2swXzAg
NDA5NiA0MDk2IDQ4MDU1IDQ4MDYzIHNoYTI1NgphMDJlMGMxM2FmYjMxZTk5Yjk5OWM2NGFhZTZm
NDY0NGMyNGFkZGJjNThkYjU2ODk5MDJjYzViYTBiZTJkMTViCmFlZTA4N2E1YmUzYjk4Mjk3OGM5
MjNmNTY2YTk0NjEzNDk2YjQxN2YyYWY1OTI2MzliYzgwZDE0MWUzNGRmZTcgMTAKcmVzdGFydF9v
bl9jb3JydXB0aW9uIGlnbm9yZV96ZXJvX2Jsb2NrcyB1c2VfZmVjX2Zyb21fZGV2aWNlCi9kZXYv
dWJpYmxvY2swXzAgZmVjX3Jvb3RzIDIgZmVjX2Jsb2NrcyA0ODQ0MyBmZWNfc3RhcnQgNDg0NDMn
ClsgICAgNC41NzIyMTVdIGRldmljZS1tYXBwZXI6IHZlcml0eTogc2hhMjU2IHVzaW5nIGltcGxl
bWVudGF0aW9uCiJzaGEyNTYtZ2VuZXJpYyIKWyAgICA0LjYxMDY5Ml0gZGV2aWNlLW1hcHBlcjog
aW5pdDogZG0tMCBpcyByZWFkeQpbICAgIDQuNzIwMTc0XSBFWFQ0LWZzIChkbS0wKTogbW91bnRl
ZCBmaWxlc3lzdGVtIHdpdGggb3JkZXJlZCBkYXRhCm1vZGUuIE9wdHM6IChudWxsKQpbICAgIDQu
NzIwNDM4XSBWRlM6IE1vdW50ZWQgcm9vdCAoZXh0NCBmaWxlc3lzdGVtKSByZWFkb25seSBvbiBk
ZXZpY2UgMjUzOjAuClsgICAgNC43MzcyNTZdIGRldnRtcGZzOiBtb3VudGVkClsuLi4uXQoKUXVl
c3Rpb25zOgphKSBJcyBkbS12ZXJpdHkgc3VwcG9zZWQgdG8gd29yayBvbiBzcXVhc2hmcyBibG9j
ayBkZXZpY2VzID8KYikgQXJlIHRoZXJlIGFueSBrbm93biBpc3N1ZXMgd2l0aCBkbS12ZXJpdHkg
b24gS2VybmVsIDQuMTQgPwpjKSBBcmUgdGhlcmUgYW55IHBhdGNoZXMgdGhhdCB3ZSBhcmUgbWlz
c2luZyA/CgoKVGhhbmtzLApQaW50dQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
