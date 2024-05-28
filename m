Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFF4C27C43
	for <linux-mtd@archiver.kernel.org>; Tue, 28 May 2024 21:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5NmHX98u67rBwOXhor7ueB4U0sKcvCnsJyl9KlbITHY=; b=JZgibIj8BF1YaF
	aYQ+LTuwygSfxNfcNLqZEBjk0ErogzO+bUGuxZEOxaAw12WzgccCPCYbw45Xua8dKYkefL0bJaoPB
	en4WmP7oVPOtkYoPFYQDy89oE47aI0c/Z0hYpREa5lOjV/WDQvTquex2fuXnoWP9yP/fIFi1pLUSQ
	VevVIvxtqs7AQ6A9aeu/6CrThw7oFY9Yelnc7NgGXwEG7d8kO0xCBOIM2EoXkXiPPtPCFbs8aZfV/
	1dgMLlduxWalsSjlq3duzM8uUp7Vo6mGvxzmhKbExi10wixmOKt8BXKIDQDnu2itun9+Q/YwbWBYT
	61AdNr7ULuIdhsHpyiFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC4RQ-000000026Re-2kyh;
	Tue, 28 May 2024 21:33:08 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC4RL-000000026P9-3iBQ
	for linux-mtd@lists.infradead.org;
	Tue, 28 May 2024 21:33:07 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D3A0D2045D;
	Tue, 28 May 2024 21:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1716931978;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y271KPi+tCyRmzKrDCwqISkFoY5mXolXM/ZhCYK6JPs=;
	b=eKKTTVsOye+aPNKRzZ122169aw7bdpQ6y9COLPAXegCVrG5iSFsKe8NmabTrtfzVmJzDv5
	Ne2IuD4WBUJ9KFI2/n+OeUSe50fsuI871CPGI9BXPcJJwGF3yCfpaEpNu/AstvRM8I1NMM
	jJQ5ZoiYnmImiq61l3/GUCVuppLSong=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1716931978;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y271KPi+tCyRmzKrDCwqISkFoY5mXolXM/ZhCYK6JPs=;
	b=/F8BJdjswiKMjas+DwonGKmjEG3HjzGZ3ZDNGxX+svqxoF5eTGLjTUR3XiAExDuzESXHh8
	mDMDQki+foK9VsAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1716931978;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y271KPi+tCyRmzKrDCwqISkFoY5mXolXM/ZhCYK6JPs=;
	b=eKKTTVsOye+aPNKRzZ122169aw7bdpQ6y9COLPAXegCVrG5iSFsKe8NmabTrtfzVmJzDv5
	Ne2IuD4WBUJ9KFI2/n+OeUSe50fsuI871CPGI9BXPcJJwGF3yCfpaEpNu/AstvRM8I1NMM
	jJQ5ZoiYnmImiq61l3/GUCVuppLSong=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1716931978;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y271KPi+tCyRmzKrDCwqISkFoY5mXolXM/ZhCYK6JPs=;
	b=/F8BJdjswiKMjas+DwonGKmjEG3HjzGZ3ZDNGxX+svqxoF5eTGLjTUR3XiAExDuzESXHh8
	mDMDQki+foK9VsAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB93113A5D;
	Tue, 28 May 2024 21:32:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jMu/KYpNVmbCTwAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Tue, 28 May 2024 21:32:58 +0000
Date: Tue, 28 May 2024 23:32:49 +0200
From: David Sterba <dsterba@suse.cz>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	amd-gfx@lists.freedesktop.org, bpf@vger.kernel.org,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-pm@vger.kernel.org, netdev@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: Re: [linux-next:master] BUILD REGRESSION
 6dc544b66971c7f9909ff038b62149105272d26a
Message-ID: <20240528213249.GH8631@twin.jikos.cz>
References: <202405290242.YsJ4ENkU-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202405290242.YsJ4ENkU-lkp@intel.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spamd-Result: default: False [-3.58 / 50.00];
	BAYES_HAM(-2.58)[98.11%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:replyto]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_143304_092478_6F729AB6 
X-CRM114-Status: GOOD (  11.28  )
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
Reply-To: dsterba@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, May 29, 2024 at 02:19:47AM +0800, kernel test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> branch HEAD: 6dc544b66971c7f9909ff038b62149105272d26a  Add linux-next specific files for 20240528
> 
> Error/Warning reports:
> 
> https://lore.kernel.org/oe-kbuild-all/202405282036.maEDO54Q-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202405282148.jaF0FLhu-lkp@intel.com
> https://lore.kernel.org/oe-kbuild-all/202405282308.UEzt6hqC-lkp@intel.com
> 
> Error/Warning: (recently discovered and may have been fixed)
> 
> drivers/dma-buf/udmabuf.c:45:(.text+0x140): undefined reference to `vmf_insert_pfn'
> fs/btrfs/fiemap.c:822:26: warning: 'last_extent_end' may be used uninitialized [-Wmaybe-uninitialized]

The report says it's gcc 13.2, that one I use (and expect others as well
as it's a recent one) and we also have -Wmaybe-uninitialized enabled in
fs/btrfs/ to catch such warnings. Yet this is reported on mips64, is
there something special about that compiler+architecture?

The warning is IMO a false positive, the maybe-uninitialized variable is
passed as pointer but initialized on success and never used on failure.
We can safely silence the warning by initializing the variable to 0 but
this may be pointing to a problem with mips64+gcc namely because other
compiler+host combinations do not warn abou that.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
