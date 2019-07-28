Return-Path: <SRS0=FYfc=VZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C423BC433FF
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Jul 2019 15:40:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A8102075E
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Jul 2019 15:40:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fb04zGNP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A8102075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9900Ys3vQjOqtHHKv8ezRW8DmkW+nHEPGl1LoQwqqJ8=; b=Fb04zGNPkfUK+k
	6KP/9GaW244FQ8XFpkYi1iPtfuS9rB9HamAEPL56u3WgOEw2zyN7dvkqPEeUObV2HDsrgkNols7qp
	H8P4gkNR9u4W8TSuBXdduDEX/2zs+fh6eHOI08JgNV9W2drGog8dRKZPRHPATh4Z4uaXfOAL60dMK
	TMMAd4oE5CFnYvQ/WdIOT/I/sF30U8naNXU8n2ajqx12/Hal1h/3cy/ZlUMbps9kB3wCHu/evVttA
	9Vm4c3P18J0W23UGm883mXuKeajWYWGQRLeFMNcmlwRr64ZIiQRGsEGQmtQSkw1f5htYb4Ejgq4Bc
	FrF0RKj4lV1/32ZkMsIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrlHu-0004h5-OE; Sun, 28 Jul 2019 15:40:42 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrlHr-0004gl-Ep
 for linux-mtd@lists.infradead.org; Sun, 28 Jul 2019 15:40:40 +0000
Received: from callcc.thunk.org (96-72-102-169-static.hfc.comcastbusiness.net
 [96.72.102.169] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x6SFeXgD004159
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jul 2019 11:40:34 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 6A6464202F5; Sun, 28 Jul 2019 11:40:32 -0400 (EDT)
Date: Sun, 28 Jul 2019 11:40:32 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v7 05/16] fscrypt: refactor v1 policy key setup into
 keysetup_legacy.c
Message-ID: <20190728154032.GE6088@mit.edu>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-6-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726224141.14044-6-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190728_084039_667229_53151A98 
X-CRM114-Status: UNSURE (   7.82  )
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
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jul 26, 2019 at 03:41:30PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> In preparation for introducing v2 encryption policies which will find
> and derive encryption keys differently from the current v1 encryption
> policies, refactor the v1 policy-specific key setup code from keyinfo.c
> into keysetup_legacy.c.  Then rename keyinfo.c to keysetup.c.

I'd use keysetup_v1.c, myself.  We can hope that we've gotten it right
with v2 and we'll never need to do another version, but *something* is
going to come up eventually which will require a v3 keysetup , whether
it's post-quantuum cryptography or something else we can't anticipate
right now.

For an example of the confusion that can result, one good example is
in the fs/quota subsystem, where QFMT_VFS_OLD, QFMT_VFS_V0, and
QFMT_VFS_V1 maps to quota_v1 and quota_v2 in an amusing and
non-obvious way.  (Go ahead, try to guess before you go look at the
code.  :-)

Other than that, looks good.  We can always move code around or rename
files in the future, so I'm not going to insist on doing it now (but
it would be my preference).

Reviewed-by: Theodore Ts'o <tytso@mit.edu>

						- Ted
						

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
