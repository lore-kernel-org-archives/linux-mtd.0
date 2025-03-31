Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEDFC3600C
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Mar 2025 09:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vRAeLGOl3C+Pf9sOzo4l1qP/c+Bryrnc8nHenhWUR2M=; b=4wU2v6cbxWO2R8
	gf7fTeh+b5wL10JKsN7pdNuih53Kw/f42UuAb1aBuDbuARmCkkC6pJyDJWp0rSGaXLDa6u0/6yqQm
	vDaUKUpmRic6LHn17QJAI57ElHWAI8PtPQl8KAHO2NUhqZZmfXV0qkTDJpTTCTXY69wntdlVcZMTE
	3lqkktDJA7S893L1pOaPDJ/guJxfISBky+SDd1HZhzDLukRFrRucEYcPFYmkS2Yg+4pVuUVP3SLEq
	/aFA8aGyHAANLHM3p8S7evVWqaPSaVq4a08IfV81WtmdBWKYEvKEm9Qj58se4BN/ROlvUkcaykFDy
	rDpoIxEB6CaSzr1+mrug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBQq-0000000HW14-3Vun;
	Mon, 31 Mar 2025 09:27:48 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBPO-0000000HVt6-28H7
	for linux-mtd@lists.infradead.org;
	Mon, 31 Mar 2025 09:26:19 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3F38C210F9;
	Mon, 31 Mar 2025 09:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743413175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yQVTuso56swULq1AfX01NPck4FWCElzEgRrKnrRDqGA=;
	b=HYkj96R5j3w96JF4tSqD5h8Pnn4q12qHAreoSYtbWKCbTQSwANKLYilGA2zFR+K0JOe3Ln
	361NZOx3vLTQc6OjXXaUX8uwFLeDXDqNdHB+J1qQPu0y4I444vj1yfBzE6qfS/rXwyRKYl
	GE6X8SUm+NIoj2rUamK+D1gn5MWkTOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743413175;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yQVTuso56swULq1AfX01NPck4FWCElzEgRrKnrRDqGA=;
	b=spRtfKuhTB6jY0wvvBDj9AjBf0iu6RoTKwbQRI/YJKytu7HgsFL0+WOaKIel8PVNtHsFa+
	skQqswJ9vnimGOCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HYkj96R5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=spRtfKuh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743413175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yQVTuso56swULq1AfX01NPck4FWCElzEgRrKnrRDqGA=;
	b=HYkj96R5j3w96JF4tSqD5h8Pnn4q12qHAreoSYtbWKCbTQSwANKLYilGA2zFR+K0JOe3Ln
	361NZOx3vLTQc6OjXXaUX8uwFLeDXDqNdHB+J1qQPu0y4I444vj1yfBzE6qfS/rXwyRKYl
	GE6X8SUm+NIoj2rUamK+D1gn5MWkTOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743413175;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yQVTuso56swULq1AfX01NPck4FWCElzEgRrKnrRDqGA=;
	b=spRtfKuhTB6jY0wvvBDj9AjBf0iu6RoTKwbQRI/YJKytu7HgsFL0+WOaKIel8PVNtHsFa+
	skQqswJ9vnimGOCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0E49F13A1F;
	Mon, 31 Mar 2025 09:26:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Vt1+Abdf6mdaUAAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Mon, 31 Mar 2025 09:26:15 +0000
Date: Mon, 31 Mar 2025 11:26:12 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org
Subject: mtd spinand build breakage
Message-ID: <20250331112612.4d230483@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Rspamd-Queue-Id: 3F38C210F9
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_022618_705354_FE5309AF 
X-CRM114-Status: UNSURE (   7.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

This commit of yours:

commit 7ce0d16d5802bfde4209e52ee8ad644ca1eab423
Author: Miquel Raynal
Date:   Fri Jan 10 15:45:24 2025 +0100

    mtd: spinand: Add an optional frequency to read from cache macros

breaks the build for me (using gcc 7.5.0). I see this has also been
reported by the Intel test robot here:

https://marc.info/?l=linux-kernel&m=174227610810635&w=2

Do you have a fix for this already, or should we revert this commit
(plus 1ea808b4d15b9 which depends on it) for the time being?

Thanks,
-- 
Jean Delvare
SUSE L3 Support

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
