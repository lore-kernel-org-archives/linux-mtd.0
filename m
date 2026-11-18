Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9361B606A333
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 05:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g8IANehg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FfwTOhXU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EscWNEbz/fDKh1UDMPGGGqz8QkEcZx/BrCQl8TBFBt4=; b=g8IANehgsChSX51m1nDYhtPKbf
	tXLx0CHUGMfRsg62qbXp1dRPjsfzQDKxkMlA95ObcC2nz9l8NwgM5/hCuAcyEoiSaAVjVX1TjJAoo
	B3ycjayYyljWGXDwh5F8va3pACiX1HcTkz87igLHJv1h+GcU9Th2wefv7wFqR2CwO2REJLckhyaFH
	W1fs6WhRi+95aK8YnB+Xt/1aYiOUWmohRyHin+u0fEeokN19R06Nac0DSA8wEnjFebZgCJjbaP0RG
	DSP0u59XguCMEU0Lkw61WiwYrhg+wu2tSTJsTdg0dSDm86IuQwKUQExd7V72SKa47cfCAynCCelYi
	EvsrN+eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTXo1-00000007jNc-1tU9;
	Wed, 18 Nov 2026 05:02:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTXo0-00000007jNU-2Mnt
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 05:02:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 08B9945852;
	Wed, 18 Nov 2026 05:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E2DA1F000C4;
	Wed, 18 Nov 2026 05:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794978119;
	bh=buJAxVxDBcGm0+gFbF5F6hAK1IYNZp2MClhpS9+UJjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FfwTOhXUXPUk+CcNccykVkrwW0f62fCOj8ajYxrUk8D3gwNNG+f0orXOYe7MAP6Ze
	 kGqxVltBqpd1DH89gmYIJRQdkwTRdgv+x1IaHQx05OnBeLDC13/CE/m6d56egTdOhe
	 MvxdTCzQCk1HX7V4XjpEO/fGBS+XbXedJVssoX23MdbTqGwSKvDIHVWj9jYBd13NX7
	 3F6hRp/2gQq3e+Gtf8QXIk2nMYsFwVOVQMeWE03BzAl+P1CvIwyKp9p7mYD4H8y3ti
	 PIYiXHtwECD1jHhA2UZK5V8gyHBn9SCHHgUujAFow9r9rAOwcSXjeyelZGYhONYPmp
	 0zgXOC8W4UxXw==
Date: Tue, 17 Nov 2026 21:01:58 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Thorsten Blum <blum@kernel.org>
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	"Theodore Y. Ts'o" <tytso@mit.edu>, linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mtd@lists.infradead.org, linux-fscrypt@vger.kernel.org
Subject: Re: [PATCH 0/4] fscrypt: Add FSTR() helper macro and convert
 initializers
Message-ID: <20261118050158.GC3400@sol>
References: <20261118002845.574426-6-blum@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261118002845.574426-6-blum@kernel.org>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 01:28:46AM +0100, Thorsten Blum wrote:
> Similar to QSTR(), add FSTR() to initialize struct fscrypt_str from a
> NUL-terminated string without specifying its length.
> 
> Use the helper for 8 initializers in btrfs, F2FS, and UBIFS, replacing
> hard-coded lengths and explicit strlen() calls.

It would be worth stating explicitly that the new strlen() calls are
constant-folded in most configurations (if they indeed are).

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
