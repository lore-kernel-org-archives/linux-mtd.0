Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3659C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Feb 2022 08:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QFqAfvuR2Ed1ZB/hAXANh0D9jllsK1BoQKBbmIcgcC0=; b=d6Mag45FISfZQu
	IPy8j8DJRbx37/QxkpjTT5FB4dDs+LEENyYFmZIqnaQCx/HeXrqbiTI6HJQtJ3F+qCEnFM/+FwBoK
	oyGp1ap7JFey6uZYC2F96OQWk5YLIKhAK8KWrskD5Q01dZJdfnF8i96FvCEjEwgMX9ocZh36DGbJv
	rNsvIurjR3Fy8zZ92hqumPGpSCizlarx4N3XlycqPLd3nSo+ysuR12N75JhR0Wxv+kgpb0zoJ0g5O
	mpnrdUxC20JAoPHv1NsaMAeiLoeGs+Tx7m41Q/vv4TSSMTGQou5oF6GTZ+sqL0LelnEwX6rkg8FeV
	aGSfslyzv1q41f4j70yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIRUX-006DFp-PT; Fri, 11 Feb 2022 08:41:21 +0000
Received: from mail.bizcall.pl ([192.71.213.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIRUU-006DEh-DJ
 for linux-mtd@lists.infradead.org; Fri, 11 Feb 2022 08:41:19 +0000
Received: by mail.bizcall.pl (Postfix, from userid 1001)
 id CDD7140C95; Fri, 11 Feb 2022 09:37:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizcall.pl; s=mail;
 t=1644568876; bh=L7rZPDqncV/PGNK3vBL4eFyhOA8rMHMu3jCfxnl4mEc=;
 h=Date:From:To:Subject:From;
 b=OJ76H+83IJ+yUx98V5L9IuI9XqswgmJCVAHQ4lEB3EMTGuknbLXgJWgT1KNseH04K
 coubw2KL4YG6Jnus1IWTs8gUJm3YXhKaSkl3VoIWUzEBYcLqk7Jb+gdpF+2ENLz85m
 CHX45SphPiWfD6KL2o1IKYRcyTLxRFgRwj8LhLd6pDjndl46keReMpdSNaobcrLgQM
 L8K3n62tk1gvHi2I2nzciYwHJKN9evfTC4Msyw02Jth23dOUUS88/VwzbqQYykeTU0
 u2t0ebKudZvsuWN+8WtQkPr6NAdCYisdN5xaw8tsYo6juw3QslGCJ8NLxzWVFzSugd
 P4X1am+7tIBCw==
Received: by mail.bizcall.pl for <linux-mtd@lists.infradead.org>;
 Fri, 11 Feb 2022 08:36:48 GMT
Message-ID: <20220211084500-0.1.u.23kf.0.qoccieofli@bizcall.pl>
Date: Fri, 11 Feb 2022 08:36:48 GMT
From: "Marek Onufrowicz" <marek.onufrowicz@bizcall.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Prezentacja
X-Mailer: mail.bizcall.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_004118_617647_206926FB 
X-CRM114-Status: UNSURE (   1.57  )
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
YSB0YWtpZWdvIHJvendpxIV6YW5pYSB3IFBhxYRzdHdhIGZpcm1pZS4KCgpQb3pkcmF3aWFtLApN
YXJlayBPbnVmcm93aWN6CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
