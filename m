Return-Path: <SRS0=layW=YO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	HK_NAME_MR_MRS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D2ECA9EB5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2019 04:47:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7701920656
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2019 04:47:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BjFdfdMo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mcontreras.gob.mx header.i=@mcontreras.gob.mx header.b="NSzzN4hP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7701920656
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mcontreras.gob.mx
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:From:To:
	Subject:Content-Description:MIME-Version:Cc:Content-ID:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=iUntvg/zFY4gwyiB28XnYTbxlm3BFc0u3/jKh6vN36w=; b=BjF
	dfdMo6g3a7ErdeRbUNu3Im0KY4UhkNe/O6mfkJIzVPVwVpEHpVjAj2AM/K+Dop2EzGmwoMBY4T0dK
	/YqRRdsLQP7U6KVjgoivDwWVQFPPQWXqEEwD/QnwXxoM5AaSFtYWLTlaLweRfjVyN9B9RjE8g98V4
	dBWT3q1Gv3md2KMAdOe+oQ24n9fPJAfmzerY6Yskye8lDL5jH+Y9z6pDoXdwMmlH8dNuxwXZeWaKg
	16QMZIsBCjLs6o5QLwFbdKrRY38xOzTANYpky8bmvtWQS6xFFMFO0IlbHYCFOjJO0TgY6qhpDr+uJ
	vLImJRcwcQNtuPSwoK3cFONR8XLpExQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMPbe-0003Tr-So; Mon, 21 Oct 2019 04:47:46 +0000
Received: from [187.141.58.171] (helo=correo.mcontreras.gob.mx)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMPbc-0003TL-Of
 for linux-mtd@lists.infradead.org; Mon, 21 Oct 2019 04:47:46 +0000
Received: from localhost (localhost [127.0.0.1])
 by correo.mcontreras.gob.mx (Postfix) with ESMTP id 65594EE81EE7
 for <linux-mtd@lists.infradead.org>; Sun, 20 Oct 2019 17:58:07 -0500 (CDT)
Received: from correo.mcontreras.gob.mx ([127.0.0.1])
 by localhost (correo.mcontreras.gob.mx [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 307xdODQAMeK for <linux-mtd@lists.infradead.org>;
 Sun, 20 Oct 2019 17:58:07 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by correo.mcontreras.gob.mx (Postfix) with ESMTP id 7C98BC7EA2B8
 for <linux-mtd@lists.infradead.org>; Sun, 20 Oct 2019 16:39:33 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 correo.mcontreras.gob.mx 7C98BC7EA2B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mcontreras.gob.mx;
 s=53A92184-CD91-11E8-86DF-F45FB6B066AC; t=1571607574;
 bh=Rqp1tqcd8K/qNgrJx+rtaGPrHlODB2s2MX0PKJm7Ymc=;
 h=MIME-Version:To:From:Date:Message-Id;
 b=NSzzN4hPsQeOv8K53onQPNAq0428dPux9Oyh5231Ny+BTHfOvQ7lPq+m9I52hLUrI
 ug4xO/Ydg5BLFSRkzilyIICqRpZKLn4DmFyp5WIL7oyIEOHG/IC3cNIAi8NEpIYFWm
 CR8xNiW5yL2lhkAHnDwSGFoAoFkVrB5TZmIV6T7/MKF4yBFbzZX1n/f3PA3BcOu53d
 6zcaKhz/CXPhaexJbvn8Ix+PGgI7nV5KPSn0oWavTXl9umQ/JqNvvCb9P7HQsqkYZ4
 NoDkfH1Hm+8pBft12W+Ez9y0b4hYi5kDHJzeAxqdMshnEvyFCO890tENobQb705x+C
 obd8vU4VS2pSw==
X-Amavis-Modified: Mail body modified (using disclaimer) -
 correo.mcontreras.gob.mx
X-Virus-Scanned: amavisd-new at mcontreras.gob.mx
Received: from correo.mcontreras.gob.mx ([127.0.0.1])
 by localhost (correo.mcontreras.gob.mx [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id WuxMnDModyXC for <linux-mtd@lists.infradead.org>;
 Sun, 20 Oct 2019 16:39:33 -0500 (CDT)
Received: from [192.168.0.111] (unknown [92.99.96.15])
 by correo.mcontreras.gob.mx (Postfix) with ESMTPSA id 30DCFA048630
 for <linux-mtd@lists.infradead.org>; Sun, 20 Oct 2019 16:22:18 -0500 (CDT)
MIME-Version: 1.0
Content-Description: Mail message body
Subject: Proposal
To: linux-mtd@lists.infradead.org
From: "Mr. Maheed " <m.rosas@mcontreras.gob.mx>
Date: Sun, 20 Oct 2019 14:21:03 -0700
Message-Id: <20191020212219.30DCFA048630@correo.mcontreras.gob.mx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191020_214744_863431_99968907 
X-CRM114-Status: UNSURE (  -4.44  )
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
Reply-To: asadmaheed9@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

I have a special discussion to discuss with you please get back to me.
Sincerely,
Mr. Maheed Asad
Alcaldia La Magdalena Contreras Coordinacion


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
