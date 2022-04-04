Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD2DC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 08:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iMKzA3DjLUvvuJL4xKZEscKnV5h3A1VxLO/gi0uZulU=; b=FmGftOFHAvFMoI
	F5hsyWiIkXu0Wz/RESnqVNKP2Lf469imw9pTNAWguP541Ko4tN6qZBwY3oYmiW1gj5a6G92qfYKvw
	BHdZojqMLzJ56HfaBjPOr9M/c+C5GsXGv+GXS7XGo8pNsvhNpsOvxyLO1q7p6M9r++EyT4GvinIGJ
	UgYAagShRgW9LkYw/1j6LMU5UtWPsndKRqOdbTCygT46H/B1lPxvn8wQVMp8lTeHGH0cO37tFFtM3
	YzA3HFbckY4EWNp+Ir2cfWJ6WOxpJCpYNvHrvmRfd3AjNYkRpTXaTxaapbd4XoSW1Q3jyebqzEBc7
	Mo/HprUJMsWSQiK+AKKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbHlv-00DlkJ-5z; Mon, 04 Apr 2022 08:09:11 +0000
Received: from mail.coredeal.pl ([51.75.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbHlr-00Dlil-QK
 for linux-mtd@lists.infradead.org; Mon, 04 Apr 2022 08:09:09 +0000
Received: by mail.coredeal.pl (Postfix, from userid 1002)
 id B2E90A37A4; Mon,  4 Apr 2022 08:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=coredeal.pl; s=mail;
 t=1649059636; bh=9KGuIG62LgzC9aYmjKxzocuYLRCVghXg6v9Q1q2LHec=;
 h=Date:From:To:Subject:From;
 b=YSeDnntikVralRV2Vx2CaGahhZxSf6mlxSceLckpJGCljyF/dvY5brGH9HnAR/8qO
 4tIznBZZ0JY4GqBZlGtFAJIMuiGf1ZbbjUiD6KR9z+A5jKsRR2UG2GZIlbWqHvYoR0
 5C6AFIU0FZvsfSBalYgNjlQFktXOiQck05ALy3VTr+3pJeNTmEKBFrnLQvPyWqHftL
 El2RjDiD9hR98o7Bic0fq07jIMCEHBw9oa0b/m0Qo8bX+/RZ2LzH/NxmeUWD4rZAxa
 kbQpvh5C6RK+P99uopSjC23R9U03h1L1Kx24TIsHg47YvIHjgyMDB/JqVUqrraYce8
 Z1D4gKL38IaUQ==
Received: by mail.coredeal.pl for <linux-mtd@lists.infradead.org>;
 Mon,  4 Apr 2022 08:05:41 GMT
Message-ID: <20220404064500-0.1.2c.c89v.0.d5r5zz7hit@coredeal.pl>
Date: Mon,  4 Apr 2022 08:05:41 GMT
From: "Krzysztof Maj" <krzysztof.maj@coredeal.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Biznesowy angielski
X-Mailer: mail.coredeal.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_010908_056052_7F97DBFC 
X-CRM114-Status: UNSURE (   1.81  )
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

RHppZcWEIGRvYnJ5LCAKCmN6eSByb3p3YcW8YWxpIFBhxYRzdHdvIHJvenfDs2oga3dhbGlmaWth
Y2ppIGrEmXp5a293eWNoIHN3b2ljaCBwcmFjb3duaWvDs3c/CgpPcHJhY293YWxpxZtteSBrdXJz
eSBqxJl6eWtvd2UgZGxhIHLDs8W8bnljaCBicmFuxbwsIHcga3TDs3J5Y2gga29uY2VudHJ1amVt
eSBzacSZIG5hIHBvZG5pZXNpZW5pdSBwb3ppb211IHPFgm93bmljdHdhIGkgamFrb8WbY2kga29t
dW5pa2Fjamkgd3lrb3J6eXN0dWrEhWMgYXV0b3Jza8SFIG1ldG9kxJksIHN0d29yem9uxIUgc3Bl
Y2phbG5pZSBkbGEgd3ltYWdhasSFY2VnbyBiaXpuZXN1LiAKCk5pZXN0YW5kYXJkb3d5IGt1cnMg
b24tbGluZSwgZG9wYXNvd2FueSBkbyBwcm9maWx1IGZpcm15IGkgb2JzemFyw7N3IMWbd2lhZGN6
b255Y2ggdXPFgnVnLCB3IHN6eWJraW0gY3phc2llIHByenluaWVzaWUgZWZla3R5LCBrdMOzcmUg
endpxJlrc3rEhSBrb21mb3J0IGkgamFrb8WbxIcgcHJhY3ksIHJvendpamFqxIVjIG1vxbxsaXdv
xZtjaSBiaXpuZXNvd2UuIAoKWmRhbG5lIHN6a29sZW5pZSBqxJl6eWtvd2UgdG8gbS5pbi4gemFq
xJljaWEgeiBuYXRpdmUgc3BlYWtlcmFtaSwga3TDs3JlIHcgc3p5YmtpbSBjemFzaWUgbmF1Y3rE
hSBwcmFjb3duaWvDs3cgcm96bWF3aWHEhyB6YSBwb21vY8SFIGphc25lZ28gaSB6d2nEmXrFgmVn
byBqxJl6eWthIEJ1c2luZXNzIEVuZ2xpc2guCgpDenkgbcOzZ8WCYnltIHByemVkc3Rhd2nEhyB3
acSZY2VqIHN6Y3plZ8OzxYLDs3cgaSBvcG93aWVkemllxIcgamFrIGR6aWHFgmFteT8gCgoKUG96
ZHJhd2lhbQpLcnp5c3p0b2YgTWFqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
