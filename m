Return-Path: <SRS0=wNtg=OH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E469C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Sep 2021 17:47:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC4E560EB6
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Sep 2021 17:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC4E560EB6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=3e8.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=oyrbz5ji9fM6wwOLlPYAQkPaydVBski7Wwvl8t0t4sM=; b=pF3wAyQfQ3kcizbLYpjwV98jkA
	nfu7SjULTaBqwmVECtjBLowNt5uBr4iIGUu+ZsKKg9dN0Xicfy4jAspK5bBHKJemCrp0Q3sRWUw6/
	peeU7OQrfa0jFSlUaYf1+DBgJXKP+BFs9R6uJip1oRDYfxPlJLBaTpcuYq6YvUcuzwgRv8aW/2HzF
	SCZ/kIZ4UdcK38e6IDDWOkr4DUDIdFyHX3MtWRX8VufFZ6bbrFqe0KWuaP3+YBMmkuxYgMh1/EKmP
	/TwEEBx2zal16t9LfV5Xh7ISBo4vjYey5cCdviU+XDoXJYl1LpPcJsnvxErbPojVceCzK4arGmSKz
	oPlzGN6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRHvk-00ElNG-AR; Fri, 17 Sep 2021 17:45:44 +0000
Received: from srv4.3e8.eu ([2001:67c:12a0:200::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRHvh-00ElMk-5L
 for linux-mtd@lists.infradead.org; Fri, 17 Sep 2021 17:45:43 +0000
Received: from [IPv6:2003:c6:cf12:5a0:9abc:9583:6f0a:c734]
 (p200300c6cf1205a09abc95836f0ac734.dip0.t-ipconnect.de
 [IPv6:2003:c6:cf12:5a0:9abc:9583:6f0a:c734])
 (using TLSv1.3 with cipher TLS_CHACHA20_POLY1305_SHA256 (256/256 bits))
 (No client certificate requested)
 by srv4.3e8.eu (Postfix) with ESMTPSA id 1085B600AA;
 Fri, 17 Sep 2021 19:45:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=3e8.eu;
 s=mail20170724; t=1631900736;
 bh=ktVsCO/bA+2oA7yI6QdsCnVtNDARkq+bYABQf34Yf5w=;
 h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
 b=waEfshOiUYtzIx19kj860fpjfQLq/lwaNwD7rYmnSJRsFZ60Lkd5z/jwJ3VQK3ypd
 djTVDAPOk2M05vZvHpLcbHOMWeI0gSDEaE0UmBRlXo/QdCTcftAkOyjyUZBmbIiWqk
 Vgs/PTKpKsJLplyZqAgTpK9PyxNb+VkxkuFBtOBJKULRH5+1v4g6K07xRhcBwz0gJ4
 FsAuqQs81aaBO5ae8qhY6QHtgeIK5ymCEeOePBPWCnMW8oNM54hE9YWsKTOCtwWb3O
 ip+dHUQAyACxfJ1630UDOvBwlSEp2WIGP/ZBWiHlCycrI/kCUNkYeX07roKvoXKCLl
 cBW5i0ssPRBKA==
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Daniel Kestrel <kestrelseventyfour@gmail.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210808072643.GA5084@ubuntu>
 <51f2ebf4-6df1-eba5-99f1-1ec88e475d20@3e8.eu> <20210917190154.76203a9a@xps13>
From: Jan Hoffmann <jan@3e8.eu>
Subject: Re: [PATCH v2] mtd: rawnand: xway: No hardcoded ECC engine, use
 device tree setting
Message-ID: <e9dd0653-139f-749b-c088-e756ee2d2132@3e8.eu>
Date: Fri, 17 Sep 2021 19:45:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210917190154.76203a9a@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_104541_543339_16736828 
X-CRM114-Status: GOOD (  12.69  )
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

SGkgTWlxdcOobCwKCj4gSSBhbSBub3Qgc3VyZSB0byB1bmRlcnN0YW5kIHlvdXIgbWVzc2FnZSBh
cyBhbnN3ZXIgdG8gdGhpcyB0aHJlYWQuCj4gVGhlcmUgYXJlIHR3byBwcm9ibGVtcyBoZXJlOgo+
IDEvIFRoZSBEVCB2YWx1ZXMgbm90IGJlaW5nIHRha2VuIGludG8gYWNjb3VudAoKVGhpcyBpcyB0
aGUgaXNzdWUgSSdtIHJlZmVycmluZyB0by4KCj4gMS8gSGFzIGFscmVhZHkgYmVlbiBmaXhlZCAo
YXQgbGVhc3QgdGhhdCBpcyB3aGF0IEkgdGhpbmspCgpUaGlzIGlzIG5vdCBmaXhlZCBpbiBrZXJu
ZWwgNS4xMC4gQW5kIHVubGVzcyBJIGFtIG1pc3Npbmcgc29tZXRoaW5nCnRoZXJlIGFsc28gZG9l
c24ndCBzZWVtIGJlIGEgZml4IGluIG1vcmUgcmVjZW50IGtlcm5lbHMuCgpJIGFtIGF3YXJlIG9m
IGNvbW1pdCAzM2Q5NzRlNzZlMjEgKCJtdGQ6IHJhd25hbmQ6IHh3YXk6IERvIG5vdCBmb3JjZSBh
CnBhcnRpY3VsYXIgc29mdHdhcmUgRUNDIGVuZ2luZSIpLCBidXQgdGhhdCBvbmx5IGZpeGVzIHRo
ZSBFQ0MKYWxnb3JpdGhtLiBUaGUgRUNDIGVuZ2luZSB0eXBlIGlzIHN0aWxsIGhhcmQtY29kZWQg
aW4geHdheV9hdHRhY2hfY2hpcC4KClRoYW5rcywKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
