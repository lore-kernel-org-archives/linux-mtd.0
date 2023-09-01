Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FCACA0FE6
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Sep 2023 09:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yuxAkX66upcEBb99XHRoFFdRDZGa/rl1YS3xCBdXuos=; b=EYO47x0ATbUG/T
	vt5iAwVEfsDvdGXYcUtnfW275Typsd9Z+kMSzwnFt9BNUQJTaaHi4iIaOGasRsO0ktCI/IXaxj6tC
	Kvz8hk+x/9522v4xiuWVKjD4LAoameCganK7m1HQDAVjz7B3UGzYiDa55Hdj3OVctXPPOnt9YqEzE
	kQ7LRIwzcptq29GZsSXnH1nzGhplAnBTI8UFE1rkWX644yDyVDUCicMoBeGDJsox48L5eX20AnZDk
	1VYM3+UJmQRPR0z/+5GoOpEzhU2rKpnXhigX+W9pjVsnEYYUacUXXTyluOwfq2peG47hpDFq2Grm6
	o1mwVRV5i76pbozLSftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc0au-00Gkt1-1A;
	Fri, 01 Sep 2023 09:37:36 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc0aq-00GkrV-0C
	for linux-mtd@lists.infradead.org;
	Fri, 01 Sep 2023 09:37:34 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1439E2184E;
	Fri,  1 Sep 2023 09:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1693561047; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cq63iKzvpEWKDTP2zXwGKcj6WxwHFdBaziVEUxL/skU=;
	b=Db6O+f8Cdh4mPNzRNcKdrdlgrYVT5r1p2D+kkGaX+URp8a7bekV2jPl9mMaYzjlAhm6Lv2
	P7odHysaeb02Cw2F830FKKGa1XclUxqawenAcmtIPG6Yj21kPRKbUZbh0HkPXAor0i3/al
	wJXTQalJtR1wWgr5DK4uKGi0mVD9c5M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1693561047;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cq63iKzvpEWKDTP2zXwGKcj6WxwHFdBaziVEUxL/skU=;
	b=UcN3bKQxUbuFPp0zQLhviM8NYp+h0nRioOJC8EkCgGjcIVSnOvsd2SmYz33rqlHPOzZGqJ
	BWw0Z4CWoEb2TkBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0712513582;
	Fri,  1 Sep 2023 09:37:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id tTq2Adew8WRfRQAAMHmgww
	(envelope-from <jack@suse.cz>); Fri, 01 Sep 2023 09:37:27 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 90BECA0776; Fri,  1 Sep 2023 11:37:26 +0200 (CEST)
Date: Fri, 1 Sep 2023 11:37:26 +0200
From: Jan Kara <jack@suse.cz>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jan Kara <jack@suse.cz>, Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	Zhihao Cheng <chengzhihao1@huawei.com>, Yu Hao <yhao016@ucr.edu>
Subject: Re: [PATCH] ubi: Reject device with erasesize 0
Message-ID: <20230901093726.zamwwjkk4k7oambc@quack3>
References: <20230831111100.26862-1-jack@suse.cz>
 <26cd7b8f-abcc-410f-a7c7-e691999f4e3b@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <26cd7b8f-abcc-410f-a7c7-e691999f4e3b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_023732_254410_2A218BBD 
X-CRM114-Status: GOOD (  13.37  )
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

On Fri 01-09-23 10:25:11, Tudor Ambarus wrote:
> Hi, Richard,
> 
> On 8/31/23 12:11, Jan Kara wrote:
> > In principle MTD device with erasesize 0 can exist and it is possible to create them e.g. via KVM. If that happens UBI layer currently crashes
> 
> mtd devices are organized in erase blocks, having a mtd with erase
> size zero looks suspicious to me. Do you know if there are any mtd
> devices with erasesize of zero?

Please see the discussion I've referenced from the patch. I agree such
devices are strange but apparently devices reporting erasesize==0 do exist
and can be created in virtualized environment. IMO we don't need to work
with them but we shouldn't crash a kernel if they are attached...

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
