Return-Path: <SRS0=Emx/=DU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7593C433E7
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2020 11:27:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74BE7214D8
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2020 11:27:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0Wkzg4Ps";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="a/Sp1GZZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74BE7214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yBtrfQKW0kHyfa+ySboJ9zPd+jTrKQmDPld108iYe2M=; b=0Wkzg4PsrujF0tTp289FblMw3
	GZfDbkKZDo7cKqiN1F3Cl3Y0IGHstyzli3p26bt/p4jEK/lPLW8ZAG28GStWUUYDVvZgh6HLM0pu2
	/MVeX8lARDLsSayjNZxmCKtEIXMWG2ijTEFMXOMiNpJRH75hZr1kio4U3E/0q3wKOFSVwE1cgUFTh
	NlxZd6XqU2v8NlGBRDjFmF7ZeGDJqbk25EaqDJWY+/8i/FIgZHqnde/XN4rS67kNB0eyxHbyp+FHH
	dQlGh17IDe1INWVZ9nGECjYHJQ7NEzXXYHd3zU+g2KszCYxBNEI/z+Ge9EthtnfiL9nil4DlzUfcZ
	a1Zwy25Sg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSIRD-0002sg-Fl; Tue, 13 Oct 2020 11:25:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSIRB-0002sH-MA; Tue, 13 Oct 2020 11:25:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ap+vugPRXoOSJhloW5EJc9FGxy9ZwiLwbnG+7+pEMhA=; b=a/Sp1GZZiVtkIrsbDZFKKgQTkQ
 FS+JHTt9pp+5vCrBdk0ac5b7U8ZgZGFScrKiULCJv4PZD4wWqOSzzq06ZoGh/8vFLI33VuvYYBdii
 wZ4VlXJvl5fnmlD+q4pIJJmvrTs/0jX/FIDmEAYUX2+Mt6vIwB3sAbRYRgWIA8hB4i4EWyZuWPFOQ
 rIaV+GwSaVBgBLKvO/SsFSj7I46VHFxg38PLmJQ+Oh1DkRIQcIx5NIWLGcWnDXshQ14JMdlpURiF2
 LxyBxRGv+1Wkfh31jf6dzRr+U4xHgvz3PsshAxeZoaF0OQPY6Fl5VA2XZOxLonra6CTBCfgsfUBp/
 6eTYHzgA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kSIR6-0001VK-7P; Tue, 13 Oct 2020 11:25:44 +0000
Date: Tue, 13 Oct 2020 12:25:44 +0100
From: Christoph Hellwig <hch@infradead.org>
To: ira.weiny@intel.com
Subject: Re: [PATCH RFC PKS/PMEM 24/58] fs/freevxfs: Utilize new kmap_thread()
Message-ID: <20201013112544.GA5249@infradead.org>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
 <20201009195033.3208459-25-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201009195033.3208459-25-ira.weiny@intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linux-mmc@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
 Thomas Gleixner <tglx@linutronix.de>, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, cluster-devel@redhat.com,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 ceph-devel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 io-uring@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, intel-wired-lan@lists.osuosl.org,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, linux-afs@lists.infradead.org,
 linux-cifs@vger.kernel.org, linux-um@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-cachefs@redhat.com,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 netdev@vger.kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

> -	kaddr = kmap(pp);
> +	kaddr = kmap_thread(pp);
>  	memcpy(kaddr, vip->vii_immed.vi_immed + offset, PAGE_SIZE);
> -	kunmap(pp);
> +	kunmap_thread(pp);

You only Cced me on this particular patch, which means I have absolutely
no idea what kmap_thread and kunmap_thread actually do, and thus can't
provide an informed review.

That being said I think your life would be a lot easier if you add
helpers for the above code sequence and its counterpart that copies
to a potential hughmem page first, as that hides the implementation
details from most users.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
