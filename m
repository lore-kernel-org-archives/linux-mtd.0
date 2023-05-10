Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA9FC77B7D
	for <linux-mtd@archiver.kernel.org>; Wed, 10 May 2023 07:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xGbLIZVaM9bJIc5y3uYWxGfOe27gzFIqvs4sAcaUCbs=; b=KbahhoeNaenoqM
	kVxEBhVcAGqwqhsqGu+wnv0muc8gbmo34NYNnI3+q5ANPHUzAuVt4evXOZDQG/eICihNSBArElyM7
	t3f64Q6daAXvUnOnGjX55AYqYcOv0FkDYYFB8JzZ6WBnlbO6QA+2ZylOXlaHfxEIo7Ad9mHnmWyrb
	vX7ECODj7rXApOsHqg3hAS0t0Mc0CDc1e7d4HX+33xN9SjV3n7xsWqVDULwtzFBA2g9rP7U0tWIR8
	9YPpJxC3UgccQIQmvv57LCFxGDHE7+pHMS305Cb1hIk/rwhvqHeSIz6NTl+jUtMAa4GXF+SNXXRzB
	lYS/qi+CJ69LNSnIzEug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwebi-005Qwp-1x;
	Wed, 10 May 2023 07:51:30 +0000
Received: from mail.mahavavy.com ([92.222.170.29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwebe-005Qv3-0E
	for linux-mtd@lists.infradead.org;
	Wed, 10 May 2023 07:51:27 +0000
Received: by mail.mahavavy.com (Postfix, from userid 1002)
	id 919B0220E5; Wed, 10 May 2023 07:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mahavavy.com; s=mail;
	t=1683705068; bh=IfqQW79nVX/qUpmHcJiWDpV9BQnOf/s+Zcq9ON74QJY=;
	h=Date:From:To:Subject:From;
	b=WJIdOpuJBW+c7AVhMYZhxONkRF6x9V1uaW4kBP8DVoWYFFub0fEQXn8EjJkn8cA4L
	 nUh4RCjIMZdLE6a8IHMnSjZhcrXw65aiMu156okhBMRo6WGAn6qPvfuraosqejkzbP
	 upnXWF2VrARB+2q0c8BIGSOTGM/yqeBvbrjx3s7m6YA8/LsMczwJSiDBMuAzYYlN07
	 VCY2Vv4YUIAn2GKpzc2UMWDl+TOFT1kuOVKyYcrLPYpLGwSlQvFwAalUg/PkTZa0ay
	 C/nrJN+NOevUevk8o0+gUEg2c/F9HKeeE7MclyFs5JRNfgokXguNGkLy5uOc9SIv/j
	 u2wSe1zqQpN5A==
Received: by mail.mahavavy.com for <linux-mtd@lists.infradead.org>; Wed, 10 May 2023 07:50:58 GMT
Message-ID: <20230510064500-0.1.2f.49aa.0.ermpobkzcx@mahavavy.com>
Date: Wed, 10 May 2023 07:50:58 GMT
From: =?UTF-8?Q?"Kristi=C3=A1n_Plet=C3=A1nek"?= <kristian.pletanek@mahavavy.com>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Tlakov=C4=9B_lit=C3=BD?=
X-Mailer: mail.mahavavy.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_005126_370691_870A20A4 
X-CRM114-Status: UNSURE (   2.20  )
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

RG9icsOpIHLDoW5vLAoKemFqacWhxaV1amVtZSB0ZWNobm9sb2dpaSB0bGFrb3bDqWhvIGxpdMOt
IGhsaW7DrWt1LgoKTcOhbWUgdsO9cm9ibsOtIHrDoXZvZHkgdiBQb2xza3UsIMWgdsOpZHNrdSBh
IMSMw61uxJsgc2Ugc2Nob3Bub3N0w60gZmxleGliaWxuxJsgcMWZZXNvdXZhdCB2w71yb2J1IG1l
emkgbG9rYWxpdGFtaS4KCk5hxaFlIGxpY8OtIGJ1xYhreSBqc291IHbEm3TFoWlub3UgYXV0b21h
dGlja8OpIG5lYm8gcG9sb2F1dG9tYXRpY2vDqSwgY2/FviB1bW/FvsWIdWplIHbDvXJvYnUgdmVs
a8O9Y2ggdsO9cm9ibsOtY2ggc8OpcmnDrSBzIHZ5c29rb3UgZmxleGliaWxpdG91IGRldGFpbMWv
LgogClBvc2t5dHVqZW1lIHBvZHBvcnUgdiBrYcW+ZMOpIGbDoXppIHbDvXZvamUgcHJvamVrdHUs
IHZ5dsOtasOtbWUgc3RydWt0dXJ1IGRldGFpbHUuCgpDaHTEm2xpIGJ5c3RlIG1sdXZpdCBvIHNw
b2x1cHLDoWNpIHYgdMOpdG8gb2JsYXN0aT8KClBvemRyYXZ5CktyaXN0acOhbiBQbGV0w6FuZWsK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
