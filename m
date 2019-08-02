Return-Path: <SRS0=z7rv=V6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5CCEC433FF
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Aug 2019 17:32:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D1122173E
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Aug 2019 17:32:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e8RfdFeT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZcqdJ1sH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D1122173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IAkrtjA+VtuWifc1pimWzSxZ4RmIOtRV5qdSgFJ8Sww=; b=e8RfdFeTP07Hj7
	nQ1WACjqOZyTPSAq3QVxtqzokGxtQAo8/RDVIbDog6mqjcbNx4DrSfKkXj06R73O/pc5XGp/+mnk1
	LYIhzHEE6/tcz6lHDzU5CrHNtTRWGoQfpS2FTuA3Ze6QLifhur294GwH+I3jmxTn/ga28hiL8OWwq
	Olo+LIEloy1fnzaNKra2XzKIWm/jtUyjqckj7DzdYEK5HX4irXKbui6XfI+Po5URo3W9jxTFiKvje
	tWLsm7H87pTPtELvqjBnHrt6UhNUsLcIAWxt5xNWCWM66fB1Dahzpsj6VaTtXA1U0s0fha0kID+Xr
	6/rBdSTw09ma6qMr44ig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htbPG-00063R-TF; Fri, 02 Aug 2019 17:31:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htbPD-000637-UC
 for linux-mtd@lists.infradead.org; Fri, 02 Aug 2019 17:31:53 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 31C1B2173E;
 Fri,  2 Aug 2019 17:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564767111;
 bh=p28pesjeaFELdMWXTRb2eE2TRQRtp76oeifvbyCl/RI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZcqdJ1sHgA4eHoVKYSn8SpVn+pAUEpj9uFNNG8Yop5svyGIeSKgDaCG0hU7/1xGe+
 YH6wiSFmAifvQSIcT5ECPJSv2MxBpI4U1tOb0SI7k4tFkU4lU056T/wtL7OaDANFff
 AXFhYpVcepiXq7WKPEIqg6WGV1t6hc/k/rdkPvQU=
Date: Fri, 2 Aug 2019 10:31:49 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Subject: Re: [PATCH v7 14/16] f2fs: wire up new fscrypt ioctls
Message-ID: <20190802173148.GA51937@gmail.com>
Mail-Followup-To: Chao Yu <yuchao0@huawei.com>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-api@vger.kernel.org,
 linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>,
 Satya Tangirala <satyat@google.com>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-15-ebiggers@kernel.org>
 <e3cf53a7-faf2-0321-22de-07d2e2783752@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3cf53a7-faf2-0321-22de-07d2e2783752@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190802_103151_995659_EA617C60 
X-CRM114-Status: GOOD (  12.18  )
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

On Fri, Aug 02, 2019 at 04:10:15PM +0800, Chao Yu wrote:
> Hi Eric,
> 
> On 2019/7/27 6:41, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Wire up the new ioctls for adding and removing fscrypt keys to/from the
> > filesystem, and the new ioctl for retrieving v2 encryption policies.
> > 
> > FS_IOC_REMOVE_ENCRYPTION_KEY also required making f2fs_drop_inode() call
> > fscrypt_drop_inode().
> > 
> > For more details see Documentation/filesystems/fscrypt.rst and the
> > fscrypt patches that added the implementation of these ioctls.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> 
> BTW, do you think it needs to make xxfs_has_support_encrypt() function be a
> common interface defined in struct fscrypt_operations, as I see all
> fscrypt_ioctl_*() needs to check with it, tho such cleanup is minor...
> 

Maybe.  It would work nicely for ext4 and f2fs, but ubifs does things
differently since it automatically enables the encryption feature if needed.
So we'd have to make the callback optional.

In any case, I think this should be separate from this patchset.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
