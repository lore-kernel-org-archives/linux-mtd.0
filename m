Return-Path: <SRS0=UdE+=DA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3D2C4727E
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 20:31:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A11422395A
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2020 20:31:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B3vDd2rF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A11422395A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eHsJNOSXvrdKn1/98FHgugPzPRycDzuH6DvMX77yIMQ=; b=B3vDd2rFB9mz0yyDLIG0zEUQF
	Ec3OA5RVUjBI7MKkN0c/sFSFcl6/aOwgHmU8ednPFVtHzp0efItbLKDS8vJQXpa3Wbzo2soXE+JyT
	/O2W9kxPBjumRp6vv8cFpzoT9Fpla76P8ZA4Q0bete5aJlbkc4b/sTFQSZqbLUkhY4FH+bw37xgUk
	pTmad2NqOyl1Pd//OMmplMELB9zHDojmBsvHMfrhh+xemBp0qe7fx+t1XJCpRu2sFXeKSjAQZD0lY
	nv9O8VsAuP+7MN2ZJ/nXdTLrSGPVGXvAoT4E/R+6lPhoYO0NUXtxvPPl7MVCrS3T15LnxIFfKWohE
	uCGVBycTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLBPg-0005Sl-DC; Wed, 23 Sep 2020 20:30:52 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLBPe-0005Rx-CM
 for linux-mtd@lists.infradead.org; Wed, 23 Sep 2020 20:30:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 3695329C66D
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH 1/5] ext4: Use generic casefolding support
Organization: Collabora
References: <20200923010151.69506-1-drosen@google.com>
 <20200923010151.69506-2-drosen@google.com>
 <20200923054714.GB9538@sol.localdomain>
Date: Wed, 23 Sep 2020 16:30:45 -0400
In-Reply-To: <20200923054714.GB9538@sol.localdomain> (Eric Biggers's message
 of "Tue, 22 Sep 2020 22:47:14 -0700")
Message-ID: <87o8lw5j7u.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_163050_506541_22F59E81 
X-CRM114-Status: GOOD (  12.89  )
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, Daniel Rosenberg <drosen@google.com>,
 Richard Weinberger <richard@nod.at>, Chao Yu <chao@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Eric Biggers <ebiggers@kernel.org> writes:

> On Wed, Sep 23, 2020 at 01:01:47AM +0000, Daniel Rosenberg wrote:
>> This switches ext4 over to the generic support provided in
>> the previous patch.
>> 
>> Since casefolded dentries behave the same in ext4 and f2fs, we decrease
>> the maintenance burden by unifying them, and any optimizations will
>> immediately apply to both.
>> 
>> Signed-off-by: Daniel Rosenberg <drosen@google.com>
>> Reviewed-by: Eric Biggers <ebiggers@google.com>
>
> You could also add Gabriel's Reviewed-by from last time:
> https://lkml.kernel.org/linux-fsdevel/87lfh4djdq.fsf@collabora.com/

Yep, I was gonna say that. Assuming nothing changed from the last
submission in the other series.

Thanks,

-- 
Gabriel Krisman Bertazi

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
