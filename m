Return-Path: <SRS0=s9Jc=V2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23754C433FF
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 20:15:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E51D12070B
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 20:15:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hiacckcS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E51D12070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6kYRvObbU35LtRGcTva6fLFAvtF3HIek0IMFs2FhFxM=; b=hiacckcSrCG+Wz
	FFQUzSS+ho0bSdo/Ht1W4FD4uBqXYA81U26Y63d4i7YZlaQafvOLN9V0qLwXV4OBv5SciZbdeBgJg
	wPrnT+osfQjHsxyd/hnNuGhV2mC6cVH4vor0y0uSg7ZvI2D1cBYIVaPRn2A9Ix/hHZDBjo5sg6i3v
	8OPdVwqY3Zx7XVdbDXySZB6FYXaA476CWikQ0UFl4ns+LXyhCDWTCdQOfJ6sDnlSxwJci9wcoWenR
	AI4lMu5kDkWG67wOW3AblN1hfEJXsADQU7vatVb1dkIdFqf9DDgi4FLeAZ7ZUN1fZTP4a3f0iR1sY
	YOnr6lz3bPgqLx7LT/wA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsC2q-00057Z-IS; Mon, 29 Jul 2019 20:14:56 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsC2n-00056n-CZ
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2019 20:14:55 +0000
Received: from callcc.thunk.org (96-72-102-169-static.hfc.comcastbusiness.net
 [96.72.102.169] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x6TKElfw026772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jul 2019 16:14:48 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id AC8394202F5; Mon, 29 Jul 2019 16:14:45 -0400 (EDT)
Date: Mon, 29 Jul 2019 16:14:45 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-api@vger.kernel.org,
 linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>, Satya Tangirala <satyat@google.com>
Subject: Re: [PATCH v7 06/16] fscrypt: add FS_IOC_ADD_ENCRYPTION_KEY ioctl
Message-ID: <20190729201445.GA16445@mit.edu>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-7-ebiggers@kernel.org>
 <20190728185003.GF6088@mit.edu> <20190729194644.GE169027@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729194644.GE169027@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_131453_595919_A1E3434C 
X-CRM114-Status: GOOD (  10.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jul 29, 2019 at 12:46:45PM -0700, Eric Biggers wrote:
> > For that matter, we could just add a new ioctl which returns the file
> > system's keyring id.  That way an application program won't have to
> > try to figure out what a file's underlying sb->s_id happens to be.
> > (Especially if things like overlayfs are involved.)
> 
> Keep in mind that the new ioctls (FS_IOC_ADD_ENCRYPTION_KEY,
> FS_IOC_REMOVE_ENCRYPTION_KEY, FS_IOC_GET_ENCRYPTION_KEY_STATUS) don't take the
> keyring ID as a parameter, since it's already known from the filesystem the
> ioctl is executed on.  So there actually isn't much that can be done with the
> keyring ID.  But sure, if it's needed later we can add an API to get it.

Yeah, I was thinking about for testing/debugging purposes so that we
could use keyctl to examine the per-file system keyring and see what
keys are attached to a file system.  This is only going to be usable
by root, so I guess we can just try to figure it out by going through
/proc/keys and searching by sb->s_id.  If there are ambiguities that
make this hard to do, we can add an interface to make this easier.

     	       	      	     - Ted

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
