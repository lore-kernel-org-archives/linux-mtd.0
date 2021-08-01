Return-Path: <SRS0=6coP=MY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8E3C4338F
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Aug 2021 01:15:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FD8F60F9D
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Aug 2021 01:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2FD8F60F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=W4igJyFc7oQmMWIv2njAuo6fM0MOADbO0g3WvCwRuiw=; b=sVc
	W00Ykf2noUnDMJIfX8RVkElSCw5SMlLcsqWTKrKB8qwnYlqEexeT+aJvkWJsE2hnrJ03issIeJrLB
	9/Xwk9YBr/ZjY7xFI/vZmnMDm7u6icWnVREIyw8onllWOiTxvd6e5v3bIN0XW9LAj2+qtPq2mpNh3
	FzloGjHKDslNrrtalwh1A75gcE5brL+V0LoXKCkI9xoT5PLtrgIjqNaI5YOOg9qRsTSqilVmOf3aS
	3EnAVXoL2/rfzvZgzZqQLyrloXCJX4I4bT44bEHug3Bc+HnBAXzDus6MGfVSfmfdC8bmvzqIw8tyc
	1wnEWQLIEbIQUJNOSb7tTt0YNk4ym1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mA03c-00Cbo5-5S; Sun, 01 Aug 2021 01:14:24 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mA03W-00CbnE-Tj
 for linux-mtd@lists.infradead.org; Sun, 01 Aug 2021 01:14:20 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id a93so4506549ybi.1
 for <linux-mtd@lists.infradead.org>; Sat, 31 Jul 2021 18:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=rrnVAflzyptQAD3zoVnNsa2pc5chmrxL2HSWR1fcFX0=;
 b=c5gBKZGJFmuNnPUvMDzxtqnNJcvZ7BzvvtbNlubU5NGyLTW8wzqeKjTaeiiSYQyqCR
 6v3I7teYERrPIZrBfgrkK5Du3+cCHatJ24RdGWc4dWAWR2yRQ+525r3cm3TxAYdBgJuS
 9bjdI3LjOycf4lptKJq66uOinS5BRcFkQNM9SMch+yCXsYV0bzfMi8EVKW+GfDUhAVQe
 HvkkDdpdtbPTqdvfozOgUughT7N621WvLvP3mgW5Undp/qcc45pWkK+tSY77WXzIf2WQ
 gs/KVMX6qqBsPAKFWScJgoRC1WnsZNN+pM0IH7YzgBsbuoOnQRj3e//d+44oEnTTSHX6
 ueoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=rrnVAflzyptQAD3zoVnNsa2pc5chmrxL2HSWR1fcFX0=;
 b=oBsQ5G+sj61k1ctPiL76pAZxIpllIs3G4nT6wiwxLtrqd2hfiwbV9OHZXPre5mYlYt
 vN2eGahwI1shypyfnr/2liWOvaY+RH9TJSL0fc3QEAxjgjZSXzhwN+zSAjG8awp9epC5
 uukCEjTxKs5r9bG7q/ZblFQYI2V8TFWfIy34Td8alk5/Jsg1mZxONv+400W+yLy8yXWU
 /wzuTM9KpOwx6SpSUaJDjUDK6mUxsXx/u/5VTH+dh1tivGq3GYCwcFqaTxv/YDTssBDh
 4YoetLjtO11QINOVSeWXmpaWgl/RceueZH6J5BdCcEvXSBnJtJQOCzt/yXQVCswRJDRp
 1Q/g==
X-Gm-Message-State: AOAM530PLcplbmS5HAXO9KHBFZO5kL+UOGtvAcnMvPphIF4z6cvBXuwC
 KTf0mk7HCbprn3IgLllfZa6y/LEi88B0YSjFob1xbnq8SjI=
X-Google-Smtp-Source: ABdhPJyV0XliAzFOO1QUBFopk11GJOxRWQ//SAOMdxOp4YU81UCKQrRq9Gvc+BRdm1nUcbUjLU28mJSgNS4klBtFG/s=
X-Received: by 2002:a25:4114:: with SMTP id o20mr13039346yba.330.1627780456100; 
 Sat, 31 Jul 2021 18:14:16 -0700 (PDT)
MIME-Version: 1.0
From: Jupiter <jupiter.hce@gmail.com>
Date: Sun, 1 Aug 2021 11:13:40 +1000
Message-ID: <CAA=hcWTqG-8vuNPn_DsxvjAqOpJJcx2Lg9irMj+JCi2U0gKF=Q@mail.gmail.com>
Subject: Kernel 4.19 MTD failed CRC error on Samsung NAND
To: linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210731_181419_024395_61381631 
X-CRM114-Status: UNSURE (   7.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

I am able to run kernel 4.19 to boot Winbond W29N02GVSIAA, due to
unavailable Winbond NAND, I switched to use Samsung K9F2G08U0D-SCB0
but failed UBI:

=> ubi part storage
ubi0: attaching mtd1
ubi0: scanning is finished
ubi0 error: vtbl_check: bad CRC at record 2: 0x9832d5d9, not 0x2a015d08
Volume table record 2 dump:
        reserved_pebs   496
        alignment       1
        data_pad        0
        vol_type        1
        upd_marker      0
        name_len        13
        name            rootfs-volume
        crc             0x2a015d08
ubi0 error: vtbl_check: bad CRC at record 2: 0x9832d5d9, not 0x2a015d08
Volume table record 2 dump:
        reserved_pebs   496
        alignment       1
        data_pad        0
        vol_type        1
        upd_marker      0
        name_len        13
        name            rootfs-volume
        crc             0x2a015d08
ubi0 error: process_lvol: both volume tables are corrupted
ubi0 error: ubi_attach_mtd_dev: failed to attach mtd1, error -22
UBI error: cannot attach mtd1UBI error: cannot initialize UBI, error -22UBI ini2

The difference between Winbond W29N02GVSIAA and Samsung K9F2G08U0D-SCB0 are:
(a) use different ECC bit lengths which I can manage.
(b) Samsung uses on-chip ECC

Does MTD support on-chip ECC NAND? Or what could I be missing?

Appreciate your help.

Thank you.

Kind regards,

Jupiter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
