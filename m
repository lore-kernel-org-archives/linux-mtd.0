Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2389BC4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Oct 2022 08:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TWF68sSmoMq8qVRq+Vv/0oXvpBd7W265eRj/LU09jCA=; b=BOVxep3CaUsr0P
	RmFIFaYadPOt4jlxIPEWgoTfpirhGgtoyQR5eSfoeHrDUNIfOkbJauP6VrYlkpBatTUkM4otNV3OO
	dtN/J3wSlNwscX+Kyo7nsebbbWQbzxs2x7HAnOcglvWsLzHWS2XqOv4s20ZIiapklE5AW+JIx7Gdi
	HPw81NORqnII8wjFByXOzXM0oLydjkrJNGo0krziLJRMh0Ije6hzbzntQLM3xSF6jRXC1AZDThuew
	tVY/9ftr/dNH8ncBQ0wVhShpzmoxn0BUnr/z7XcFfXjeQQlxuXDNshKZi+dZXIuh3iOmRodIvC5Sx
	JDvit3LIgxi3sVjhEiBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnVl-006PSk-VM; Fri, 21 Oct 2022 08:36:14 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnVi-006PQW-0z
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2022 08:36:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 95B30B82B63;
	Fri, 21 Oct 2022 08:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57E2C433D6;
	Fri, 21 Oct 2022 08:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666341367;
	bh=VYkxOdyqZTRP94uFOMrKlhrYPkv6+oVeaJOCigiokeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0LHArjuO/emmogeedg4sidpH81EIC1oFajIQk20rr9Km/Y0ewObOQB0i43jXid6V8
	 MEWVl4mxIE2auEWLdOFh5S0zN7a5cdswL8kZv1F5sHrcBCX+9z8wc+kpjX8Czr8S07
	 DVGuTf4yxBxOxcpimxvN26SCCFuV+ZffgRv7I1WQ=
Date: Fri, 21 Oct 2022 10:36:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>, linux-kernel@vger.kernel.org,
	qemu-devel@nongnu.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-erofs@lists.ozlabs.org, ocfs2-devel@oss.oracle.com,
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org,
	rafael@kernel.org, somlo@cmu.edu, mst@redhat.com,
	jaegeuk@kernel.org, chao@kernel.org, hsiangkao@linux.alibaba.com,
	huangjianan@oppo.com, mark@fasheh.com, jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com, akpm@linux-foundation.org,
	alexander.deucher@amd.com, richard@nod.at, liushixin2@huawei.com
Subject: Re: [PATCH 00/11] fix memory leak while kset_register() fails
Message-ID: <Y1JZ9IUPL6jZIQ8E@kroah.com>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
 <d559793a-0ce4-3384-e74e-19855aa31f31@amd.com>
 <Y1IwLOUGayjT9p6d@kroah.com>
 <0591e66f-731a-5f81-fc9d-3a6d80516c65@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0591e66f-731a-5f81-fc9d-3a6d80516c65@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_013610_394442_1CE91EC9 
X-CRM114-Status: GOOD (  32.04  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Oct 21, 2022 at 04:24:23PM +0800, Yang Yingliang wrote:
> =

> On 2022/10/21 13:37, Greg KH wrote:
> > On Fri, Oct 21, 2022 at 01:29:31AM -0400, Luben Tuikov wrote:
> > > On 2022-10-20 22:20, Yang Yingliang wrote:
> > > > The previous discussion link:
> > > > https://lore.kernel.org/lkml/0db486eb-6927-927e-3629-958f8f211194@h=
uawei.com/T/
> > > The very first discussion on this was here:
> > > =

> > > https://www.spinics.net/lists/dri-devel/msg368077.html
> > > =

> > > Please use this link, and not the that one up there you which quoted =
above,
> > > and whose commit description is taken verbatim from the this link.
> > > =

> > > > kset_register() is currently used in some places without calling
> > > > kset_put() in error path, because the callers think it should be
> > > > kset internal thing to do, but the driver core can not know what
> > > > caller doing with that memory at times. The memory could be freed
> > > > both in kset_put() and error path of caller, if it is called in
> > > > kset_register().
> > > As I explained in the link above, the reason there's
> > > a memory leak is that one cannot call kset_register() without
> > > the kset->kobj.name being set--kobj_add_internal() returns -EINVAL,
> > > in this case, i.e. kset_register() fails with -EINVAL.
> > > =

> > > Thus, the most common usage is something like this:
> > > =

> > > 	kobj_set_name(&kset->kobj, format, ...);
> > > 	kset->kobj.kset =3D parent_kset;
> > > 	kset->kobj.ktype =3D ktype;
> > > 	res =3D kset_register(kset);
> > > =

> > > So, what is being leaked, is the memory allocated in kobj_set_name(),
> > > by the common idiom shown above. This needs to be mentioned in
> > > the documentation, at least, in case, in the future this is absolved
> > > in kset_register() redesign, etc.
> > Based on this, can kset_register() just clean up from itself when an
> > error happens?  Ideally that would be the case, as the odds of a kset
> > being embedded in a larger structure is probably slim, but we would have
> > to search the tree to make sure.
> I have search the whole tree, the kset used in bus_register() - patch #3,
> kset_create_and_add() - patch #4
> __class_register() - patch #5,=A0 fw_cfg_build_symlink() - patch #6 and
> amdgpu_discovery.c - patch #10
> is embedded in a larger structure. In these cases, we can not call
> kset_put() in error path in kset_register()

Yes you can as the kobject in the kset should NOT be controling the
lifespan of those larger objects.

If it is, please point out the call chain here as I don't think that
should be possible.

Note all of this is a mess because the kobject name stuff was added much
later, after the driver model had been created and running for a while.
We missed this error path when adding the dynamic kobject name logic,
thank for looking into this.

If you could test the patch posted with your error injection systems,
that could make this all much simpler to solve.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
