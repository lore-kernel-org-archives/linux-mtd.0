Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8116C001DE
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jul 2023 08:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AOYVuB6FXE5w+MTY4pInNJFkz8+TUd3n18q1SAG3Ow0=; b=o2YoWdTZHWR4Fc
	K7vkBZgCo/bPm5iJk97M3uAs+tfCCqsubBVNap0oOJEEINP654/JupSjVudstnSvTZDD8ydOppJr0
	SjDV46V/ESSDgq6kBjtKVp7m28j3d7P/wiAGNBJkqr5GZc/NHMwcGyjuROuEufovnSAUSYW7fCPo6
	XKGyVRSVHsGBcjeuVBHWbtewqHQPYGm0BPpdbyp7przGWwIplWTP7ljOoV3Yq2NPkaL9bVsFaB060
	aGVDXULR/zzLRKieg7gqp0dMXWQDWFvn1kKWtvpDvd7EXT2sfBPaJW1hsrOZ8TjikfpBHv5qJvklL
	9LXBswEFpdA7/wNZgUEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOQu-00EZFY-1o;
	Mon, 31 Jul 2023 08:39:16 +0000
Received: from mail.cothiafon.pl ([217.61.106.23])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOQs-00EZEb-00
	for linux-mtd@lists.infradead.org;
	Mon, 31 Jul 2023 08:39:15 +0000
Received: by mail.cothiafon.pl (Postfix, from userid 1002)
	id 920D2839C5; Mon, 31 Jul 2023 10:36:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cothiafon.pl; s=mail;
	t=1690792626; bh=dwoca0X6C9VXklO/zRgFQCPapTk5LFz4tKaENdvy6Po=;
	h=Date:From:To:Subject:From;
	b=TBJEH4ow5tNAuRoJvP+SuYl2w0NORZIcuo4izia6Z3Y8gZJpJO28zR7RByb6FNmVE
	 3bB/rE2WIo8msFeA9TEFcEd5DcEVLfQabnHGfQFUBnqYtsYqpx6P8EKKb3+IJ53vC1
	 NCyNRjVze8FgZ1Bm3X6eRZS5rlNw+wYxT7TIu96baQMv6F72xyN23RdntgNubANlGh
	 wBYlQWxN4iwAmifOfE1XxoY3rHLbklgfrIvwdy4Zp0x5eTY9RRJ3VJ8DOlyGCXOmwI
	 2cH77f9QngSyW16enImtKjAFdRHIamKiT2ibgMKYqKUV70hE6swZR5D1y0+8Dw+IZ0
	 U3HXmf7A+7Z7Q==
Received: by mail.cothiafon.pl for <linux-mtd@lists.infradead.org>; Mon, 31 Jul 2023 08:35:48 GMT
Message-ID: <20230731095940-0.1.28.on3q.0.81qmf0f0qa@cothiafon.pl>
Date: Mon, 31 Jul 2023 08:35:48 GMT
From: =?UTF-8?Q?"Rados=C5=82aw_Grabowski"?= <radoslaw.grabowski@cothiafon.pl>
To: <linux-mtd@lists.infradead.org>
Subject: W sprawie samochodu
X-Mailer: mail.cothiafon.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_013914_180690_011345EE 
X-CRM114-Status: UNSURE (   1.10  )
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

RHppZcWEIGRvYnJ5LAoKY2hjaWVsaWJ5xZtteSB6YXBld25pxIcgUGHFhHN0d3Uga29tcGxla3Nv
d2Ugcm96d2nEhXphbmlhLCBqZcWbbGkgY2hvZHppIG8gc3lzdGVtIG1vbml0b3Jpbmd1IEdQUy4K
ClByZWN5enlqbmUgbW9uaXRvcm93YW5pZSBwb2phemTDs3cgbmEgbWFwYWNoIGN5ZnJvd3ljaCwg
xZtsZWR6ZW5pZSBpY2ggcGFyYW1ldHLDs3cgZWtzcGxvYXRhY3lqbnljaCB3IGN6YXNpZSByemVj
enl3aXN0eW0gb3JheiBrb250cm9sYSBwYWxpd2EgdG8ga2x1Y3pvd2UgZnVua2Nqb25hbG5vxZtj
aSBuYXN6ZWdvIHN5c3RlbXUuIAoKT3JnYW5pem93YW5pZSBwcmFjeSBwcmFjb3duaWvDs3cgamVz
dCBkemnEmWtpIHRlbXUgcHJvc3RzemUgaSBiYXJkemllaiBlZmVrdHl3bmUsIGEgb3N6Y3rEmWRu
b8WbY2kgaSBvcHR5bWFsaXphY2phIHcgemFrcmVzaWUgcG9ub3N6b255Y2gga29zenTDs3csIG1h
asSFIGRsYSBrYcW8ZGVnbyBwcnplZHNpxJliaW9yY3kgb2dyb21uZSB6bmFjemVuaWUuCgpEb3Bh
c3VqZW15IG5hc3rEhSBvZmVydMSZIGRvIFBhxYRzdHdhIG9jemVraXdhxYQgaSBwb3RyemViIG9y
Z2FuaXphY2ppLiBDenkgbW9nbGliecWbbXkgcG9yb3ptYXdpYcSHIG8gbmFzemVqIHByb3Bvenlj
amk/CgoKUG96ZHJhd2lhbQpSYWRvc8WCYXcgR3JhYm93c2tpCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
