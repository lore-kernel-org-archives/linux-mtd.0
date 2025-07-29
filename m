Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4364FC87FCC
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jul 2025 20:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=HHq0OK6BVET/vV2jiRmZ4WH0csLmrJtxPfxWYWnB4Bs=; b=cFq
	ESqEjKASumXbS5NyznbiL3woH/2+seu77ponDgeCLCRglfnbbrDP93flkqg4nNtPDa1dcx8Bl7V6x
	ivb2ThpbbWRfzl+kw6Z0izBvfpEIR3UEb0qkMuP5IxwLyhBgswkdBCpDTnr/FNZatdl6TxNOAdFog
	kyZujaiVPWa2JlRkBh9FCcxbGCWyZMAHOgehZv4qOOkxf5GOG5Yd5RtaC02K/21ogI8WDOPWfNebE
	gAJVuu7Con0st84FJYGvQZ1y0q0FdtVyZvynqg0tNmd9XxeD1MNISGz24IbRYA6E6AHh5uuVcq/Lh
	xlxP9xO5SOc3xhHSYSIfCLuaAUhz8kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugqgd-000000002Bp-2FUj;
	Tue, 29 Jul 2025 20:12:35 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugqee-0000000021m-3P8E
	for linux-mtd@lists.infradead.org;
	Tue, 29 Jul 2025 20:10:34 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aec5a714ae9so878980966b.3
        for <linux-mtd@lists.infradead.org>; Tue, 29 Jul 2025 13:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1753819829; x=1754424629; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FKuOQIUzxLcHTK7W3h1Rqt2SBeSCsDHUPMu2l8U3bnA=;
        b=BEAZG8rc1qo8R05zhT7N871b18h2/QymWDkaQZSXoGx+j5qsoPJfcAxs+7GF3do7P7
         ocBKyGdwdc+/OBfQFbG7UrMAFA79lpu/AEMunmQEzPSw0LZkHom7uaGfpbuixYWzU9m6
         lIAG4BMj8kQJIbvnawQT51lpgD69NpjbnIRS5ENA8A6k3TR5ZcXK5xB0ClEKdE5bc+50
         T5WHB81l8fT6ZtON1Tgc3cKH+qr1bZRRru8wVFo/sRPi2a7oNjicYbAcYGGFSCYJS0uF
         Qni/wN63gwOmhOzuBOzad0dTP9ok5WC09QFRf0ytGpiEqNLijYJOorDrjRy40yxKYSRy
         jSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753819829; x=1754424629;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FKuOQIUzxLcHTK7W3h1Rqt2SBeSCsDHUPMu2l8U3bnA=;
        b=k/Z8HBhMOf5itaPPgUCa0g6VCfKrzf/+fIYFAb3Ccd6BB8ugZ5QZbfG0USmvnt3mS+
         t2gPOwGrRJtwZkZli/t4q0DHI3uvikZD2Ux9E+qAE/XV8/pozjU37uDAdGRsnmk4lH0j
         MoI4hSpCRuSjSTSrkeepDgeY8PDtYViyo6DKk73/Qaj/nvoC4neMfRXYB8nPwpME2MpM
         RTf5C3rWar0mAQABZpLtsN5z4ai5kn/05yYVaPt8Fk/q2Cs+BzuFLlXUGSkdv77DtrB4
         nzQZRaYGQj8e2GuaR8gx9iCEX9LX0CvO1ze3KhOqEMPBmMqiRASQsbOhf88a1mZ6+TEz
         74+Q==
X-Gm-Message-State: AOJu0YzMafxUT9QzS4VTfZmTI+xkgEe4REjTfZs9lYZPu7MLrFCWhnLZ
	DqKar6SidPcijJRFAH0j4kIxDYWD59O4laODGY60zH/bOj2h4Cdgdxsid2SONGGfkBQeZ/QJ1hS
	qhMne
X-Gm-Gg: ASbGnctsaYdBvKVqrQMwxpRTuZ0VYYIkvFBASLXgnwkPH9et5pTiL6DiHrAAWtjYqMU
	ayQoKEgbtLVJ0x3ozHCcnYYcTSXkymLy9hsYysgFuR+QK/7tviC1fusGQbW86VFEb+df6VsNEL8
	iRHHOIkdxGBvUvLQJz4z9u/1+yvx076CZ7DqcLdbxsLiHBA0praCa3wbsrYxqgjy47VHdrJsmUM
	nRHBPIrB6gJpJnRFw8OCdNlptzzveo2aflkTY3uWi8HE9i9Q5fs5wzflG5sAaBlHn5zOm3RXaNh
	bj9shS6h1vMWmcHRr7+HOPdUNH4th7Pq2ixTMWqATeEvvvSbOJUPFeHrcnLpHzB92U7ANdWVA/o
	Re2ogdq/78x7KpKvR68nrHKcvFRQ41oIEh9xTU+e4G9VM053feQsMFqyJ/MBpYTM=
