Return-Path: <SRS0=l5Rv=EX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2ED9C5519F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 17:35:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6371924654
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 17:35:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M4ln06fB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6371924654
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BPtllk/Zq17RwuZGa4jA9PC7iUZmICyee0bqmUbz5Ac=; b=M4ln06fBN0vq5xJ99nHo1WxrP
	frLuMQMIdEx8rDVNfA59mJZiKPh82RkwZGwlAz3Lf2NWyMa/5qBKQYTVUf6sRvAIEPkw5rmWpE2in
	Pm/gJdxhb5rGteXvwNRl2wVLAzzaT3zuBis6bv+S/9EvADZ2xIi1BSW4eiCgmXVUuNnb3CT9SxSzD
	RSVl1pRFBeDsvLYVGDdRySi2X9dADyIcmuZGHhfi55RrD9vmwzgZTU4NAwfAqOV/dwcdF5YICsgLc
	MaoTF0MP6jJv7TOw9GOkgaJj11XSnvlJjx9NGZIhy/P/GLeff6bCUSGDAUQT2E+vrhVMKyBt/T//y
	HITc+Rc6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf4sd-0003tS-Cu; Tue, 17 Nov 2020 17:34:59 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf4sa-0003ss-QN
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2020 17:34:57 +0000
Received: from callcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net
 [72.74.133.215]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 0AHHYlsB000862
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 12:34:47 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 30CB5420107; Tue, 17 Nov 2020 12:34:47 -0500 (EST)
Date: Tue, 17 Nov 2020 12:34:47 -0500
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Subject: Re: [PATCH v2 2/3] fscrypt: Have filesystems handle their d_ops
Message-ID: <20201117173447.GF445084@mit.edu>
References: <20201117040315.28548-1-drosen@google.com>
 <20201117040315.28548-3-drosen@google.com>
 <20201117140326.GA445084@mit.edu>
 <20201117170411.GC1636127@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117170411.GC1636127@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_123456_957746_ED1114A4 
X-CRM114-Status: GOOD (  10.53  )
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
Cc: kernel-team@android.com, Daniel Rosenberg <drosen@google.com>,
 Richard Weinberger <richard@nod.at>, Chao Yu <chao@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 17, 2020 at 09:04:11AM -0800, Jaegeuk Kim wrote:
> 
> I'd like to pick this patch series in f2fs/dev for -next, so please let me know
> if you have any concern.

No concern for me as far as ext4 is concerned, thanks!

   	       	     	    	 - Ted

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
