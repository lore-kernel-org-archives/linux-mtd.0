Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0045D606A32C
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SDp8CcUr;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=fwSP+rV5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S4+8HjpBHEHNzf90tFUV+hX9ZUXgFa4hNc75+IHL7N0=; b=SDp8CcUrlksbASoDVVUYe7vQkL
	uf8QFLWes5P6IWPbRnbXZrzMEyLugavy3tjTVfQrCX9Gbs2ttYZcuRYg8QLoNrtdxL1W0BegkyCJN
	sYh2MSfsNWwCl2ToFHIrI6RxvrLMISNAxpqnTN+DEY/TnvrT1p3XieSnQmLJD2eS0Et1NZiNKwV6j
	JXMMXM6Lh7Y49rnCf2Y3Qq5b39s9n/ZSQO64cJXeMXZZMn8bA2XwrVHI7TQjHuHFwcd8pTFbNolE3
	E/+KxgNNNHmFAjWkzBYkNWBauaWVlhv7NgtIX2po3XYTf+M7vExT353B9KMiuaNk0pQTUK96gA+Jo
	/9+/NKVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqOJ-00000001K8O-188L;
	Mon, 16 Nov 2026 06:40:35 +0000
Received: from out203-205-221-236.mail.qq.com ([203.205.221.236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqOG-00000001K7z-0wve
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:40:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794811227; bh=8a/PKiLxaTEMPYbiH5CDurBLGvrzH4Qgf36+oo8YXkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fwSP+rV57UjJCaWb64mNn8sq30LdR6QJ5AHrCONIXWq1kVGwenM6iAk+hIIzRR9Hd
	 1vHTwpSrw5JBfF4pHW/hbUxc37Zl3KbYIMI6/Xr2Y5re9oSOqsGy1U0iHbRUW78E5Z
	 1hIq7MGv13aXiIC0odNHOQ/80KKXjcWZLRW2FbPw=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.198])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id A180B68E; Mon, 16 Nov 2026 14:40:24 +0800
X-QQ-mid: xmsmtpt1794811224tlxh7pbr1
Message-ID: <tencent_1684827B82B415CBAF7C7AD30E6EBCD8D406@qq.com>
X-QQ-XMAILINFO: Npv5yIQT4nxMwCEwPhhhObPEkl5jXr8PJi4i9hZ169SMULYk48h90wNra9WrTL
	 9dMfHzVFRwzXCCwDBE+HnbuasK8FOgB8jo9Q+pFrMIHZxwaIYhW2nKnCsHYw3zrdVx2N4ZoB3em4
	 caAOnehu4HDaCGnw53ENbKa6H24KiUCp5hpElBlS0+GWXkIw1BlXEo77vJ4KmPaB47oAysn9Rl8h
	 Gmduzwv/el5OpPs12qbmCLjeOu2ibWt+0/HM3gB0UBw6KrAbLfgq5RagIU+mPkr+ekYcCZMlosPU
	 Sd1yPiEOJ7tbxp4dYBPBS0n26ORn13leqJ8Vg15du3kPapEazretbhA3EZVlgrKubpmWxqwBA15j
	 NuYzpyjpsUSwjW4pPwIJEB/YXTYfAUDW4h44vZKpfbRqaX4MWhmAkuQbIzbm3SIUjA9gy2Sj/qr/
	 OvvdWK2j0J36T3yXT8x//cqmzvv6dUiR5boTsq6p30nKOwQ9wEThtgGg5dV6amylWnvoVeSz2VmR
	 JuKMet+U+YyfAuc7l995xqnOXr29ukJcbhi77aMmWMGZiNQvQZGn7fzU5il592PuQjkU9KejYPw/
	 nUf8GuuMlgtwef5gpRjGEg3MjIYTdrQhkEVkRt0ca9CwLuZxNnDFvyhBj6g3xdMHYQVzEdtvexr+
	 zn8ufPz2X7ugaGqLw7RigTL/7QgYcU9vdG3cZmxn4ANxBbkPYqRpcpO8MF7rYCmCKjMCpUSAsS+Y
	 WfI6c4yMn1f8D+FAPk0/PCa1nhXtuJcCwiknAyWfzYBoqPZyzkU47Zij6TmpzgasB5zY9mGknSn3
	 px3AA4qYRVEKwAlK+1wzw1v4aKHTDqjr3l2KvC0nByIVULG2bDsYg/VXsg6I2phXDZ6Lnxz5wQsQ
	 sCCshvG+vbS1rlLyn5OiQwxQHk3W+AU0lsc9CPFjpDC5Ua1iTNFp8HM633iollc0jzLeWQKxtxvL
	 4q2zOUwluIWzonYXev80I2945E+5RLIx7A4L1ev3sLFTBEw6eD2JkSpur6NC6aHpdq9YNHKKCKGv
	 /Rh3U/I8xO2EHG/wNtPhKUnow0pJL5uMjJESXE7Xd6iMAvfAKsI1RYWpscQRJJEU080oPi7w==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Shuai Liu <847807867@qq.com>
To: thdwjdgkr123@gmail.com,
	richard@nod.at,
	dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	syzbot+250fde257a3eebba4426@syzkaller.appspotmail.com,
	Shuai Liu <847807867@qq.com>
Subject: Re: [PATCH] jffs2: keep alloc_sem held when a write retry cannot reserve space
Date: Mon, 16 Nov 2026 14:40:24 +0800
X-OQ-MSGID: <20261116064024.926991-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102173342.314251-1-thdwjdgkr123@gmail.com>
References: <20261102173342.314251-1-thdwjdgkr123@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_224032_591653_A9838B11 
X-CRM114-Status: UNSURE (   5.97  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

I independently verified this fix with the syzbot C reproducer on top
of Linux 7.4-rc3 (master), using mtdram with 128 KiB total size /
4 KiB erase size, CONFIG_JFFS2_SUMMARY=y and CONFIG_PROVE_LOCKING=y,
closely matching the syzbot configuration. The patch applies cleanly
to this tree.

Baseline (before the patch):

  - The fail-nth scan in the reproducer triggers the lockdep warning
    at N=10:

      WARNING: bad unlock balance detected!
      repro/67 is trying to release lock (&c->alloc_sem) at:
        jffs2_do_create+0x229/0x250 fs/jffs2/write.c:474
      but there are no more locks to release!

  - The call chain matches the syzbot report: jffs2_sum_add_kvec()
    fails with -ENOMEM, jffs2_write_dnode() drops alloc_sem for the
    retry reservation which then fails with -ENOSPC, and
    jffs2_do_create() calls jffs2_complete_reservation() on a lock it
    no longer holds.

With the patch applied:

  - 2 runs x 2000 fail-nth rounds, zero lockdep reports.
  - The failure path is still reached: in one run the injected
    allocation failure landed in jffs2_sum_add_kvec() ("Write of 68
    bytes at 0x0001e00c failed. returned -12, retlen 0"), creat()
    still returns -ENOSPC as expected, and the second unlock is now
    balanced.

Tested-by: Shuai Liu <847807867@qq.com>

AI assistance disclosure: the two-state test environment (kernel
config, QEMU setup and log analysis) was prepared with the help of an
AI coding assistant, per Documentation/process/coding-assistants.rst.
The conclusions above are from actual test runs.

Best regards,
Shuai Liu


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
