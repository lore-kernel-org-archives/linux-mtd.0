Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEE8C52D6D
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Aug 2024 07:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xoVRPUqkcP72GyOzBSNrgYpVjqUjyEROPt8DsVIFemc=; b=IGkQGeXVSUTHtt
	Z/SvkwFH33OceVvd0EobZ50ZTnlBRI4GFmAcFw0MOpuU2hnORBA0r2Tmqfz2SjcI3u/HbuNvf6RKk
	gw0nOh/THRhERfsw2A1rUH7/nORJ+OM8KJnzGmyxM9KBWCpXlCMc0BdogxV+n6x/2KEfc0CBaWKz1
	yihrSud1sTnBXk4BSEnh87GAZQdrANT5hEQxamJz3W5qNeFOm1lDpMkDm3q8zHGXwP/1Z8LulXOQC
	tI6bZGtspgQeqPJrpmQqlenY2wUFk+m96/XAn24cGKwAijvNtYtuEJv86fPV+TkgtbCRf4fIhaXw+
	wgOX3T6ioWpXVNQOgJqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbEfQ-00000000nKq-0ioU;
	Tue, 06 Aug 2024 07:31:36 +0000
Received: from mail.synergynova.pl ([51.195.47.69])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbEfM-00000000nKG-1DFI
	for linux-mtd@lists.infradead.org;
	Tue, 06 Aug 2024 07:31:34 +0000
Received: by mail.synergynova.pl (Postfix, from userid 1002)
	id B4B1FA380C; Tue,  6 Aug 2024 09:31:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synergynova.pl;
	s=mail; t=1722929486;
	bh=H2qKgXE2kH8cJbbzmMD4Hpjt6I9O7VcxhCsYYCpgFnQ=;
	h=Date:From:To:Subject:From;
	b=ufg4uAe0DXCs2uL1WnSzJGMSd7jmYuREpGFRDzm5ukayMfrtBwgzXYIJUqvJ30bqF
	 Vv/hsD2PCS3Xl9/3s4TCq0koS69WhsZcHmgfmRw8coSUpCKDZCA5kLI4f4zYGJovNZ
	 0F8T7QDePS/uxYOObbo9bkYAAY5IzfdZ5YpJ6ERYHNQDjUVIr0w3CHmokDS/PXBxI1
	 bMh8x5VewvQSxvrwZLxSMhWpUkR5kA2jHpAOQZ0b3RERpnNKfncnBJEkKn58vSdxvc
	 RALewc4YICtmLCAACJcMhsvqpGdRhzcfX8VCRJSq6aMI9xmA+ZYKh4GzTz8A7ZLxnh
	 ZzM/MaOpHbmpA==
Received: by mail.synergynova.pl for <linux-mtd@lists.infradead.org>; Tue,  6 Aug 2024 07:30:53 GMT
Message-ID: <20240806084500-0.1.ii.13jey.0.7a03hpaf5j@synergynova.pl>
Date: Tue,  6 Aug 2024 07:30:53 GMT
From: =?UTF-8?Q?"Tadeusz_=C5=81ukomski"?= <tadeusz.lukomski@synergynova.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.synergynova.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_003133_041250_006E9A69 
X-CRM114-Status: UNSURE (   0.77  )
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