X-Google-Smtp-Source: AGHT+IHOcV6g/UKdaeOksJAZv8oqi/ykcVNEIP0+IbKecU0CG+YVXXzJt1mG7mOgdrjHD5QqgjsYNA==
X-Received: by 2002:a17:906:f59c:b0:ae9:8cb4:2fe8 with SMTP id a640c23a62f3a-af8fd97327fmr77327966b.37.1753819828620;
        Tue, 29 Jul 2025 13:10:28 -0700 (PDT)
Received: from somecomputer (85-127-105-52.dsl.dynamic.surfer.at. [85.127.105.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635a65fffsm622702966b.76.2025.07.29.13.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 13:10:28 -0700 (PDT)
From: Richard Weinberger <richard@sigma-star.at>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] UBI and UBIFS changes for v6.17-rc1
Date: Tue, 29 Jul 2025 22:10:26 +0200
Message-ID: <7787490.DFzTOozpa1@nailgun>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_131033_381174_D3CCCE9B 
X-CRM114-Status: GOOD (  10.21  )
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
Content-Type: multipart/mixed; boundary="===============5904316351919407856=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============5904316351919407856==
Content-Type: multipart/signed; boundary="nextPart8201394.atp6XCIr46";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart8201394.atp6XCIr46
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Richard Weinberger <richard@sigma-star.at>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] UBI and UBIFS changes for v6.17-rc1
Date: Tue, 29 Jul 2025 22:10:17 +0200
Message-ID: <7787490.DFzTOozpa1@nailgun>
MIME-Version: 1.0

Linus,

This time I'm sending from my business account because Google still hates
my mail setup at nod.at.

The following changes since commit 347e9f5043c89695b01e66b3ed111755afcf1911:

  Linux 6.16-rc6 (2025-07-13 14:25:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git tags/ubifs-for-linus-6.17-rc1

for you to fetch changes up to 99dbb2a1bd661418be33b1ff1462c09b7d2221cf:

  ubifs: stop using write_cache_pages (2025-07-24 22:23:14 +0200)

----------------------------------------------------------------
This pull request contains the following changes for UBI and UBIFS:

UBIFS:
	- No longer use write_cache_pages()

UBI:
	- Removal of an unused function

----------------------------------------------------------------
Christoph Hellwig (1):
      ubifs: stop using write_cache_pages

Dr. David Alan Gilbert (1):
      mtd: ubi: Remove unused ubi_flush

 drivers/mtd/ubi/kapi.c  | 27 ---------------------------
 fs/ubifs/file.c         | 10 +++++++---
 include/linux/mtd/ubi.h |  1 -
 3 files changed, 7 insertions(+), 31 deletions(-)
--nextPart8201394.atp6XCIr46
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEdgfidid8lnn52cLTZvlZhesYu8EFAmiJKqkACgkQZvlZhesY
u8HUMg/8CFqSNVKYHdzD7cewEieFJ0YNPN+DD0MkgLGoDKfahWzLFN8owTKjEvXV
ScyrVG6gSXuyGkYDIarmmupKnD8YXyNfoLLlVoYDh/LvdJhJNvcYo46jPZoBTmjK
r6oiI1pDdWV60BT1Vx10SJqA+J/xkbyrxlmtVgEeLbhH6SuzzqOxrfrmargK1q6h
TIsbzhK57x1o6DxTB8oFpVSPqmeegNEsuaCZhZ/RwrVUUgADnfImFkjhFafSS41w
IBmTY7NBnEKQVBgCjLBDWAIt0mqxcZsptFaNPe7UJtUk841Ts5kEMIt9B5mlupnC
qQmRGDjDUX8JS/MeMbISqBlp+0JgJLN826lRtD9sli/RFMUhO+d2ONYvGJ1XADl1
zfkITxx2SWQHSmBwe6QUY/OpsgM1eqr2N4PVbPwTDV0266XSrr2CB/uFawbpKWTC
RGCv+8/yxXfI1+yxjpT0HVVT/5YfbMM4Z8nWDK5PAYqJ1GTL+WcYfShE/xke1sos
tKtjIip/zk1MDbCNo0GwVl0wlOJpL5jhwVWdf3HbbDoTRdAuNSov6batWzY9L+EA
aBnrqkK1dgOwnikGLnTACrYsOqYGUEhuLtokFFBQdWSTq3XZP43YRUKmG9umj9bZ
VSYbKZxs6WwUCdRyfIYzF2+OCE3L6C7p6cJcU+TYdqhACSiRJzs=
=3YD8
-----END PGP SIGNATURE-----

--nextPart8201394.atp6XCIr46--





--===============5904316351919407856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5904316351919407856==--




