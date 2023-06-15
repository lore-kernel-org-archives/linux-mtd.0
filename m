Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88EDEB64DC
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jun 2023 06:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HjQhAcMJKtUarnJ1eInr0W+LfQrKpOJBAkeTVeRLLa8=; b=JG0Y368FLPV+p6
	G0MWpLJUrtJPTMZB8l4Eup4bMwlv2WSAH8lndDebKTmKww8E3rhQf2oqHsmCgVSGFhmmnhizFkEjj
	UKVENioNvF/CdP7de+hdxhtA0injMVXEkBP3Qr5HNJqhMErhsNbeNK2w4KEFzVFneF2iGN9tlUm+b
	/rAcRFWXhlCGVUC/0nN0+UXAJzBc50aVZoIaC83M+9ScSGn2jciLJnGb7Dygu9pwtmb+BAuTYXfWw
	Q2mOBz4hmb7U4V7SNBugfyx0SUAZodXxKocFByS/j86cdJf1Hw6/ffPbhPwHRa2RN85tuSDckjDXx
	SpUDt9FrGC8DtfWpw3JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9gYE-00Ds0v-1g;
	Thu, 15 Jun 2023 06:33:46 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9gYB-00Ds0Q-2J
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jun 2023 06:33:44 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-bcc29cdcdc9so1410183276.0
        for <linux-mtd@lists.infradead.org>; Wed, 14 Jun 2023 23:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686810822; x=1689402822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZ8sWmOrvIq8waWFLXgCuASTZeEJ+zlwoDAZjDpRLXY=;
        b=sZwOdz+HYW1RyLBwJv5FpAqZ/3fHatoK9ha9qk0QYWSnb/RPSEgnPBWDxKpnO14Rku
         c4u7D/jlOGpcdFumrjwUHL6wMD5ELePVg1QTvKB1QlW9Z08bX2REnMA2QxzE178q+0bk
         Cy03GwkjOF0SFnkcfzJdV13dkMeilNTc/L1wuarWkI6v6gwHNRdAGi0knEDVltg41UHM
         ObudbUHWQn1x1MQMTY8lYuAhkTknkgJDIENtkwnhNUg/Q9Si+/r9cBBp3XGOKRQJay3b
         j5lzMtZ0+u3slEv+kHtyR9x2hbhZFegeMUet7Npik9wzwYwiA3irAwktA3K7+D9ZBUDX
         Z+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686810822; x=1689402822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZ8sWmOrvIq8waWFLXgCuASTZeEJ+zlwoDAZjDpRLXY=;
        b=KX3sZY8VR49ciLnKsgN/JfMNsNJWQrrjZI1rJwhOu+NKIXCWAjoDFkO0/1Nt6Zlf0q
         Qb7xPSWrQUsouyV6UVbXCc07yuci6s9Jrdo0i8MHDR7c8wNY8+NMJ/wBF4jsrI0Dw+HE
         DxUyxlsZPYQPEgxRwhsscsT9fkapzwBiTkIH+uFR7ZIbQKdiBnbhYciNSXSsOgY5/lCn
         THFAMTjNl/Zz2xnU8oOfEDsAk3Du6giV13IkLmzg7zeXm+ctyyHisHsznUjp4pnd7HPU
         +58Noq48rBUVxuG0jF0U0klK1ItbNF0BUt+lDoBBOE7R7IpMrmVEqaK3W4m7URANhMtP
         +oWw==
X-Gm-Message-State: AC+VfDwshrESSt6Y2+gCX1xJI/J4YhgqZbWSwh4EH2ndphGzeZbzKsE1
	YYoEFc3nSMDHyK9MPCmmdjTlicK2M4lc3owDXXZhdg==
X-Google-Smtp-Source: ACHHUZ6rMue4kNIamOiSY5UQYrDzI0yab9xvTCydCT7af7qsnesG+N6ZKe4g43aMAhhOI33yTrAKykH99CcrspzzhTU=
X-Received: by 2002:a25:504b:0:b0:bd4:e6d6:2b8e with SMTP id
 e72-20020a25504b000000b00bd4e6d62b8emr3891532ybb.50.1686810822546; Wed, 14
 Jun 2023 23:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <fe7ef901-9571-4c6e-a40e-449046efe2c6@moroto.mountain>
In-Reply-To: <fe7ef901-9571-4c6e-a40e-449046efe2c6@moroto.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Jun 2023 08:33:31 +0200
Message-ID: <CACRpkdYTcLKBq2s8_kBoM1PtzqNxxwK3wWZp6ORiY__pEkBgtQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: otp: clean up on error in mtd_otp_nvmem_add()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-mtd@lists.infradead.org, 
	kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_233343_755141_FC27B45E 
X-CRM114-Status: UNSURE (   9.27  )
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

T24gVGh1LCBKdW4gMTUsIDIwMjMgYXQgODowOeKAr0FNIERhbiBDYXJwZW50ZXIgPGRhbi5jYXJw
ZW50ZXJAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IFNtYXRjaCBjb21wbGFpbnMgdGhhdCB0aGVzZSBl
cnJvciBwYXRocyBhcmUgbWlzc2luZyBjbGVhbnVwOgo+Cj4gICAgIGRyaXZlcnMvbXRkL210ZGNv
cmUuYzo5ODMgbXRkX290cF9udm1lbV9hZGQoKQo+ICAgICB3YXJuOiBtaXNzaW5nIHVud2luZCBn
b3RvPwo+Cj4gVGhpcyBuZWVkcyB0byBjYWxsIG52bWVtX3VucmVnaXN0ZXIobXRkLT5vdHBfdXNl
cl9udm1lbSkgYmVmb3JlCj4gcmV0dXJuaW5nLgo+Cj4gRml4ZXM6IDNiMjcwZmFjODQ0MyAoIm10
ZDogb3RwOiBQdXQgZmFjdG9yeSBPVFAvTlZSQU0gaW50byB0aGUgZW50cm9weSBwb29sIikKPiBT
aWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQGxpbmFyby5vcmc+CgpP
b29wcyBteSBiYWQuClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxp
bmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
