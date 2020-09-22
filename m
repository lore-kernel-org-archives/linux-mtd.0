Return-Path: <SRS0=loyI=C7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8758C4363D
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Sep 2020 13:52:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6147B20936
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Sep 2020 13:52:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rq371q9K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lFnv75YW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6147B20936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x24jdTt4qivJeUoDOS8c4e2Xa7uMlacX/D3FBa47N/k=; b=Rq371q9KftgZ4G7TvAycPCWfQ
	YlpaJ6bRAq7372CdxqjTwIxPpsKyTGbmLqmBaEKprlP2N+x1vABPw8m5EXOWPmbKQmA0klZRteHYW
	toRvbvXPHQHsMRxDO2L3bCMErdMc6vZnUj62GknZgxTjANQHESf9FU6d/R/ONyT+Cw48howME3aqf
	FtLJNDbIlZv/lfUmaqP3YW77pNLjKd0I9Gf+P4/pD4cLIhtbvqHvTmlsKn6Kt12ppOGlL0wrT02fO
	Ct6fao5v8gWaH0/UkgQplY+IO9hhY9xkq3Fk+B3pSFYR1oDh40XyG1aEnX+ocek3Y5TpIa5PqRmFy
	Ky3MzyxzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKihF-0000kX-Qa; Tue, 22 Sep 2020 13:51:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKih9-0000k1-HL
 for linux-mtd@lists.infradead.org; Tue, 22 Sep 2020 13:51:00 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9067720936;
 Tue, 22 Sep 2020 13:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600782658;
 bh=ah1oRV9AwF+HOR2QyLQpuVaKZLQO4RCWcJodnzc0oZg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lFnv75YWIDQtPV1/37RjVPZCmc+w2raAzyDf/lBUX1xGdOF8/y+Of5HNgNyEuZYLq
 xs9upAb8I7B4MYDl7BdVbpmP9X/DKc9mF/70oyWM03GRglhaS8264ijKmOZchSpuYs
 fmOc1tLmvl8aKCckC1nqPNCydNFXGW3Um2IiQCWY=
Date: Tue, 22 Sep 2020 06:50:57 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH v3 00/13] fscrypt: improve file creation flow
Message-ID: <20200922135057.GA5599@sol.localdomain>
References: <20200917041136.178600-1-ebiggers@kernel.org>
 <20200921223509.GB844@sol.localdomain>
 <da7f608e01cd8725d8da668f1c4a847b29b9de68.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <da7f608e01cd8725d8da668f1c4a847b29b9de68.camel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_095059_665054_9DF2932A 
X-CRM114-Status: GOOD (  12.59  )
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
Cc: Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Sep 22, 2020 at 07:29:45AM -0400, Jeff Layton wrote:
> > 
> > All applied to fscrypt.git#master for 5.10.
> > 
> > I'd still really appreciate more reviews and acks, though.
> > 
> 
> You can add this to all of the fscrypt: patches. I've tested this under
> the ceph patchset and it seems to do the right thing:
> 
> Acked-by: Jeff Layton <jlayton@kernel.org>
> 

Thanks, added.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
