Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEB0606A31E
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 12:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UXuzCTZm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MlDyCLTB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PTTnwiYHBBtWEGWPiAotlJKVv+XJZ7eMKiKpaxCOdzw=; b=UXuzCTZmzGxaRXdCuDfEWPQbLc
	24SIqL9M9S3NNSHIrCtOjk25FDiMgQ5lh4boATypDA7w/iZBAqgpWaGsyDrHwzKS7c3iLNqf+TkYO
	4itnYqqWVvWBTS2Dxlb9E6JEpMeJnDfaRTAmPL5u46kpL+Ied0kgyfzW3tnjBTIb9VktYkUNK9TRK
	F/r72pfgvEjHVDtuiW+Z60gcHeDbhE0jSqFDq18fxDNLmrK5RFExFXnCKy60rrZKqkSE9UcBU7c4m
	6Yf4QFJU/rvHGP2j9pujCcx+hNOveIYDcWhjGkwOkEoFrAb4nt9c3xYHDLWq8QCvLXfshzYuZDVyE
	fObU8cig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWv01-0000000G6qb-1jAQ;
	Fri, 27 Nov 2026 12:24:21 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuzx-0000000G6op-13H9
	for linux-mtd@lists.infradead.org;
	Fri, 27 Nov 2026 12:24:18 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso3646539a91.3
        for <linux-mtd@lists.infradead.org>; Fri, 27 Nov 2026 04:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795782256; x=1796387056; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JhQeLHAOS781k5w4uun7J9WWIR0Qr+uoFEbbpSQQgl4=;
        b=MlDyCLTBC0EKFQf1ru/8yqYa1Tq5lh/MtBIw6D77tyPXkj0FPmI94iZ7QU593IQnko
         bglRNLhqhn+vXjsgrD5/XupHGnjEx5ikORazOYKL5TELDZs8bzVTvHvUI6pH81XIOvJi
         /hOok5MiWrkPBRzMwagLuYyhRV1rxNbrJKancd2h+biD4X1i6ZTmW2MzwDgU4zEC8PaS
         ZM6haPIUa+20xTcztYf33fbqu+arxd532ZMZ98cd2BRe/TolRw8WnTeevL60yjnSSPEL
         R8umXRTANxAQMOG/YLh/SVYGAlrrpPhDGIvM8VrKxnZR2x3hBsjO14pOxq8EIvJQi5S3
         DaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782256; x=1796387056;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JhQeLHAOS781k5w4uun7J9WWIR0Qr+uoFEbbpSQQgl4=;
        b=NU9CRIfrXlnNaOo8s0sqVToTvS6FWvIta9T+LrwAqItgujvFPNbu4rEXmKkBryiWs/
         MUbBlczpRHA57SC5qiIXPjziwe+leuigHAKtnyXmt2ICcW3eYE45pTESyqlEF8csnWTK
         NmS5pRVRfv7bOOHjrcrG2qNZehTqfa2ump1FWmhtd/Gx9pQFetj7lreTuEx9IBoz8ocb
         7WaetXRpFOQ+34oHx+SWbjiX2h4/2oDjootQ4IixmLCG+31cxS7m5m8e6tvQF0s3xOKi
         XMjDoRQEuCmlsIqLeeBx9bcNdxopRlP63HcAEGgQbqKyOVkwFdgQhPZZhAFxh68RLN23
         7yxQ==
X-Gm-Message-State: APuU4Z99eQt3sL41GImpW1PDAz9X9pf0uBNSYkqo19hAqreoy+thiCAR
	dlRcQQAWwFQTnwveCgAvnPZA3J8tW4EQe/1wetpzQPEB9Otqw2R7Y8oU
X-Gm-Gg: AZFdTZcqMsuWasaTe/F5l6upK5emUj5SvM01zDQkCgGVaOXwhDk6Tfv3dKWU4bzVzyM
	sSwrCleMl2tbHi8iVNaCnQ4ieoVp24uhEtXqHJH3f3/VeTBDxpnA79mV+zP4trD2cWbKvpNU33E
	FIjeWgPA7U/c3jghJQ3oh/EuNR6APGTaiy/QQLdlSmVw0IiUAfI0QfeeLHT+CKb7fEBaSoZ0y6k
	8aC0xcCjwNoP/t6VSvtBVq2LPiCgy6ME1cLL4nEjSBH/K6mt+28mWSdA+Mo37KsGSldt4a3uy6x
	6S4/S6iqGeURVZJqBblSPL31h19F6CrG31EXgHjq9he+HLRmnsycXV1jx2C8oii2hRa8KJgdzjw
	PnXFnWQlBGCV2hDuZA7IqCUvQv6akoo05u72OhCt95sMuaFsqxry4ndotW5BaMpbm2wQconHlQh
	aCrL3ixhwnyUBfSJpSnyxdIGfRHpBuRKgvyMyh5cyZN2GLyzvh1zUwJ7aSOFCH1sGKPnq9C5pRK
	lMarQSIK93LKEh/AuWP/mnD6dqbm8HkfokOLuKFUouwVjxeB8AHv9NnbK+nzFAg1Evcq7LnE/FS
	vmr7GikKa2MSRsN8YBOPkeTe1UX5ohttacFXQnwhTA098uAzNkmrKD9JA8xPyun42Qlu83kl
X-Received: by 2002:a17:90b:390b:b0:3b3:b858:cc92 with SMTP id 98e67ed59e1d1-3b41c97ac6bmr23397370a91.63.1795782255781;
        Fri, 27 Nov 2026 04:24:15 -0800 (PST)
Received: from Fantast-WT.localdomain ([120.229.37.123])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm37581203a91.0.2026.11.27.04.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:24:15 -0800 (PST)
Date: Fri, 27 Nov 2026 20:24:12 +0800
From: Teng Wu <gigadevice2025@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com, richard@nod.at,
	linux-kernel@vger.kernel.org, teng.wu@gigadevice.com,
	weijie.huang@gigadevice.com
Subject: Re: [PATCH] mtd: rawnand: Skip timing mode readback check for
 GigaDevice NAND
Message-ID: <awl2bMa2cqHZWfD-@Fantast-WT.localdomain>
References: <awWLzWDg-m9VBZVr@Fantast-WT.localdomain>
 <87qzgas5yv.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87qzgas5yv.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_042417_293227_37024C1C 
X-CRM114-Status: GOOD (  16.14  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 02:40:24PM +0100, Miquel Raynal wrote:
> Hi,
> =

> >  	if (request !=3D tmode_param[0]) {
> > +		/*
> > +		* GigaDevice raw NAND chips (manufacturer ID 0xC8) support
> > +		* the timing modes advertised in their ONFI parameter page.
> > +		* Skip the strict ack check; keep it for other vendors.
> > +		*/
> > +		if (chip->id.data[0] =3D=3D 0xC8) {
> > +			goto update_interface_config;
> > +		}
> > +
> =

> There is a vendor driver, you shall use it rather than polluting the
> core with vendor specific fixups. Check what
> macronix_nand_fix_broken_get_timings() does for example.
> =

> Thanks,
> Miqu=E8l

Thank you for your review.

I agree that vendor-specific workarounds do not belong in nand_base.c. =

Adding a dedicated nand_gigadevice.c would be a substantial piece of =

work and is outside the scope of this effort.I understand if this patch
is rejected, and I will drop it for now. =


That said, if there is a significant future need to add nand_gigadevice.c,
we will refer back to the changes in this patch.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
