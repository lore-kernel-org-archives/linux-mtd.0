Return-Path: <SRS0=Kb5f=GC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC280C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Dec 2020 15:38:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69C53207A6
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Dec 2020 15:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69C53207A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:From:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=e6dwCKjby4n4lnkze/9c14/rZMYHeyHaNQQMJcvvQFc=; b=OB7X6eL8ud65rsCujySMh7M34
	9m/WVTl9LrNRaYftXf8VwYuP5zKpk0p1WwnFya1vemPdIieNiUBT955kFoGzcU2OjWn2CZEykOMNY
	6t4cJ4PrVn4lJ10dfj0J7GgTzWGCjrfJMorxCaypFOB9aRKt0kRBOqebUlikaelMYAqR4qWemRoI7
	bS0tJN1j3IQQ7mbCUMHPzgQjU6lH3Pqgc1uCDgTbrMqlAVN8nvRBHFcIslVk+LDA8p5g0jcXxdyIl
	0zP6Ca2mGeWV8yomZ5TcEExcTB9ITZKPDZtOYLhMBsdyRwiXuti9GHXATvSuZ0lObyKfe405QlqeT
	qyzd09Dbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kudXr-0003Vq-Ci; Wed, 30 Dec 2020 15:37:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kudXo-0003VT-PR
 for linux-mtd@lists.infradead.org; Wed, 30 Dec 2020 15:37:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 95400221F8;
 Wed, 30 Dec 2020 15:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1609342665;
 bh=yJCd1TLplkusIOGz9dpxRiUpI16UhGE3RgRGWueBu6k=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=UN2GfsuUgYQPBfQWBvaM0FGvrDWkDDZxFV2rcb2d4d0TkxU5ZiXbqCAippOrjJhrq
 IlAezIB3xBKW2J1hkv6JA9OXyu2pkjNwdqPjuz9Xj9bR/fJCHI10UgtbkqvcueAyuy
 msFvnCanaqB1t9KNQ37UUtDLo86fxriotHwVDF8s=
Subject: Patch "ext4: prevent creating duplicate encrypted filenames" has been
 added to the 5.4-stable tree
To: ebiggers@google.com, ebiggers@kernel.org, gregkh@linuxfoundation.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org
From: <gregkh@linuxfoundation.org>
Date: Wed, 30 Dec 2020 16:39:11 +0100
In-Reply-To: <20201228185433.61129-3-ebiggers@kernel.org>
Message-ID: <160934275175130@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_103748_904570_AE0AD138 
X-CRM114-Status: GOOD (  12.13  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


This is a note to let you know that I've just added the patch titled

    ext4: prevent creating duplicate encrypted filenames

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     ext4-prevent-creating-duplicate-encrypted-filenames.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Wed Dec 30 04:37:58 PM CET 2020
From: Eric Biggers <ebiggers@kernel.org>
Date: Mon, 28 Dec 2020 10:54:31 -0800
Subject: ext4: prevent creating duplicate encrypted filenames
To: stable@vger.kernel.org
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org
Message-ID: <20201228185433.61129-3-ebiggers@kernel.org>

From: Eric Biggers <ebiggers@google.com>

commit 75d18cd1868c2aee43553723872c35d7908f240f upstream.

As described in "fscrypt: add fscrypt_is_nokey_name()", it's possible to
create a duplicate filename in an encrypted directory by creating a file
concurrently with adding the directory's encryption key.

Fix this bug on ext4 by rejecting no-key dentries in ext4_add_entry().

Note that the duplicate check in ext4_find_dest_de() sometimes prevented
this bug.  However in many cases it didn't, since ext4_find_dest_de()
doesn't examine every dentry.

Fixes: 4461471107b7 ("ext4 crypto: enable filename encryption")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20201118075609.120337-3-ebiggers@kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/ext4/namei.c |    3 +++
 1 file changed, 3 insertions(+)

--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -2192,6 +2192,9 @@ static int ext4_add_entry(handle_t *hand
 	if (!dentry->d_name.len)
 		return -EINVAL;
 
+	if (fscrypt_is_nokey_name(dentry))
+		return -ENOKEY;
+
 #ifdef CONFIG_UNICODE
 	if (ext4_has_strict_mode(sbi) && IS_CASEFOLDED(dir) &&
 	    sbi->s_encoding && utf8_validate(sbi->s_encoding, &dentry->d_name))


Patches currently in stable-queue which might be from ebiggers@kernel.org are

queue-5.4/fscrypt-remove-kernel-internal-constants-from-uapi-header.patch
queue-5.4/fscrypt-add-fscrypt_is_nokey_name.patch
queue-5.4/ext4-prevent-creating-duplicate-encrypted-filenames.patch
queue-5.4/ubifs-prevent-creating-duplicate-encrypted-filenames.patch
queue-5.4/f2fs-prevent-creating-duplicate-encrypted-filenames.patch

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
