Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCFEC00A89
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 19:21:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D10C2225E
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 19:21:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nLUJ+YGo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=genevatech.net header.i=@genevatech.net header.b="AlmeRX+K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D10C2225E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=genevatech.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OrPOKX4Zx2l5nqeGkHSIx63oPsK1lePqAFyjXeTEm1o=; b=nLUJ+YGoJq+r57PI88ySEU33N/
	mSH474+FepfpZ6yznCgw/IAp9SQFJNs4NOIGbeH7A9jytNy8ev1YJC4aKndU8hhbYMGg2sqdjHEhq
	oETKi1wlNp1LZbiIxMv1rF1+nzu8Iovdxt+kCRb3gJW5E+6mTHrw/8QGxRyEh66LoVKI+CIm3eB/u
	IryWIh4aRAPxS0nd2zC6CkaFTyF5RWTuozEyKANkkKOsGDfKK4PsbO+uPJcXPmAR2NWUjc3rfgRd3
	UqRViURX6zNvA69TLYIzxLQlQHgR2hxOQFr0irD0Eaex2I8ivn3r9hriLhH+0j9blYTSCbx5DqsGS
	X8Is/Aqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZfNW-00007v-8I; Mon, 02 Nov 2020 19:20:30 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZfNT-000079-Fn
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 19:20:28 +0000
Received: by mail-ua1-x935.google.com with SMTP id a10so915312uan.12
 for <linux-mtd@lists.infradead.org>; Mon, 02 Nov 2020 11:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=genevatech.net; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=2K0Kqwgl7yIQs7Zvr7SFeT2K7Biwu1H58cvbVRWc7V4=;
 b=AlmeRX+K7Hj6fePsFW+jBPedILwxWavZSGdUeogpOdr/g3RzHAf1bPp+dMeoPqfrVL
 FEo6HQzB6vvTEp/MsJ63YwnckyzEromVrwewHNoiSBVOC4rmxkYcpviYzL9jrGZVPT9/
 d9pxa9kP4iDmXA3Yz3/nnmxfRQuKVAi7ZXRxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2K0Kqwgl7yIQs7Zvr7SFeT2K7Biwu1H58cvbVRWc7V4=;
 b=l4sx3aK9rDqPE0fKRqp/6ibfmQoFv3yXyXco91olM2BvHhnnejndSuDkRbWkzRQF2O
 hnhmhuz/1DeAtxW5K16ycAUQjyWOAFQvfNeHaW9OzXJwxjKI41/FWwuK4pTu7OupYB2G
 yPfXaCned06pqFC67FAMqq64POgFeE8mWd/853f6ctW0tMD4OOADjc/dfczsU4eq8zjB
 Ed4Apz5OftgG/BeOny5GDs5ZgtyeTizhTn1Zz0fWrYGK+UsO236EwcsGE3mzwPKKdSGl
 RX/9Y0XyWx9GiD5R+n09V3iXOlg3r6FeqHFLrDe3ph0n5p4tl46RqLUMkiiOTcmjfHAF
 gG4w==
X-Gm-Message-State: AOAM531iFxw49k+hp4hHCtXf/4EAcLN+Q6ZXw/8CkJHMbFE2QF/h0VxU
 Fhzua7H4XxinKtoUTL/I0fJ3qaOxnf1+wgcXSLwPOgbQ0NsVy482XeCyJ6Ozx16uhFOKGd0eKX0
 Xl3OcxWB0fncTHh+vaJwwDvkAln6ThanCmzazYOPP5XQ=
X-Google-Smtp-Source: ABdhPJyYZ/xwqfprKp1BvP74Uk30WmNHdp4QRbKHj5iARHJbHS+PtqcOfZ5qYqDfmJLwwDyJHJccuxGvpg4e7pEjzJs=
X-Received: by 2002:ab0:5e85:: with SMTP id y5mr8617508uag.101.1604344823918; 
 Mon, 02 Nov 2020 11:20:23 -0800 (PST)
MIME-Version: 1.0
From: Maurice Smulders <maurice.smulders@genevatech.net>
Date: Mon, 2 Nov 2020 12:20:13 -0700
Message-ID: <CACxOKoJSoOMjeZncUV5Rae8+bbHgn-0viZmAZV2c0vP3+zRMGw@mail.gmail.com>
Subject: ubihealthd status
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_142027_603761_CEAD26AD 
X-CRM114-Status: UNSURE (   8.72  )
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

I am trying to determine how to be able to figure out if a PEB had an
uncorrectable bitflip and expose it to user space.
It would be good to determine if a specific volume is suspect
determined from the actual LEB, and have some exposure in for example
SYSFS. Would the actual volume be turned read-only?
I'm open to suggestions, either I build something into ubihealthd to
notify user programs to tell something bad has happened, or sysfs (but
that cannot notify)

The problem I have is that one of the apps i need to support this for
is commercial - and I couldn't change ubihealthd to a libary because
it is GPLv2, the other app is now Apache License based I think, it
used to be under NOSA.  Also UBIHEALTHD doesn't necessarily have
access to which LEB/Volume is potentially affected.


-Maurice

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
