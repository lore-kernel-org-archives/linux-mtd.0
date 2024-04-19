Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BD3C4345F
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2024 12:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3JC2K2QOcR4SNOnzqeyD/CKnd19IxHvfgZFE4O7qHqM=; b=NykKOrZgjAbVdx
	q6NHNpYgfZaMobYa3JNsqXKAcMRMNzi5416HjJBoEfB0FCF9SaraWK9JwvhFOPhfZXhs/Td1RjVOl
	2bMkp+J1D8uS65QuUD56sNzxEO+gw52/kizt0M8K3L7014C5hjBWwlmfPvWaRVBMr4MBUbPyusCJ4
	isd2aI4ZihY/2nGRtUfDx86yKJENNVwV/fZ/emoo5K4Rx2u31Fom06yu6P40Re9+yFFx+gZdT4+BS
	Y8rR1k98L6tcQZObdAHAeuLvVhw2x5jk9JmL2ymf+Agl+AIK6CXxWymQEvvMMbTZNT+DGJf6kYcnH
	i5PXxCnhbYTxPjmdG/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxnog-00000005fal-4AcE;
	Fri, 19 Apr 2024 12:58:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxnod-00000005fZX-1Zvf
	for linux-mtd@lists.infradead.org;
	Fri, 19 Apr 2024 12:58:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 50F09619CB;
	Fri, 19 Apr 2024 12:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E21AC072AA;
	Fri, 19 Apr 2024 12:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713531486;
	bh=VtCpSSv1q1vUlkowZI681Tx4yNADj3YhfNQOnFknjCw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=O2fJ/51u1nqPIUMD2q5SvfzC63/J3KArVYhlBGdhRoElJMYaGqJBxkZkkFIOsbefv
	 k6pX4z2aHyO68i/RL6PIkc1jMA68kcocxeGbW4Euvd1Q1hBCz46nwCqPDPiTRKyP5z
	 iJTFno3jpqeeAA3krig/sGLPU2YLNB6CCB0+IA1QP3vfj801OsyVgHOQWjSTlP7JCA
	 sfYC73BPzrYIXTVXZalnHxFHEHQ5070wEI5Gd2Iq46+KUcm/Iy5H2d9YM3x1dkKQz9
	 epp6CnPWlPx1KzpTAMZufKu4MHRjUqn7thHI7XMC58ifyiBz/tGFJy/hUBEpEj3+w4
	 ATXIy4K79pf2w==
From: Pratyush Yadav <pratyush@kernel.org>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: "pratyush@kernel.org" <pratyush@kernel.org>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: spi-nor: excessive locking in spi_nor_erase()
In-Reply-To: <9bfdc3a36d4112dd6464f26ebe86e82e88cb6ccc.camel@infinera.com>
	(Joakim Tjernlund's message of "Wed, 17 Apr 2024 12:54:36 +0000")
References: <069251d381826e9bc8a59c49c39c393c2860a028.camel@infinera.com>
	<mafs01q758g7z.fsf@kernel.org>
	<8366e6def86b792f3e8b0077dd9aaa5cbecf27ff.camel@infinera.com>
	<mafs0wmow6tyu.fsf@kernel.org>
	<9bfdc3a36d4112dd6464f26ebe86e82e88cb6ccc.camel@infinera.com>
Date: Fri, 19 Apr 2024 14:58:03 +0200
Message-ID: <mafs0y1995x2c.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_055807_486733_664962DA 
X-CRM114-Status: GOOD (  19.22  )
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

On Wed, Apr 17 2024, Joakim Tjernlund wrote:

[...]
>> (spanning multiple sectors) is running, other tasks do still get to run
>> (since spi_nor_wait_till_ready() calls cond_resched()) but any task that
>> tries to access the rootfs would have to freeze since the lock is held.
>> 
>> Dropping and re-acquiring the lock after erasing each sector or
>> programming each page would let readers make progress in between. This
>> shouldn't be too difficult to implement I reckon. You already mostly do
>> it in your patch below.
>
> Yes, that is simple.
>
>> 
>> Doing erase or program suspend would only make sense for flashes with
>> larger sectors since even one sector erase would take a long time. For
>> those, I suppose we could give reads priority over program or erase
>> operations. When a read comes in, it suspends the erase, does the read,
>> and then resumes it. This would be a little bit more complex to
>> implement.
>
> Right, a bit harder but I think it is needed like cfi_cmdset_0001 do: suspend erase to do read/write
> Don't think cfi_cmdset suspends writes, that seems overkill.
>> 
>> I would suggest you try the former first and see if it already gives you
>> the results you need. From your patch below, it seems it does. So
>> perhaps just cleaning it up and turning it onto a proper patch would do
>> the job for you.
>
> Tests with my patch shows vastly improved responsivity but there is still some
> way to go. Consider that an erase takes some 0.20-0.25 secs for us in best case in
> which apps are blocked. We do get some complaints from the app taking too long to complete
> some tasks during erase. 

Send some patches to fix this then :-)

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
