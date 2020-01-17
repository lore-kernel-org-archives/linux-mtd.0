Return-Path: <SRS0=4m0E=3G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27961C33CB1
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 16:41:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB54821582
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 16:41:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jN7c7h8b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB54821582
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RKFdk//bAqimEWEyxrJ/Xl9GVyr0TdqxxM2ncENrxy8=; b=jN7c7h8bu0g9Mf
	DN8AlJ0OqnWk/FkxdglUh3Aah4sky80jXHFBWNyrXp5Q0/CYQDzDxcfrFzCoLXn2mNqA54ArgMjrg
	iQZQIIlaez2pBU+Il4dty5kPix//7nNai0XFOnBJaoxx9l5Ec0Go5bpCMTdUtQNCV6yXEO1YrqS15
	No39wrJu7suNmGZw3x2jPfFOAqxXpXfgGRl0harjpGuEaLn5Lwl5kz9CzwugqwokjCXMFsC0iRK1s
	jjgeNIyxPmvUkxSOW4m1pxG5Kv3f4URORPq4jtWpG9aLyMs0ljB+7kZxI2hjP5OMTcMR1CL9Mf+j/
	vQMFMu14waQi3P2tWt0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isUgS-0004s6-Sj; Fri, 17 Jan 2020 16:41:20 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isUgL-0004qb-Bu
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2020 16:41:19 +0000
Received: from callcc.thunk.org (guestnat-104-133-0-111.corp.google.com
 [104.133.0.111] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 00HGesH5016861
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jan 2020 11:40:56 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 44E2E4207DF; Fri, 17 Jan 2020 11:40:54 -0500 (EST)
Date: Fri, 17 Jan 2020 11:40:54 -0500
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] fscrypt: reserve flags for hardware-wrapped keys feature
Message-ID: <20200117164054.GD448999@mit.edu>
References: <20200116192008.35766-1-ebiggers@kernel.org>
 <20200117081246.GA16846@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200117081246.GA16846@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200117_084113_868301_7DB2A4B8 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: Barani Muthukumaran <bmuthuku@codeaurora.org>,
 Gaurav Kashyap <gaurkash@codeaurora.org>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jan 17, 2020 at 12:12:46AM -0800, Christoph Hellwig wrote:
> On Thu, Jan 16, 2020 at 11:20:08AM -0800, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Reserve flags for the hardware-wrapped keys feature which is being
> > worked on [1].  FSCRYPT_POLICY_FLAG_HW_WRAPPED_KEY will denote that the
> > encryption policy needs a hardware-wrapped key to be unlocked.
> > FSCRYPT_ADD_KEY_FLAG_HW_WRAPPED will denote that the key being added is
> > a hardware-wrapped key.
> > 
> > This reservation is tentative, and these codepoints may be reused if the
> > feature is not upstreamed.
> 
> NAK.  While the feature itself sounds really useful we don't just
> reserve format bits for code not upstream.

I disagree; saving a codepoint to avoid accidental collision of a
feature bit is a good and proper thing to do.

Reviewed-by: Theodore Ts'o <tytso@mit.edu>

							- Ted


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
