Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15F4C43334
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jun 2022 13:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kv6cZLlaEYyt10rHbWxCwQmQGzvS4ELneTasdGrrlFk=; b=jZKMWE+tw2Q7Dy
	kV58LCR6BzNJkn1B2kqKi/fyCYrpFdEmCW7YX+HaGruVIzwbVH5VvXGWznatdzIDP/jtTGEtpILDE
	Iz+jdcH9WbQe3ynVzMmsDHR3mNptoiWD85VP8xyoMb/AhmTHxb9UQYXhSkSh4aX3nS1f+jOtJpHN3
	bLCbMSzSro245rn6F1naWN8EUTbZ3WcQPpyGTQzmHI3CHD8XljaY/XeDXMwFj+a+DfU+3SeCcTFqF
	ILGa7DWRBgBr2/QJPKZw6OVqPeNg//J3hcLyyeA0j5ZmCvqI9tbW/9xQTnLgF5wHnGbr31q4OVFCP
	zIz3Ii5lgKO8CNkvuhwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Bi3-006ZhY-Oj; Tue, 28 Jun 2022 13:56:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Bhh-006ZNx-BF; Tue, 28 Jun 2022 13:56:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0A731B81B97;
	Tue, 28 Jun 2022 13:56:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C80ADC341CA;
	Tue, 28 Jun 2022 13:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656424588;
	bh=b5FsKFMrP1+S6zwgUlKhr8WAIjk2qEr4j/i4jiXKeUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ipH9xLLON/wfF1+doX0YwzWNurZbGyHCLx43ahE7WR8jLi1R48cI2m2yJAsZCWDQT
	 Un4VNsnpjcqqdwdfvJBWhdCzCR6kAmILST6sGe+QmxtUWHpxGj2/l2NK930cX7S1Vb
	 ck1tdm9dVL3hHqJ5pPK6X9u94v/kg7IeqTTrypuenoyOXdLstD1jm9a1r2/Mn+hjvK
	 A5gIe8GNT4XoGXRtGng12sB0ehpNIhwjOmzNMxwSBDvTu3O5JPGVxOwJ5SG66up68M
	 dTuMxAaqVKV5rVpkj9AWHYexDQNYp0rXQRl//EEgGVYdOgnC2OLlmpTSGeWpC665ae
	 t2Abf09RRIvCQ==
Date: Tue, 28 Jun 2022 15:56:23 +0200
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Daniel Borkmann <daniel@iogearbox.net>,
	Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
	x86@kernel.org, dm-devel@redhat.com,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org, kvm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-can@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net, io-uring@vger.kernel.org,
	lvs-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	kasan-dev@googlegroups.com, linux-mmc@vger.kernel.org,
	nvdimm@lists.linux.dev, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, linux-perf-users@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-sctp@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org, linux-usb@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	v9fs-developer@lists.sourceforge.net, linux-rdma@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] treewide: uapi: Replace zero-length arrays with
 flexible-array members
Message-ID: <20220628135623.GA25163@embeddedor>
References: <20220627180432.GA136081@embeddedor>
 <6bc1e94c-ce1d-a074-7d0c-8dbe6ce22637@iogearbox.net>
 <20220628004052.GM23621@ziepe.ca>
 <20220628005825.GA161566@embeddedor>
 <20220628022129.GA8452@embeddedor>
 <20220628133651.GO23621@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220628133651.GO23621@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_065633_717052_BF4B17B0 
X-CRM114-Status: GOOD (  22.14  )
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

On Tue, Jun 28, 2022 at 10:36:51AM -0300, Jason Gunthorpe wrote:
> On Tue, Jun 28, 2022 at 04:21:29AM +0200, Gustavo A. R. Silva wrote:
> 
> > > > Though maybe we could just switch off -Wgnu-variable-sized-type-not-at-end  during configuration ?
> 
> > We need to think in a different strategy.
> 
> I think we will need to switch off the warning in userspace - this is
> doable for rdma-core.
> 
> On the other hand, if the goal is to enable the array size check
> compiler warning I would suggest focusing only on those structs that
> actually hit that warning in the kernel. IIRC infiniband doesn't
> trigger it because it just pointer casts the flex array to some other
> struct.

Yep; this is actually why I reverted those changes in rdma (before
sending out the patch) when 0-day reported the same problems you pointed
out[1].

Also, that's the strategy I'm following right now with the one-element
array into flex-array member transformations. I'm addressing those cases
in which the trailing array is actually being iterated over, first.

I just added the patch to my -next tree, so it can be build-tested by
other people, and let's see what else is reported this week. :)

--
Gustavo

[1] https://lore.kernel.org/lkml/620ca2a5.NkAEIDEfiYoxE9%2Fu%25lkp@intel.com/

> 
> It isn't actually an array it is a placeholder for a trailing
> structure, so it is never indexed.
> 
> This is also why we hit the warning because the convient way for
> userspace to compose the message is to squash the header and trailer
> structs together in a super struct on the stack, then invoke the
> ioctl.
> 
> Jason 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
