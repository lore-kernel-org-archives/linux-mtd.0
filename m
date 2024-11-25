Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E54FD3B7F0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Nov 2024 08:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xoVRPUqkcP72GyOzBSNrgYpVjqUjyEROPt8DsVIFemc=; b=htlfc8LUeTuZFz
	taOVkcaLsc6I1usldr2CM/j0gja6/xNrzPCKqf8VT0DWCLlpQWJJ63YuVM+VVdDQuuRwKP6xAjHpt
	dx0ZtvpZIEHk6I+L/7NuYVB9KIsF1r52JKdHRBygq6OZvwF6QJhq6nmN3HIpbqcIPMkxAD7GGFg0j
	mNwZu0PosCaQg8vVuMcoVjq2STmU/cqUMeIVVghqvdfFWTByRvbvKgeZbdluXhUtgyWx+M5cDIPCb
	4HuE79UKItHZAaZ3AZ7SyqHP933nIJPSFddt6MkFq1pZ+sWend5zvxX6eBblLQcj6cEoIM+YRqf2k
	R16kwzs9SIzY6qxqGfDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUbV-00000007PWN-3fFV;
	Mon, 25 Nov 2024 08:37:57 +0000
Received: from mail.quantumquest.pl ([217.182.69.186])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFUW4-00000007OEi-2T7k
	for linux-mtd@lists.infradead.org;
	Mon, 25 Nov 2024 08:32:22 +0000
Received: by mail.QuantumQuest.pl (Postfix, from userid 1002)
	id 90E7B44C68; Mon, 25 Nov 2024 09:31:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=QuantumQuest.pl;
	s=mail; t=1732523503;
	bh=H2qKgXE2kH8cJbbzmMD4Hpjt6I9O7VcxhCsYYCpgFnQ=;
	h=Date:From:To:Subject:From;
	b=rDxJFPs+tZbLOf5iY0EOD38s1W94TTmxhbAPFCI+bjnff++aLYjdMA9UVqrFEs2Zf
	 uweh4nxO+Zt68voqszlUtvH+Avveev2N3GYTaz1QwmUyo9tLjRfQt0ejMekfnmC0op
	 3MEh/8Xelcv6DwbBZ+CtSHMrq0O7ijs8zXMJZlRLs1PoP4KDY3pLNnnPEfIqreUJQ8
	 MBaOu1jFF01X5ocm++zthwYTx/nbf7i3YHFOlAWPdKzX2Ii52CCr5dJT1olepz5gpS
	 dR/4JggrnR/gFq+vXUxbIgrmYemQFD6ofaUfSZRcHar9/q/LpP7cQ+SZsE2/HqdwL6
	 VhWpimZ9xdB3w==
Received: by mail.QuantumQuest.pl for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2024 08:31:01 GMT
Message-ID: <20241125084500-0.1.cr.1xa9n.0.8trnalhwp0@QuantumQuest.pl>
Date: Mon, 25 Nov 2024 08:31:01 GMT
From: =?UTF-8?Q?"Tadeusz_=C5=81ukomski"?= <tadeusz.lukomski@quantumquest.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.QuantumQuest.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_003221_307284_BEE5F7A3 
X-CRM114-Status: UNSURE (   2.24  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbSBzZXJkZWN6bmllClRhZGV1c3ogxYF1a29tc2tpCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
