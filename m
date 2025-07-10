Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D917C83F20
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jul 2025 21:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k9UAEaQGz1bKXG0zSURP9rsHrSM4LNYX7dsEdARYiz8=; b=lCxN09RKcZSUmg
	KCeFwwh79bexgauUqrbqmP4YTWlTIijeKhr20YM8fzckSFgLaFAaF69UT7LxSfBEEuTkTis6r2fZr
	/3F/D/ic4sOpIzZ4RpKY8CTi1mq7iwhxXjXLxW+aeKIC3kHyklkuIQDiKpufguJ603xBaMmQtQMxm
	fRO5GcYdgSQNMegAXEYnxjZrLqZdeqjvXGuan8Pt/oSYofLcfJn+hPoAXbAVGtlVWhR4HXf/AcFB8
	IwiGRbtee7BVQ2z5rAnfpcEBiEDKw3EsnkdtxMeH2f5u2hvKM2uFRDHhGXFq0bkbkJqd3iBAPLCkH
	MmKMSh2XFPXatifoR3rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyUa-0000000D1ru-2z15;
	Thu, 10 Jul 2025 21:07:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZx0o-0000000Cp2a-41S3
	for linux-mtd@lists.infradead.org;
	Thu, 10 Jul 2025 19:32:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7EFD05C5C8F;
	Thu, 10 Jul 2025 19:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C0BC4CEE3;
	Thu, 10 Jul 2025 19:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752175974;
	bh=5iv/ybBT1EWpCtzUTeH7jOisZdpjTSxsHX5LZWaBTBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d4KrJlDa0wqJNg3kV/Aycs4TlPYrAsCJRXY7pEr0yFXtTSr5FEeZGUF/jPySl86L0
	 G2Wj3h88lJib/AeFNTfE55CceP6Z8QDP3lBTDwYqHHQju5mqPUOCa4/3mGS9h9fWN2
	 8BE0kCRE4pggOceAMSsqBVWRr1gs6zAWJaNhtudIagRE9mkIDpF/mwipXJeEkW+oCM
	 p3QbqdTQJ6FoWgjFXP97kQGwHc4BgJnkex2oGRmglmd2Gq6jytbt8BcKjvG56TNzdm
	 tbQ0dW+FgZY3oL6JitibiLFuzcpQ3/iHOi8JgP4kOgyIMABWv4q4DV/rHXa0LiV7Mx
	 Uwez3iX6QZFgw==
Date: Thu, 10 Jul 2025 12:32:52 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Alex Markuze <amarkuze@redhat.com>
Cc: linux-fscrypt@vger.kernel.org, linux-crypto@vger.kernel.org,
	Yuwen Chen <ywen.chen@foxmail.com>, linux-mtd@lists.infradead.org,
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] ceph: Remove gfp_t argument from
 ceph_fscrypt_encrypt_*()
Message-ID: <20250710193252.GA20579@quark>
References: <20250710060754.637098-1-ebiggers@kernel.org>
 <20250710060754.637098-7-ebiggers@kernel.org>
 <CAO8a2Sivm00NRM9Z-Fwp=FzcmkAP8m1uQR24-avT-tUug4VgmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAO8a2Sivm00NRM9Z-Fwp=FzcmkAP8m1uQR24-avT-tUug4VgmQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_123255_033222_8EAB8801 
X-CRM114-Status: UNSURE (   6.83  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jul 10, 2025 at 02:07:47PM +0300, Alex Markuze wrote:
> Reviewed-by: Alex Markuze amarkuze@redhat.com

Thanks!  In the future, when sending a tag, please include brackets around your
email address, like Reviewed-by: Alex Markuze <amarkuze@redhat.com>.  Otherwise,
when applying the patch, b4 skips the tag:

    NOTE: some trailers ignored due to from/email mismatches:
        ! Trailer: Reviewed-by: Alex Markuze amarkuze@redhat.com
         Msg From: Alex Markuze <amarkuze@redhat.com>
    NOTE: Rerun with -S to apply them anyway

I'll add the brackets, so no need to resend anything.  But other maintainers
could miss this, which would result in your review tags not being applied.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
