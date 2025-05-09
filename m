Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C23C3ABC3
	for <linux-mtd@archiver.kernel.org>; Fri,  9 May 2025 09:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1WJhLdgoxLf7NZpGI0VYd/gvx9V58Z+FvHsHHd3bEik=; b=Ijw5PCJNQcCfML
	6/Spnb9G3TpyD4lj+bj6Cer2PLpVd1yV+LA1/Yr2cYSabEdQshU723vMPkcfuYGZnQ6QdLxbc5O/0
	9PXYT8IGAoVtGFE/74bl0CWHxDScT52b5FTjA1SI7ZAbItuQldaHZW1NN/f9ZuhQ57nkaL1G5arrq
	sNj3xpKhkFdtjvFguCyoxBd8OBQicD9LY+JkI6jjNi2IkN3bIWYUbeHV72utfSfvDgM8It90pFt4C
	lO1wiGJx29h94khVct6F1rOE3dES+sjWFcv/6I07+3UPjGa7dBmyn7R19VjP8dF2j3ZbX41kHDRwV
	YIUyYFMbvNFnSdRv1S+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJby-000000031iP-052b;
	Fri, 09 May 2025 09:01:42 +0000
Received: from mail.taskflame.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIQH-00000002n3v-2SpE
	for linux-mtd@lists.infradead.org;
	Fri, 09 May 2025 07:45:34 +0000
Received: by mail.taskflame.pl (Postfix, from userid 1002)
	id 6D30525D94; Fri,  9 May 2025 09:41:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=taskflame.pl; s=mail;
	t=1746776543; bh=w4+HQbQP74/lcux9sCovXIK7fEvSRotrOw+Jrj90l5c=;
	h=Date:From:To:Subject:From;
	b=CLSvPHJIVL+x6/JmBYxYscRy6aldcsR8lMzzRBgllSp130vx5BtPmrCTfKaibjCLN
	 hz+MLW+/dR3Yv1ASmgYxt4u3Ilvkpn8u4LfmnK1e7JxRbz+LaPgBvmGYpZ+RBwr3QW
	 2FCOWXKF9aHonzqu36vXBHmdfthlNwJDI2fbydqp7HaXK6dCgKuGMNHCVayyjXzBkt
	 upsUhcyvAcWSseVKXVpMkz62s2mgILtL7I6buBDBpo5r44LqcceXIevlkbFh6mlQy1
	 U9ZODHSDrT8C/Ztqb4MELM/kPL4q16EsY8CvGHTm6owzqSZeHeHwTSnKfU9asaHVdL
	 youemTG+qKkHQ==
Received: by mail.taskflame.pl for <linux-mtd@lists.infradead.org>; Fri,  9 May 2025 07:41:08 GMT
Message-ID: <20250509084500-0.1.i2.34o1m.0.plbnnr6qlq@taskflame.pl>
Date: Fri,  9 May 2025 07:41:08 GMT
From: "Marcin Gard" <marcin.grad@taskflame.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Wsp=C3=B3=C5=82praca?=
X-Mailer: mail.taskflame.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_004533_769835_4ECABF87 
X-CRM114-Status: UNSURE (   0.91  )
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
emRyYXdpYW0KTWFyY2luIEdhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
