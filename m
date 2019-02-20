Return-Path: <SRS0=2MvH=Q3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C878C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 18:36:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67FE821841
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Feb 2019 18:36:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nuL/+olH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="qYJU8vZf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67FE821841
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xMSPCI75XweLIXvZCFup70dMI4gw1gIUKXsbhoXcxRs=; b=nuL/+olHpUMnL1
	QuEtRmi5mjFaZQ1CzEW4ieqcxYpJg0QQbirTE8Gb6uPgS3n5ZtqvKmn8DEQKIqPE6Qtl7x6xJMgPH
	jo9gdP+iTpBGSeK79wjQzfIte9Ll+B/QhBmV7MUi7c3VDI/hWCEWNfBOjMBM6XLO69gw1WRcF4CFQ
	cNT4IJGYCRfr6XIuULcAD2gsTT4zFBu31FWdnq6iIgnLccv02gmrnNfnuhx6IzzZYAQModtlDcgvx
	hOXzLPI1vwblOhKSm1lDIuA9MteIu8/bgc3C2nYv7EK7Ub8jNLHszkQgsrVGSCG3QYPfLcYDzCpyX
	eBSagai0Kv6hb3F4WmGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwWjJ-0003gb-R6; Wed, 20 Feb 2019 18:36:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwWjG-0003gH-Rv
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2019 18:36:24 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0BD5F2146E;
 Wed, 20 Feb 2019 18:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550687782;
 bh=yyDVto/5qGBteLMWT92Jqi7x2n0brJDILjRi/mEhxKU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qYJU8vZf6BazayR2FnpgVdjIvZbnxDnnYgPiuCH+AQCJ+UYyHGeC81qpgcOegIACh
 w3DRQBAGcB8AeqFtEbZBszvA4P3ddEU8wpLz0wHx6BrIIGSAWC5Yt1pbKMg1xZB3ho
 yN5xqDY7gf0c7nVCUNxAK6QoxIw1D+X1UGfhEW1Q=
Date: Wed, 20 Feb 2019 10:36:20 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [RFC PATCH v3 00/18] fscrypt: key management improvements
Message-ID: <20190220183619.GA177939@gmail.com>
References: <20190220065249.32099-1-ebiggers@kernel.org>
 <14023.1550686042@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14023.1550686042@warthog.procyon.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190220_103622_923527_FD2F3264 
X-CRM114-Status: GOOD (  14.16  )
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
Cc: linux-ext4@vger.kernel.org, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Satya Tangirala <satyat@google.com>, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi David,

On Wed, Feb 20, 2019 at 06:07:22PM +0000, David Howells wrote:
> I have a couple of patches that add ACLs to keyrings, that you can find at the
> top of the branch here:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-acl
> 
> I have other patches that allow tags to be used as subjects in the ACL, with a
> container supplying a tag, e.g.:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?h=container&id=e0fdc5613a32b9475b025f58e7a2267329b3f3a4
> 
> Might something similar be of use to you here, perhaps specifying a tag
> referring to the blockdev of interest rather than the container?
> 
> David

I don't think so.  The main point of adding keys directly to the filesystem is
that it's generally inappropriate to apply OS-level access control or
process-based visibility restrictions to fscrypt keys given that:

- The unlocked/locked status of files is already filesystem-level.
- The purpose of encryption is orthogonal to OS-level access control.

The ioctl based interface also makes it *much* easier to implement all the
semantics needed for removing fscrypt keys.

I don't see how key ACLs would be appropriate here, except that key ACLs would
allow userspace to opt-in to fixing the denial of service vulnerability where
keyctl_invalidate() only requires Search permission.  But for fscrypt that's
addressed by my proposal too, and is just one of many problems it addresses.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
