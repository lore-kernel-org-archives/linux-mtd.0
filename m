Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18283606A324
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2026 03:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UF3uuc+u;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=I6lGbH2z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=atY3WPkb9cut2UsNerbDXfEGf0RWEMrhyT57ZYvCYno=; b=UF3uuc+ukkP4RrSrLFqE9b72qq
	x8ubTIEZEQcPeOofzNPui3cHEfJOiOpoihHD8CnSXOLGohP2nB1NL49mwWwPHBjgKHDEmwPV+gVhg
	UHj7gHujZCjekOdjzzyuzVU/qckuUvhceRFL3lpa4nt4VMkmEtd2bklUOhThYxBt6FOjx41+jJp0R
	Ln5JbwhyrHogaWHgtaWh06xMJa9cXDfaoTJ6fQiqv0QESoxqvRVkrd39DAqWsKxfstnRyB5f2rtU4
	XLuRsoBfsDzyrZUT4Xf83c9LBuVCqnaLxqGdZGo6Xn4YC6RRDjTk6hhkFiEqpvbq0fh2h8MJyE6As
	VV64ixCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO5Aq-00000000wNo-2T0X;
	Tue, 03 Nov 2026 03:27:00 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO5Am-00000000wMf-2TYN
	for linux-mtd@lists.infradead.org;
	Tue, 03 Nov 2026 03:26:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793676410; bh=7sXvPNBaxHdWaLLan0lLsEk3zIV5UYZaQkD5N7bRqig=;
	h=From:To:Cc:Subject:Date;
	b=I6lGbH2zaVPWaLjPEcHLNkSAEqNj5chJw9+eXzPL6IPVe7uOrSXLBYyRdJepUJYGn
	 owZyY1x3AHHaoJpMbgP2AnyjCsk/Jd+6nc/M5hw53oKRIWxCeFu5NQmSeu+R82bivp
	 ZWyUcBuwsKBxOvvX7LqUZhd0Hq2pK/dTd7BVkkGc=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.198])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 6AF9942A; Tue, 03 Nov 2026 11:26:47 +0800
X-QQ-mid: xmsmtpt1793676407tgbprm8d0
Message-ID: <tencent_A21BAE90D8EE04A5FB98B4168BA73C695306@qq.com>
X-QQ-XMAILINFO: MvUAcPkRmFBfe/k0sJA1gXnVBGWOmN+E9nwdKqhHlDHiisGEPnQQgrKhQ/6Utj
	 zm8pIokQRVlTcbXkkbFkAk8pw6RcVcJvpadsmpDHhm2s4mjNZ+Eq6TYHuy/UY2EPa89FwCkwv3vw
	 0y1Dbg9HDSnNh6mR+qGjpFDDwMKTerjDlZyGcnTiuCYYz5kod/loeKRbllFSCm4o+7A2L4mZLkdF
	 5XjtyJNAJe9JHlyxBd9z41ZkMe2G8AEZNdOVXY5Vs9EKyK+IaqG6G0HC2BQqj4sWaCzFFDekySRk
	 kioT7rmTOsj99OkQ1odU56p5DwzfCbh75Mm8OiKdSSIo0RBjPNFEZnXcCMEVgUv9eu5lP7DPbhIB
	 Ukp7cbcBp0vbNLo7JgNdyfl/LrrAbztm/0r2BKYY6WM5R8NrkPxaJQNAdoeYw+2LPCSY794ZZ3lS
	 n46bvIPpETVmrLw8HcvO2JxATfUzgCLgXBTBKvfTg9iZdT5MP8mr9iwF0EuqqWL8i4JnRZvt82dw
	 GLDcL8MLaVjwKYOqTv4nXG/uodrcWHF+rD12k3dIH5mE0WlChbBN+BVxevfyKO2YXhgWMkca3tpn
	 mHG51pHpIAiOwEeRIIRsAoSghyYYQ7PXOS4NhMiw2PlcW3jpycdgsaYCPD62n0Pj6ZiC2vLOPbOb
	 S0P7dGYHrwYcKvtFr5Tu0lv1rP0vEVXtnppK4+2TyqPVV3gtebYWIeevG5pgFenL5aGL0if5XrVO
	 SZhJSiNrsgSRLUBqhPHFd9Ro54GQIKiAzvK3tvSCID/0I1U8MnRmincIFAPnIMHA0hFjil7ql39j
	 bKIjhkcJ48wUmTfi0hQPVqfEZowGSrQOn0oN/EmzPgIwnI2kyiw6/tkK6CXNG7NwdHRWUVseLf4x
	 I3W9Zq4mdKYrD/ojbWjNU5MF3lQTa8ikcF2P81kxxP9l2QaW0GRSrjGlOTLzcFnD55BPYqhtvwf1
	 bAuLaIez4NraZSmdBJnTOkQYrUtJnIcIQphrcG1a6cAkLEPUGvxv9Tg+15nFfVdiP+Ba0ujPpd8k
	 0PWeCcBEzc3lWFwmhUzxy5yBWsyfcgfh3zPzta15gXcu9ukbIE13Q5mDwXAiY=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Shuai Liu <847807867@qq.com>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at,
	syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com,
	luquijeffrey@gmail.com,
	linux-kernel@vger.kernel.org,
	Shuai Liu <847807867@qq.com>
