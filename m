Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16098D5B164
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2024 08:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wsE8In8uOhjDNq0kJys+mgV5XfBD5AXoT8oocm0JPco=; b=HZBAX/QSMgL2ET
	e7xaf4rJVePCKoS4IKOsOeGZ+t4fzET7VMt3T7oU6PNMgbjVGlaFEXi4g3u2RzUCkMEIBVy40qPz1
	dXTZdjZ39L7GcRfmFGS1CZaarRV3g+6YSNtepNUxhUh/RgJBRes9f6WRoPzaSA6I2CuWmuqfLjjCq
	yDOzS+Lq09btzbEf0u8W90bwaLAeopvDvy/UHlLqzX/qUY8+chzdrCxe+c9nbXPxQSv/ySwxNlp2m
	dxh07gsao7I+FPdIjacNeIduV8YH08Cir5wIwubgzsNxZq2f8sLOey3ms9R9APhCJSRqcNhHdKJTt
	QWblO2mlLOuhrp5kAm0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hpZ-0000000DjDF-2bJE;
	Tue, 29 Oct 2024 08:44:01 +0000
Received: from mail.craftyimpact.pl ([51.195.47.69])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hco-0000000DgzK-2OVY
	for linux-mtd@lists.infradead.org;
	Tue, 29 Oct 2024 08:30:52 +0000
Received: by mail.craftyimpact.pl (Postfix, from userid 1002)
	id 1FA2EA34A1; Tue, 29 Oct 2024 09:30:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=craftyimpact.pl;
	s=mail; t=1730190643;
	bh=pXrlpvPp10A8rZLMPH1lwZUSA6Zve1Mracowsq8/X+w=;
	h=Date:From:To:Subject:From;
	b=s2P0u96cU4WoePogLHgEzhvMA3v/oqwmU4aSti5ahrX+p5S0Q3NlcgYj6BmqdI8QT
	 mVCWbtbw+Ph9RY2J7NXcJ+KXBt8R5Y6K+z8a7DNFi3OimPe2L0gO/MMNcLeBXy220g
	 9b66Az4m1pc/6paVFQnboHzIwLVMakopq6VyO9JoRzG3qBm8Z7rtxYH49SldDbq4l2
	 BCeU+YPWmi2S7ZslAZshwYtskXYgi1eXbrrutcE908KuVBV+0ktush/8Yn9krestbG
	 Mcz/3FuXfBX9/l9SaC33HXOW5gHvhHrWXWZ7Dvs1A++nJfxdYb3UW+yruN+eds+SQc
	 UF1XRxF9i8bhg==
Received: by mail.craftyimpact.pl for <linux-mtd@lists.infradead.org>; Tue, 29 Oct 2024 08:30:19 GMT
Message-ID: <20241029084500-0.1.k6.1a05k.0.xdwh662wek@craftyimpact.pl>
Date: Tue, 29 Oct 2024 08:30:19 GMT
From: =?UTF-8?Q?"Tadeusz_=C5=81ukomski"?= <tadeusz.lukomski@craftyimpact.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Wsp=C3=B3=C5=82praca?=
X-Mailer: mail.craftyimpact.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_013051_333979_DA905153 
X-CRM114-Status: UNSURE (   2.24  )
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

RHppZcWEIGRvYnJ5LCAKCkN6eSBpbnRlcmVzdWplIFBhxYRzdHdhIHBvenlza2FuaWUgbm93eWNo
IGtsaWVudMOzdz8KClpham11amVteSBzacSZIHByb2Zlc2pvbmFsbmllIHdzcGFyY2llbSBmaXJt
IHcgdHltIHpha3Jlc2llLiAKCk5hc2kgcGFydG5lcnp5IHp5c2t1asSFIHN0YcWCeSBuYXDFgnl3
IG5vd3ljaCB6bGVjZcWEIG9yYXogemFtw7N3aWXFhCwgYSB0eW0gc2FteW0gendpxJlrc3phasSF
IHN3b2plIHd5bmlraSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcHJ6ZWRzdGF3acSHIHN6Y3pl
Z8OzxYJ5IGRvdHljesSFY2UgemFzYWQgaSBtb8W8bGl3b8WbY2kgd3Nww7PFgnByYWN5PwoKClBv
emRyYXdpYW0KVGFkZXVzeiDFgXVrb21za2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
