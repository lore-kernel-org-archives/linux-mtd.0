Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E2E606A322
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 23:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=auJkyjLG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KhiaUWc5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2Ts2xeK//W0ltC77PCatzrdnY2heR6eLHRVPNUm2u70=; b=auJkyjLGiInR7WYKVBXk6Zw2BA
	X4iD2StTZECitvYfqF+EnBGjf8+yAt53kj3vseHllL1j2ZGTH8NvJRG5UbLMEVKapxBZ8TNn7ypW6
	wSDNgeULNkTmANwsEgWkkR+9iXiRJFXoJq6xXclApixOEsLvA+fJD3wgVw7aZrYiPPmo5fQp0KyM6
	iZ4DlD1N8wfnQoVMHVNmDcMoaO/CSbbtDGEE2iNSkznHF9NrhuOLHjNoGl9ZbgiRdngTktvZMW7sk
	CjbLP97DgfYS1hf0Rdo1gKx60n/6XFyfZpHiQlDofz6auMs/h5tfdBVB2CsoSZgNkp6AYH7r+SWKh
	2ZEIt9OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCdy-0000000Gw2k-2dnS;
	Sun, 08 Nov 2026 23:49:50 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCdv-0000000Gw0i-0XDJ
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 23:49:49 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-486f013db83so94090fac.0
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 15:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794181784; x=1794786584; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r4f2V9+bqMcBY5LtQhLJ3jd3DFlm4gkj1qoIPg+cYCY=;
        b=KhiaUWc51MhFn6eAFI5dmNYaYeMrdNqpxQ58kA0Hwlz7BnZcqxtxvl2hE37q1bohge
         3G+b1G4ceZAiQE6c8QhFQ7+VZwttXJxW8+f2kb0Q1iVUjdNYjUGN8D7GGElc79AjR1LR
         Uw1RsTo7I3gXW1jrD8fHXRmgUkuGWWux2D6+DVEL1NE6m2uI1MtZK+/6j5MosqulQ9wq
         bHAMoydprLAFFPofiD4ohqy+oY7dBSfZk0sfhFPx7ZNoXB5N51J8Bbaq8Ddp+qrJr2Ir
         sFjACGA4a4bgS2Nt70OYzWByDvHYJssglQCjhbZkVm05CEMVMzPU/lsIIUnAwaxbsRsx
         n5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794181784; x=1794786584;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r4f2V9+bqMcBY5LtQhLJ3jd3DFlm4gkj1qoIPg+cYCY=;
        b=wu8Pe/mh9YAznMfDixImNfR1TkN25Y1ASQjXhQYl5nGo4T23Ji7tSPk5bptl1E5llM
         XU6zO17qXbn2GYUpFbnZsNSkv8AihXh6ahyC7XUE+H40vM8JO7eb/R51p4XYeN/w5cKn
         acrv3BVUlclN0KASVXrnoGixOnh4sZ2pyS5Di+SWfoAzcI4dFs+MgYibAGMFT1KwguZa
         73UakOFx4abz0pBLm3CPsXwOdSG5Waet8zTtr+gxAUevwE+J/9kQNL+quLcdubr/CCjR
         uMaRigOf1MIw2tPmifg18sgU5ClZ2FuWzZSKjRApjEptjNP43g1GgYzk4aDZwnHZ+mUA
         g29g==
X-Gm-Message-State: APuU4Z/dsxNl0yVv0tBZkTxAawAvbMLBaRmfm80/cnCUnwISwa2kHVwT
	WYbudCmEp+I8in6RaQMtBsJ8QPhcMVoriPqtTmmA5T0ajLFXazWelDOS
X-Gm-Gg: AYBFou1IznURwoRAQM7NB8s6Sw5y2N28w/gAcrLxPAWh/6h28VVghb5gyOTn94kPa1S
	yfE3E7yhlf1SSV8o2ojydjXBgLP8oYqgPf6IZFGCQsG7CdZPUwrmKeMCpbBk81DBJ/lvA84EZv7
	ogJxJwwnc8BNwE4F7WZBf5YvUeO9KKekyUrNoeDdO+mCjQhUvGof7ARzCPHPCKNRt0CgpQm7rKH
	cXczwhVtNnieBFoDQ/xQ+8Pm3EPSypc54dBa2Z1/hTVG4wy7oUhK5N6RVBNyZNJWOBMSl9KsmoA
	LUh74OUOBMPJk7Aq73EoiC9aRklGT6fU+4r+frpsYnNxFMthLXIoUBe25uGg/3vtfHhZjSexFlF
	T6Xf8aqClj1FbKq2k6UwfwlVbWPm+gkpbuyK0a789AoNC+0TageWU9DR+KAentGKBhEgZboIFNq
	FUC5mbz+eFhO9uQM+FxiA07+lZysdYOxFNicguXbefJVfeQw7GnFNqPWMS5e0fM8muIFY0ErOCk
	dWnswr/bUEQewYKw6yyW/vCS3epeZDw598mJu1fYJN+YW8Gg7HCm5FIgr2w2gIyrqG/WTKCXpss
	qe1kIsCC0+C8ZGnP8LaZwAahKFVaNbgqBgcaqHH3SN/4CYLpsOwVksKNzfttDOn3/xKsuQL7nkn
	rAw4MimH6Krwbx+IAeBCHspY+kDJ0D/w37QZZBEN2Akd/DAZMPYpKv5DYsw8iUHKP1THk44/SNt
	6SPA4h4M8wiAU60G2tm40S6vXTOIgY/2efx0j/mrF52dZdtZPfGXs=
