Return-Path: <SRS0=wpEZ=37=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB254C352A4
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2020 02:31:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEB7120714
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2020 02:31:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YfgOO0R/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tpFbe4/d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEB7120714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=KYU2oxcOMvDmO6sImVB/qfIUvsBJj2hz50SkHkZUWHc=; b=Yfg
	OO0R/fzfSOcoggluicxUlxjsikCSMCr5oEdjiVAwwvn2OqyulBVZ4Bcjt74K/x30yZVXCQBz7LAca
	4ks08aLXast4UPChEq8Sa2afvuB6S5ECpzeKMSwvivlniFxj2oGClioixa57l4gAHFG9TKYzrSk3Z
	yHFQhztZn0+HAxdmMXmQYy1QBWrbjseqhQ6ZBxwaX1Bmw0AVrZECG6eJ8pHpM+zLmqZ7CPrXU1p+c
	bRsIDV9XkBhgTgre+Eyqa3MszEnd8NCfCYdP65uB8tTYNUWW5fIryeWZvb11Z7PuBMw57/yJDZ0oI
	sFm/ETl1Ti6GsfchSO86ucPBj6KsQHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1LKM-0007Zm-MZ; Tue, 11 Feb 2020 02:31:06 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1LKK-0007ZS-6o
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2020 02:31:05 +0000
Received: by mail-lj1-x233.google.com with SMTP id x14so9758387ljd.13
 for <linux-mtd@lists.infradead.org>; Mon, 10 Feb 2020 18:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=z9zvizdqzJ4+t3ijFXEG0ibxAvXW+EPztgpSA78b/OE=;
 b=tpFbe4/dDMcxPaPAXz6GRRpjKZHirPNOU3oBBc+tdCz4RUd3VbptZexNsvUlcRtDkB
 EZpdHWKKJ/UkPDfD6KegBKyBCCPoTBP2nQWZ9+PgQ66j+yx4TG5z47GoS0pm9u6Sn8uX
 ucjm4l+LXoNeBJadA2F1oHMpYN/9AKLP1RNisRHiiZ+sKkLJuyOx2GsoYe3pfyxv3Sqw
 46KBbGkceXwaiLoI9heVcHtgpihV66EJV7btDe+XZaZcP0dV5+mixktsIfLNiNmoprqf
 gTLTlBlfy5oYDEItuQeY4dIyQBe5BijzbZ2WHzHtk8HBO2pKSFLE70vt43Sa4+TN7EVg
 x72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=z9zvizdqzJ4+t3ijFXEG0ibxAvXW+EPztgpSA78b/OE=;
 b=PcZfftlxbyY5AmnDrBg20hkg1kbYal4a1c+ABK8BezM21jpFVbldqRzlGKNTkp0uug
 3fbgMOX+uLTvtjqwH572QRdFSmmlaWlr/Zwsq1X9d3iu2TUU/nsqdT8DRmgc5YxyY7C5
 t9Z2L/TZPFac8CXTBdFs+t7+O0nDeOWvxg5NN2/V3L23AkGUDBDtv+5OT+gxxYRL5PF4
 BfX7rLoTKWxbJMUzbNeIg+yUN3xfE+tZrAy7A1srfyFt9UyULNKO2IAjxX+Ha6prJGpC
 DVzLuEXn6Zl78OmScEMhqcFQSNXCfOX79s0tI3MNN8Z01c+z2JXqgobsWXMWDHDhmb6W
 0FRQ==
X-Gm-Message-State: APjAAAXjiR4YT9gr4Zvs5VNYb+Gg0di6I23eNe7MJsa1I3ZDLiY3h4o+
 aq1WTs1ZRz1oS3R1gTJHUVl3gtP+GM4waYctPHwqETNs
X-Google-Smtp-Source: APXvYqw6E7Ne6JbYiMcGwt2yKyu8q5QPjMI6C930H0mq+ElIGh1lI29Z91N6wvUCff9AeVG4E3o7WPMp/zQSr9z6y+s=
X-Received: by 2002:a2e:8907:: with SMTP id d7mr2833359lji.71.1581388257570;
 Mon, 10 Feb 2020 18:30:57 -0800 (PST)
MIME-Version: 1.0
From: Otto Blom <oblom586@gmail.com>
Date: Mon, 10 Feb 2020 18:30:46 -0800
Message-ID: <CAOfSrV25UiKjgpYBfW3KQF7B9uvr5sMzzTk=yUu3TWpT-OKHjw@mail.gmail.com>
Subject: Non-Random Bit errors on freshly erased Micron Flash
To: linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_183104_251165_934431E5 
X-CRM114-Status: UNSURE (   6.16  )
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

Hi There !

We using a Xilinx Zynq Ultrascale+ (Arasan NAND controller) with
MT29F4G08AB Micron Flash. The strange thing I observe is that after a
flash_eraseall there are 4 bit errors on each page (2048bytes), always
in the same locations, see below -


ZynqMP> md 0x10000000 200

