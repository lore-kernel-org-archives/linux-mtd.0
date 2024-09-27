Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907F9CEBF7D
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Sep 2024 07:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FSwudtasW2HKFc7A7JNSV3JuI1lSi5gHJSZ6G247qAs=; b=HRHrwGquyn0PcB
	wBw4VTU8MmSF48EtC5EqaJnddh93Dg7uNigugj9d2d35FBdMV4mJ7n6C2HzeSHGUlcT0XwXdS9Gy1
	moeIuuASHawe3PWkDfJCVi+MsErZwTNcs43ACOT7zcJLdfXgSQ/ZtnH0gSbgPPvrckf7VK6g5qLdG
	dkOyH9pYvDNpeGyTBXC1gfL4GIGgic60vGqREOALxZQdHJZOdoxtaNljusI2hO0gFhMCzF6HD+Ooa
	7aNDD9xgWrWKHnNyNaWPrJIEmejAfEvJhjdIOO4ma5SRzrGqNL5e8FhiWfrS5ye1pgqx4m3B1gQR+
	Wt3thu8XxMhc/9Zkrhig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su5hV-0000000AOhO-27lZ;
	Fri, 27 Sep 2024 07:47:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su5hR-0000000AOgq-1lMW
	for linux-mtd@lists.infradead.org;
	Fri, 27 Sep 2024 07:47:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6818CA452A6;
	Fri, 27 Sep 2024 07:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B6AC4CEC4;
	Fri, 27 Sep 2024 07:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727423256;
	bh=hLFU0wFk1zgbV40yyqw/Y1+zVSaXVfe8h1o9ioNr7CA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g0+fi391lBoPgNTha7JdwQtOBgLPqHqbCCMbXN0Az6PlVAoIaHQZ9Q2+Tpv3HpgKE
	 Eivrxh9tlMtenDIEMDiHrwcBRYQDTxlI5XnDN4uMNIlhVnQ3pGyVnUWupgyq6tOzC6
	 hp2Z0DuRmp47CfCycO9IxcupoOgBuvc27VqHcFdXqgPMgGf5B3xTxk0jRA6DT9BP5J
	 I4YZUa4k+/xqtxYQU4yF33xQoYQAfG0pbHA+wNOgY5PkwevfwE9KkiBKdsvbpEvQUB
	 /H9T3XBYmQHt7u+TT6o+rnL0U2VxxabYMO0eXdzvoDPIMWPYivHf+JXbtuYprCa28B
	 BA7oMnTG3Gq+w==
From: Christian Brauner <brauner@kernel.org>
To: linux-mtd@lists.infradead.org,
	Eric Sandeen <sandeen@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: Re: [PATCH] ubifs: Convert ubifs to use the new mount API
Date: Fri, 27 Sep 2024 09:47:27 +0200
Message-ID: <20240927-pulle-veredeln-452021ef2492@brauner>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240926203604.23622-1-sandeen@redhat.com>
References: <20240926203604.23622-1-sandeen@redhat.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167; i=brauner@kernel.org; h=from:subject:message-id; bh=hLFU0wFk1zgbV40yyqw/Y1+zVSaXVfe8h1o9ioNr7CA=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaR9SxZsyOUN2TGlwTEqIN/viWBtYH75k8KbX5e+suyuX Mf7835uRykLgxgXg6yYIotDu0m43HKeis1GmRowc1iZQIYwcHEKwET2sjH8Zk2IfJzBfeiFwD3R qVvOx9669Mbl+9U6iRDZAzIbC+xunWBkuPHmpy9HM8/GtORkpdabcxPXzXk1wUjqvXr1f4H5Z10 XcgMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_004737_544402_BCF5B5D0 
X-CRM114-Status: GOOD (  12.36  )
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

On Thu, 26 Sep 2024 15:36:04 -0500, Eric Sandeen wrote:
> Convert the ubifs filesystem to the new internal mount API as the old
> one will be obsoleted and removed.  This allows greater flexibility in
> communication of mount parameters between userspace, the VFS and the
> filesystem.
> 
> See Documentation/filesystems/mount_api.txt for more information.
> 
> [...]

Applied to the vfs.mount.api.v6.13 branch of the vfs/vfs.git tree.
Patches in the vfs.mount.api.v6.13 branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.mount.api.v6.13

[1/1] ubifs: Convert ubifs to use the new mount API
      https://git.kernel.org/vfs/vfs/c/10fe979418ac

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
