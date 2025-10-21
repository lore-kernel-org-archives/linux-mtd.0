Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B61CCD184
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Oct 2025 07:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2ICxD73F39sh4XMyj3UvoTXLEpmFv2V+vuDwMsRQN3o=; b=FSMSD6XOwjgLnq
	ZVTrpWalu6h9sh9pPUt90PXfaGYC4WxHsTJ88TFFixc/wdw+uM4zTll40Sb52wag5v2ari9hPyqGN
	2dWtzn/wDAEvxI49u4rxjsDJYcK0NBIVMWMQviC2YVpVhpi54ReSC3gwQMBA/tyWJ/2NqffkiS5VH
	IU7fyrUSrGXwYMmO/0wHjDANab4EH8NboZItfT6iC0nWS4Rkw1xIYRqovRJleUI3age17ECSuAbuM
	erLxKVqGH7pv5o7jUXvoqN3nGjQW4de4GQME8jZOHVDm/fP4al+/be8WBJ/Ms7jewCjjWRGRO1OU+
	20/Q74xLgh+knvq+fSpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB76n-0000000G9RV-2h18;
	Tue, 21 Oct 2025 07:48:41 +0000
Received: from mail.zynotix.com ([79.137.80.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB76k-0000000G9Pu-3UWF
	for linux-mtd@lists.infradead.org;
	Tue, 21 Oct 2025 07:48:40 +0000
Received: by mail.zynotix.com (Postfix, from userid 1002)
	id A077F2658E; Tue, 21 Oct 2025 09:41:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zynotix.com; s=mail;
	t=1761032592; bh=xZTLqM3E7aVDYIB/jnD5MiDi3FAIGgatFm751EDj2YQ=;
	h=Date:From:To:Subject:From;
	b=N2Dr/17Hp5O1DNcTqk+w1wPwr5CyWnnp0jl84fKWtemBXnFpPf575sMLRs02JVdqc
	 r3+ZprIetMOy9hLa2EED6k4XLSorG3Y/o48G4zYY5Feby7X88QNWVeAg1hPej7JXvz
	 VpqVUGlsp+gAfcHLgsPelAWV9Cy/CPnYxILXRlYP7uLX5yPsaQ49C28G7jSGngs1Wn
	 atxYNTFLcCP2Mpv2Wg8xcBjFulOXYGLXQGFpiw1cOfM04xs7VXWvVSZ8BhkrODW+XE
	 +bt7L+qM6mMe7U0YkDXaLYRc9ms0Ja9SUiTB4189G+MNmwrKkThV2KSzLuyAvGW+60
	 wMMWouu8TcbeQ==
Received: by mail.zynotix.com for <linux-mtd@lists.infradead.org>; Tue, 21 Oct 2025 07:40:46 GMT
Message-ID: <20251021084501-0.1.ck.unr0.0.m41dkcjhgg@zynotix.com>
Date: Tue, 21 Oct 2025 07:40:46 GMT
From: =?UTF-8?Q?"Magdalena_Ko=C5=82adczyk"?= <magdalena.koladczyk@zynotix.com>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Informacja_z_ksi=C4=99gowo=C5=9Bci?=
X-Mailer: mail.zynotix.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_004839_020828_9163BF6E 
X-CRM114-Status: UNSURE (   0.99  )
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

RHppZcWEIGRvYnJ5LAoKcHJvd2FkesSZIGJpdXJvIGtzacSZZ293ZSwga3TDs3JlIHNwZWNqYWxp
enVqZSBzacSZIHcgb2JzxYJ1ZHplIGJpem5lc3UgUGHFhHN0d2EgZm9ybWF0dS4KCldyYXogeiB6
ZXNwb8WCZW0gemFwZXduaWFteSB3c3BhcmNpZSwga3TDs3JlIHd5a3JhY3phIGRhbGVrbyBwb3ph
IHNhbW8gcHJ6eWdvdG93YW5pZSByb3psaWN6ZcWEIGkgcHJvY2Vzb3dhbmllIGRva3VtZW50YWNq
aS4KClJlZHVrdWplbXkgZG8gbWluaW11bSBjemFzIGkgxZtyb2RraSwgamFraWUgbmFzaSBLbGll
bmNpIHByemV6bmFjemFqxIUgbmEgb2JzxYJ1Z8SZIGZpbmFuc293by1rc2nEmWdvd8SFIGkga2Fk
cm93by1wxYJhY293xIUuIAoKWiByYWNqaSBtb2plZ28gZG/Fm3dpYWRjemVuaWEgcHJ6eSB3c3DD
s8WCcHJhY3kgeiBmaXJtYW1pIG8gdGFraW0gcm9kemFqdSBkemlhxYJhbG5vxZtjaSwgY2hjaWHF
gmFieW0gcHJ6ZWRzdGF3acSHIGtpbGthIHdhcnRvxZtjaW93eWNoIGkgc3ByYXdkem9ueWNoIHJv
endpxIV6YcWELgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHIG8gb2JzxYJ1ZHplIFBhxYRzdHdh
IGZpcm15PwoKUG96ZHJhd2lhbQpNYWdkYWxlbmEgS2/FgmFkY3p5awoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
