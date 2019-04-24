Return-Path: <SRS0=0gGT=S2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535DCC10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Apr 2019 15:01:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22B822084F
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Apr 2019 15:01:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o5O8ZQh3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oU2oyEUP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22B822084F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nzGme/o7Hiswbxc/7D7o2bvEiEEkLwBSSKpBs3noAM8=; b=o5O8ZQh3y5/IKr
	pm5//Dq9sW9veoLi4X8wdQvsfLrbsPKeqzTnuD+z1hSbS+YHtM1EYGr+i3wpNPnpk8wvwE5DY4LvL
	bVbdrWBM4WyzuM+sF4KUXTl5WFS2syyqxqDwIo+h5w08InJrhFd0N0jKfcYvWDKgBZfJU7MC1gMeD
	8KAshiYz2JAKt8+3fYZKm1NsGGdFm+toxaEa+ioulS+lAvS/HFZAe7659kF8c1m6TF+rZle4R7f6f
	AN28mwvCfazrUXnvfaJekyvFp/nMNuHYJA6BKhjZLU9JZueepxyG/eHX+cFoNzixMFrZjgQ/XmAZh
	WcepMJZy3h41Ts2qqvRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJJOn-00065v-Du; Wed, 24 Apr 2019 15:01:25 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJJOj-00065C-QL
 for linux-mtd@lists.infradead.org; Wed, 24 Apr 2019 15:01:23 +0000
Received: by mail-oi1-x22c.google.com with SMTP id a6so14528526oie.5
 for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2019 08:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=02TaMCFQHnJ5tGoUOKA27p5QCIGvGVLFVty0SUo1GJY=;
 b=oU2oyEUPz737e3EyQc/sQxSkO3ummAh2AhYr6DI5uglpAd8k09sxNugdYo60/BRRsn
 HoWXnYtJJMg+8QDYG7iZ7DRmudNYTt1Irz3rSxKpEuBlv5d3ayNqtkbFab0UIMLGr6cL
 6IqlQfMCPcQxvdnbGweGz545UAk+9aoVcNHFCLl0BcuXlVXvtjw0aagxSYEggzPU6gRp
 s2l+z3XKibmS2+5r8oX6npBc4w9E/RzBup0E7SWjKy8+MLoV2XGBzYkMboyvQ7kZ6Ps1
 kbzOL8SYydLIUNutbvSboECXrIcJG1AYYXC5Hl7BHssNb36+YZSC6eYOfjL8woJ5BVV+
 YIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=02TaMCFQHnJ5tGoUOKA27p5QCIGvGVLFVty0SUo1GJY=;
 b=F0Zj50bK2RMQpNoIjQe6iF66ILhaMKWKr8gno9R1020lZomOop69DUaObzEI20fvZd
 uxdPkkICq60q9sbfqX47H9K/e5pHzHjXtmG3C9amaYFwy46DO+UT4YSZqI+tgSNNI3yk
 6NQst+MHBAYXbtfDaQqvCX9skn+1GByt8+aJPwjkI+qUzp6UwsTX2wT0v53cwFfHfJNY
 pD67mQFu84m+p+kActuW9a51n+dtz5oyqA1worsZ1S0DzXLvZI7w0HCl/CbCca25rn0C
 Nu91DsiiNVVcJE8fE13/jOJOAz7t9/+5UGiYvEw37nvQPZVBfwcFyBs5ecfO1RKBxtwz
 /f7w==
X-Gm-Message-State: APjAAAUSFld/QJuZZspZjetBocKmx9pw3+A32uYHIFnjnd/UNK5Cxn25
 wdgA0PORD7eO8UIYQkoDtlylL5P1+3ggvhsalXTm+Fx2
X-Google-Smtp-Source: APXvYqy+POrJVbcw9l9gaDQarOpRJBrxVwv1kF+enD56cg8FeEVw/J4klqV9H95hI5SkEXyDtCi66J23WTGOywdHWQ0=
X-Received: by 2002:aca:3c55:: with SMTP id j82mr5525841oia.84.1556118080716; 
 Wed, 24 Apr 2019 08:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <5d6f2392-ac70-3192-bc16-ab3f7a88ca04@allycomm.com>
 <CAJsYDV+Y4-xcuLqv7QTL_BtNcVOZriwnrkyTCTLjxJi2WuHv2w@mail.gmail.com>
In-Reply-To: <CAJsYDV+Y4-xcuLqv7QTL_BtNcVOZriwnrkyTCTLjxJi2WuHv2w@mail.gmail.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Wed, 24 Apr 2019 23:01:09 +0800
Message-ID: <CAJsYDVJmZD2aBqEA4iJ0HGPvN1OM6NEuSSyBAKw_+h0J17rk+w@mail.gmail.com>
Subject: Re: spi-nand: GigaDevices Support;
 qca9560-spi Device-ID Byte-Shift Inconsistency
To: Jeff Kletsky <lede@allycomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_080121_854414_5AF667FE 
X-CRM114-Status: UNSURE (   6.23  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

On Wed, Apr 24, 2019 at 10:48 PM Chuanhong Guo <gch981213@gmail.com> wrote:
>
> According to datasheet the free areas are 0-0x7ff and 0x810-0x83f.

Sorry. I accidentally throwed the data area here and reserved too much
for bad block mark.
Your F variant chip has the same OOB layout as currently supported
gd5fxgq4uexxg.

> 0x840-0x87f is the ECC area.
>
> > [...]

Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
