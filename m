Return-Path: <SRS0=YFz0=RR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED34C4360F
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2019 23:15:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A6382184C
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2019 23:15:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bqEhkx/C";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="Xom1t6C6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A6382184C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=USewm7Q/99tXsQqys535QOZUpjdn1qozNJkR5x8RxAQ=; b=bqEhkx/CfFLMYp
	kNnue70xVP/eVDOb9/3Mw6rarg+GPQvvt3V1xuv0OARm5Oyj/HvMn/5NQmKaMJSa7jR6A/3YRf3OO
	VFCblzJCgyOKoEAUHRVX8uiSOGbBrMwbG2G2AcpN/+qLAN0+KjAhbL4Fu+U0Ba9KJrF2wDvfbGf/A
	Yx4ESH0xNA7r5d9OPiIYEnQoNrxjH5KIIuXu8y4SVi5jYaHQlyJcRohQsd0kEc1jiCIYBFEnn9tLV
	KcFGg0bWps4gULpkbZ8Ax9WRlAzFb1e4Gdc6k9FE6MjNTjPgJhkMu/GKyKZXbU5wRfBmOPpPm91dH
	JTMzTb6GilDZgukZ/0rQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4ZZF-0003Ye-Um; Thu, 14 Mar 2019 23:15:17 +0000
Received: from bedivere.hansenpartnership.com ([66.63.167.143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4ZZD-0003Y4-5n
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2019 23:15:16 +0000
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id A6CF08EE1EC;
 Thu, 14 Mar 2019 16:15:13 -0700 (PDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id uUFEi_7wNkui; Thu, 14 Mar 2019 16:15:13 -0700 (PDT)
Received: from [153.66.254.194] (unknown [50.35.68.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 07CB58EE02B;
 Thu, 14 Mar 2019 16:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1552605313;
 bh=+sNp9lHnPYGPJkjxRa5mzdQLDF//P9+5EqLB644Xm7o=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Xom1t6C66vnDHLIL3YMov7IPb1C/Fxwazo/uOtSLjEEaXmS0yD+uItG+am84AWZgb
 r1HTw896/ClCOmPeKPAsvoP30uPuccRkyxmxD8Pnd92F/B3WXdK0DG5XZ4kETvkpUJ
 LJI27Ct6ZWPu8/3AmANDzsM6oHk3Yofg0/HuuRdM=
Message-ID: <1552605311.2571.6.camel@HansenPartnership.com>
Subject: Re: [PATCH 4/4] ubifs: Implement new mount option,
 fscrypt_key_required
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Date: Thu, 14 Mar 2019 16:15:11 -0700
In-Reply-To: <20190314171559.27584-5-richard@nod.at>
References: <CAJfpegvX4ANfso-Jn1zaB+m4Q_0eK9i-+MCJ+sTH5QzD3PZFMQ@mail.gmail.com>
 <20190314171559.27584-1-richard@nod.at>
 <20190314171559.27584-5-richard@nod.at>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190314_161515_222480_54CBFB8B 
X-CRM114-Status: UNSURE (   7.36  )
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
Cc: tytso@mit.edu, miklos@szeredi.hu, amir73il@gmail.com,
 linux-unionfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 paullawrence@google.com, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2019-03-14 at 18:15 +0100, Richard Weinberger wrote:
> Usually fscrypt allows limited access to encrypted files even
> if no key is available.
> Encrypted filenames are shown and based on this names users
> can unlink and move files.

Shouldn't they be able to read/write and create as well (all with the
ciphertext name and contents, of course) ... otherwise how does backup
of encrypted files by admin without the key ever work?

James


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
