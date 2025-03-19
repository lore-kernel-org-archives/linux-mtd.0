Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE52AC35FFF
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Mar 2025 09:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LZpNmiDJkGM2l9yAIbFBVAfw7hJi1JE2igrEdDnMFNs=; b=3An0qBwk8QSJqu
	k1yMdUl11ta0vTWIhcGZ6R92V9XFtiq1U9bIZJdudR8rofEV1duxVIUrZKs3mJ3NpW/dbOs4xbVEh
	8Cv8KomjgpOo23Qr5m2My2NxioOAtlVmplCwDSi50+N4BoXriIbEq6w/ospQn2e7JOqjw3guPDlRy
	gW8CLMjBlZO5h8zdw4Wez/1YpnSx3PiAlUfNRtpExA/0IWCMD6fMCOfsZAzXAoDydjG952dOcWUiV
	aTXm5bf49uBknTdr0fQ7EyhihDeNdBXH/o3FGc0Gb29vfCS8VfEeQiMpe8w/RTVyEnvxCYdnVoPhl
	9N6UFfXKYp5xoITVCTEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tupap-00000008Sup-2AeN;
	Wed, 19 Mar 2025 09:20:07 +0000
Received: from mail.primefinix.com ([141.95.160.218])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tupam-00000008Sss-1MU4
	for linux-mtd@lists.infradead.org;
	Wed, 19 Mar 2025 09:20:06 +0000
Received: by mail.primefinix.com (Postfix, from userid 1002)
	id BFF17A7A23; Wed, 19 Mar 2025 10:16:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=primefinix.com;
	s=mail; t=1742375787;
	bh=eTw/Ga5/N6mVrc9xwMpMFYxdgBp3YtFvnyozeSy1je8=;
	h=Date:From:To:Subject:From;
	b=qBNxbXd1D5UUmqIQlQXeqrK7bl+ZtKHMH5bH6r9K3ESobbKNDlWnK8HIjSzQ7/pYv
	 6rx8BtzIp5FXTRN2QsIAGiyq2w3vXN5VMUkPgNke410kAe+9brKnVGBwG1T+90MA4a
	 QTbWkYw9oyr9AEVx7UTHsycSvKuZKOmLoSvgyEB3Rw6WnXGg99b+jY13Tixe9pTJgN
	 TG37LXLJsswWGLxfYOULxEiFRPS+Rc6S5mhwISjWbH3HmJaOOrrZQwiRZmP4z45Rfu
	 rGRrcC0IsQ+V/rTCktfg55YU1IhRu5HO05OWajB5AshWC5d9NGXB9Acrsu2/T6+Ydj
	 JwWRfHEDTaFzw==
Received: by mail.primefinix.com for <linux-mtd@lists.infradead.org>; Wed, 19 Mar 2025 09:15:54 GMT
Message-ID: <20250319084500-0.1.jj.1tj37.0.ko64yjv6rf@primefinix.com>
Date: Wed, 19 Mar 2025 09:15:54 GMT
From: "Brendon Roy" <brendon.roy@primefinix.com>
To: <linux-mtd@lists.infradead.org>
Subject: Mattresses - collaboration
X-Mailer: mail.primefinix.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_022005_050336_8CB5C27A 
X-CRM114-Status: UNSURE (   3.54  )
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

SGksCgpEcm9wc2hpcHBpbmcgb3VyIG1hdHRyZXNzZXMgaXMgYSBzb2x1dGlvbiB0aGF0IGlzIG5v
dyBnYWluaW5nIGEgbG90IG9mIHBvcHVsYXJpdHkg4oCTIHNpbXBsZSBzYWxlcyB3aXRob3V0IHRo
ZSBuZWVkIHRvIGludmVzdCBpbiB3YXJlaG91c2luZywgbG9naXN0aWNzLCBvciBzaGlwcGluZy4K
CllvdSBzZWxsLCBhbmQgd2UgdGFrZSBjYXJlIG9mIHRoZSByZXN0LiBXaGF0J3MgbW9yZSwgd2Ug
ZG9uJ3QgbGVhdmUgeW91IG9uIHlvdXIgb3duIOKAkyB3ZSBoZWxwIHdpdGggc2FsZXMgYW5kIG1h
cmtldGluZyBzbyB0aGF0IHlvdSBjYW4gc2VlIHJlc3VsdHMgZmFzdGVyLgoKQ2FuIEkgcHJlc2Vu
dCB0aGUgZGV0YWlscyBvZiBvdXIgcGFydG5lcnNoaXAgcHJvZ3JhbT8KCgpCZXN0IHJlZ2FyZHMK
QnJlbmRvbiBSb3kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
