Return-Path: <SRS0=EbIY=4E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PDS_TONAME_EQ_TOLOCAL_SHORT,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E676C3B1BF
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Feb 2020 22:08:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 320C62067D
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Feb 2020 22:08:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iegnbDdc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUncG+uz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 320C62067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=VdwBzY/S78CZUQTewTzMiVNdLwBbERaQ7lvNF2UOUao=; b=ieg
	nbDdcjNO8d5RcFRyQQSF+D+06P2ZyAhrWrWyRa+Yf698tmYBUY2c4DYBJ+mrVKmm+uSkwAh2Xinox
	tVaGDLcAWXrJcvb4bustxwLpdHbtVixT9NnK2QmxUw+q/y5QDgWB6OjTxZzd9fwEaKLJm/30LPAkW
	dGD8cNtiZko1fpgpMzsZVK8JA1mVifGxzF220PWjp9N3Q+w8SSSJbqpLBQWGKAnA6sHDdKDnjn5Vj
	rsUZbWYtzoob4UtDgK9jBk8ZIVJqxpzBIsNlCk1hLoaKySgk7TCs9kLAFe+/VQpE4oKRnXzKNv1gn
	lO/g/U+d4Yf+JfhOgGJOWGpAFgDF08A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3S4r-0006nn-7y; Sun, 16 Feb 2020 22:07:49 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3S4o-0006nH-AV
 for linux-mtd@lists.infradead.org; Sun, 16 Feb 2020 22:07:47 +0000
Received: by mail-io1-xd29.google.com with SMTP id n21so4227848ioo.10
 for <linux-mtd@lists.infradead.org>; Sun, 16 Feb 2020 14:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=09s6w7LqP4z4Vr4sU9E8MP8StYfD7uZ9CWf43nvqIlg=;
 b=gUncG+uzs3XvWrGmmEdhTsX8DJ07R2B/coUdahcgnS5pkoCoQf2T4/QiS9xkwtzJRE
 P/MzdIgZ5rV/yv5fnNtoq8fdv/lHqg72fmcA1y8xLYEaB8vwtKZ2rCNYX7NMnSCwm6qp
 jzZWU4E4UKNh6gvSuTWkDsIR1y00nVCerGHsbmu/2Zj1wmZwss3YIicjFqqSi/G56z2R
 9TJwrFbVak1thXotSLe37DJ+eY6z1cffpReG6rYI9HZP1bQZbL594K164wdUQrYB9w0G
 uAGK/bCoVwxI5tqUeOa+lEEGov9+VXTBJUJN1mZRsfV7E5i/wjbf7TuLNm2ctVAWvWXX
 rqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=09s6w7LqP4z4Vr4sU9E8MP8StYfD7uZ9CWf43nvqIlg=;
 b=I9/ljKUn/Uxd6DTK7yvPVo6iUZANlBvZSCbeuE2hH2ubOmYm5Y7FiYTD3u87ea6139
 KA69S+6UVFggIqYmoGH+wxLmU0zNWx2dlapfWIlgyyhg6e+9xfiNsuXXUvY8cyPybFEx
 qmxI25yWWYWCmtvSqiBA2+FHTf+FE0w1cbMYrmrX1bf99GHmPJayI4PkGP6hM/eGq4FL
 /3tGTOqUtAeInNqb09tfEBZNXGFBfKRgs4aQlhM/cY5isyY4VpWi6nE2kdWUHnoMBzU3
 W8bfmt3gC2Uvtw2gsXkBSrTiTflaYLxF9rU0uVnaV6Ulqn4nlln/4C6Ds/2QU2ZBspot
 OV2Q==
X-Gm-Message-State: APjAAAUyCFxAgyEMeeqAznufBju+fnaWTrfqP6t6K/sZaTY4vpU0MEaa
 u3x6/VYufesgxCAOgjRSV5SEqSFVVFDMNNv8GUx59eIG
X-Google-Smtp-Source: APXvYqyvjN6oAXQVbhXKfcBK5v1maWRIo1PXwS0ud/v09nGOW94HGnaWpNOK6rwQPCGdb5v7wLgMoc87Vi0F0WfVznA=
X-Received: by 2002:a02:6055:: with SMTP id d21mr10738614jaf.21.1581890861407; 
 Sun, 16 Feb 2020 14:07:41 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP; Sun, 16 Feb 2020 14:07:41
 -0800 (PST)
From: JH <jupiter.hce@gmail.com>
Date: Mon, 17 Feb 2020 09:07:41 +1100
Message-ID: <CAA=hcWSjWZDRcNFj3e4fdaV_u5AVNiksgykcDhqbHXm_aqT5wQ@mail.gmail.com>
Subject: Cannot mount UBIFS volume rootfs to RO
To: linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200216_140746_386356_12CACCF2 
X-CRM114-Status: UNSURE (   3.61  )
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

I passed the root=ubi0:rootfs-volume ro ubi.mtd=2,2048 noinitrd
rootfstype=ubifs mem=256M rootwait=1 to kernel command line, but the
rootfs was still mounted as rw, can UBIFS volume rootfs support ro? Or
what could be missing here?

root# mount
ubi0:rootfs-volume on / type ubifs (rw,relatime,assert=read-only,ubi=0,vol=2)

Thank you.

Kind regards,

- jh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
