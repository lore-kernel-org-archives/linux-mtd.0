Return-Path: <SRS0=okf0=X3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC0C0C35280
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Oct 2019 16:10:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AAE2222BE
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Oct 2019 16:10:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X9dop9Zi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IzhWuYkT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AAE2222BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9X6gt85T141pCqkDeyN9vdboE17vYgJkMeCTvSsFvwI=; b=X9dop9ZivMT42Z
	aBXZLNfJpK9O5dKeLKW5zykxpWaBX50s+9bEFknxZjjjEWYgFzN6T+OVyOl4hLB4MSk2gIUX5Pps4
	lxnqFFIlVSq3CjqRhRwbjEBJkEOS7V6e5f7zjuH7MrvpIYSmofEcUJrzlrKzed6zAg5JNi55Yz+Ys
	pTw36h4uJzfcV6ay0TkSPSdZOxc2banV4kL2K4XkM8tYe765l5Y4msRayempRAJflSI6S6VwUfmVL
	15r+woT/BVtKOQbmgNvgZZlYn+xfjKMN57wtaFyFHcVc4QBxUyVXZ6XyV2tvhcZatouta3SXgiq+O
	myNoQOEnP7AVK68RTgog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFhCf-0004Xk-H0; Wed, 02 Oct 2019 16:10:13 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFhCd-0004X3-3P
 for linux-mtd@lists.infradead.org; Wed, 02 Oct 2019 16:10:12 +0000
Received: by mail-qt1-x835.google.com with SMTP id c21so27007568qtj.12
 for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2019 09:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+3yqibiD2Nqce4jlPuFNd95YeLDIUQt7VLIGYA2GVzQ=;
 b=IzhWuYkTFgQ68F86YaA7C34w68ZwwtiZf1b/h2P/wsEfhOpAu0lTMOgzbuP3qA4qXR
 se43Dem6kiXLEX+M1wimc/A2CHBZLcyzHOhhh4CdtdD/WPemxpPdji/EDqcAMTHJLMzK
 H6lTVEh2Ba42KPNO0aCvGUlvEMlID17eghcMYAnomUCVmgMkGdPPVwu2wMpU06yWwg1g
 6Yvxj4FEchW+wP44itVVyHZSCcjnpNOt+uQaRHi7/ABYGOPfxHk2K9gzgxQevQW8FwZ0
 uAn5hmxekTj1nYSzwRSS8nysUuiV/QIPtOrF2/YUzqzrZFujWJjDln+qKkAZqjPMVFYG
 GVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+3yqibiD2Nqce4jlPuFNd95YeLDIUQt7VLIGYA2GVzQ=;
 b=ZKFzLTcZD4oACb4Iz0PfupqIHV5sSfqfwWdkZMHkiMCZ2QUjBhExVArdIlYhzLQLMs
 O+QxnONmcdsGjaZo1mwUa2Co7/luAPSQ61tgKgKZqDr11GUfDCrRLo1dWZvO1JQg3avQ
 3sR4JGpaFPWzEmx6L56Oj+viIY5/QVu5UgOfxD4t8mSh9rjnrXogSmYVtDE+E7QDnMOU
 xVCvS39lpDZInTg6/cSSBkivtN2Q2zGOycGv9NA4VD+UYB0Ppz1ZQfdYjJfM7nozKMBR
 cjxykL68Ihbm+CKOdejdUQxVq4B/4glKblpFMiapAmeeqGjwDCBxeOFoZmNc1XeMIV+C
 eXtA==
X-Gm-Message-State: APjAAAW7nisk9408gHxot+XTNFRjcL7m1bRzNUkZpeMpA/azM60lDrTK
 NeO73jW1mCV5cPo+cUSPzJiasS941AbqgOIT6Dk=
X-Google-Smtp-Source: APXvYqyElHjo14Ovy6DJM0Ic2qJasNtsCfqXal5c0t4gFoM8hKWke+zv080iifnYbVG0xvuYMm/ztVpRKu8fjVDYnYo=
X-Received: by 2002:a0c:92e9:: with SMTP id c38mr3819774qvc.88.1570032608715; 
 Wed, 02 Oct 2019 09:10:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAA=hcWSR52BJB4+k2k4CwLTQUVmvJvR=bjRx6kqe2aar-PH21w@mail.gmail.com>
In-Reply-To: <CAA=hcWSR52BJB4+k2k4CwLTQUVmvJvR=bjRx6kqe2aar-PH21w@mail.gmail.com>
From: Steve deRosier <derosier@gmail.com>
Date: Wed, 2 Oct 2019 09:09:31 -0700
Message-ID: <CALLGbR+robQS+Vfd7q2+pCws2pvrxKBO+OgX7B9dShDCqFUkdA@mail.gmail.com>
Subject: Re: How the bad blocks occured in despite MTD manages the bad blocks
To: JH <jupiter.hce@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191002_091011_171307_31990013 
X-CRM114-Status: GOOD (  15.18  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Oct 2, 2019 at 3:35 AM JH <jupiter.hce@gmail.com> wrote:
>
> Hi,
>
> My understinding is that MTD manages the NAND bad blocks, but can the
> MTD prevent bad blocks happening?
>

In short, No.

> My iMX6 NAND device was only up and running about a month, it now
> failed to boot from NAND due to the bad blocks:
>
> Questions:
>
> (a) what could be common cause to trigger bad blacks?

NAND flash gets bit errors. It happens and there's no way to prevent
it, you can only manage it.  However, it's important to note that a
bit-error != Bad Block.

> (b) if I reflush the NAND will the bad blacks recovered or just mapped
> it to bad block list?

I assume by "reflush" you mean "reflash"?  Not necessarily. You don't
know what the problem is, therefore you don't know what will help.

>
> .......
> Bad block table found at page 131008, version 0x01
> Bad block table found at page 130944, version 0x01

For a system running with a BBT, this is a normal and good message. It
doesn't indicate a problem - it is just telling you where the driver
is keeping the BBT.

> ................
> [FAILED] Failed to mount Kernel Debug File System.
> [FAILED] Failed to mount Temporary Directory (/tmp).
> [FAILED] Failed to start Remount Root and Kernel File Systems.
> [FAILED] Failed to mount /var/volatile.
> [FAILED] Failed to mount FUSE Control File System.
> ..............

These messages don't indicate anything useful at all. Your assertion
is that you have developed "bad blocks". An assertion that can't be
validated by the above messages. Hence an assumption. In fact, I don't
believe it has anything to do with your flash at all, considering that
most of those aren't physical file systems, but virtual ones that
don't use the flash.

In short - you may or may not have flash corruption issues, but the
above messages don't tell us anything at all one way or the other.

Even if you do have flash errors, you're more likely to have developed
bit errors and your ECC is set at too low a threshold for your flash.
Or you're not scrubbing properly. Or you didn't write the flash with
proper ECC data. There's a large number of possible problems. Normal
bit-rot is transient and manageable. Developing bad blocks is somewhat
more rare.

If you want a list of possible things to verify w/re: to the flash, I
suggest you read this post:
http://lists.infradead.org/pipermail/linux-mtd/2018-December/086331.html

I suggest you give us the actual kernel log error messages so we can
advise better.

- Steve

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
