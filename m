Return-Path: <SRS0=5B27=W2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_SBL,URIBL_SBL_A,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1757C3A59B
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2019 18:36:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C436523430
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2019 18:36:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Aegg12wu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=zol.co.zw header.i=@zol.co.zw header.b="EcJgOg/f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C436523430
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=zol.co.zw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XqnNk2HfjTEdcMKuAHWt7LQPbi5x1eayUJzH+evGhi0=; b=Aegg12wuMLUGIi
	CJr/dpsKLvNGTAsBGQNuNpsf+3Pv0mToritRAxtYew4xDXiM5ODEkQPsjBK7/Qry19/ymNTfB1YTe
	4IWUsV2nPB2VoiDkNFd2qMP77ktlxQhQt/p4Odxo3Z99CmI/jucMmt9DioI7Z/ejr6clvmSloiVua
	/UYUaZEagq3AxFEp8L9N41JGi22DErbXCZ5K7knoW5qbgM54jPnWm+S00QTM1WOvnCykxjy/zjd21
	a2jIptlZN/n9rtq4jFt9TOHPnqqB6fAsSCJZuRIRZTEACRBA6X47AscaLtJVOyTsxAI2xk7ISMYsF
	I3Rw+gAuOJ8Hgc9EIouw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3ll3-0003XY-7o; Fri, 30 Aug 2019 18:36:25 +0000
Received: from rs17.zol.co.zw ([197.211.212.71])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3lky-0003MB-CT
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2019 18:36:22 +0000
Received: from outgoing.zol.co.zw (206-214-8-79.candw.ag [206.214.8.79] (may
 be forged)) (authenticated bits=0)
 by rs17.zol.co.zw (8.14.4/8.14.9) with ESMTP id x7UIZc7T023184;
 Fri, 30 Aug 2019 20:35:44 +0200
To: "linux mtd" <linux-mtd@lists.infradead.org>,
 "dedekind1" <dedekind1@gmail.com>,
 "Pankaj DEV" <pankaj.dev@stericsson.com>,
 "David McCullough" <david_mccullough@mcafee.com>
From: nik_bin_nek_alwi <certificate@zol.co.zw>
Subject: =?UTF-8?Q?=F0=9F=91=86?=
Message-ID: <7aec3e0a-522f-4cb9-b7b2-3f73c307456b@zol.co.zw>
Date: Fri, 30 Aug 2019 14:30:56 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
X-sslZOL-Comment: Message x7UIZc7T023184 sent by user #51872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zol.co.zw;
 h=to:from:subject:message-id:date:mime-version:content-type:content-transfer-encoding;
 s=dkim; bh=QmQXRLh/nPCxPxs1RKlP93V2u7X8o3C9+da/3utp7Co=;
 b=EcJgOg/fN3teDcxH6yCdcqw3r7vnGnzHmC+9epe3aCCQqQE2GrDiYYlCO5ou1ul4UHSAO24iKD+fOGYCGEJs1xacVwf+X5Bc8vAmxklXQAdMVFG+yRPxElzZDXQcc3EK5dH8IYWsC9BN327vMywJwKU6oKDby8HwIhlGRQjMY10=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190830_113621_473663_CC4AFA00 
X-CRM114-Status: UNSURE (   1.38  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VW5nbGF1YmxpY2ghIGh0dHA6Ly9wcWsuTHluZG9uMjk1Lnh5ei9pbmRleAoKCgoKCgpfX18KTGFz
cyBiYWxkIHdpZWRlciB2b24gZGlyIGjDtnJlbgpuaWtfYmluX25la19hbHdpQHlhaG9vLmNvbQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
