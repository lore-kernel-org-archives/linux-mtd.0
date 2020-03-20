Return-Path: <SRS0=ekNa=5F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92549C4332B
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2020 20:22:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 547652072C
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2020 20:22:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fUZNtnjY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hDmXRJ1E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 547652072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=NmPUbmDQjwejmwvO+92y8N44DgAjtpBOvjEnm3oUS5o=; b=fUZ
	NtnjYWNzrsVSnnnr5GfWjLDjMmKhiKT7CG149FjJYm0zoptjBoeYKZLaFj/7jOXNPiBFZqJVF5/7X
	aw9iu2DmARah+nnt1YxZAbBKWRHVAxaq6suw8VZNvZMtbp5pb0E2vEJY3290bO+op4KU9ekWnbo/r
	cpKqjbRnhN/uZrSRmisWBAOWSZwAlJ/ozHOsP2VWwU2qg0uQJ573VYYEoLoxKwHLILplGU2NjCkzS
	8qdKnjRfziOgeM1eih88av4pVCp7CtFeF1lnUoIvsMZp5R5rNXKNDZ+Nc73+ai6Aaj5Nn3JG5Wog9
	XQx06Sw2ASghCfL6tD7NybKImXId5xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFO9Y-0000Fu-Sf; Fri, 20 Mar 2020 20:22:00 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFO9W-0000FX-4i
 for linux-mtd@lists.infradead.org; Fri, 20 Mar 2020 20:21:59 +0000
Received: by mail-ot1-x344.google.com with SMTP id 111so7243946oth.13
 for <linux-mtd@lists.infradead.org>; Fri, 20 Mar 2020 13:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=bAKLsk79MfbDU+8bgYncdTYRGIojaGJPT8x8ZSlk32M=;
 b=hDmXRJ1EXXZBXAh20vDfIGuq2cUddKo+hBv5Wh22YQvKxhHhdhWqZhVagD1bcWBSI1
 52pVPuVedBRCL72064cDj8PDQagbJQ96fkSwsieLHGcpn++guvYXTtbneT6J/ZvoM/kP
 yz7izMn/O07rava5JLHYs08eZAa8leg7uEyNAKhI/fx+zfxI+9w8jukyHPE1SgNsBViG
 vHN4p3JGNLgHtLOasxNQAD5QzGuQUmKKAFbuY2M8FLDgSF8OFQ4jNGVfyE8abN/Pz3NQ
 fVr0hKTDrvZOX538L2W1/Yw4Ut3QoqM0Bcz2KnPzVsGla4rZ4vBTP+id5VcQ6XI3Jpgj
 n+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bAKLsk79MfbDU+8bgYncdTYRGIojaGJPT8x8ZSlk32M=;
 b=UaBkE5w23GIEBifu7a5AWtvNqTuwohrp4TQvzkFKJqsU7ZDRPTtb/wbOm/QtcPjFcf
 VZPDvRMMdyyMS/kypNIo9FAs6C5YvckGirgK8fR6t5Nk3IqzcbZmN731m2QF8+rysrzG
 wn2nv16NXsN5ul+imDj71PaHs1V2QVKyyCaRj4nLcXC+Eh8b8O44Y+S3HARPUAPU7IAl
 zQnXGR7Ik1tcWSaU6KYkOvcqQVPfYuTpnBoGFkb/N8b4WvPqzIBw/XsG+1hpgYYoVNMX
 xogpmTdD+rZrfmhcwqgY303rTh2Oe7RpD59gAXLgLm/sCWcuYQ1jeAiSoCNsfgkgqYMx
 /llg==
X-Gm-Message-State: ANhLgQ12x1MrXslDB1oWaLWJCYyxAUiuVpN0ajHLGMt/QUjZMOeEFWxx
 ntufpld9qVoa21FBf50jzWhRauNmOBIcExVZ+zY=
X-Google-Smtp-Source: ADFU+vua3D2LnGiPPPRkPSUZ5YDqHmmLal/2aFQkGjkDRJPyvezFmcZmhgwK6PZe3tqW4qXaXbqRT9tBsMq0p1jVKqs=
X-Received: by 2002:a9d:414:: with SMTP id 20mr8629135otc.300.1584735715177;
 Fri, 20 Mar 2020 13:21:55 -0700 (PDT)
MIME-Version: 1.0
From: ron minnich <rminnich@gmail.com>
Date: Fri, 20 Mar 2020 13:21:44 -0700
Message-ID: <CAP6exYL889zuXgDhLE3SdwzC4idZ6tbe2oqXQRpZT2M6SrRbFg@mail.gmail.com>
Subject: [PATCH 1/1] mtd: add | as a separator after mtd-id
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200320_132158_218816_B1F0948B 
X-CRM114-Status: GOOD (  16.28  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

The MTD subsystem can support command-line defined partitions
for one or more MTD devices.

The format is:
 * mtdparts=<mtddef>[;<mtddef]
 * <mtddef>  := <mtd-id>:<partdef>[,<partdef>]

The ':' currently separates the id from the partdef.

The mtdparts can define more than one part, in which case
there will be more than one <mtd-id>:<partdef> component.

The problem comes in with newer systems which have MTDs
attached to a PCI device, which has a PCI name including
several :'s, e.g. 0000:00:1f.5 on an Intel chipset. Although
this is largely an x86 problem at the moment, PCI is coming
to newer ARM systems, and they will hit this issue in future.

There are two : in the name alone. strchr is used to find
the <mtd-id>, and in this case it will return the wrong
result. Using strrchr is not an option, as there may
be more than one mtddef in the argument.

This patch defines a new delimiter, |, to seperate
the <mtd-id> from the <partdef>. | is rarely used
in device names, so seems a reasonable choice.

The code first searches for | and, if that fails, searches
for the old :. Eventually, it ought to be possible to remove
the support for : entirely, but since mtdparts are also defined
in FLASH in the device tree on many ARM boards, wholesale removal
is not yet practical.

This code has been used on real hardware and allowed us to use a
squashfs in SPI-NOR flash as a root file system, with partitions
defined on the cmdline.

Signed-off-by: Ronald G. Minnich <rminnich@google.com>
Change-Id: Ifce3627cb03247bf9e54c8b19d24b60baeed2ec3
---
 drivers/mtd/parsers/cmdlinepart.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/parsers/cmdlinepart.c
b/drivers/mtd/parsers/cmdlinepart.c
index c86f2db8c882..eca8ec026d89 100644
--- a/drivers/mtd/parsers/cmdlinepart.c
+++ b/drivers/mtd/parsers/cmdlinepart.c
@@ -223,7 +223,14 @@ static int mtdpart_setup_real(char *s)
         mtd_id = s;

         /* fetch <mtd-id> */
-        p = strchr(s, ':');
+        p = strchr(s, '|');
+        if (!p) {
+            /*
+             * ':' is the older separator, which conflicts
+             * with PCI IDs T:B:D.F; too many  :'s!
+             */
+            p = strchr(s, ':');
+        }
         if (!p) {
             pr_err("no mtd-id\n");
             return -EINVAL;
-- 
2.25.1.696.g5e7596f4ac-goog

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
