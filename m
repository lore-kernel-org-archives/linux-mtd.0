Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62916C54EAA
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Jan 2023 08:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NzJroF4CGzjmu6rX2w5PM++gRwoha8yRZHi9BOdtRz0=; b=yuk1Veetw9zGyD
	BnJflFjXBlxr2Sa7bVZr5lzw6FGjJS4Xrh7Y2CJrKF66LR9sC/BfsgKINWbnOZFcnSse4dNr00w1k
	7wGOxuU4cBlNY4loNRNIQl2ATG+iwDcYy26+q3n47/fqO13y0cmP3miST5gJ7Ke+eYh1qmEN79EU6
	wYm2pMymD2DB/MmS1gbZuO7xXLhh4PGXZNZEyWUW6bDqngDCSNXBBkJYCT4uJSXvXFCDpYTKU56lG
	+CM6rpJXuL8WIHgAI8QOXEZZgcMv1Ac8s7i+fbrivv7B8cW4o7n65aTp3DEmPTIc/1ij/cpKqMndK
	k7Tf2/UD66GoWzUYhNIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJsQ1-00GOZJ-OM; Mon, 23 Jan 2023 08:43:09 +0000
Received: from mail.tryweryn.pl ([5.196.29.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJsPz-00GOYe-DK
	for linux-mtd@lists.infradead.org; Mon, 23 Jan 2023 08:43:08 +0000
Received: by mail.tryweryn.pl (Postfix, from userid 1002)
	id 99888A2723; Mon, 23 Jan 2023 08:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tryweryn.pl; s=mail;
	t=1674463385; bh=Bo+/jg3TCpOeS79PpZREuOWEeqJV//jojylD9dSrSik=;
	h=Date:From:To:Subject:From;
	b=cgtbrcgu9szw7Cu1Z0sziGuLUwNglEOIN8EN4zI7YEEq9Bs/9UbKb8QYkqGQhToiD
	 QDIe/3qWNnTY+zP7JpHokq5NUyG7/qcByP4tBQNo8OjzNn41n51ACLiX9waYR7Fta8
	 MiP2xGvL+6i9ablQD+Y5w0VaqM7MemPa6m7Jh0nT5rpaPON054keMQMWqTbFFz1Jwg
	 hmQMNeXg8Eioekrb08sDQ+M3V8Vd3tKsP+GdZwZnIG3kFUOEKfQHSryiOxeI/x5Qzn
	 DA+NvxwMwbJyzykBt+321L7cHYWZaymrLY/SoLx0ZDeOmfbOSmhp4t23MX4co1C0tS
	 6UPCHuEWmLpLQ==
Received: by mail.tryweryn.pl for <linux-mtd@lists.infradead.org>; Mon, 23 Jan 2023 08:42:54 GMT
Message-ID: <20230123081829-0.1.7p.2rwgm.0.og8o2jonmk@tryweryn.pl>
Date: Mon, 23 Jan 2023 08:42:54 GMT
From: "Karol Michun" <karol.michun@tryweryn.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Prezentacja
X-Mailer: mail.tryweryn.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_004307_632520_A0DC4A4E 
X-CRM114-Status: UNSURE (   1.94  )
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

RHppZcWEIGRvYnJ5IQoKQ3p5IG3Ds2fFgmJ5bSBwcnplZHN0YXdpxIcgcm96d2nEhXphbmllLCBr
dMOzcmUgdW1vxbxsaXdpYSBtb25pdG9yaW5nIGthxbxkZWdvIGF1dGEgdyBjemFzaWUgcnplY3p5
d2lzdHltIHcgdHltIGplZ28gcG96eWNqxJksIHp1xbx5Y2llIHBhbGl3YSBpIHByemViaWVnPwoK
RG9kYXRrb3dvIG5hc3plIG5hcnrEmWR6aWUgbWluaW1hbGl6dWplIGtvc3p0eSB1dHJ6eW1hbmlh
IHNhbW9jaG9kw7N3LCBza3JhY2EgY3phcyBwcnplamF6ZMOzdywgYSB0YWvFvGUgdHdvcnplbmll
IHBsYW51IHRyYXMgY3p5IGRvc3Rhdy4KClogbmFzemVqIHdpZWR6eSBpIGRvxZt3aWFkY3plbmlh
IGtvcnp5c3RhIGp1xbwgcG9uYWQgNDkgdHlzLiBLbGllbnTDs3cuIE1vbml0b3J1amVteSA4MDkg
MDAwIHBvamF6ZMOzdyBuYSBjYcWCeW0gxZt3aWVjaWUsIGNvIGplc3QgbmFzesSFIG5hamxlcHN6
xIUgd2l6eXTDs3drxIUuCgpCYXJkem8gcHJvc3rEmSBvIGUtbWFpbGEgendyb3RuZWdvLCBqZcWb
bGkgbW9nbGliecWbbXkgd3Nww7NsbmllIG9tw7N3acSHIHBvdGVuY2phxYIgd3lrb3J6eXN0YW5p
YSB0YWtpZWdvIHJvendpxIV6YW5pYSB3IFBhxYRzdHdhIGZpcm1pZS4KCgpQb3pkcmF3aWFtCkth
cm9sIE1pY2h1bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
