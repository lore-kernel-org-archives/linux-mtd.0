Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1698C282DA
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 13:50:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90D9920872
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 13:50:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hoBueLzE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90D9920872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q2d4kI+1gpO4oMJQP7QgeK+sbes1yWZw9kGA420r/40=; b=hoBueLzE6qZ23W
	+NUJq8k7ncS/8M+2T3KSo4Vy31pWNZX4xvDHrVgNyYLkMbhUHPIy3zjFCllzGs15P0PkJVEwMe8RU
	4B05TtOunudpEflFMZoJoMIVNJQCVVWDTWpom0JcDd8WX/mGq2eCwC9Y/j2QD/V0Q5u5IHMewCkch
	OYFa9PKkP78E/wBdL4CLKV3KWcJnm4FYBsr6oqi2aaiGqa7vC1wETcZtenecmP+o04rgux/iDAfXm
	qGWDJa2XjRD/f6t5KINATMe+RVCoWtFBm3F/QWt/+Ef0Ncg1GJAf55N9Q3zt7xVTyzL7H6rw0VonF
	gbAuE4CnL1rJpPtBcdSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGkxO-0003kf-5w; Wed, 17 Apr 2019 13:50:34 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGkxL-0003kM-6V
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 13:50:32 +0000
Received: from callcc.thunk.org (guestnat-104-133-0-109.corp.google.com
 [104.133.0.109] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x3HDoFw8020484
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Apr 2019 09:50:16 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 8D935420497; Wed, 17 Apr 2019 09:50:15 -0400 (EDT)
Date: Wed, 17 Apr 2019 09:50:15 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v2 1/5] fscrypt: clean up and improve dentry revalidation
Message-ID: <20190417135015.GA4686@mit.edu>
References: <20190320183913.12686-1-ebiggers@kernel.org>
 <20190320183913.12686-2-ebiggers@kernel.org>
 <20190416230840.GB14623@mit.edu> <20190417001041.GA18090@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190417001041.GA18090@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_065031_401389_A9DA5221 
X-CRM114-Status: UNSURE (   6.43  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Gao Xiang <gaoxiang25@huawei.com>, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, Sarthak Kukreti <sarthakkukreti@chromium.org>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Apr 16, 2019 at 05:10:42PM -0700, Eric Biggers wrote:
> 
> Hi Ted, I assumed you resolved the conflict with "fscrypt: use READ_ONCE() to
> access ->i_crypt_info"?  The code in fscrypt_d_revalidate() should be:
> 
>         dir = dget_parent(dentry);
>         err = fscrypt_get_encryption_info(d_inode(dir));
>         valid = !fscrypt_has_encryption_key(d_inode(dir));
>         dput(dir);

Yes, I did notice the patch conflict.  Thanks for confirming the
correct resolution!

						- Ted

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
