Return-Path: <SRS0=rWZ+=XP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BA2C49ED7
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Sep 2019 09:52:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C56E720665
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Sep 2019 09:52:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="upiHV7cF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dz6W1csg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C56E720665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=JQk0E+MyXhU1zYuiPOmP/9I+OX/f2lQLcJOFJsx8DMw=; b=upi
	HV7cF0mEgWItZuXJzg80ymTRfpxN8zv3tpFRd2ljqaBS5aahGolLdS0qvYCD/Vg2uCIqwg14Q61KK
	A3h2ZakNGtm6SLPTo+2+90Cd2dmoxOU49neLlhtnyQ7SdmeUBT+wXzt9+I7RHdd4R8gnOa2gvdFBG
	tG7bHkPMXnnTF8wdefUxswG7vcViaBRkepAT0eKgPPJ7vcIf6LHyF2EHRaGLORV8yqHW2BAx88uNu
	QTk2s8NkDz/lC4bnQlsN6TSutVfovSj2M5+OvSOI+SFBRp6jzXhNIDdLD39VGFmZGWTgyZqhhwIO1
	YJ9qKNpCMNf8vwo4yja+XaDft8SD8YQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBFao-0001mG-Sh; Fri, 20 Sep 2019 09:52:46 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBFam-0001lu-SD
 for linux-mtd@lists.infradead.org; Fri, 20 Sep 2019 09:52:46 +0000
Received: by mail-io1-xd32.google.com with SMTP id b19so14816529iob.4
 for <linux-mtd@lists.infradead.org>; Fri, 20 Sep 2019 02:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ULqsJKEIeHgaC/pNfZ08YUrDLNwlxoDprrHkJGcjJE4=;
 b=dz6W1csgEklCxRlv0mC//WSUDq8ywxejBCtga3p1876QE1fb3gj7POhc67ha52M/C9
 iiKFpUbceOfbbTwvOtPEan7nb6YwfnNVsk3BB99Dx3G7uTsbFzhoQR1F8DCzpp/2IpJW
 cuRFBiRdtcHyiRV3Lf4OGpggPW9RFGB3FuUIQjmoPdSWV39qhx0+gEBZxi4/uq+ze0T8
 3HNtszcySYWAIXVq+LJ2z160YSLGfOe2jPDx1vz4VG163m5BSoK0JmRQRqRW/3UwYaf1
 cElIqVid5lHPa/aKFCLwKXS/0R91EbtPEJQG90X0xlDiU2Y/uoWgHT5TlVPfRUO/MbPO
 yN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ULqsJKEIeHgaC/pNfZ08YUrDLNwlxoDprrHkJGcjJE4=;
 b=e+W40Eqc80QqLMNHXAfvwOGrzR+ITbaX1Z+eS30fOE2iVyh9IvLWjK8EfwQXjIKPHy
 oo004qUR/v8wv2phqh0cJXNWAKv5fmGLFC41XYHxZRVIEBdPkmqtuEgVD3iaVBo79KM8
 jy+L7xaEF4dTPfYgh/6HAF2vHHXouU4wpq8qOOk4tcYOwZMnHbJFz56Kzu5QpbtQ3Bif
 iHnNfXsESvqw37p+MlHiyEw1HTGMO52yPPgqnwTk7AaWbOSm0dT+CmTIk2YANqGOW6dk
 3tBgYSDXqVoTl640D8pu0Lw5/HE62ZD8pIZ6thpeFg/mNVEt/SyD9iRyorw26g6Olirm
 jvEw==
X-Gm-Message-State: APjAAAVYg/TXFCLr8qF23hRj46cjK01urYwXpcd7UjmWv636ABg83F46
 y6OsXs7vr7Gs9gc+9fEq/mfJ7SJUOzeW8lFJzoHexQ==
X-Google-Smtp-Source: APXvYqxtoW74C2dtGsH0w9NUN/CPqaA6JFDEocW+ofUl0xF9yiCmD0wt/9FijAkl7Ig25T53StFAK5KJtaRUo0WIUTc=
X-Received: by 2002:a02:6601:: with SMTP id k1mr19017184jac.47.1568973163334; 
 Fri, 20 Sep 2019 02:52:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:9c85:0:0:0:0:0 with HTTP; Fri, 20 Sep 2019 02:52:42
 -0700 (PDT)
From: JH <jupiter.hce@gmail.com>
Date: Fri, 20 Sep 2019 19:52:42 +1000
Message-ID: <CAA=hcWRK-ChXxovKqSLpDF+JO7DtjginYXY33O-xtEAq25MiuQ@mail.gmail.com>
Subject: Missing all ubi commands in mtd-utils
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190920_025244_914535_CD9C8D5A 
X-CRM114-Status: UNSURE (   4.62  )
X-CRM114-Notice: Please train this message.
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

Hi,

I installed mtd-utils from Yocto, the document
http://www.linux-mtd.infradead.org/doc/ubi.html#L_usptools says that
mtd-utils includes all ubi commands, but I cannot find any of them,
what I am missing here?

# opkg files mtd-utils
Package mtd-utils (2.0.2+0+bc63d36e39-r0) is installed on root and has the foll:
/usr/sbin/nandwrite.mtd-utils
/usr/sbin/flash_otp_info
/usr/sbin/nandtest
/usr/sbin/mtd_debug
/usr/sbin/flash_otp_dump
/usr/sbin/flash_otp_lock
/usr/sbin/flash_unlock.mtd-utils
/usr/sbin/mtdinfo
/usr/sbin/flashcp.mtd-utils
/usr/sbin/flash_eraseall.mtd-utils
/usr/sbin/flash_otp_write
/usr/sbin/mtdpart
/usr/sbin/nanddump.mtd-utils
/usr/sbin/flash_erase
/usr/sbin/flash_lock.mtd-utils

Thank you.

Kind regards,

- jupiter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