10000000: ffffffff ffffffff ffffffff ffffffff    ................

10000010: ffffffff ffffffff ffffffff ffffffff    ................

10000020: ffffffff ffffffff ffffffff ffffffff    ................

10000030: ffffffff ffffffff ffffffff ffffffff    ................

10000040: ffffffff ffffffff ffffffff ffffffff    ................

10000050: ffffffff ffffffff ffffffff ffffffff    ................

10000060: ffffffff ffffffff ffffffff ffffffff    ................

10000070: ffffffff ffffffff ffffffff ffffffff    ................

10000080: ffffffff ffffffff ffffffff ffffffff    ................

10000090: ffffffff ffffffff ffffffff ffffffff    ................

100000a0: ffffffff ffffffff ffffffff ffffffff    ................

100000b0: ffffffff ffffffff ffffffff ffffffff    ................

100000c0: ffffffff ffffffff ffffffff ffffffff    ................

100000d0: ffffffff ffffffff ffffffff ffffffff    ................

100000e0: ffffffff ffffffff ffffffff ffffffff    ................

100000f0: ffffffff ffffffff ffffffff ffffffff    ................

10000100: ffffffff ffffffff ffffffff ffffffff    ................

10000110: ffffffff ffffffff ffffffff ffffffff    ................

10000120: ffffffff ffffffff ffffffff ffffffff    ................

10000130: ffffffff ffffffff ffffffff ffffffff    ................

10000140: ffffffff ffffffff ffffffff ffffffff    ................

10000150: ffffffff ffffffff ffffffff ffffffff    ................

10000160: ffffffff ffffffff ffffffff ffffffff    ................

10000170: ffffffff ffffffff ffffffff ffffffff    ................

10000180: ffffffff ffffffff ffffffff ffffffff    ................

10000190: ffffffff ffffffff ffffffff ffffffff    ................

100001a0: ffffffff ffffffff ffffffff ffffffff    ................

100001b0: ffffffff dfffffff ffffffff ffffffff    ................
//433rd Byte is missing MSB

100001c0: ffffffff ffffffff ffffffff ffffffff    ................

100001d0: ffffffff ffffffff ffffffff ffffffff    ................

100001e0: ffffffff ffffffff ffffffff ffffffff    ................

100001f0: ffffffff ffffffff ffffffff ffffffff    ................

10000200: ffffffff ffffffff ffffffff ffffffff    ................

10000210: ffffffff ffffffff ffffffff ffffffff    ................

10000220: ffffffff ffffffff ffffffff ffffffff    ................

10000230: ffffffff ffffffff ffffffff ffffffff    ................

10000240: ffffffff ffffffff ffffffff ffffffff    ................

10000250: ffffffff ffffffff ffffffff ffffffff    ................

10000260: ffffffff ffffffff ffffffff ffffffff    ................

10000270: ffffffff ffffffff ffffffff ffffffff    ................

10000280: ffffffff ffffffff ffffffff ffffffff    ................

10000290: ffffffff ffffffff ffffffff ffffffff    ................

100002a0: ffffffff ffffffff ffffffff ffffffff    ................

100002b0: ffffffff ffffffff ffffffff ffffffff    ................

100002c0: ffffffff ffffffff ffffffff ffffffff    ................

100002d0: ffffffff ffffffff ffffffff ffffffff    ................

100002e0: ffffffff ffffffff ffffffff ffffffff    ................

100002f0: ffffffff ffffffff ffffffff ffffffff    ................

10000300: ffffffff ffffffff ffffffff ffffffff    ................

10000310: ffffffff ffffffff ffffffff ffffffff    ................

10000320: ffffffff ffffffff ffffffff ffffffff    ................

10000330: ffffffff ffffffff ffffffff ffffffff    ................

10000340: ffffffff ffffffff ffffffff ffffffff    ................

10000350: ffffffff ffffffff ffffffff ffffffff    ................

10000360: ffffffff ffffffff ffffffff ffffffff    ................

10000370: ffffffff ffffffff ffffffff ffffffff    ................

10000380: ffffffff ffffffff ffffffff ffffffff    ................

10000390: ffffffff ffffffff ffffffff ffffffff    ................

100003a0: ffffffff ffffffff ffffffff ffffffff    ................

100003b0: ffffffff dfffffff ffffffff ffffffff    ................
//945th Byte missing MSB

100003c0: ffffffff ffffffff ffffffff ffffffff    ................

100003d0: ffffffff ffffffff ffffffff ffffffff    ................

etc,

The offset of the byte errors can be found using this equation  0x1B1
+ (200 * N)

Given the fact that this is not random in nature I have ruled out
actual NAND cell bit errors as a possible cause. Problem is that I'm
not sure what could cause a problem like this.. I'm guessing something
is wrong with the 4bit BCH ECC configuration, but I'm not sure how to
proceed.

Any advice or hints would be greatly appreciated as I've already spent
two weeks on this

Thanks in advance,

/Otto

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
