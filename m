Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901F4EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 05:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kNzwghZ8I1aivRuVFqXcZJea7H76wisr1lDnC9doqHc=; b=ruxktgO32jwCft
	M3GK88AD5/jstxoBcoUkjM0baxBi8Skgfc7VPnGqb3EnBOuL67g45ZQVRJDwYnfDJtmQDIWdowMtV
	iewMmzFJGZ1HrTH5mDFkqKHHRRKGSeAW/BzlaYjqSjMDT33i2I9c3YivWaSDHFN+Bfk6CVKhSHA1V
	/5BeLLEzMU6IgktOIKUKkMb9JmeF9Q3xvI/iD6pf4O/dyt+V+wvM4hKLyG7IZTwt+FQVQl6x7z5O2
	TYRvDsuMS2ktUUel1SLfTkhXB8/EoBbS8Cc9OUCaARUkUm3WPPzFLZGf6ieZFSF/4Pefx7FSu2J3r
	IuB48mvl30pdkkjll09g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzb8-005Dd1-0C;
	Wed, 19 Jul 2023 05:19:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzb6-005DcG-1K
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:19:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VRkJIutGAQCy9V+Cnln/i2QHE7ZQe0Zo2jvJEyGa0Ng=; b=nQDF4V10Ls4HUskwf1uKdLr4ZI
	j7GXrZ2A1kwrv0NGzRgIvnN8Fa0m0adhXAf45yvR3m2H8NUSElH/OQGTAkhLqhyImtxVcA9/lm8Gn
	5TrtXRrGpYM29G4tj/HsylGoKBsQjFZlZHBJzuGTBJ49i/U+UZpCw5D6wE2FuyCWRa1d0uBQrVuqJ
	X9kwhnJYWRlW6zTml8pk1X7aanT53lPkaiIbbk2AZ8DlextI62r8izMYNcBKZDlT3ar6Aab4BGhe1
	f+21+/K4cvYyE5hHg/TeyJty+Fa06cTS0NdNtgEuQXMw7N+8F0DIPtc+yVnTbiozNf9oT2exqQ3sg
	qwAaxVLQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLkJV-00BYOH-0o
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 13:00:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4EB4F6157C;
	Tue, 18 Jul 2023 12:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D366C433CA;
	Tue, 18 Jul 2023 12:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689685191;
	bh=ODoi2e+vcqIb799pflsdMhm1nGdkubtWgbUegajrVfU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SDalzP/YaXdnw/eO5FhMttHT+uo4cUQ0HEfzV/eVDhjrh2vL2AqqxXcAqh13yqJn4
	 AVbM5TSLu3q0pr2cIE2wClirkeGHzrnHwdeCo5pdmULzTvNEpku6b70jtE1ArlykWc
	 iaLRyhhRjQiHzGqDFnFYCpXBS8sZnvAGylTxo/SCUEVIt3zDITwUPYFYeNX441iuA5
	 UPvKWFmqWGmWjFjxj3GAvUxK0AMTKP3bw+ZiMK2blBchprVp/PM9vi8CkYksqH9lwv
	 0KW/Y7eXnjmHRBPOokrRrf/vKW7znD2how5Rm7j4/YU0ipme/NjIaZ8mn9lIi/NwrT
	 dtMt3ZU+yjBpQ==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Haren Myneni <haren@us.ibm.com>,
	Nick Terrell <terrelln@fb.com>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jens Axboe <axboe@kernel.dk>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Richard Weinberger <richard@nod.at>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	qat-linux@intel.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org
Subject: [RFC PATCH 05/21] ubifs: Pass worst-case buffer size to compression routines
Date: Tue, 18 Jul 2023 14:58:31 +0200
Message-Id: <20230718125847.3869700-6-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718125847.3869700-1-ardb@kernel.org>
References: <20230718125847.3869700-1-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089; i=ardb@kernel.org; h=from:subject; bh=ODoi2e+vcqIb799pflsdMhm1nGdkubtWgbUegajrVfU=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIWVbT9FzF2aeyo1FL46LhUf9emTqUM1q5dWwJ2Dzr1cTG sRaswQ7SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwETqRRgZriduT8+o3D0pY5fL upjHTB/UclQ3ycjOPOLy0+e+sqX/b4Z/Wgf3MzUs1I/L09XztZ/lvWNdMcPstI16pS5bDvIdeTO NGwA=
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_140025_445924_C44303E7 
X-CRM114-Status: GOOD (  13.70  )
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

Currently, the ubifs code allocates a worst case buffer size to
recompress a data node, but does not pass the size of that buffer to the
compression code. This means that the compression code will never use
the additional space, and might fail spuriously due to lack of space.

So let's multiply out_len by WORST_COMPR_FACTOR after allocating the
buffer. Doing so is guaranteed not to overflow, given that the preceding
kmalloc_array() call would have failed otherwise.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 fs/ubifs/journal.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index dc52ac0f4a345f30..4e5961878f336033 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -1493,6 +1493,8 @@ static int truncate_data_node(const struct ubifs_info *c, const struct inode *in
 	if (!buf)
 		return -ENOMEM;
 
+	out_len *= WORST_COMPR_FACTOR;
+
 	dlen = le32_to_cpu(dn->ch.len) - UBIFS_DATA_NODE_SZ;
 	data_size = dn_size - UBIFS_DATA_NODE_SZ;
 	compr_type = le16_to_cpu(dn->compr_type);
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
