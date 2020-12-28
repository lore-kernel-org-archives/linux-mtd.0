Return-Path: <SRS0=5rSU=GA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E02D2C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Dec 2020 18:56:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C7EA221F8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Dec 2020 18:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C7EA221F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tYmiF+IsdxbuEtlIf5CnKs7CPksrtNNkYv8HZfcABRU=; b=jX+b2FjjDSGvrZkmOxTHVeVOwd
	Bo72f7e6O8aIFRm1Uapu391sW5OoKg8qecAbOK/3qsSFVUAZDhyajKliJexS7VyJtd0LOU8GxwUk0
	kZIsmlwb6j71UuTGnyEzdLqI6FbEDmvhPxoPqcj28LGFiDvkj9VjJ+ON2mFo6QeugRIB8xak93jJx
	HXzYJHvv8KGCnug2FHZa+Q1giEE1ZEnUMGyMFskdsajmyOaCzypFMoRSAo7DKG9g33rN3CtN6Q5yG
	w42KGflAzz8X178yNq38hEV1N1MlgV7ghpBotYn9jf4PVnEPHdE6ZZDEyWQAYwvrlNlpW3PTeznXB
	gdmcUUVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktxgE-0007IS-8P; Mon, 28 Dec 2020 18:55:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktxg6-0007Ff-Sj
 for linux-mtd@lists.infradead.org; Mon, 28 Dec 2020 18:55:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26B51221F8;
 Mon, 28 Dec 2020 18:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609181728;
 bh=VkM+zALiqlg97TIjo+lgwe+6aK90+NNjU4+Z9i2Ja24=;
 h=From:To:Cc:Subject:Date:From;
 b=ESLnjXJ1nWfg071HzMKi/VfMc46fxKf9sg+yrbZG3jQShKB2zf8GvycxGjG9U0Wq0
 zxZ/M3JAGElSFaoJ3DvCZhYO8QqQzYTFYSIpwnTG7D4XPRncnVmEjney2iv0O4MWbp
 5ex621LfQTUa4CnDtpFtITCIexEo2MIA7qCcTD4pZU9S+r+vro3DysR3L7bAYy4jYp
 Ecn8zRekNnyoQY7zRxZu0drNqbMSKb+cv9C5BQnKrYQdEy/sW1SWWyK4uqDgQtzFNz
 DDRxrxOGQe6cwRBmMnWrp41pfs8t1krRUDkAWK0xaDYjiWLZXDvWumXu6XsfETJQZ5
 N+xvAYvaKrGPQ==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Subject: [PATCH 5.4 0/4] fscrypt: prevent creating duplicate encrypted
 filenames
Date: Mon, 28 Dec 2020 10:54:29 -0800
Message-Id: <20201228185433.61129-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_135535_174217_38EEE353 
X-CRM114-Status: UNSURE (   7.67  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Backport four commits from v5.11-rc1.  I resolved a conflict in the
first one.  The rest are clean cherry-picks which didn't get picked up
yet because they depend on the first one.

Eric Biggers (4):
  fscrypt: add fscrypt_is_nokey_name()
  ext4: prevent creating duplicate encrypted filenames
  f2fs: prevent creating duplicate encrypted filenames
  ubifs: prevent creating duplicate encrypted filenames

 fs/crypto/hooks.c       | 10 +++++-----
 fs/ext4/namei.c         |  3 +++
 fs/f2fs/f2fs.h          |  2 ++
 fs/ubifs/dir.c          | 17 +++++++++++++----
 include/linux/fscrypt.h | 34 ++++++++++++++++++++++++++++++++++
 5 files changed, 57 insertions(+), 9 deletions(-)

-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
