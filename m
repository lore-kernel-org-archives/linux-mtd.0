Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C959C83F0F
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Jul 2025 07:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M/fhsmHZftPFSg937EB1NKWCvV+Qrl7GbEB2nl6ZJ6E=; b=cpavTk0OM/4n9R
	0OflLaiWKF9vtsbS0SITUNUJEYJCedbNpnxUQYZj0VuPBB9YJTGhaHbnfQKX2QAS/nEyiIj+bpvaS
	wT+R8Iiw4wMiTYQtmrmfZ6LAoT2J80EFy8HX0q5aX73u+bXA5Li2puvuzjuSI7haEjLP5/ij8eAPz
	z6Du2Dqlfi7pu7CB1V3pAG3v7K2cEZ/wxNC4N/uZPLuzOpFBKfIna9+q5iuSioWdzXunzp9RkUF1K
	/GY9P1WvkZl8CzQDP8YYFhlzP7+xNDYVlvLCc3YW+f+mqwOgUimNh1CD5LvHMgd15eHd4RUBsQvmB
	WYPsa4sKjC2P7/yrZzLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2xl-00000004c6d-40GA;
	Tue, 08 Jul 2025 07:42:01 +0000
Received: from mail.quantro.pl ([51.195.47.38])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2xh-00000004c4O-08Rw
	for linux-mtd@lists.infradead.org;
	Tue, 08 Jul 2025 07:41:59 +0000
Received: by mail.quantro.pl (Postfix, from userid 1002)
	id CF3AF257B1; Tue,  8 Jul 2025 09:41:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quantro.pl; s=mail;
	t=1751960511; bh=nKFyL6kHGsUkO+q8agC+zR0Go57BP4LT86ehYkplXn0=;
	h=Date:From:To:Subject:From;
	b=mS+Xq6PsMLuDRmeHBvpZRmmj+aGFHJtuLVY92rIYXQudEQDGcC8SFcZgoxXXU82fY
	 MZB/lat6zGmKUT9T2xf6lVMPXRt+WFVzDV06pqcedkKN3cgqxqp2Gd+6T1ta0mq537
	 LGdeBI1rV3MjF+QwK2M5m1TP5kH+PwXe+wX83xAm2+UZEYLSTKX5YFzmhwXoul10VK
	 9r4qRH/C9uar1CZ/STVMRkUIAzK1rS5sxrUVt2/kl8WEyzAJQxoTlWB14YT2CEdVX4
	 HfJHrBP9h4JUIlUU1n/YpFo1KoobPAFJEayy1utKhry/VFSFHS9KsyPP0b8OmMj7wh
	 yzIDQ1RokWG1g==
Received: by mail.quantro.pl for <linux-mtd@lists.infradead.org>; Tue,  8 Jul 2025 07:40:29 GMT
Message-ID: <20250708084501-0.1.im.5pi73.0.6beksznh4e@quantro.pl>
Date: Tue,  8 Jul 2025 07:40:29 GMT
From: "Ewelina Koprowska" <ewelina.koprowska@quantro.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Karta lunchowa
X-Mailer: mail.quantro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_004157_758514_942960FC 
X-CRM114-Status: UNSURE (   1.25  )
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

U3phbm93bmkgUGHFhHN0d28sCgpjenkgemFzdGFuYXdpYWxpIHNpxJkgUGHFhHN0d28sIGphayB6
d2nEmWtzennEhyB6YWRvd29sZW5pZSBwcmFjb3duaWvDs3cgaSBqZWRub2N6ZcWbbmllIHphb3N6
Y3rEmWR6acSHIG5hIGtvc3p0YWNoIHphdHJ1ZG5pZW5pYT8gCgpPYmVjbmllIGplc3QgbW/FvGxp
d2/Fm8SHIHp3b2xuaWVuaWEgeiBvcMWCYXQgWlVTIGHFvCBkbyA0NTAgesWCIG1pZXNpxJljem5p
ZSBuYSBrYcW8ZGVnbyBwcmFjb3duaWthIHBvcHJ6ZXogZG9maW5hbnNvd2FuaWUgcG9zacWCa8Oz
dy4gCgpaYSBwb21vY8SFIGthcnR5IGx1bmNoIHByYWNvd25pY3kgbW9nxIUgcMWCYWNpxIcgdyBy
ZXN0YXVyYWNqYWNoLCB6YW1hd2lhxIcgamVkemVuaWUgb25saW5lLCBrb3J6eXN0YcSHIHogY2F0
ZXJpbmd1IGN6eSByb2JpxIcgemFrdXB5IHNwb8W8eXdjemUuIFRvIGRvc2tvbmHFgmUgbmFyesSZ
ZHppZSBtb3R5d2FjeWpuZSwga3TDs3JlIHRha8W8ZSB3eXLDs8W8bmlhIGZpcm3EmSBuYSByeW5r
dSBwcmFjeS4KCkNoxJl0bmllIG9wb3dpZW0gd2nEmWNlaiBuYSB0ZW4gdGVtYXQsIGN6eSBtb2ds
aWJ5xZtteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKClBvemRyYXdpYW0K
RXdlbGluYSBLb3Byb3dza2EKU2VuaW9yIEhSIE1hbmFnZXIKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
