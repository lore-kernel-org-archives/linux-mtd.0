Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D05C54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Sep 2022 18:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MBEM87yhuppj4AFcQcF2a/sh/emrUJWf2++Rikp8v3A=; b=Tk4CJA7nBMTbsD
	81Y2QXbvTSpU6JLyiAk6pPT+fs05L7OYWjElSnkyg8BCY9FF/4EQ8uSatkv2MKCtGJV29cKvq0zfw
	9MZju/vAd6lyNRtqqpO3i7sMZ66cSKYPBwhsCmr/xcp10pn4UOTBT76jBV3HdRwXA1Kr+unuCgcBm
	pg+UTO1emOqWnUigfDYB6ZwpVo/MMQHERhYsRyVwBkzZJDaQNpzaXWsxkgWKGA8UiMILSPC/mgfbU
	eI+m1zGkd9ewul39+RqY1otQi83DUfsBlKNvdlmM2yKeo8nVCyCXjhsFmIcOr2bbLPE2K/XiQJYkQ
	wC4b8Gy1ogEpRN7cfihA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odFlL-00CIke-Q7; Tue, 27 Sep 2022 18:56:59 +0000
Received: from fsfvdiej.episotheque.com ([81.161.229.202])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odFlJ-00CIk4-CM
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2022 18:56:58 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=dkim; d=episotheque.com;
 h=Reply-To:From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding; i=san.con@episotheque.com;
 bh=OiGiu6Ah1/fotYvxUCVyqvf+5hs=;
 b=skH8VPrVyYp2vx+4P9yAvhsE08xntm69Vm02TPHqlFn92DjDluApVbNjYBkwx/suZDR765gqUi9l
   OoH71XZetKOR6PTMGguq/1uDo7eTb32Zp6f5LO6W57HGFzIX6OEtKefNZh0uqhLJeAGfnxQfdaNs
   SXysJBhHsfRTchiwDa57IrIyFpvlIQ2KoDsD/xBmO1JFQhWjPRgz/dwPW37Q3OvFP0yMtGOURu4e
   SovlrVPdWHjUHiAQgY/6NI+h1tu2ZQXtOM5jdYSLz6frl75FjDxpZthcaSWZwvOQw4N+9ka5qOyj
   fmup9NF7eTHOhj1iTZFrMjnUnoGlzE3f5W+5nQ==
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=dkim; d=episotheque.com;
 b=J4jN5/m8a06QisigZ3KgInspRFz8mAF+6iHzSxB9LjEIeOccWoh+GhHyWvshgnCvMmX7g+cjNzb3
   0zrNPYtyb92lanCAjJvL8d7xEmwIwqkA059phmfLvdouTlICH4TrS16+L5mkDYNQxU5Ku1R7hYna
   WP2nFrsgkVuRiXua4xlZUMs/r+z7xanIFMaFwCCR0llxeUXzzAX62SZ+67UC4Mz1qHnvid+dVrMz
   3yyYvXM3ZqAJP2Mnh6G5bTtoh8k0CK/SQOw2+PoxOa/oQ2V8LPN3384+chImbbWPmzW1ALzFh9bO
   BQOmngrumO52h/DZohbuYFWpkVoiSwLxpBROPw==;
From: Donald Kolman<san.con@episotheque.com>
To: linux-mtd@lists.infradead.org
Subject: IMPORTANT
Date: 27 Sep 2022 21:56:53 +0300
Message-ID: <20220927215653.13B23DB4E60BFE7F@episotheque.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_115657_644054_9A60E10D 
X-CRM114-Status: UNSURE (  -0.67  )
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
Reply-To: kolmandonald3@protonmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcgLAoKSSBrbm93IGl0J3MgYW4gdW5j
b252ZW50aW9uYWwgd2F5IG9mIHJlYWNoaW5nIG91dCB0byB5b3UgYnV0IGl0J3MKZm9yIGEgZ29v
ZCBjYXVzZS4KCgpJ4oCZbSBEb25hbGQsIGEgUmVzZWFyY2ggQXNzaXN0YW50IG9mIHRoZSBSZXNl
YXJjaCBhbmQgRGV2ZWxvcG1lbnQKRGVwYXJ0bWVudCB3b3JraW5nIGF0IG9uZSBvZiB0aGUgbGVh
ZGluZyBCaW8gUGhhcm1hY2V1dGljYWwKQ29tcGFuaWVzIGhlcmUgaW4gRW5nbGFuZC4gSSdtIGxv
b2tpbmcgZm9yIGEgcmVsaWFibGUgYnVzaW5lc3MKcGVyc29uIGluIHlvdXIgcmVnaW9uIHRvIHJl
cHJlc2VudCBteSBjb21wYW55IGluIHNvdXJjaW5nIHNvbWUgb2YKb3VyIGJhc2ljIHJhdyBtYXRl
cmlhbCB1c2VkIGluIHRoZSBtYW51ZmFjdHVyaW5nIG9mIGhpZ2ggcXVhbGl0eQpBbnRpLVZpcmFs
IFZhY2NpbmVzLCBDYW5jZXIgdHJlYXRtZW50IGFuZCBvdGhlciBsaWZlc2F2aW5nClBoYXJtYWNl
dXRpY2FsIFByb2R1Y3RzLgoKVGhpcyBtYXkgbm90IGJlIHlvdXIgYXJlYSBvZiBzcGVjaWFsaXph
dGlvbiBidXQgaXQgd2lsbCBiZQphbm90aGVyIGluY29tZSBnZW5lcmF0aW5nIGJ1c2luZXNzIG91
dCBvZiB5b3VyIHNwZWNpYWx0eS4gVGhpcyBpcwpiZWNhdXNlIE91ciBjb21wYW55IGlzIHlldCB0
byBsb2NhdGUgYW55IHNlbGxlciB0byBidXkgZnJvbSwKaG93ZXZlciwgSSBoYXZlIGJlZW4gYWJs
ZSB0byBkaXNjb3ZlciBhIGxvY2FsIGRlYWxlciB3aG8gY2FuCnN1cHBseSB1cyB3aXRoIHRoaXMg
cHJvZHVjdC4gSGUgaXMgc2VsbGluZyBhdCBhIGNoZWFwIHJhdGUgLAp3aGljaCBpcyBmYXIgY2hl
YXBlciB0aGFuIG91ciBwcmV2aW91cyBwdXJjaGFzZXMuCgpJIHdpbGwgZ2l2ZSB5b3UgbW9yZSBz
cGVjaWZpYyBwcm9maXQgZGV0YWlscyB3aGVuIEkgcmVjZWl2ZQpmZWVkYmFjayBmcm9tIHlvdSBp
ZiB5b3UgYXJlIGludGVyZXN0ZWQuCgoKQmVzdCByZWdhcmRzCgpEb25hbGQgS29sbWFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
