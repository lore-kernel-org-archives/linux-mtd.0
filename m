Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3E7C77B7D
	for <linux-mtd@archiver.kernel.org>; Mon, 15 May 2023 10:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uqnPK/Hrb7EYjgXXdoMJ4g4Z4vJ8FyjAFuPhs9azXdY=; b=0l0oo6qL1SMEIf
	g8o7ksKU5/LOZk0U1qr2ZbUklSYOm3qiUwhBln+RVs4wMdQCLvRUTaQpQA0yztmilQ4PefBo45gi9
	apce7CEadliyAk2M45rVNEIRTsD0LkPDE85YG9A8bYZiZOqeBC+5AbQRHtPI8PM9BYosSXVZrcYdh
	JbbvWUSEbZZB5Y6Rbb5EL8hpS12EnNwjMy6+A7MXq5Zwx0a56DFYYUrE43LGNUiEG8PPjOZEg3eKj
	UjPAMdFibkXZwI/I0XmnzZZZR/hEEoyx+7UCUDZZEofqeKGy3lOB5rTIRmu6wQfIVGEUBUzZaAqor
	b6FhSHEmQhL5oMiEkWYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyVlD-001ti3-0y;
	Mon, 15 May 2023 10:48:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyVl9-001thJ-32
	for linux-mtd@lists.infradead.org;
	Mon, 15 May 2023 10:48:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4D16361236;
	Mon, 15 May 2023 10:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5E8C433D2;
	Mon, 15 May 2023 10:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684147734;
	bh=GMNZQGOM7OSk9SMRxPFbPrzw+HMjjcK+CNPMsFGAKCk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mw/l9ln6He8vMUNGmGMX/QlUn71yBZBMFO4zTC8FhnL6zFl55lRO4lBeJsEk+tw0Q
	 b6yz4tRVCy+a5PY3AzkSIiYjKfwPuH5amOAstRRsLxcpUy+ca4TeK8haLpKfyJEgv6
	 /cu5yP54pKm5KfT2MLnqT/Y5t4Drn75/G6wRZq+Jg5zMW1Ns3lS1hYcRpYAszzndLn
	 m10AhCLBvK+rGIFfMtU4AV5fhsO+okzW5Jd1Px6XtSS5kTKb4MJIuLAW0hvJDNXy3V
	 yLJRB10r7EE8ftyGGmvr3Am6NcbmDMwBtwQzpthkUsXQJX10ttw6QKqfu3oCVLplsh
	 9ySJDGvXw9XpA==
From: Christian Brauner <brauner@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Fabian Frederick <fabf@skynet.be>,
	Nick Desaulniers <ndesaulniers@google.com>,
	KaiGai Kohei <kaigai@ak.jp.nec.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Christian Marangi <ansuelsmth@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>,
	Tim Gardner <tim.gardner@canonical.com>,
	kernel test robot <lkp@intel.com>,
	Ron Economos <re@w6rz.net>,
	Nathan Chancellor <nathan@kernel.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH] jffs2: reduce stack usage in jffs2_build_xattr_subsystem()
Date: Mon, 15 May 2023 12:46:50 +0200
Message-Id: <20230515-sinnbild-boten-fa2d5510a52c@brauner>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230506045612.16616-1-ansuelsmth@gmail.com>
References: <20230506045612.16616-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=800; i=brauner@kernel.org; h=from:subject:message-id; bh=RW8BK9FlWjXjDRheFHaERdpy80bDkJQX/aatmJS8jy0=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaQk8U7Z+vRO/vOf6864nTnvkdIUFy3sOyklLylUcHXd8Wb7 x1cPd5SyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAExkygGG/7mn8xYI3VxXGrjlzVm5jA e7ly3ye6dl9+Kky/+LeydxnY5l+GfYsPelreH3r7u37/zy0kbjgTTbEdUIPRXXdTtnMke/V+YEAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_034856_042211_EBE208F0 
X-CRM114-Status: GOOD (  12.45  )
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

On Sat, 06 May 2023 06:56:12 +0200, Christian Marangi wrote:
> Use kcalloc() for allocation/flush of 128 pointers table to
> reduce stack usage.
> 
> Function now returns -ENOMEM or 0 on success.
> 
> stackusage
> Before:
> ./fs/jffs2/xattr.c:775  jffs2_build_xattr_subsystem     1208
> dynamic,bounded
> 
> [...]

I assume I was Cced to pick this up. I'm happy to do that. If this is
rather supposed to go through the jffs2 tree then please tell me so we
can drop it.

Applied to the vfs.misc branch of the vfs/vfs.git tree.
Patches in the vfs.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.misc

[1/1] jffs2: reduce stack usage in jffs2_build_xattr_subsystem()
      https://git.kernel.org/vfs/vfs/c/493e7cebb906

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
