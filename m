Return-Path: <SRS0=reHH=K7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545B4C47082
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Jun 2021 07:29:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 005C16121D
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Jun 2021 07:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 005C16121D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wdF190+wH8KhqQafvsX/tOABz3qUavsJj0sDCy4oQY4=; b=c+ne5e7scbqwXg
	8H+0TBYCco7OHwHjS9ivnnAHDpwqVf5zfIvEeNpyIZT0XqywHFctQySnXURQBLN2uCRiYxcBmwu+o
	h96EjPW8sCw1SqUAil/ETuxxGQbVdePfvK0m9lGLapD56UNekQvb1jytmcGfJvU8Gvq0I7Pc1b4Jb
	+e/QeKHpdvpnbkcrgyngY4/QdZE0BHQB6bK4Xb081C3dR7uUA8zD0zMdvVZtMeRkzYXV2Fu0AzXlV
	6Ii6XdRdesPjLSzozyfdx3kNjuKVphWyzMtdyJzTUvQMp52GqqInDH6GsoiwLftIYjDJT/X1xH8x+
	BJlxor+fl08X8Mfhm6Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpQjF-00GD1P-Q3; Sat, 05 Jun 2021 07:28:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpQjC-00GD0o-RL
 for linux-mtd@lists.infradead.org; Sat, 05 Jun 2021 07:28:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E95D61205;
 Sat,  5 Jun 2021 07:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622878097;
 bh=5g/aAviMny/1FbdkPtEqxlinD1zUu0BX5Eg+Gjxof9w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ecqtWV5+MliS+73h1GUVDr/6Is2BagPyHqHOLAWXmLeEsp+nor4Oi0a57xaWOWcRf
 7Hni68QjXNX+9wxpVa6eZcO3hIXX3fdRQKfSctMxfWq+j4FJ9ca0z1MgjUFgSr3JsZ
 NDBdYEwmgz9BhUYAxFFSJdpfG7blR0pt87qQbIqRmV7dw4tb4WoppJV7LCZ+xzA/k6
 vqUGV1OOmqn1570/9AAFVvw0H/iGCkOrcGqldrsAovanOxS9cDp33wMGneSDJA3nLt
 YXiAK/xIZxtdksDZYYPE2+GIrmYwQW+XY9Bje6oDYMUYvv0oQ3QbyUU3lOxzuJmXAa
 zILBDus1uZYhg==
Date: Sat, 5 Jun 2021 00:28:15 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Cc: linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [PATCH] fscrypt: don't ignore minor_hash when hash is 0
Message-ID: <YLsnjxXpe+agF6nj@sol.localdomain>
References: <20210527235236.2376556-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210527235236.2376556-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210605_002818_937245_E4221159 
X-CRM114-Status: GOOD (  19.61  )
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

On Thu, May 27, 2021 at 04:52:36PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> When initializing a no-key name, fscrypt_fname_disk_to_usr() sets the
> minor_hash to 0 if the (major) hash is 0.
> 
> This doesn't make sense because 0 is a valid hash code, so we shouldn't
> ignore the filesystem-provided minor_hash in that case.  Fix this by
> removing the special case for 'hash == 0'.
> 
> This is an old bug that appears to have originated when the encryption
> code in ext4 and f2fs was moved into fs/crypto/.  The original ext4 and
> f2fs code passed the hash by pointer instead of by value.  So
> 'if (hash)' actually made sense then, as it was checking whether a
> pointer was NULL.  But now the hashes are passed by value, and
> filesystems just pass 0 for any hashes they don't have.  There is no
> need to handle this any differently from the hashes actually being 0.
> 
> It is difficult to reproduce this bug, as it only made a difference in
> the case where a filename's 32-bit major hash happened to be 0.
> However, it probably had the largest chance of causing problems on
> ubifs, since ubifs uses minor_hash to do lookups of no-key names, in
> addition to using it as a readdir cookie.  ext4 only uses minor_hash as
> a readdir cookie, and f2fs doesn't use minor_hash at all.
> 
> Fixes: 0b81d0779072 ("fs crypto: move per-file encryption from f2fs tree to fs/crypto")
> Cc: <stable@vger.kernel.org> # v4.6+
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/crypto/fname.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 

Applied to fscrypt.git#master for 5.14.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
