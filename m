Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD55EC01A4
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2026 09:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zt2acttnYuq+NzRJPtT4ZR694XLzNipz/Gld7ptoq1w=; b=NeA2O9WVJ/9zUh
	AtifmhQdu/2j26DdQb1rp5OF0DbJfWGBkpeG6BYMIElkknQ9VdHcAGot6Hls6Cbam8l2JxNe/BKg8
	2KCHSoPnJry828Fgwr1Z67ZkG5DH5wgljjHYBDiq8EqrmTVoIEhxdMKbzKLSI/+Xr7QWtlebzpNn5
	EZmwFRFmPP7tj13iCxalP9WjXKycC/EZtzfFd0oE31GMPFOcNYfuKLoYsHBRWOLSGZXUBi//VGtz/
	RKh5e2ru7gHqjHRJPQvVQUKfY5xomIkX8UCAMcMC4zVbWVcR/WUbdVoGK3R6Ni02zZxlaYC1fpVHg
	YwnV5upCBUo5aWjxuauA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bLT-0000000GLRW-1U61;
	Mon, 23 Mar 2026 09:13:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bLR-0000000GLQq-2wNA;
	Mon, 23 Mar 2026 09:13:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E411D600C4;
	Mon, 23 Mar 2026 09:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06702C4CEF7;
	Mon, 23 Mar 2026 09:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774257188;
	bh=wzMrqKx3Jtzn/TAs56FycVP5WjxG7mSofPlph6puuTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=joSxwlspVhKYcgE4zizMzEupkVxH7zBoRt16ItgpGqtktF8hLPrEEOTxfgh4aRR46
	 H0U9alpLsA83SdovjY4NjT0S8IVfoGCFHfdV08wBojK7QatPitGsHroy+nurmzIUo5
	 9LTrYrheRCty7XcM5Hdcd35jJVYk4YzX2FwqnAgbFVPaee1S/zk0OOYbb6dWKe54SV
	 Qejn61X7CFhOqRsAbeUsXpGiEPrzUHGPx8hpLYNbDN7Ghgx9DVL33kddcsAYc4j5Sz
	 AmCzqaip3eo7Xnd8PbIQkYXGzXvvJm8fegMwy8XoqhfyH8Ytxfa3hUrWvBicIE9Bu0
	 C1NjdvWhW+Gjw==
Date: Mon, 23 Mar 2026 09:13:06 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Long Li <longli@microsoft.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
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
Subject: Re: [PATCH v4 18/21] drivers: hv: vmbus: replace deprecated mmap
 hook with mmap_prepare
Message-ID: <409ff1b0-43ff-4b1d-ad07-7624e0817640@lucifer.local>
References: <cover.1774045440.git.ljs@kernel.org>
 <05467cb62267d750e5c770147517d4df0246cda6.1774045440.git.ljs@kernel.org>
 <SN6PR02MB41573DF211DA2469D7FFE892D44BA@SN6PR02MB4157.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN6PR02MB41573DF211DA2469D7FFE892D44BA@SN6PR02MB4157.namprd02.prod.outlook.com>
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

On Mon, Mar 23, 2026 at 04:16:20AM +0000, Michael Kelley wrote:
> From: Lorenzo Stoakes (Oracle) <ljs@kernel.org> Sent: Friday, March 20, 2026 3:40 PM
> >
> > The f_op->mmap interface is deprecated, so update the vmbus driver to use
> > its successor, mmap_prepare.
> >
> > This updates all callbacks which referenced the function pointer
> > hv_mmap_ring_buffer to instead reference hv_mmap_prepare_ring_buffer,
> > utilising the newly introduced compat_set_desc_from_vma() and
> > __compat_vma_mmap() to be able to implement this change.
> >
> > The UIO HV generic driver is the only user of hv_create_ring_sysfs(),
> > which is the only function which references
> > vmbus_channel->mmap_prepare_ring_buffer which, in turn, is the only
> > external interface to hv_mmap_prepare_ring_buffer.
> >
> > This patch therefore updates this caller to use mmap_prepare instead,
> > which also previously used vm_iomap_memory(), so this change replaces it
> > with its mmap_prepare equivalent, mmap_action_simple_ioremap().
> >
> > Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> > ---
> >  drivers/hv/hyperv_vmbus.h    |  4 ++--
> >  drivers/hv/vmbus_drv.c       | 31 +++++++++++++++++++------------
> >  drivers/uio/uio_hv_generic.c | 11 ++++++-----
> >  include/linux/hyperv.h       |  4 ++--
> >  4 files changed, 29 insertions(+), 21 deletions(-)
> >
>
> There are two mmap() code paths in the Hyper-V UIO code. One path is
> to mmap() the file descriptor for /dev/uio<n>, and the other is to mmap()
> the "ring" entry under /sys/devices/vmbus/devices/<uuid>. The former is
> done by uio_mmap(), and the latter by hv_uio_ring_mmap_prepare().
>
> I tested both these paths using a combination of two methods in a
> x86/x64 VM on Hyper-V:
>
> 1) Using the fcopy daemon, which maps the ring buffer for the primary
> channel and sends/receives messages with the Hyper-V host. This
> method tests only the 1st path because the fcopy daemon doesn't create
> any subchannels that would use the "ring" entry.
>
> 2) Using a custom-built test program. This program doesn't communicate
> with the Hyper-V host, but allows mostly verifying both code paths for the
> primary channel. As a sanity check, it verifies that the two mmaps are
> mapping the same memory, as expected.
>
> As such,
>
> Reviewed-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>

Perfect, thanks so much for this!

It is tricky for me to test these, beyond fairly exhaustive logical
confirmation of equivalence, so this is _hugely_ helpful.

>
> The most robust test would be to run DPDK networking against
> UIO, as it would communicate with the Hyper-V host and use
> multiple subchannels that resulting in mmap'ing the "ring"
> entry under /sys.
>
> @Long Li -- I'll leave it to your discretion as to whether you want
> to test DPDK against these mmap() changes.

Thanks in advance for taking a look on this also!

>
> I've noted one minor issue below.
>
> [snip]
>
> --- a/include/linux/hyperv.h
> +++ b/include/linux/hyperv.h
> @@ -1015,8 +1015,8 @@ struct vmbus_channel {
>  	/* The max size of a packet on this channel */
>  	u32 max_pkt_size;
>
> -	/* function to mmap ring buffer memory to the channel's sysfs ring attribute */
> -	int (*mmap_ring_buffer)(struct vmbus_channel *channel, struct vm_area_struct *vma);
> +	/* function to mmap_prepare ring buffer memory to the channel's sysfs ring attribute */
>
> Changing the comment from "mmap ring buffer" to "mmap_prepare ring buffer"
> produces awkward wording since "mmap" is used here as a verb.  It might be better
> to just leave the comment unchanged.

Sure am happy with that of course, I think Sashiko moaned about this but
it's obviously fine either way.

Andrew - do you mind restoring the comment to its original form above? Thanks!

>
> Michael
>
>
> +	int (*mmap_prepare_ring_buffer)(struct vmbus_channel *channel, struct vm_area_desc *desc);
>
>  	/* boolean to control visibility of sysfs for ring buffer */
>  	bool ring_sysfs_visible;

Cheers, Lorenzo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
