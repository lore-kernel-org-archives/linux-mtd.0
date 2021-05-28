Return-Path: <SRS0=UlXy=KX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C4DC4708D
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 11:38:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AE156124B
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 11:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AE156124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=gZ0LQZL/PjPglVa3U7MU7QVrYZ2Kg6Qjbgh0Ge6T6HY=; b=HzR
	eyyyRm2zR4KcV9lE2Dig77aIGp+cRmZHfbnKlMihoQFkGbc/i63BcJp0PWBJmX+rpnEL1jNzDzfgP
	rMJfAk+sLcT8BVqvXgCMfClVVzPdSX6ABLdeOzzYGmofVvj4ROQESZ33mS2tiEhgmrQEMVOysUX8y
	VCEoMeCxaK1RRjeE7d3MXoawCgPmp6bCE5o5WchUKEpZOimO5her/OfWsUJJlYcWZuTuG7ltDc9o0
	PH5HM62zn/7WouUlW3EFkxkz4pFOf6SEB0Mr/JTGi0OcDbDWn7c8QLnnp/NB8UqKCAcIh9/vgd+/n
	sR2VFnq/FmWFgFiZJ8WPh+NzREkq9gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmaoN-00Evok-7k; Fri, 28 May 2021 11:37:55 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmaF9-00Edga-DJ
 for linux-mtd@lists.infradead.org; Fri, 28 May 2021 11:01:36 +0000
Received: by mail-yb1-xb32.google.com with SMTP id i4so4980551ybe.2
 for <linux-mtd@lists.infradead.org>; Fri, 28 May 2021 04:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=GyowUhwTzWMnRB/FNJl8wFroV4/vGSyWfJbe9S6rAsw=;
 b=IRT3OeSxmURUEKJgMEAdQhWIOTR1TPnFY81TWo+Fo/Mk/RFOsiQ5sn+0O99lDID9Wv
 40BT9/gRVIrJ5HpQKquSvBea821vy3UgYZzNoHNPMuotoCXTphbg/TGd6S1xU/Hk7elu
 b2u0BFFkSABEA0GOPSEJ6+rizp5/OJTKyBX7CIVUHbf3c/BGGHGX35B+QIsTBzVTeVAY
 1egugZ1d8N70zYa5K1pvVAGmP9byzy+RrIFfQ65hTwWIlrkpCnwBIGECCIT+Poe/Kfoq
 mkQ3G2VTf1S85sKG4NfzzzEK9ax+17oHk2SgeHu6pXK9bbYNq4387nv+7XkYH7j1Hdc2
 BQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=GyowUhwTzWMnRB/FNJl8wFroV4/vGSyWfJbe9S6rAsw=;
 b=oLbaUNLUm5SmNgFTDzm0+U1bWHS3GIztEGdLHik3fqyZn3jSPU8QK5JevbDMriUjPt
 7VoPMswiGnjHjnZ0ou9xhH8y4URcHgfaJp4VGVJJvPvjf2lrwJY6MR+9+xLWTTgaKYq+
 ZSIwJWbu8O08GIZ1tda7q++W/pspASkWaHUazErLaKs96+nn6UNVkFSF/hH9Isli6Z7F
 Et4AfFbI+DyoGP+9/qFLG7eD7F2maKf8EowwF+rH55VAgBisGO1VEbcXic1pxu2ivCyl
 6FhOJQimkH/6cmjeGOf6BLqtj0F5q3Dzs2pKWnSz7lvJmnG1+VU2gTEF+pxiiT0OBtx9
 Bx0g==
X-Gm-Message-State: AOAM530HiNZkP0o4mQ2sPdJWdYs8/YI2ygK1mmcAJ77DW4NPQvDWcxBR
 5en54cvTpvKdltcK61t6v8RCIKUq2F6yeUQ/3nU992CZfgw=
X-Google-Smtp-Source: ABdhPJxeHOF9npf46co0Iko1w3ruAqnvI2aNtvVrPNRGspkIsBYBg8aI2v2EBx8iJcjo3jkr3YcNQcerKEIxcOBxUFo=
X-Received: by 2002:a25:1fc1:: with SMTP id
 f184mr12260956ybf.289.1622199688453; 
 Fri, 28 May 2021 04:01:28 -0700 (PDT)
MIME-Version: 1.0
From: Jupiter <jupiter.hce@gmail.com>
Date: Fri, 28 May 2021 21:00:52 +1000
Message-ID: <CAA=hcWQk84==-Y2yq44M-EL_jwqb2Yg2QKJXY9fNycDfLUGOgA@mail.gmail.com>
Subject: Failed to create MTD partitions
To: linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_040131_526912_AA9B0E75 
X-CRM114-Status: UNSURE (   8.91  )
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

I am using MTD in kernel 4.19, I was able to run kernel boot to create
MTD partitions when I used NAND Winbond W29N02GV:

[    7.961966] nand: device found, Manufacturer ID: 0xef, Chip ID: 0xda
[    7.968545] nand: Winbond W29N02GV
[    7.972267] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB siz
e: 64
[    7.986814] Bad block table found at page 131008, version 0x01
[    7.994254] Bad block table found at page 130944, version 0x01
[    8.002152] 3 cmdlinepart partitions found on MTD device gpmi-nand
[    8.008479] Creating 3 MTD partitions on "gpmi-nand":
....................

Since we could not get Winbond W29N02GV supply anymore, we changed
Samsung NAND, Both are 3.3V 2Gib devices with the same memory
organization (2k pages +
64b OOB / 128k blocks) so these two parts should be equivalent in
terms of internal organization, but it failed to create MTD partitions
in kernel boot:

[    8.137591] nand: device found, Manufacturer ID: 0xec, Chip ID: 0xda
[    8.144246] nand: Samsung NAND 256MiB 3,3V 8-bit
[    8.148995] nand: 256 MiB, SLC, erase size: 128 KiB, page size:
2048, OOB size: 64
[    8.158330] gpmi-nand 1806000.gpmi-nand: Error setting BCH geometry : -22
[    8.166690] gpmi-nand: probe of 1806000.gpmi-nand failed with error -22

Since it is a new board, I suspect one of following problem might
cause that error:

- HW
- MTD does not support Samsung?
- Need kernel configure?

Appreciate your comments and advice.

Thank you very much.

- jupiter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
