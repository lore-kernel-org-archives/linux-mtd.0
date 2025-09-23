Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F312CAC5B0
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Sep 2025 00:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:
	Message-ID:To:From:Date:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=38tXdeZTQmAJM31OfRO5aU8Rg82OBQ1xD/IVrn+VR58=; b=jn9
	7eTKfTBOEQi4/+w47uW5nsRMPUgScUVsh1E4V3MovsrApfoenjIS4RgRykdiJe6W/IP9qYCFO3Np5
	scaHeKe8YGTE3JsRxtI/etbJ94D4QeNz0Lp329BWqTjaANGpcd8jz0e89CCF1nLW2DEWuwOQ0nJqP
	VVC8PtdIAHgMr9+WBYClvlYFo7QyYiqsFSs44XyjyDsKqr25ak/R8dZL55MHBw0xLDGMMsB1KgO2o
	z6T/Pzb3AeJXX2MVg9YertKcfnx6ysE2R4vAjIVBfY9PLgChVBieOUMs3cDCaWWnwsPC4gFgrNUJQ
	2DtxzzJUiQw8Mn3cZN258SWLWz3MH/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Dbj-0000000FEQl-0X4Q;
	Wed, 24 Sep 2025 00:43:43 +0000
Received: from sender4-g3-154.zohomail360.com ([136.143.188.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Dbg-0000000FEQM-3wh8
	for linux-mtd@lists.infradead.org;
	Wed, 24 Sep 2025 00:43:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758674619; cv=none; 
	d=us.zohomail360.com; s=zohoarc; 
	b=QaOrlQRrMmptdRw2q325C4/quwMBDG5edIuWCoBBmrsf3d0ivHEDX2NWFpgELbmnbfsFFqqzEb4X39fXkOSAgsYSgU4NugOrpHHRQsgBv8UfJxZp6I7CXiQb+rGCdjX/4wa6Sxhy15atIJV7YGnU6ardzCGqPevr9mQz2GENIh0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=us.zohomail360.com; s=zohoarc; 
	t=1758674619; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Reply-To:Reply-To:Subject:Subject:To:To:Message-Id:Cc; 
	bh=zCtJBk26QBtzZOz+PVLHDTZ2zsLMJPG8ND+7jnOn3Fg=; 
	b=sQ5PuiHQsJ5HIWc3ncFE4UjgG/LqAIp/cE/ZLJV6v9Hmu+NmkRRYJgglhuIASfQJj5R4MnhNh7meLVcPczsaXP8FvC5t1JfYPJ9d3Sdaf2fpeKZiEZULOc11IKFHPfS0Snj7WwIHrk6hHy+1br1RcIjYE9OrtXOav9k0gy6quJs=
ARC-Authentication-Results: i=1; mx.us.zohomail360.com;
	dkim=pass  header.i=maguitec.com.mx;
	spf=pass  smtp.mailfrom=investorrelations+9a96d720-98d8-11f0-8217-5254007ea3ec_vt1@bounce-zem.maguitec.com.mx;
	dmarc=pass header.from=<investorrelations@maguitec.com.mx>
Received: by mx.zohomail.com with SMTPS id 1758671653186761.1382090174244;
	Tue, 23 Sep 2025 16:54:13 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; b=FPdEjaaO5ZOUCAOOrTjfqLlN8PKPzBr54EsLGhm8gIAfQFNk4fEtzSWV890LjpjpHo3hQpEOqvy/cwm13aI3wEUF0Ce3r7m4dMlSGjSi7GtGe0wS3x4urI/YIQHjYcapucrMe814jsWX+jgzSCd86ico/CURmO7NehhD9HiqwoE=; c=relaxed/relaxed; s=15205840; d=maguitec.com.mx; v=1; bh=zCtJBk26QBtzZOz+PVLHDTZ2zsLMJPG8ND+7jnOn3Fg=; h=date:from:reply-to:to:message-id:subject:mime-version:content-type:content-transfer-encoding:date:from:reply-to:to:message-id:subject;
Date: Tue, 23 Sep 2025 16:54:13 -0700 (PDT)
From: Al Sayyid Sultan <investorrelations@maguitec.com.mx>
To: linux-mtd@lists.infradead.org
Message-ID: <2d6f.1aedd99b146bc1ac.m1.9a96d720-98d8-11f0-8217-5254007ea3ec.19978ffc592@bounce-zem.maguitec.com.mx>
Subject: Thematic Funds Letter Of Intent
MIME-Version: 1.0
content-transfer-encoding-Orig: quoted-printable
content-type-Orig: text/plain;\r\n\tcharset="utf-8"
Original-Envelope-Id: 2d6f.1aedd99b146bc1ac.m1.9a96d720-98d8-11f0-8217-5254007ea3ec.19978ffc592
X-JID: 2d6f.1aedd99b146bc1ac.s1.9a96d720-98d8-11f0-8217-5254007ea3ec.19978ffc592
TM-MAIL-JID: 2d6f.1aedd99b146bc1ac.m1.9a96d720-98d8-11f0-8217-5254007ea3ec.19978ffc592
X-App-Message-ID: 2d6f.1aedd99b146bc1ac.m1.9a96d720-98d8-11f0-8217-5254007ea3ec.19978ffc592
X-Report-Abuse: <abuse+2d6f.1aedd99b146bc1ac.m1.9a96d720-98d8-11f0-8217-5254007ea3ec.19978ffc592@zeptomail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_174341_009435_4A55C44D 
X-CRM114-Status: UNSURE (   2.53  )
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
Reply-To: investorrelations@alhaitham-investment.ae
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

To: linux-mtd@lists.infradead.org
Date: 24-09-2025
Thematic Funds Letter Of Intent

It's a pleasure to connect with you

Having been referred to your investment by my team, we would be 
honored to review your available investment projects for onward 
referral to my principal investors who can allocate capital for 
the financing of it.

kindly advise at your convenience

Best Regards,

Respectfully,
Al Sayyid Sultan Yarub Al Busaidi
Director

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