X-Received: by 2002:a05:6808:11c9:b0:4b9:a88b:8884 with SMTP id 5614622812f47-568144741e2mr1314581b6e.26.1794181784299;
        Sun, 08 Nov 2026 15:49:44 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813ac6352sm3019435b6e.1.2026.11.08.15.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 15:49:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/4] mtdchar: keep data and OOB aligned across ioctl
 chunks
Date: Sun, 08 Nov 2026 16:49:11 -0700
Message-Id: <20261108-submit-mtdchar-page-chunking-v1-v2-0-838cf8934ba6@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OSw7CMAxEr1JlTSAfET4r7oG6SNLQGkhaJWkFq
 np3nPYCSPZiPONnzyS5CC6RazWT6CZI0AcUYlcR2+nQOgoNaiKYUJwzRdNoPGTqc4N+pIPGiO3
 G8ILQ0olTpc5KKsOMsw1ByhDdAz7rhXu9aUQ8nc0FWxJGJ0dN1MF2ZYTkQ+ltC/0OUu7jd31x4
 oXz/zdYjIrLSWomj5Ibe2u9hvfe9p7Uy7L8ABcSfA0AAQAA
X-Change-ID: 20261106-submit-mtdchar-page-chunking-v1-668636b0becd
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_154947_174929_971A9D59 
X-CRM114-Status: GOOD (  12.04  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TUVNUkVBRCBhbmQgTUVNV1JJVEUgc3BsaXQgcmVxdWVzdHMgaW50byBib3VuZGVkIGRhdGEgYW5k
IE9PQiBidWZmZXJzLgpUaGVpciBjaHVuayBsZW5ndGhzIGFuZCBmbGFzaC1hZGRyZXNzIHVwZGF0
ZXMgbXVzdCBrZWVwIGJvdGggc3RyZWFtcwphc3NvY2lhdGVkIHdpdGggdGhlIHNhbWUgcGFnZXMu
CgpBbiBpbnRlcm1lZGlhdGUgcmVhZCBjYW4gY29uc3VtZSBPT0IgZnJvbSBwYWdlcyBiZXlvbmQg
aXRzIGRhdGEgY2h1bmsuCk9PQi1vbmx5IHJlcXVlc3RzIGRvIG5vdCBhZHZhbmNlIHRoZSBmbGFz
aCBhZGRyZXNzIGJldHdlZW4gY2h1bmtzLCB3aGlsZQphIGJ1ZmZlciBlbmRpbmcgd2l0aGluIGEg
cGFnZSdzIE9PQiBjYW4gbGVhdmUgdGhlIG5leHQgb3BlcmF0aW9uIHN0YXJ0aW5nCmF0IHRoZSB3
cm9uZyBwYWdlLiBXaGVuIHRoZSBPT0IgYnVmZmVyIGlzIHRoZSBsaW1pdGluZyBmYWN0b3IsIHRo
ZSBkYXRhCmNodW5rIG11c3Qgc3RvcCBhdCB0aGUgc2FtZSBwYWdlIGJvdW5kYXJ5LgoKVGhlIE9P
Qi1saW1pdGVkIGNhc2Ugd2FzIGZvdW5kIHdoaWxlIHRlc3RpbmcgYSBwcm9wb3NlZCBCb290Uk9N
LWZvcm1hdApNVEQgdmlldyB3aXRoIDEwMjQgZGF0YSBieXRlcyBhbmQgMTE1MiBPT0IgYnl0ZXMg
cGVyIHBhZ2UuIEEgNjQtcGFnZQpyZXF1ZXN0IGhhcyA2NTUzNiBkYXRhIGJ5dGVzIGFuZCA3Mzcy
OCBPT0IgYnl0ZXMsIGJ1dCB0aGUgb3JpZ2luYWwKNjU1MzYtYnl0ZSBidWZmZXIgbGltaXQgbGV0
cyB0aGUgZmlyc3Qgb3BlcmF0aW9uIGNvbnN1bWUgYWxsIHRoZSBkYXRhCndoaWxlIHRyYW5zZmVy
cmluZyBvbmx5IHBhcnQgb2YgdGhlIE9PQi4KCkZpcnN0IHNpbXBsaWZ5IHRoZSBwYWdlLWNhcGFj
aXR5IGNhbGN1bGF0aW9uLCB0aGVuIGJvdW5kIE9PQiBpbgppbnRlcm1lZGlhdGUgcmVhZHMgdG8g
dGhlaXIgZGF0YSBwYWdlcy4gS2VlcCBub24tZmluYWwgT09CIGNodW5rcwpwYWdlLWFsaWduZWQg
YW5kIGxpbWl0IHRoZWlyIGFjY29tcGFueWluZyBkYXRhLiBGaW5pc2ggYW55IHJlbWFpbmluZyBP
T0IKYXMgT09CLW9ubHkgb3BlcmF0aW9ucyBvbmNlIHRoZSBkYXRhIGlzIGV4aGF1c3RlZCwgaW5j
bHVkaW5nIHdoZW4gdGhlCmxhc3QgZGF0YSBmcmFnbWVudCBlbmRzIHBhcnR3YXkgdGhyb3VnaCBh
IHBhZ2UuIEFkdmFuY2UgYnkgdGhlIHBhZ2VzCmNvbnN1bWVkIGJ5IGVpdGhlciBzdHJlYW0gYW5k
IGxpbWl0IE9PQi1vbmx5IHdyaXRlcyB0byBvbmUgcGFnZSBwZXIgY2FsbApmb3IgcmF3IE5BTkQu
CgpBc3Npc3RlZC1ieTogQ29kZXg6Z3B0LTYtYXN0cmEKU2lnbmVkLW9mZi1ieTogSmFtZXMgSGls
bGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBB
ZGQgYSBmb3VydGggcGF0Y2ggdG8gZmluaXNoIHJlcXVlc3RzIHdob3NlIE9PQiBleHRlbmRzIHBh
c3QgdGhlIGRhdGEsCiAgZm9sbG93aW5nIFNhc2hpa28ncyByZXZpZXcgb2YgcGF0Y2ggMy4KLSBT
d2l0Y2ggdG8gT09CLW9ubHkgb3BlcmF0aW9ucyBvbmNlIHRoZSBkYXRhIHJ1bnMgb3V0LCBpbmNs
dWRpbmcgd2hlbgogIHRoZSBvcmlnaW5hbCBub24tTlVMTCBkYXRhIGJ1ZmZlciBoYXMgemVybyBy
ZW1haW5pbmcgbGVuZ3RoLgotIEFkdmFuY2UgYmV5b25kIHRoZSBmaW5hbCBkYXRhIHBhZ2Ugd2hl
biBPT0Igd2FzIGNvbnN1bWVkIHRoZXJlLCBhbmQKICBrZWVwIHJhdy1OQU5EIE9PQi1vbmx5IHdy
aXRlcyB0byBvbmUgcGFnZSBwZXIgYmFja2VuZCBvcGVyYXRpb24uCi0gTGluayB0byB2MTogaHR0
cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjYxMTA2LXN1Ym1pdC1tdGRjaGFyLXBhZ2UtY2h1bmtp
bmctdjEtdjEtMC0yOTczYTAzNTMxYmNAZ21haWwuY29tCgpUbzogTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4KVG86IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBu
b2QuYXQ+ClRvOiBWaWduZXNoIFJhZ2hhdmVuZHJhIDx2aWduZXNockB0aS5jb20+ClRvOiBNaWNo
YcWCIEvEmXBpZcWEIDxrZXJuZWxAa2VtcG5pdS5wbD4KQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZy
YWRlYWQub3JnCkNjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCgotLS0KSmFtZXMgSGls
bGlhcmQgKDQpOgogICAgICBtdGRjaGFyOiBjYWxjdWxhdGUgT09CIGNhcGFjaXR5IGZyb20gdGhl
IHN0YXJ0aW5nIGNvbHVtbgogICAgICBtdGRjaGFyOiBib3VuZCBPT0IgcmVhZHMgdG8gdGhlIGRh
dGEgaW4gaW50ZXJtZWRpYXRlIGNodW5rcwogICAgICBtdGRjaGFyOiBrZWVwIE9PQiBjaHVua3Mg
YWxpZ25lZCB3aXRoIHRoZWlyIGRhdGEgcGFnZXMKICAgICAgbXRkY2hhcjogZmluaXNoIE9PQiB0
cmFuc2ZlcnMgYWZ0ZXIgdGhlIGRhdGEgcnVucyBvdXQKCiBkcml2ZXJzL210ZC9tdGRjaGFyLmMg
fCA4MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKLS0tCmJh
c2UtY29tbWl0OiAxYzFhMzQyYWNlZWM3OTUyOGIzYmE1MWYzNzZlY2EyYmU1OTI4ZmU3CmNoYW5n
ZS1pZDogMjAyNjExMDYtc3VibWl0LW10ZGNoYXItcGFnZS1jaHVua2luZy12MS02Njg2MzZiMGJl
Y2QKCkJlc3QgcmVnYXJkcywKLS0gIApKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdt
YWlsLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
