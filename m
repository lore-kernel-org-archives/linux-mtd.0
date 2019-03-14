Return-Path: <SRS0=YFz0=RR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08FD8C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2019 23:07:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2384218A1
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2019 23:07:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vh38FrTd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2384218A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0DtBJ+RxQmeO8PphfgNC7Tq8ffunWP7Qb0JsZ8kOuuc=; b=Vh38FrTd5QbiM0
	1MOXEpo6Q9VHlahKIaDJd+TM2m2+BlKmL7+vrMgsAA1MTPVy66kBBx9q6mZhlHsI8UdFgBBBjS1ag
	NQMC5aodjPoJziq4VxOSjh1W32yGBegU25A9MlChDNehDHjZnHukatVeZQ1SRobz01+y2Gf8HM5Ny
	AkurQ8NEpACE9aaRLTOSfRuwpEsNNCDsW6a9x5mk7gNZCrP6RmwSV35waA9ja/l+U6f8/jcIfYAtb
	NFbDjKkXQIGjadtTXdoNgcbRjGwDb2aDGeg9PmaP1AjtRTdKJDK3hgGSXV/sjG644My/Na0jWMAyp
	5ybSUs9Cfm/WmsJux8tw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4ZRS-0008HA-TQ; Thu, 14 Mar 2019 23:07:14 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4ZRP-0008Gm-PU
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2019 23:07:13 +0000
Received: from callcc.thunk.org (guestnat-104-133-0-99.corp.google.com
 [104.133.0.99] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x2EN72P5022266
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Mar 2019 19:07:03 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 27E6A420AA8; Thu, 14 Mar 2019 19:07:02 -0400 (EDT)
Date: Thu, 14 Mar 2019 19:07:02 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 4/4] ubifs: Implement new mount option,
 fscrypt_key_required
Message-ID: <20190314230702.GE6482@mit.edu>
Mail-Followup-To: Theodore Ts'o <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>,
 Eric Biggers <ebiggers@kernel.org>, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, jaegeuk@kernel.org,
 linux-unionfs@vger.kernel.org, miklos@szeredi.hu,
 amir73il@gmail.com, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, paullawrence@google.com
References: <CAJfpegvX4ANfso-Jn1zaB+m4Q_0eK9i-+MCJ+sTH5QzD3PZFMQ@mail.gmail.com>
 <20190314171559.27584-5-richard@nod.at>
 <20190314174913.GA30026@gmail.com> <1957441.Hty6t2mpXG@blindfold>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1957441.Hty6t2mpXG@blindfold>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190314_160711_990238_42FA1A0F 
X-CRM114-Status: UNSURE (   6.20  )
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
Cc: paullawrence@google.com, miklos@szeredi.hu, amir73il@gmail.com,
 linux-unionfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Richard --- stepping back for a moment, in your use case, are you
assuming that the encryption key is always going to be present while
the system is running?

Ubifs can't use dm-crypt, since it doesn't have a block device, but if
you could, is much more like dm-crypt, in that you have the key
*before* the file system is mounted, and you don't really expect the
key to ever be expunged from the system while it is mounted?

If that's true, maybe the real mismatch is in using fscrypt in the
first place --- and in fact, something where you encrypt everything,
including the file system metadata (ala dm-crypt), would actually give
you much better security properties.

       	       		     	 	- Ted

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
