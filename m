Return-Path: <SRS0=Oj4s=2C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	LOTS_OF_MONEY,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7879C43603
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Dec 2019 18:22:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 917E92253D
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Dec 2019 18:22:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hL0x6BB9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 917E92253D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=1fbo.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Message-ID:Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:From:To:Subject:
	Content-Description:MIME-Version:Cc:Content-ID:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fDQL3X2qtbPFUlYqCqZ4Dwvi5w9JY9VnSBEftvwPtAY=; b=hL0x6BB91PoRO3
	5n0RhiObB9PBOJQ7lKlhhX6pWX0V5P7arn3b0YLdAFtTrwj9v8xQFt8ma0r3DM+ibJsVqPIwa+7mI
	KckhvYfEgbnvkWYydO6xB6JylL0a794bWIbKW2qrjHeSXp+iBhLODDrFNcsIxUE5OwjdKf1j0Wxh5
	PFY5y5UU71T0yfsYfWSX2a9mCLqo+VeYjrd60Afx4HFQVIsu/FueaGqQGtq9O0F9xqrWD9yk3NvDU
	mHMJ56vXmobcWs5dSXiGRDGPrFltkf2A7Cga+n5TJN1nlt8jxhovfIuQCUD2nKnxcoHn8M4LEessh
	9lI77olE3azGdIMcJ6wA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifT5y-00013W-7M; Thu, 12 Dec 2019 18:21:50 +0000
Received: from 1fbo.ru ([185.250.205.214])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifT5v-000131-Pg
 for linux-mtd@lists.infradead.org; Thu, 12 Dec 2019 18:21:49 +0000
Received: from DESKTOP-08F10ET.home (unknown [176.218.154.157])
 by 1fbo.ru (Postfix) with ESMTPA id 8E4B882247
 for <linux-mtd@lists.infradead.org>; Thu, 12 Dec 2019 19:43:25 +0200 (EET)
MIME-Version: 1.0
Content-Description: Mail message body
Subject: linux-mtd@lists.infradead.org
To: linux-mtd@lists.infradead.org
From: "Lisa Robinson" <travel@1fbo.ru>
Date: Thu, 12 Dec 2019 20:43:23 +0300
X-Antivirus: Avast (VPS 191211-0, 12/11/2019), Outbound message
X-Antivirus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_102147_978660_1D0796A2 
X-CRM114-Status: UNSURE (  -4.41  )
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
Reply-To: lisarobinson50@aol.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Message-ID: <E1ifT5y-00013W-7M@bombadil.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hallo (linux-mtd@lists.infradead.org),
Sie haben eine wohlt=E4tige Spende in H=F6he von 7,8 Millionen US-Dollar (7=
,800.000 US-Dollar) von der Robinson-Familie in Munford, Tennessee. Ihre E-=
Mail ist als Sieger hervorgegangen, Best=E4tigen Sie, ob diese E-Mail noch =
g=FCltig ist. Kontaktieren Sie mich dringend f=FCr Anspr=FCche.

Mit freundlichen Gr=FC=DFen,
Frau Lisa Robinson f=FCr die Robinson Familie.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
