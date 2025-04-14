Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422D1C369B2
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Apr 2025 07:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IIpnlORSpm9hTfR3gpmxmLN7MnZI49zwP2+RC7K7JDA=; b=4SLH7wIkCPsi1f
	x1XizmVTHIwVAugUweC2bAbV4GSmBozB+7Ppup+SUVIeloWRoOrKFmAzdw2g7MNITxvfkPzh0G2fj
	hkBpSbW32mJSQr0VYoDvBQmQXtHLZwQrQvRcANzds+jqUhghPXY5eBknQdybgbN+8Cqb2m3oJIx36
	uhFrR/u7X63uMgDrJjd/3mtEG0/jhnPogNpd5fqPdwshMhWxTUP3KJIokwHyx7ci51nyBvCBYSdJL
	GWyPZG/FSSpy1lJwZZBgAlxt0pW4KDY3dyo8W7vplw4F4WJASGGDRroo0WqYl6SNqDV4ar3vruTcu
	H2WrQTou3vd20vRKKqug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4EiR-000000010iZ-3gRY;
	Mon, 14 Apr 2025 07:58:51 +0000
Received: from mail.commetro.pl ([217.61.16.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4EiP-000000010iE-0kBJ
	for linux-mtd@lists.infradead.org;
	Mon, 14 Apr 2025 07:58:50 +0000
Received: by mail.commetro.pl (Postfix, from userid 1002)
	id 630E382B43; Mon, 14 Apr 2025 09:56:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetro.pl; s=mail;
	t=1744617396; bh=COht1CALZmZz8MRkow5xVDQUyVzx29Nu6ozA/Y0jgb4=;
	h=Date:From:To:Subject:From;
	b=uM2mD8bj/WTv7snGz2+fE9g+Ciy7+mM4MDIJ090opudV+wUCB44hRKvvWIUMOICJe
	 naCVjPX/IxSn5NvBNz2GrxDxLdG/iV6zscOF5woMnA8qHMRETQnFSESgW2DM0x9cSD
	 qBsfNzD2tdKmgqOMO+n7lI9xkG1msr5M4iHJIFVsDZmbL8ziY6sywqtawkEjEyiWoS
	 QalejiXamAPTmVXrYZtkO24RtGbp65IWbvrQNZrHktYb2z85YTXHfH/0+/7Ndmp6Ja
	 W0GbsKKBQfMYu3WG3c/8MkT4NPbwfAemJVgUfX9CVgV5g0KEnKimlqQBxsn2B7aoq0
	 1tWBB4pHWj2VQ==
Received: by mail.commetro.pl for <linux-mtd@lists.infradead.org>; Mon, 14 Apr 2025 07:55:54 GMT
Message-ID: <20250414084500-0.1.1z.n3aw.0.97yaa73rcv@commetro.pl>
Date: Mon, 14 Apr 2025 07:55:54 GMT
From: =?UTF-8?Q?"Jaros=C5=82aw_Kownacki"?= <jaroslaw.kownacki@commetro.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_ofert=C4=99?=
X-Mailer: mail.commetro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_005849_338551_180E6587 
X-CRM114-Status: UNSURE (   0.78  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKQ3p5IHBvdHJ6ZWJ1asSFIFBhxYRzdHdvIGFrdHVhbG5pZSBub3d5Y2gg
a2xpZW50w7N3ID8KClNrdXRlY3puaWUgcG9tYWdhbXkgcm96cG9jenluYcSHIHJvem1vd3kgaGFu
ZGxvd2UgeiBrbGllbnRhbWkgemFpbnRlcmVzb3dhbnltaSBQYcWEc3R3YSBvZmVydMSFLgoKWmFw
cmFzemFtIGRvIGtvbnRha3R1IHp3cm90bmVnby4KCgpQb3pkcmF3aWFtIHNlcmRlY3puaWUKSmFy
b3PFgmF3IEtvd25hY2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
