Return-Path: <SRS0=LKht=3Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B09CC35249
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 04:22:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2B5A21741
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 04:22:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kygdiVra"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2B5A21741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GXpARyMEPrUPP/L1ZyerkL8BNa+Noun8A/bQ30ujeV4=; b=kygdiVramhaSzZ
	+oPbR9a4t51LfxLK4cS/H9+a5HVGY5W1c6cwflShEpABD57+XGI3MSX0nOYHW0Iai7HohUJECEZBI
	60Ypg4klGL1IH6KDRzVUJMkYTh/AK2buLT362/Lu281ppDyY6+n+QCdfJIaPxMGVUUPU4Wyfd/n4x
	cURevppKtdXXTBWUIDdc8lCZPDooBYzwOHe3R4/QIQ+gOuWcGr3JrHh3eTYmdjjzunWJ9qJjdJhKj
	lDQHTB86amob+EuWhxygyvv/hSRkoOgWaVsBuPuUqMQ1d5Pt/lJNLhIpWNHYF3/MhcJFLpye2fJTI
	pM4+ALKdVjBb3o3PO5pQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izCCB-00060S-ML; Wed, 05 Feb 2020 04:21:47 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izCC8-0005zA-F1
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2020 04:21:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 694AB29298E
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH v6 1/5] unicode: Add standard casefolded d_ops
Organization: Collabora
References: <20200128230328.183524-1-drosen@google.com>
 <20200128230328.183524-2-drosen@google.com>
 <85sgjsxx2g.fsf@collabora.com>
 <CA+PiJmS3kbK8220QaccP5jJ7dSf4xv3UrStQvLskAtCN+=vG_A@mail.gmail.com>
Date: Tue, 04 Feb 2020 23:21:33 -0500
In-Reply-To: <CA+PiJmS3kbK8220QaccP5jJ7dSf4xv3UrStQvLskAtCN+=vG_A@mail.gmail.com>
 (Daniel Rosenberg's message of "Tue, 4 Feb 2020 19:05:02 -0800")
Message-ID: <85h8051x6a.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200204_202144_635077_AA4149DD 
X-CRM114-Status: GOOD (  12.08  )
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
Cc: Theodore Ts'o <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chao Yu <chao@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Daniel Rosenberg <drosen@google.com> writes:

> On Sun, Feb 2, 2020 at 5:46 PM Gabriel Krisman Bertazi
> <krisman@collabora.com> wrote:
>>
>>
>> I don't think fs/unicode is the right place for these very specific
>> filesystem functions, just because they happen to use unicode.  It is an
>> encoding library, it doesn't care about dentries, nor should know how to
>> handle them.  It exposes a simple api to manipulate and convert utf8 strings.
>>
>> I saw change was after the desire to not have these functions polluting
>> the VFS hot path, but that has nothing to do with placing them here.
>>
>> Would libfs be better?  or a casefolding library in fs/casefold.c?
>>
>>
>> --
>> Gabriel Krisman Bertazi
>
> The hash function needs access to utf8ncursor, but apart from that,
> libfs would make sense. utf8ncursor is the only reason I have them
> here. How do you feel about exposing utf8cursor or something similar?

Hi,

It was designed to be an internal thing, but I'm ok with exposing it.

-- 
Gabriel Krisman Bertazi

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
