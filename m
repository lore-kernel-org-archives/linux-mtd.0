Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CD5CDD1D5
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 19:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XRAa5D+89wg9tyC5pIohwPoklYYjLjCjR9eq0EPEl2A=; b=OnA9AbKws3RTJS
	E14OJUfoswBB9J+JKednpyIGB/Mg7MVQqjXMX4/vN4w3IaXOyph9TdzVOhKmxXyL3KXnDNX6kU4zx
	wQzk8383XcmTzc/aH6P+QiBuURLfkYnGYzrmfGckVWQxgaD8GoPNM7luir2+IvtTmA6DN//mYiHwe
	KE1Wfh3BCavLJ4VyXP0cQBgPbJbMm+Hf3ZWro5Q5+EVb2UUCAVLVzw5g3rT3U9MphuBwWKg/bODfQ
	MkYPQK3T1r2aq766h8o9eDuVybd/cJSL29bSCVrjv5YTofY0IyqjWWx/ZsPRuy1c6jcoZas/GESHx
	8yuMxS1AMMw7uL0hTpfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svMFg-00000000edB-3vcs;
	Mon, 30 Sep 2024 19:40:12 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svMFe-00000000ecZ-1v6e
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 19:40:11 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1svMFR-0000000050w-0VwY;
	Mon, 30 Sep 2024 19:39:57 +0000
Date: Mon, 30 Sep 2024 20:39:48 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Richard Weinberger <richard@nod.at>
Cc: chengzhihao1 <chengzhihao1@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, robh <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, John Crispin <john@phrozen.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFC 2/2] mtd: ubi: add support for protecting critical
 volumes
Message-ID: <Zvr-hOM2DfveaqeC@makrotopia.org>
References: <e0936674dd1d6c98322e35831b8f0538a5cfa7a3.1727527457.git.daniel@makrotopia.org>
 <b43a7155f80995c3986893951c092291caf3a5f4.1727527457.git.daniel@makrotopia.org>
 <251386789.117942.1727612762462.JavaMail.zimbra@nod.at>
 <ed98871a-b41a-9755-4eed-18ad9e00869c@huawei.com>
 <364911897.123906.1727721820227.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <364911897.123906.1727721820227.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_124010_522245_378A4845 
X-CRM114-Status: GOOD (  20.06  )
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

On Mon, Sep 30, 2024 at 08:43:40PM +0200, Richard Weinberger wrote:
> ----- Urspr=FCngliche Mail -----
> > Von: "chengzhihao1" <chengzhihao1@huawei.com>
> >>> Von: "Daniel Golle" <daniel@makrotopia.org>
> >>> Allow the boot firmware to define volumes which are critical for the
> >>> system to boot, such as the bootloader itself if stored inside a UBI
> >>> volume. Protect critical volumes by preventing the user from removing,
> >>> resizing or writing to them, and also prevent the UBI device from
> >>> being detached if a critical volume is present.
> >> =

> >> I agree with the doubts raised in patch 1/2, if userspace is so hostile
> >> to delete system partitions, there is little hope.
> >> But I'm still open for discussion.
> > =

> > Yes, I agree that it is meaningful to prevent user from operating
> > volumes accidently. How about doing that by some existing methods? Eg.
> > selinux(Design sepolicy for ioctl cmd).
> =

> Another thought, do we really need to enforce this in kernel space?
> Teaching ubi-tools to be super careful with some volumes is also an optio=
n.
> =

> like a ubirmvol ... --i-know-what-im-doing.

True, enforcement doesn't need to happen in kernel (though I think it's
nicer, but really just a matter of taste, I guess). ubi-tools would still
need to be able to recognize critical volumes somehow, and that could be
done by checking if the 'volume-is-critical' property is present in
/sys/class/ubi/ubi*_*/of_node/

If you prefer going down that road instead I will work on patches for
git.infradead.org/mtd-utils.git instead.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
