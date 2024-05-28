Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB0BC25B7C
	for <linux-mtd@archiver.kernel.org>; Tue, 28 May 2024 19:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8PlHTtmhYwquKIaBHOZX/4gAsf2t8rYYOy8egNddhV0=; b=Brx26NfPv3/S7J
	EDyDb11klAnKzkApJZweqRClh15oRmK1zpi+0mEinPKeOnFnHfvPNi53/DmojzpRlAO+ED4p6eIGV
	ctndA7zmRWUYJE4xbs9KRl79rRmRPlPuHmW9IUmPGwMetCpk/LiCRaPhfmkeqDBZO3gLFu442OwCf
	Qg+r9Qo6FLOATnAEc2UNQ+AHb8SzgupKlBwt8ijq4oQXTG6Fc8UacC+2qC5T37zvsNsEk95fx/IFJ
	IkewJUB4kKt/5LYu5ISzA0pHxRSZE14D6pcsbOAU6Ebcjbh/EYwTlGmG/GsK2HomtVzhsANvpUsmK
	5s5376qucJS9wjZeFAVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC2CT-00000001lda-28Sk;
	Tue, 28 May 2024 19:09:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC2CQ-00000001lct-3e3W
	for linux-mtd@lists.infradead.org;
	Tue, 28 May 2024 19:09:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ABE186232C;
	Tue, 28 May 2024 19:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E94BEC3277B;
	Tue, 28 May 2024 19:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716923369;
	bh=TXpIOoXYGmt2pBtqg047ViZFwCKWKQ4ykKIKvnN77vU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AmoNzAPG5OwWLUnUTGJZOanCQpM32jwGBiGV4Kj4DqPwhtvLBjX7A3wqKxlxsCTWE
	 4YlTKJUUMXV5uh6+0WPRfwCkH273a1cf0bd5KJpsqdkMUyjI6Vgtfz1tnOzv9bb0IH
	 pMIQ8j+lj9q4gKVtxV33VbBEs7s44f0JV+UutHCBHJeOxjqLgUm1R9HpH/wGhKV05q
	 Tr3TqW24CFEenXZNnu4wZ5SQQw1yk33QrWKJC/VFE/kzwHVqEjPvoMDBH3Bh/1I71B
	 V7tsnBW37DNfRz4Y/6LLe430oK/3rEAzLFnvf7ROuluDFMibMDvOjr8B9MyGzvce2H
	 RwlYJMYFmJ7FQ==
Date: Tue, 28 May 2024 12:09:28 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List
 <linux-mm@kvack.org>, amd-gfx@lists.freedesktop.org, bpf@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pm@vger.kernel.org, netdev@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: Re: [linux-next:master] BUILD REGRESSION
 6dc544b66971c7f9909ff038b62149105272d26a
Message-ID: <20240528120928.633cca9d@kernel.org>
In-Reply-To: <202405290242.YsJ4ENkU-lkp@intel.com>
References: <202405290242.YsJ4ENkU-lkp@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_120930_977783_ACF4F97A 
X-CRM114-Status: UNSURE (   6.01  )
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

On Wed, 29 May 2024 02:19:47 +0800 kernel test robot wrote:
> |   `-- net-ipv6-route.c-rt6_fill_node()-error:we-previously-assumed-dst-could-be-null-(see-line-)

Is there a way for us to mark this as false positive?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
