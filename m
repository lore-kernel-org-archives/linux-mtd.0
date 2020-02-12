Return-Path: <SRS0=zQg3=4A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE29DC2BA83
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 06:12:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0AE5206ED
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 06:12:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jVZ3Yc2+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="raqwjbi5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0AE5206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XR27VoPAhEcWi95T2rOWNG0K2DXiZLFrYiV5hWqQ78Q=; b=jVZ3Yc2+FPQzuu
	xr2mj91r7JE5LGHXZjPh3K/2O2m2M1r3HTU1/fpytoq1Qv7jbQ7yO+AdNdNG3aALUq1GjOmydPLik
	boo0IeuCxptbGBoCQD+BjxP0RTVvahdfHBGWCi2mtpyQQVUF5/+emob+f0dyY6JFT3FpXaEAWO6Bs
	sZLi/RV6Q3Hnxunjx+C6VTbTFIHxeQoVKizHcRqsWZfpYvfTlvqEW2zIR6gdQV/cDkkVNaNfyGm03
	I9uHMsDONPEo7XYZhgBcjoXfYPfPeURML7IgGpM55rtCjqeYjCvVXZ8G/4hnDyLUIGYtfNTYMyt63
	3px7oLCz0A+mL86CwYqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1lG2-0001YW-Tt; Wed, 12 Feb 2020 06:12:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1lFz-0001Xl-QU
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2020 06:12:20 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B3BA206ED;
 Wed, 12 Feb 2020 06:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581487939;
 bh=p9QKtIbrdilhU/XB3DWdE+4oKrcq3A9n3NGMmoeBPPs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=raqwjbi5gzH8b9eutCh93MIHFdCbV4Wd2lKnKmfYD/QYHULXrN9X+9e4beJMl+GEX
 N2j6JhwVSj+WuZ1bBya666D8Nfjg9adnCIYhTBJxds5KN4J+3gapEwGTSRfdSshtLM
 kPRpOc7TJOmyAU2t6AMvrD+6TK3HcTCdB73dYpW4=
Date: Tue, 11 Feb 2020 22:12:17 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH v7 0/8] Support fof Casefolding and Encryption
Message-ID: <20200212061217.GK870@sol.localdomain>
References: <20200208013552.241832-1-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200208013552.241832-1-drosen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_221219_879226_0D2FCC44 
X-CRM114-Status: UNSURE (   6.99  )
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
Cc: kernel-team@android.com, Theodore Ts'o <tytso@mit.edu>,
 Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Chao Yu <chao@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Feb 07, 2020 at 05:35:44PM -0800, Daniel Rosenberg wrote:
> Support fof Casefolding and Encryption

You should fix the typo in the subject in the next version.  I assumed you'd
notice, but both v6 and v7 have this...

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
