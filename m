Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E4CC02185
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jan 2025 09:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cg+Zj9G/XfbbIrs4T2hwOMdGy4yZ1aMXPHWNVMlRvXE=; b=CN4OevA48v8dA/
	51EbwkRnRGR+UjtZRJC/AJcma1SwOFhPB68aFXd2xkx39qHyGWyJmYy82jzffsO5/dwCiGr+vT6P0
	xcXA3lGApQaXALu7PZH7Rjl0CqtIkinN2rHS96kwUeLXF59xO2weIg7F0PNqz8+CBf2b0KNe6FpR8
	Hp1GZxwGOatKMTjOlnLB3EWRqcoXVrH7Txq8ZFEv1kWqwOpf9YrjYtHJ0kc3ecga2yWqcIUme8xlA
	Mh8F1An5lJDFl1l6qYa+sbbmbjqJHmxgTgi47wlOF5uizF4Z+up0ig0we+T9aq1JiUsw/NThV5Q0r
	g8ZiO6lh1jS+Nhb70vlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taAy0-00000007Thn-1wzW;
	Tue, 21 Jan 2025 09:54:40 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taAxx-00000007ThQ-3keF
	for linux-mtd@lists.infradead.org;
	Tue, 21 Jan 2025 09:54:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CDC9E0003;
	Tue, 21 Jan 2025 09:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737453275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C7gflKXd4zII/GeDYeSETV84zTda3Rb++G9d+oXje/4=;
	b=Uj+JLJkRtaPbnigXIXPg8UWaH+8AI38qbOhokkH43AUYlE+GnB/qdLcTSxvqM4huhkJrJF
	NzbIoSnzhDqzFWWDVT6c29UTgmTj3zsqHArTBYs/Oad171RKWY3MYrR7vvZx4cMfGaarwf
	EJjJ2IKgkx5LIpAkdLA1nUMCZo7Uhr4Ecm3msgRJoroZlcgDCLkdzB43PTWgOs3W402o6s
	1dDPZ3lHoz65eSI/8lHtiYrGiGQ/niAFRTvgxPNZzQp2dZsLMyTv6nWc/HVu0VO/CfDXiU
	PqLKLv1JVzm0Zc4/m1z9lwfn2/j9NDneq7B9wCoaNfiyUfp81ijldhU27vAjdg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: niravkumar.l.rabara@intel.com
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux@treblig.org,  Shen Lichuan
 <shenlichuan@vivo.com>,  Jinjie Ruan <ruanjinjie@huawei.com>,
  u.kleine-koenig@baylibre.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mtd: rawnand: cadence: fix incorrect dev context
 in dma_unmap_single
In-Reply-To: <20250116032154.3976447-4-niravkumar.l.rabara@intel.com>
	(niravkumar l. rabara's message of "Thu, 16 Jan 2025 11:21:54 +0800")
References: <20250116032154.3976447-1-niravkumar.l.rabara@intel.com>
	<20250116032154.3976447-4-niravkumar.l.rabara@intel.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 21 Jan 2025 10:54:32 +0100
Message-ID: <875xm8pk4n.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_015438_128914_82C29827 
X-CRM114-Status: UNSURE (   8.79  )
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

SGVsbG8sCgpPbiAxNi8wMS8yMDI1IGF0IDExOjIxOjU0ICswOCwgbmlyYXZrdW1hci5sLnJhYmFy
YUBpbnRlbC5jb20gd3JvdGU6Cgo+IEZyb206IE5pcmF2a3VtYXIgTCBSYWJhcmEgPG5pcmF2a3Vt
YXIubC5yYWJhcmFAaW50ZWwuY29tPgo+Cj4gZG1hX21hcF9zaW5nbGUgaXMgdXNpbmcgZG1hX2Rl
di0+ZGV2LCBob3dldmVyIGRtYV91bm1hcF9zaW5nbGUKPiBpcyB1c2luZyBjZG5zX2N0cmwtPmRl
diwgd2hpY2ggaXMgaW5jb3JyZWN0Lgo+IFVzZWQgdGhlIGNvcnJlY3QgZGV2aWNlIGNvbnRleHQg
ZG1hX2Rldi0+ZGV2IGZvciBkbWFfdW5tYXBfc2luZ2xlLgoKSSBndWVzcyBvbiBpcyB0aGUgcGh5
c2ljYWwvYnVzIGRldmljZSBhbmQgdGhlIG90aGVyIHRoZSBmcmFtZXdvcmsKZGV2aWNlPyBJdCB3
b3VsZCBiZSBuaWNlIHRvIGNsYXJpZnkgdGhpcyBpbiB0aGUgY29tbWl0IGxvZy4KCj4gRml4ZXM6
IGVjNGJhMDFlODk0ZCAoIm10ZDogcmF3bmFuZDogQWRkIG5ldyBDYWRlbmNlIE5BTkQgZHJpdmVy
IHRvIE1URCBzdWJzeXN0ZW0iKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVk
LW9mZi1ieTogTmlyYXZrdW1hciBMIFJhYmFyYSA8bmlyYXZrdW1hci5sLnJhYmFyYUBpbnRlbC5j
b20+CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
