Return-Path: <SRS0=6YPz=VT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD313C7618F
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2019 18:37:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 774A421903
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2019 18:37:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JHTl9qQm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 774A421903
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=tas.ge
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Message-ID:Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:From:To:Subject:
	Content-Description:MIME-Version:Cc:Content-ID:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y0lyaLG/V/24P+ZJiMoypNgoIU2Hbc0Yc+G0891KjBU=; b=JHTl9qQmhilv70
	2S4PhCflDbVAyX4EElFteYQl9+++F/GTcT+018mnmLzNZK4JCEMq0jus6LNkxIvJbuhkyh7q+KSQf
	s1Ur82LKCg13dT99xMJrmEtZPfTidP4cMRkauTNfTaY9anM4AJd0WJ0WeOV8oh2yNLKU+AozlGDMY
	v657Gzixd3TMmo6thw8USYJEHH3F3hsT1Yy8YuqZqcoWDhQdyd0a6hfJ2oQQhrA6rathxyDDVOrZp
	oBGAn0NYd7G9zrYyDKyI7kRgAAcZeuVorBoEJq2oJTuneNpuGWAyr30qPAdR+H3fZwbUAr8hNZfeH
	xwvGmoSKKseMzEaXvxxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpdBe-0006UV-6A; Mon, 22 Jul 2019 18:37:26 +0000
Received: from mx1.tbilisi.gov.ge ([185.83.36.26])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hpdBa-0006Tx-U2
 for linux-mtd@lists.infradead.org; Mon, 22 Jul 2019 18:37:24 +0000
X-ASG-Debug-ID: 1563819917-0a6d49136b2751e0011-6YE7NY
Received: from [145.239.210.106] (ip106.ip-145-239-210.eu [145.239.210.106])
 by MX1.tbilisi.gov.ge with ESMTP id guxcaMzMv7geiCiM (version=TLSv1
 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO) for
 <linux-mtd@lists.infradead.org>; Mon, 22 Jul 2019 22:25:23 +0400 (+04)
X-Barracuda-Envelope-From: info@tas.ge
X-ASG-Whitelist: Sender
X-Barracuda-Effective-Source-IP: ip106.ip-145-239-210.eu[145.239.210.106]
X-Barracuda-Apparent-Source-IP: 145.239.210.106
MIME-Version: 1.0
Content-Description: Mail message body
Subject: You have been selected to receive a private donation from us:
To: linux-mtd@lists.infradead.org
X-ASG-Orig-Subj: You have been selected to receive a private donation from us:
From: "Fred and Lesley Higgins" <info@tas.ge>
Date: Mon, 22 Jul 2019 11:25:16 -0700
X-Mailer: TurboMailer 2
X-Barracuda-Connect: ip106.ip-145-239-210.eu[145.239.210.106]
X-Barracuda-Start-Time: 1563819923
X-Barracuda-Encrypted: DHE-RSA-AES256-SHA
X-Barracuda-URL: https://10.10.254.25:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at tbilisi.gov.ge
X-Barracuda-Scan-Msg-Size: 35
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190722_113723_210402_295C8EC5 
X-CRM114-Status: UNSURE (  -1.82  )
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
Reply-To: flhhumanitarian@yandex.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Message-ID: <E1hpdBe-0006UV-6A@bombadil.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Email back for more information. 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
