Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3662FC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 24 May 2022 10:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E9c31ysKLV4zr8HDZY/5idsrQniodQb0Y7vUV9LNJGU=; b=2gfbZgHF8409uB
	cIgtJsHwl0yI9Z6JMryq5hBM2L/t83pJKndBk/qvkRaiV92dPRJirxKQxWDx2gh4eCBJ9UP6Z6yu2
	akkcYG4JlSpy0rmqVfIOiu+PJeylLXcmwq0lY2mLgrAEV+D+1j+cQ1ULHh/Puya0YV8A7dPpcPdjl
	zKBtV9tyYhc6xiypopRn/u+80v3d+bxU7NH6b3QKGZezZBtnAQw5f6uubLQBUtPsh/71tOBSt91NB
	bNt+WgklPGzLUT6D4bwxrNw85khkYvN/Wci2n9b2j43MvBM3kddJ7idsbqZdEDPAuDxt0mtn00ODI
	lrI265UfiTG8RRNwFMsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntRYI-007bNA-RK; Tue, 24 May 2022 10:14:10 +0000
Received: from hwsrv-970840.hostwindsdns.com ([104.168.149.109]
 helo=box.indicandustries.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntRYB-007bLp-AU
 for linux-mtd@lists.infradead.org; Tue, 24 May 2022 10:14:08 +0000
Received: from authenticated-user (box.indicandustries.com [104.168.149.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by box.indicandustries.com (Postfix) with ESMTPSA id 55B321080C7
 for <linux-mtd@lists.infradead.org>; Tue, 24 May 2022 03:25:05 -0600 (MDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=box.indicandustries.com; s=mail; t=1653384305;
 bh=V6VCn7WEbqHjVVQ20/+SYu6rwS1WmTHcxX88g+j430s=;
 h=Reply-To:From:To:Subject:Date:From;
 b=eEg+MkmrZETRzHHX7HWixa9TZaXvp1zB8J/oI7jiaCgAaH9zG8EY+fLptVKWwFUEE
 j4BPMZ/kZ80vjTWSy5cJFU6j42aADHhiyiszxFX2/w+XgetntvbNIp1+bzstoAR//i
 ZLG8Zz6CQwAeqIqYDevbnypxSRSFcYEhKiGSFrQY1G34hZxfFyJt0fQ8tYhkpEb4k+
 yOv6J/IJk2RGMZF1Ifiq9AUxaFBgim6e5+4IiCMK3OA7Sbq3eVuHaAuDq+blfGoisC
 4zsC9M5KvZ/mC0pubMn5TtRiwwty0B0vTDeilsrZ2dXEzMjIc6RO6jOlSmhw8dYWeh
 zWaMX1tFhihqQ==
From: amjad.ali@box.indicandustries.com
To: linux-mtd@lists.infradead.org
Subject: Hello Sir, I seek your urgent consideration.
Date: 24 May 2022 11:25:04 +0200
Message-ID: <20220524112504.6996D058E6B73F1D@box.indicandustries.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_031407_607927_8432096D 
X-CRM114-Status: UNSURE (   1.63  )
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
Reply-To: amjalia90@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpHcmVldGluZ3M/IEkgYW0gQW1qYWQuIEkgd29yayB3aXRoIGEgbGVhZGluZyBCaW8g
RmlybS4gIER1ZSB0byAKdGhlIHNldGJhY2tzIG9mIHRoZSBwYW5kZW1pYywgbXkgY29tcGFueSBo
YXMgb3BlbmVkIGEgYmlkIGluIApzZWFyY2ggb2YgbmV3IHN1cHBsaWVycyBmb3IgYmFzaWMgcmF3
IG1hdGVyaWFscyBuZWVkZWQgaW4gCnByb2R1Y3Rpb24uCgpJIGFtIHNlZWtpbmcgYSByZXByZXNl
bnRhdGl2ZcKgYXMgSSBhbSBhIHN0YWZmLCBJIGNhbiBub3QgYmUgCmludm9sdmVkIGRpcmVjdGx5
LiBJdCBtYXkgbm90IGJlIHlvdXIgYXJlYSBvZiB3b3JrIGJ1dCB0aGUgCnByb2ZpdHMgYXJlIGdy
ZWF0IGFuZCBJIHdpbGwgZ3VpZGUgeW91IHRocm91Z2guIEkgaGF2ZSBhbHJlYWR5IApzb3VyY2Vk
IGEgbG9jYWwgc3VwcGxpZXIgZm9yIHRoaXMuIEkgb25seSBuZWVkIGEgcmVsaWFibGUgCnJlcHJl
c2VudGF0aXZlLgoKUGxlYXNlIGdldCBiYWNrIHRvIG1lIHNvIEkgY2FuIGV4cGxhaW4gdGhpcyBp
biBmdWxsLgoKQW1qYWQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