Subject: [PATCH] jffs2: initialize f->inocache to NULL in jffs2_init_inode_info()
Date: Tue,  3 Nov 2026 11:26:47 +0800
X-OQ-MSGID: <20261103032647.70138-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_192657_140888_0A6472F6 
X-CRM114-Status: UNSURE (   9.45  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

new_inode() can hand back a jffs2_inode_info recycled from slab with a
stale f->inocache still pointing to a jffs2_inode_cache that was freed
by a previous mount's jffs2_free_ino_caches().  jffs2_init_inode_info()
initialises every other pointer field but leaves f->inocache untouched.

If jffs2_new_inode() then fails before jffs2_do_new_inode() assigns a
fresh f->inocache -- e.g. in jffs2_init_acl_pre() -- the error path does
make_bad_inode() + iput(), and evict() ends up calling
jffs2_xattr_delete_inode() which dereferences the stale pointer when
reading ic->pino_nlink, causing a slab-use-after-free:

  BUG: KASAN: slab-use-after-free in jffs2_xattr_delete_inode
  Read of size 4 at addr ... by task repro
    jffs2_xattr_delete_inode
    jffs2_do_clear_inode
    evict
    jffs2_new_inode
    jffs2_mkdir
  Allocated by jffs2_scan_make_ino_cache (jffs2_do_mount_fs)
  Freed by jffs2_free_ino_caches (jffs2_put_super)

Fix by clearing f->inocache in jffs2_init_inode_info(), consistent with
the other pointer fields there.  Verified with the syzbot C reproducer
under QEMU with KASAN: the UAF is reported before the patch and absent
after it.

Originally proposed by Lucas Jeffrey <luquijeffrey@gmail.com>
(Link: https://lore.kernel.org/all/20260909023955.1642244-1-luquijeffrey@gmail.com/);
that thread has seen no activity since September 10 while the bug is
still reproducing upstream, so resubmitting with his credit.

Reported-by: syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3a8099322b09d8d073d1
Suggested-by: Lucas Jeffrey <luquijeffrey@gmail.com>
Signed-off-by: Shuai Liu <847807867@qq.com>
---
 fs/jffs2/os-linux.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
index bff2134d771d..e80b786c9ea2 100644
--- a/fs/jffs2/os-linux.h
+++ b/fs/jffs2/os-linux.h
@@ -55,6 +55,7 @@ static inline void jffs2_init_inode_info(struct jffs2_inode_info *f)
 	f->metadata = NULL;
 	f->dents = NULL;
 	f->target = NULL;
+	f->inocache = NULL;
 	f->flags = 0;
 	f->usercompr = 0;
 }
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
