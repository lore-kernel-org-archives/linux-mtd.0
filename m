Return-Path: <SRS0=CTVO=WI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC1CC31E40
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2019 22:20:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DAB8206A2
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2019 22:20:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q7fUuxIa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DAB8206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0uKWAwNeDQ5R6xWZ1wcazniHPmm2LVSUx9k1UMHqNGw=; b=q7fUuxIav9hmBG
	PoMCXiC6cZKdAxPn44jrxf1Qkii/Q8XAgUjwRtIwJLjIhQjldrX+3SeRItKJ8p3uqdD4GPjPWpmW4
	AOXw9U06xn7md3dq1XFv4Z7daakUXgpXJWTKp+k/mDxKBAsmWw7ggx7vPB/MhxQ7dNOdFo8NCXn7z
	yPfKKdVNlGqaqyMDkeC9gPp1HgvoAfVjb3kFF47kT+oIyn34Mt18taffuTMcIrn+BJ4Sh2EljIFST
	3AulToSDj7P9h3Wc5zjkjPpihBIIZKNzjQQFhfI9F058s8mYbXNXQgrjrKzxFJ7p03+DcUOVT4znZ
	w84CGav4R6eY89f+4Afg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxIft-0005pQ-9p; Mon, 12 Aug 2019 22:20:21 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxIfp-0005ox-EY
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2019 22:20:18 +0000
Received: from callcc.thunk.org (guestnat-104-133-9-109.corp.google.com
 [104.133.9.109] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x7CMK4AQ010100
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Aug 2019 18:20:06 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id F054A4218EF; Mon, 12 Aug 2019 18:20:03 -0400 (EDT)
Date: Mon, 12 Aug 2019 18:20:03 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v8 05/20] fscrypt: rename fscrypt_master_key to
 fscrypt_direct_key
Message-ID: <20190812222003.GD28705@mit.edu>
References: <20190805162521.90882-1-ebiggers@kernel.org>
 <20190805162521.90882-6-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190805162521.90882-6-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_152017_662068_14D61B8A 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 05, 2019 at 09:25:06AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> In preparation for introducing a filesystem-level keyring which will
> contain fscrypt master keys, rename the existing 'struct
> fscrypt_master_key' to 'struct fscrypt_direct_key'.  This is the
> structure in the existing table of master keys that's maintained to
> deduplicate the crypto transforms for v1 DIRECT_KEY policies.
> 
> I've chosen to keep this table as-is rather than make it automagically
> add/remove the keys to/from the filesystem-level keyring, since that
> would add a lot of extra complexity to the filesystem-level keyring.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good.  You can add:

Reviewed-by: Theodore Ts'o <tytso@mit.edu>

						- Ted

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
