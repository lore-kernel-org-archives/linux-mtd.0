Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D856BCEF161
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2024 12:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6MNjBFbl9giTLtBhQtGvENtsm8u60hKAEtyFD4S0mrs=; b=llBaQtejpxq8YO
	bPecsNCiwr6tBwq6tMb5qrpipeWuMMbzV4OIernHLuwkziHAZPooKqBAME9gTQJ+UT9F9d6TBiKa7
	gMkoCc7x9PywZs/zH5GJBpnFzezvVP96vTn2aqH0olFyKQxnm7tLzo0sJJu9jkJyG02UD4pSmOcgt
	kyXTTt0ACh/d885OCiUwzdiH6Ni/EByxMkPIi0vjUeOHrP87UAOEV/uIk4r6DvfEt6zksnEAr1Xl4
	z/JXsAlgoCo2gO54pfmw68RlU/YDmHflq57s8SokBQAiqPmjAJOw9sLr1jH1kus//h4vHXxmEjycN
	SqTvvV4DBFC998e6AdMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy9Rk-00000005pwT-3ZRu;
	Tue, 08 Oct 2024 12:36:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy9Qw-00000005pp6-0Dzb
	for linux-mtd@lists.infradead.org;
	Tue, 08 Oct 2024 12:35:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D3255C58D4;
	Tue,  8 Oct 2024 12:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B175CC4CEC7;
	Tue,  8 Oct 2024 12:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728390921;
	bh=FwU6Q3NEFYrCL1JxhohqoQDiR0nthXcHrwGbPQbLxvg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pezpW88PtzeA0AN1VL5bPOeF9NsrK3guSUPRtPMp88U3ezngEAte0ldEiUdLc9twA
	 Zdh+ykvM2+VSPi8Ygmz6o6nsATA7oK23vd6e+K1trY6XxXL6lekpbTxtB35a+mu8dZ
	 p68bjOXaIgTHJJSZ5ENFKfTQV5L0D3wQZiJLtggK8UPFW5cqZX4qPEX3/3mfDlhxr6
	 OdMHCb08HujA0RSufUQcnd1IKlE8uEPW9f+FL61HGnbdAkJZwR6Qo2zg+g3nsVGmk4
	 vEroiuxcUZELC9GlgTc8Rej8v5HShsnipEMBcQfiWo+mUf3ZG42oOmxGsoiZh7gvbt
	 WcPalxtMeD8wQ==
From: Christian Brauner <brauner@kernel.org>
To: linux-mtd@lists.infradead.org,
	Eric Sandeen <sandeen@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: Re: [PATCH V2] ubifs: Convert ubifs to use the new mount API
Date: Tue,  8 Oct 2024 14:35:11 +0200
Message-ID: <20241008-kaleidoskop-vorfahren-a517fbb94ec5@brauner>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002165834.868046-1-sandeen@redhat.com>
References: <20241002165834.868046-1-sandeen@redhat.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=brauner@kernel.org; h=from:subject:message-id; bh=FwU6Q3NEFYrCL1JxhohqoQDiR0nthXcHrwGbPQbLxvg=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaSzqrO4nFqkznFpgsDH/rlezJzWd6se7nd//Teun/VP+ velgSvmdpSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEzkEDMjw6KcBH+H31zKmzQ2 HBP7dHlK/YWY/fHB76ck2OVM7i29t4qR4VfVv8qzXzWP2/Lf9Q+J/fQroZjt9LO6rTsVTnyV+zH 7HxMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_053522_166228_B4816998 
X-CRM114-Status: GOOD (  12.95  )
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

On Wed, 02 Oct 2024 11:58:34 -0500, Eric Sandeen wrote:
> Convert the ubifs filesystem to the new internal mount API as the old
> one will be obsoleted and removed.  This allows greater flexibility in
> communication of mount parameters between userspace, the VFS and the
> filesystem.
> 
> See Documentation/filesystems/mount_api.txt for more information.
> 
> [...]

Applied to the vfs.mount.api branch of the vfs/vfs.git tree.
Patches in the vfs.mount.api branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.mount.api

[1/1] ubifs: Convert ubifs to use the new mount API
      https://git.kernel.org/vfs/vfs/c/11716e86804b

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
