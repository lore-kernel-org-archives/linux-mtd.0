Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD10E9381C
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Apr 2026 05:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IiDewSogGDAnCVgvjFlwnvb4a6tcO0UGA136Mo6K1yU=; b=4C6NdWBEC4A5IB
	R2vEQEWTy3rD0+x5OdTxFl8YLzVymVm0yDwvj5vPipHTkf8etBGLpDLFPQkkT3rL4AK/kidSwYszz
	6wt4h9ms6J3PPjyF5LyQp2oOfyiTOnRWs243623pnS/F72cA/ElAOWa4p1NFc91DTkAbeLsGCpWL4
	iMPSfULiw+xqR0qxMXYcpjfTAe71vMGBQpOIP/oGsFWcCw2c6ar2PMkDk6kCMmm0dbHeUbRveGUkr
	iM4Y1feWBwGzQH1FvVuesQswsyBKTfE53wEiqjj3AYqXL4jvrPv0GPKUgFVMBJ1Zh7h6S+Vn55nBN
	koxyHKiSvmexiwAZxlSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC9zu-0000000F1Y1-3iRr;
	Mon, 13 Apr 2026 05:38:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC9zg-0000000F1X2-3Ihm;
	Mon, 13 Apr 2026 05:38:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D5BE7434F4;
	Mon, 13 Apr 2026 05:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D756C116C6;
	Mon, 13 Apr 2026 05:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776058674;
	bh=c9xdq9i+G0zulG6323Mzb3s5ZrM924e/Sx6+1KNbAKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CYAidPKqcLB7DggtGonSr6XqmwbLLK9P1gNbNHNBTA3mq0vH1b50IIBl5v1zbXXps
	 GHHshy2hpn9wUga0epb1dJOO1e0BFndrNx4clnhZZOn7zUnMfzMx6U35BjPalsVv13
	 qe/HFMZY82osynewGvSj46/ZbqIGUSh+xDIhvSd+QTqUHgM4YzoDv1x2RvlqnEOdRo
	 7wWfyVwal3hQDzOC2w+RlZOAL/OCU5glHRpaDPGFhkr7WJsPEXrSyKatLqSv2fukC/
	 Y5fVO5ybbUpow/LSffY8kBaDZD2Hl75evpdO2SqpzWa/lnBVl0wUwWPho8OkumYSk0
	 wrCdvcELxpHgA==
Date: Mon, 13 Apr 2026 06:37:41 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Clemens Ladisch <clemens@ladisch.de>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Bodo Stroesser <bostroesser@gmail.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, 
	David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	David Hildenbrand <david@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, 
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, 
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, 
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>, "linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v4 19/21] uio: replace deprecated mmap hook with
 mmap_prepare in uio_info
Message-ID: <adyAzdYVm95MZny2@lucifer>
References: <cover.1774045440.git.ljs@kernel.org>
 <157583e4477705b496896c7acd4ac88a937b8fa6.1774045440.git.ljs@kernel.org>
 <adx2ws5z0NMIe5Yj@shinmob>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <adx2ws5z0NMIe5Yj@shinmob>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_223756_979612_B49AE14D 
X-CRM114-Status: GOOD (  16.58  )
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

On Mon, Apr 13, 2026 at 05:14:08AM +0000, Shinichiro Kawasaki wrote:
> On Mar 20, 2026 / 22:39, Lorenzo Stoakes (Oracle) wrote:
> > The f_op->mmap interface is deprecated, so update uio_info to use its
> > successor, mmap_prepare.
> >
> > Therefore, replace the uio_info->mmap hook with a new
> > uio_info->mmap_prepare hook, and update its one user, target_core_user,
> > to both specify this new mmap_prepare hook and also to use the new
> > vm_ops->mapped() hook to continue to maintain a correct udev->kref
> > refcount.
> >
> > Then update uio_mmap() to utilise the mmap_prepare compatibility layer to
> > invoke this callback from the uio mmap invocation.
> >
> > Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
>
> Hello Lorenzo, since two weeks ago, I observe a failure during my kernel test
> set targeting Linux for-next branch. On failure, kernel reported a WARN at
> __vma_check_mmap_hook [1]. I bisected and found that this patch is the trigger.
> Here I share my observations of the failure. Actions or advices for fix will be
> appreciated.

Ugh yeah thanks, this actually needs to account for use of compatibility layer,
so probably we shouldn't even assert this as that isn't easily detectable.

I'll send a hotfix for this that can be bundled up with 7.1 patches.

Cheers, Lorenzo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
