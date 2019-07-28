Return-Path: <SRS0=FYfc=VZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA9E6C7618F
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Jul 2019 21:24:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80D9A2070D
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Jul 2019 21:24:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FdFfLQre"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80D9A2070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GQH8N/O0lGbY+vHUj3DwQMR4HUXvUwQ72irY3Dq3/us=; b=FdFfLQreie7nAt
	17LVRulz8s97o06ZYLkYFjm1GXE0rUm4HIZpXBAfZZKLBXxljAYBGYBcX3WDvxRfof/3U3ihx7bZX
	6cq4ERkW5lYLUKIjl6sPTk08v6SmwMbRgUmiBd3CTNpQdgL3yRQ88/ivWUrz8f/eFlxMgiDAtmWc+
	e0+I6LP87/a7ZjEETADaZAIOCtmtTjnZPq71J2rH11sN3J9bBYT4s6m1HZwKTvG1d2+oELQAaIGF5
	fIRAkN3HmhT5B29uMZrx0z5+iuQ9hL1R+ENuNj5kGX4wh2l8XYqUOGimcM0bnOFZbm80Z0WqD8XeO
	dSTjH9W/Z98rm4gupo8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrqeJ-0007Gx-DK; Sun, 28 Jul 2019 21:24:11 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrqeG-0007Gg-Ia
 for linux-mtd@lists.infradead.org; Sun, 28 Jul 2019 21:24:09 +0000
Received: from callcc.thunk.org (96-72-102-169-static.hfc.comcastbusiness.net
 [96.72.102.169] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x6SLO3BG013518
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jul 2019 17:24:04 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 87A1D4202F5; Sun, 28 Jul 2019 17:24:02 -0400 (EDT)
Date: Sun, 28 Jul 2019 17:24:02 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v7 12/16] fscrypt: require that key be added when setting
 a v2 encryption policy
Message-ID: <20190728212402.GM6088@mit.edu>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-13-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726224141.14044-13-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190728_142408_776782_0D681D0A 
X-CRM114-Status: UNSURE (   8.40  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jul 26, 2019 at 03:41:37PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> By looking up the master keys in a filesystem-level keyring rather than
> in the calling processes' key hierarchy, it becomes possible for a user
> to set an encryption policy which refers to some key they don't actually
> know, then encrypt their files using that key.  Cryptographically this
> isn't much of a problem, but the semantics of this would be a bit weird.
> Thus, enforce that a v2 encryption policy can only be set if the user
> has previously added the key, or has capable(CAP_FOWNER).
> 
> We tolerate that this problem will continue to exist for v1 encryption
> policies, however; there is no way around that.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good, feel free to add:

Reviewed-by: Theodore Ts'o <tytso@mit.edu>

					- Ted

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
