Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DE4C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Feb 2022 10:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cPTvMgW3PqSrN4a7Lw11Jq2JmCU3Cb9FD5ZY0Kf85QA=; b=d0iazatOM7BpUk
	EuPufj5+DVeXIkL3Z0djvRbLV71hRfRk0ISkZMQXL7QYOYmYz+Fh5KA71bv/k0BBotHXK0BccEn/T
	VDArIotjInSNu1OET4QWt7Ly0QoHwZA6VRJXH/IDw+m3/C7jG5ZHa+djHybxrHWN6zT2I2nRDaDBp
	Nl1YLpnHV4sg7wyWys/wJL4DImXLNEkO3eUPJXUJcSFmw/O+7pFKuvC62aqS7lIDDVNK7k1PqpvSM
	+gljRMBWLan7X/h8gOhZ0tZhe9ZLQ6VCh9sF5h5P8tdzBewa10tWY+QlH0uuFFmXoea1KBaGm1NQH
	pA3uvnMEnFSMYZIRPPVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFD10-00EvSy-3z; Wed, 02 Feb 2022 10:37:30 +0000
Received: from mail.profitfirm24.com.pl ([212.237.10.110])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFD0q-00EvR8-V3
 for linux-mtd@lists.infradead.org; Wed, 02 Feb 2022 10:37:22 +0000
Received: by mail.profitfirm24.com.pl (Postfix, from userid 1001)
 id DBC8DAAC08; Tue,  1 Feb 2022 09:17:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=profitfirm24.com.pl;
 s=mail; t=1643707821;
 bh=M1ZVeu3q6Upppe+FUx/3rgI7MKJXh389NZDbgCK1SX4=;
 h=Date:From:To:Subject:From;
 b=zurT1C54bSgGmaM6rcDe5FjAK/ncBvycdtl7UOS94wloTGoBqrr9ukMqIOcO1gsUo
 qYPFJ0jLRMLhdg49MS4qmfZ7ZDbHpuUYeaH8CRtTnGWwzVMaTbGzMMHd8MF48sv8eg
 iqKR2LEZ11hTZpt+yHUv7DjAaot+MygUVGgh+o7LE2GlzO7jKAxMvWFwm750EOvglQ
 MvkPstEC76dPkjXeL7MaH0OmoWZc27+8n2Yn9NDbSP4AZHoMdMWnSVTzXl40aQB4FG
 HmCu7qIhiwhfGoD+Jlwo4hOpuRdrL7aaLIp5I8s0lcU2jAZE2/Mqs+mEnUzI/BQ9a4
 ToWBZdu+Pmw5A==
Received: by profitfirm24.com.pl for <linux-mtd@lists.infradead.org>;
 Tue,  1 Feb 2022 09:17:20 GMT
Message-ID: <20220201074652-0.1.b.2yxc.0.qgdtrhkiij@profitfirm24.com.pl>
Date: Tue,  1 Feb 2022 09:17:20 GMT
From: =?UTF-8?Q?"Arkadiusz_Soko=C5=82owski"?=
 <arkadiusz.sokolowski@profitfirm24.com.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Koszty instalacji fotowoltaicznej
X-Mailer: mail.profitfirm24.com.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_023721_162212_E11E2A15 
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

RHppZcWEIGRvYnJ5LAoKc3R3b3J6eWxpxZtteSBzcGVjamFsbsSFIG9mZXJ0xJkgZGxhIGZpcm0s
IG5hIGtvbXBsZWtzb3fEhSBvYnPFgnVnxJkgaW53ZXN0eWNqaSB3IGZvdG93b2x0YWlrxJkuICAK
ClNwZWNqYWxpenVqZW15IHNpxJkgdyB6YWtyZXNpZSBkb2JvcnUsIG1vbnRhxbx1IGkgc2Vyd2lz
aWUgaW5zdGFsYWNqaSBmb3Rvd29sdGFpY3pueWNoLCBkeXNwb251amVteSBuYWpub3dvY3plxZtu
aWVqc3p5bWkgcm96d2nEhXphbmlhLCBrdMOzcmUgemFwZXduacSFIFBhxYRzdHd1IG9jemVraXdh
bmUgcmV6dWx0YXR5LgoKTW/FvGVteSBwcnp5Z290b3dhxIcgZGxhIFBhxYRzdHdhIHdzdMSZcG7E
hSBrYWxrdWxhY2rEmSBpIHByemVhbmFsaXpvd2HEhyBlZmVrdHkgbW/FvGxpd2UgZG8gb3NpxIVn
bmnEmWNpYS4KCkN6eSBzxIUgUGHFhHN0d28gb3R3YXJjaSBuYSB3c3TEmXBuxIUgcm96bW93xJkg
dyB0eW0gdGVtYWNpZT8KCgpQb3pkcmF3aWFtCkFya2FkaXVzeiBTb2tvxYJvd3NraQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
