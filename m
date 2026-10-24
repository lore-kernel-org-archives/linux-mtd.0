Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE87E606A31A
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Oct 2026 12:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hHF7fw8Z;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=alepacheco.dev header.i=@alepacheco.dev header.a=rsa-sha256 header.s=fm1 header.b=el6As6qC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=OHRQFyCF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xEt5LHvh9wAd/gkvP8M95bzCA7eMRpHyx1ADzEqfBfk=; b=hHF7fw8ZsuSc98UeLMu/GC4ooD
	bPIajy5h5GciNHVrbMtXfohDYZGq85hPp+kwIeNXd0CjpJsfpAMyJHtyFtTqCYpQt24wAa4BteMub
	yIqifWhqZA5AS2JhLvEJetCgkfwBIpcWezaO/aX4NzmH838GIqRN6yDKND990uIOq4JrLNpr9d1Wo
	5SyLhtNnY2+36tslh06Fhp3Xk44LpxZQQsUQ8Lwh4TFDpKmkIpk/fIbrlz2nVcEI5nJ3HWtCul0xm
	WRq35t5ifvJQyr9ItIu1OxiKWctM0r2/dCIkdL4gjPzatJ0Zc+C6Zw3FjTBg7NDkTSLG3kPtt2ZIT
	kd+uvBFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKb6P-00000000Btm-2hOa;
	Sat, 24 Oct 2026 12:44:01 +0000
Received: from flow-b8-smtp.messagingengine.com ([202.12.124.143])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKb6J-00000000BrF-1bHt
	for linux-mtd@lists.infradead.org;
	Sat, 24 Oct 2026 12:43:57 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 36C1013019AD
	for <linux-mtd@lists.infradead.org>; Sat, 24 Oct 2026 08:43:53 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 24 Oct 2026 08:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alepacheco.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm1; t=1792845832; x=
	1792849432; bh=ENhw4oZ7dkCvLtEmjtoon6DPAJB7hCjSjNl5XJyd9Oc=; b=e
	l6As6qCTal9LLJ/htEX/Stn2qLwfpUxt64s1D5Hsedgca5n2rOcRpqUwTMUFZ0Wz
	c51yVL/raBGUF16P1D0GgDfIbvC01Dksfdv1ccCqcfMHYAxhU1w6fGg2QOJXdhfz
	cpAlbMktQEr2UqglTcbS9m2mySGT2WdQqB3YwSPI4Z81XQceBRGoyr65VwiUvqRa
	UsLEuN2NftrrofbaXctz8p8JibucqZ0mS9s4/lHzOaSoaUs0I9TnxjDt4MG1E53k
	ShCd3tbrtTeK+F9d2lGMpnsrBaOvn1fveKrfUj98nxRrd2xIW5HAIySyeNli/ApI
	wEvmIIdacwYH6aEdYoDzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1792845832; x=1792849432; bh=ENhw4oZ7dkCvLtEmjtoon6DPAJB7
	hCjSjNl5XJyd9Oc=; b=OHRQFyCFcyylnJohh+i+FQgH/xttTDiYrJxJw7UpCumn
	TH8FUEed/2D3aoJRlqOBi3Hungvypi5KvKp89hwZgGTGB39WsKVs7BBdExTpQ3Tv
	jEwMraC9jnDNT6h+Hkf/XjKs70Z3uZLgbBkFHmZniMPE7yJFcJgVJi4/LwCGr6RX
	sGcb3tsugnId1XVKyguMa7laxx7XQ3SV1Z0SS6AugIhbUsxlmUJ2qVY5sr/XETgL
	uzq9irYlUJ7wIZG+A69vgjPyV3Wvq9TbWAyEMeM9dMPPnSp/J1+hle3m4h6pB5TU
	8Dfdti8OvefZGfjCiloDGcaYmB+QeLwjqK9HZB0Dew==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=alepacheco.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792845832; d=alepacheco.dev;
	mf=PGFsZUBhbGVwYWNoZWNvLmRldj4=;
	rt=PGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPg==;
	s=fm1:rsa-sha256:qsSP11OXyHtlUYufQWv+jtE6aLyMeLWxEcFtOU70lItrz9v
	souBAls3BiaofiwglY2hekSX9x1OgvdweztR9roMimBhI9WfJJ6NYQffmojexgSu
	fKAfIysPNRtg5Gff2+MFTr+rV2dvhvP6VqwNhPvLBhsmGSSXW5Z6LkbhqL5IO5lm
	sMIBNCAr8VcbAUHzkcxNzKgFVHvG9Q6XMk3/F5CXuM+qcsS4WrfelpkBEVkgT1uH
	uj9C4TtJzPEQKfx7KdhJ6/b7/9UECftF5mCDGYZk45ZVR4T5CDg7bGvIbfo56+YQ
	Ve149zlEAZfjy99duUHxr26uDZJFT8MqmCqlmPA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:q/20VQU3SVZJvTb9VFDJq2fqOsmMOSC23FicZ+FboCQ=:slF7uynnDrqUAcmaJgx1X4rd1EXSlyPTMvetHGJ2f+o=;
X-ME-Sender: <xms:CKjcaggvhXENat1fSCST6gbc7KXn-N7sRYMtBGiRQy2niX7OdFxsvw>
    <xme:CKjcaj0K5ST1e6yn5DHqHYvei9iLOlMC4h5Uzcea910TjJxX5E5342VpDefy3cGzD
    NCMwdkqgOxJvftcttLohWVsjOQU_fm2nmEiGCEE_TBPy7JEXGZDeI1w>
