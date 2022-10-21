Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6FFC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Oct 2022 05:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QoH8c2n0+w01a6A4P/FrXu3GbdVaVjZOZTwsWdcCIXU=; b=p0dBU/SR2/jseD
	2ASPX09PmPRFLm2oO/OdPDVi8/ryBiZdDjMFzY1OS3oJts3zZZOQU8Hfn7KMYlk0DxYlA3tvwpgiH
	5EDRhhEupDPyY2eYrbrITZXKSpSReSmjXwTmOlSVw9a3zpbCIv0cjh+Vyl9Xnuo4E7op+9PWezFWM
	IeXsUWxy3K86Le6EA9RhqMtN8xMHYgXohKy05w+UHOVtFXRNZrSHY9kqgeg770EtHmZ7O10GqhIrD
	IScfa05LoGLrM47m2yk8AAffDVAI2ig6uCsx3WUB4zk3UkspMzAqBzL2LAkA1Flv/Sb8YzdLNFnYV
	D84rWzMG3Ahk0TaC5ldw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olkiN-005T0F-F7; Fri, 21 Oct 2022 05:37:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olkiK-005SzV-VR
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2022 05:37:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0B01061D9D;
	Fri, 21 Oct 2022 05:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD180C433C1;
	Fri, 21 Oct 2022 05:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666330619;
	bh=C4x6hYFDAWi4DXcimrF67aLQPsZW93Mx96V0amCnWn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QlbKpgGx1qrMgSdaJyivXXf5qor/X961lpc0yRR+woSzH3tCcgiu1gmz/NBYEXQfe
	 K4vsmjcCVpegODndBu2vg9R9eT4zstEkXIb1SfoFeTNCPoQOhnVD+4siGARAhiytQw
	 tUVK0o7ipMo473nLX2GyW5d8TYlaC0oYKW+aMHhw=
Date: Fri, 21 Oct 2022 07:37:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Luben Tuikov <luben.tuikov@amd.com>
Cc: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
	qemu-devel@nongnu.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-erofs@lists.ozlabs.org, ocfs2-devel@oss.oracle.com,
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org,
	rafael@kernel.org, somlo@cmu.edu, mst@redhat.com,
	jaegeuk@kernel.org, chao@kernel.org, hsiangkao@linux.alibaba.com,
	huangjianan@oppo.com, mark@fasheh.com, jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com, akpm@linux-foundation.org,
	alexander.deucher@amd.com, richard@nod.at, liushixin2@huawei.com
Subject: Re: [PATCH 00/11] fix memory leak while kset_register() fails
Message-ID: <Y1IwLOUGayjT9p6d@kroah.com>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
 <d559793a-0ce4-3384-e74e-19855aa31f31@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d559793a-0ce4-3384-e74e-19855aa31f31@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_223701_073856_A2526943 
X-CRM114-Status: GOOD (  22.72  )
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

On Fri, Oct 21, 2022 at 01:29:31AM -0400, Luben Tuikov wrote:
> On 2022-10-20 22:20, Yang Yingliang wrote:
> > The previous discussion link:
> > https://lore.kernel.org/lkml/0db486eb-6927-927e-3629-958f8f211194@huawei.com/T/
> 
> The very first discussion on this was here:
> 
> https://www.spinics.net/lists/dri-devel/msg368077.html
> 
> Please use this link, and not the that one up there you which quoted above,
> and whose commit description is taken verbatim from the this link.
> 
> > 
> > kset_register() is currently used in some places without calling
> > kset_put() in error path, because the callers think it should be
> > kset internal thing to do, but the driver core can not know what
> > caller doing with that memory at times. The memory could be freed
> > both in kset_put() and error path of caller, if it is called in
> > kset_register().
> 
> As I explained in the link above, the reason there's
> a memory leak is that one cannot call kset_register() without
> the kset->kobj.name being set--kobj_add_internal() returns -EINVAL,
> in this case, i.e. kset_register() fails with -EINVAL.
> 
> Thus, the most common usage is something like this:
> 
> 	kobj_set_name(&kset->kobj, format, ...);
> 	kset->kobj.kset = parent_kset;
> 	kset->kobj.ktype = ktype;
> 	res = kset_register(kset);
> 
> So, what is being leaked, is the memory allocated in kobj_set_name(),
> by the common idiom shown above. This needs to be mentioned in
> the documentation, at least, in case, in the future this is absolved
> in kset_register() redesign, etc.

Based on this, can kset_register() just clean up from itself when an
error happens?  Ideally that would be the case, as the odds of a kset
being embedded in a larger structure is probably slim, but we would have
to search the tree to make sure.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
