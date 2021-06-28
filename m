Return-Path: <SRS0=3VFJ=LW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FDD6C2B9F4
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jun 2021 16:57:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF56561920
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jun 2021 16:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF56561920
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MD0AfIAmPMqXzLtTeoqpMWFRzuIzIpdv2EqT9nwNvgY=; b=xT8mjyCUWxcvue
	Hj3wrffM2kjPP4Ksx1niHPzjiCxIOLCfkHmubS+DmI7G5uyIaJ976GW3nOOMAqkDSOUFmCwoAF/LN
	FB/0FqfUrFtrJe3sk2tIF88LrHxZvTeKCZx9u8k4lRHHESXtnVz/zb1V0hsLlFqed9XbrfiHbavHd
	a/uFxRsEgaWDBe+p1W5rFv/Y/66yW8zFRUmdLKas67KH406Q04C/xhsh790xvLmaCNH8Nmx0fDo9P
	53iD25z+EdGFv6khB+KiE2G3ORfXn/gfLvMW6hIjFb77RNwg0uOP7VQd58Df0rg1DMxK06XpZb4SO
	A18OsvlD01D1Uw1npwdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxuZ4-008k4R-IA; Mon, 28 Jun 2021 16:56:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxuYw-008k2K-Rd
 for linux-mtd@lists.infradead.org; Mon, 28 Jun 2021 16:56:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB87B61988;
 Mon, 28 Jun 2021 16:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624899406;
 bh=JEH9YvkX1tuS2gUabFZ9JaX5r+EudDtnu4dkjX3MpYc=;
 h=Date:From:To:Cc:Subject:From;
 b=vNj8RwCa5/BCXX2jdMugsk8BK+T6K04e/v9FzgdrgzJaJ9GUpOdsfeYfV0SOb63iX
 KL7IPMD4GPZmublCVb4UFA6hyl43mf6EeUErmU0R5DSBZP8BpQQ3r/bi8FSTh4e2gi
 NczpLPJDkY4I7g5pwR5imkna4VDn+nml2cM8AI54Eaw7VJd9H1CzYcZtqiaY8yuuv4
 9YSKJ1bXlhjcDEYskWqkVZVg3TCMvoZ2G7Yk1FXZEZsYG9/wJi1HK81jf3n6hopI8B
 h1HzZaMto30+F+Mb6UVEy/e+wEUaIXQHnMrDpal9oWPMhdeUAJdxfKafRcZMG20Dq6
 zNbaGKfd6Ai1Q==
Date: Mon, 28 Jun 2021 09:56:44 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [GIT PULL] fscrypt updates for 5.14
Message-ID: <YNn/TL5lW44yAx3o@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_095646_985427_ABF8E52A 
X-CRM114-Status: UNSURE (   6.49  )
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

The following changes since commit c4681547bcce777daf576925a966ffa824edd09d:

  Linux 5.13-rc3 (2021-05-23 11:42:48 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git tags/fscrypt-for-linus

for you to fetch changes up to 2fc2b430f559fdf32d5d1dd5ceaa40e12fb77bdf:

  fscrypt: fix derivation of SipHash keys on big endian CPUs (2021-06-05 00:52:52 -0700)

----------------------------------------------------------------

A couple bug fixes for fs/crypto/:

- Fix handling of major dirhash values that happen to be 0.

- Fix cases where keys were derived differently on big endian systems
  than on little endian systems (affecting some newer features only).

----------------------------------------------------------------
Eric Biggers (2):
      fscrypt: don't ignore minor_hash when hash is 0
      fscrypt: fix derivation of SipHash keys on big endian CPUs

 fs/crypto/fname.c    | 10 +++-------
 fs/crypto/keysetup.c | 40 ++++++++++++++++++++++++++++++++--------
 2 files changed, 35 insertions(+), 15 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