X-ME-Proxy-Cause: dmFkZTGV7SK1cWrGZthFWa8XkmJ66JuwGiPPOMutVIbcRSFR6MLAIUMYblUOqL5GWGSJ0v
    YNr6zpsE5vYSmbv8sRU7UrC841yllAbKXaUPKr7l9YuWZRbjqQX9I3w6jcRv454c67vyz9
    2a60rFrOourTzmy3lFCrhfX9+1aDyxRktApyboxLqofk2HrrViGBrOe9GVsm23VHzNT+Wn
    mZjNA1sVzeYLXW/mtccpkFnYIGe9rSQpHXRfVM5b3WU8QzV9lpXknZHoANHV4MlXo54zdn
    rQzTEfEVAF2NDPPBHzPa1b/5+h8UF9oedc1Kw7aYq9glpsBMbWhhqGNriuFjQ7fPRnifAz
    Afkb8+FKGKZy2RkUOQsw4UmEM/C5uFDuIHGvorP5GBLZtLZuAxtRLx1+72bqvYZyMSyK5a
    QbBT6QjiyHj1/YzKsZMmF8kx3pAJYxLDwIhQ1DuAwrIxcAAwXyhQcHypyRlyCh0Gsz02xo
    p2SPBhujUwUX5oAVYKc28NN/FgsD8wrBnID3zCsucudhld/By2R6xumFQc9iUzMRvvJGE6
    2oxvy+LK2qOJjJ8P9fXBfSwgL4Jc30KPpqWdEnKn7oSz1SCFwLd3defEZVmqE0uI5m7PsA
    zi90t8zzjZ2I/iOK7eUpl9mP9ADWqeAup6t1tk2MnLlnUnQTH4eZzHBD8LWw
X-ME-Proxy: <xmx:CKjcaqjur_KfSgA-rbKT36p9-2HyT13Xu5U1TzHZWXgLghgX8cSR_g>
    <xmx:CKjcal-sY6eRu0tPMz2Qr6SE-JW9tIo0yTvQuiDba2PFc7a9S26kXg>
    <xmx:CKjcahE16invgkQdG2MLZV59alYBnzbPSEKv-5a2ajJBlZleP0UqcA>
    <xmx:CKjcaoni3-z8nIh7rs4hnl3E_M886Do8MkyCvezhmaEP-OO8naZjjA>
    <xmx:CKjcavMDrHNI6gsx4SNhT8gaasu2roO7R1nmkuzYCUWfj1r0ZCblpjMb>
Feedback-ID: if58e4a8f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1A26A700065; Sat, 24 Oct 2026 08:43:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 08:43:51 -0400
From: "Alejandro Pacheco" <ale@alepacheco.dev>
To: "Richard Weinberger" <richard@nod.at>
Cc: "Zhihao Cheng" <chengzhihao1@huawei.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <6083713b-4c4e-4e17-93c5-61f3bb7a77f1@alepacheco.dev>
Subject: [PATCH 0/2] ubi: Check two values read from the media at attach time
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_054355_786058_A8A9C953 
X-CRM114-Status: GOOD (  11.42  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Two values that UBI reads from the media when it attaches a device are
used as an index and as a length without being checked against the
device or the volume:

 - the PEB numbers of the free, used, scrub and erase lists of a
   fastmap, which ubi_wl_init() uses to index ubi->lookuptbl;

 - the data size of the last LEB of a static volume, which
   ubi_check_volume() reads into a buffer of vol->usable_leb_size bytes
   when the volume is first opened.

Patch 1 rejects a fastmap with an out-of-range PEB number, so that UBI
attaches by scanning instead; patch 2 makes check_av() reject a static
volume whose last LEB data size does not fit its usable LEB size. Both
need a crafted image: the fastmap and the VID headers carry CRCs.

Testing: UML (ARCH=um) with KASAN and KASAN_VMALLOC, a 64 MiB mtdram
device with 128 KiB eraseblocks, fastmap on, this base with and without
the series. Each boot formats the device, makes a dynamic volume and two
static volumes (the last LEB partly used and exactly full), writes them,
detaches, attaches from the fastmap UBI wrote and reads every volume
back; that passes with and without the series. It then attaches once
more with one value of the fastmap altered:

 - the first PEB number of the free list set to the PEB count (512):
   without the series KASAN reports a slab-out-of-bounds write in
   ubi_wl_init(); with it UBI logs "bad PEB 512 in fastmap free list",
   attaches by scanning, and the volumes read back;

 - the last LEB data size of the static volumes set to the LEB size
   + 1024: without the series the first read of the static volume
   fails the UBI assertions in ubi_eba_read_leb() and ubi_io_read() and
   does not return (the boot was stopped after 15 minutes); with it the
   attach fails with "bad attaching information, error 6".

The altered values were set by a test-only change in
ubi_attach_fastmap(), right after it reads them from the fastmap, not by
a crafted image. Not tested: the used, scrub and erase lists, negative
values, patch 2 on the scan path, and 32-bit kernels. W=1 builds of
drivers/mtd/ubi/ (x86_64) show no warnings with or without the series.

Alejandro Pacheco (2):
  ubi: fastmap: Check the PEB numbers in the fastmap lists
  ubi: Check the data size of the last LEB of static volumes

 drivers/mtd/ubi/fastmap.c | 40 +++++++++++++++++++++++++++++----------
 drivers/mtd/ubi/vtbl.c    |  6 ++++++
 2 files changed, 36 insertions(+), 10 deletions(-)


base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
