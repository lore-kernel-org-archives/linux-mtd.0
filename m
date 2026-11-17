Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF041606A8AD
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 08:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gAYgCtfx;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=apGx4gLP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RJ4rCQqgFUFxTYAPi5cHoqbvTt2TtrIqyT63uSgjdi0=; b=gAYgCtfxVsz5KnW/mG9Yb2z/KQ
	agWLswnwt97XUSKlIUjIHCWmoikOnDeapsxV3gKvWVPcs6zWqhclvDmiHhiV9OFQiHBolbywiCkoT
	5EdFqWW9uuiWreTTyqLMwNNC1feKYSeK2FtiibczWkzamXoH/wcSjP15Z4JF2MySAcNMMUaliRLM2
	iDDsNo/lcDuvSpxLpSxFk7Z26Y2fUvtuZwIsm6+F1AH2fUJbBhTRCkMr4nV2MnlJdhaV/b0N62pUc
	zWSp7L6aqr5ze/OmHgVu5sBjy7j/QhmbuAswW8YB7vEHQiBeUTlZmLcRWmW4xxk/AszePJ7O45rRa
	7NAFcyyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEjs-00000004vIs-3csr;
	Tue, 17 Nov 2026 08:40:28 +0000
Received: from out162-62-57-137.mail.qq.com ([162.62.57.137])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEjp-00000004vI8-35OS
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 08:40:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794904816; bh=Ow56Dh1ceICwHURLVlW6HlZuR50fD/53SALcfaqTYVk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=apGx4gLPIlOPLKOk4xL/Q/8f7+D8ZEpKLQqtBmUMTVngeESiBQKl0DdJa1Vn5BQ/+
	 sAXfdT8Tb9pgjgtV1VrN+xHwamqZyP06gauAR6hRgeHx3LywY4HVK/N02MqOJ+yQ99
	 vCCAAUow5oQcxdKIS4d+T2lqZeOFXvGVFs0Lpwl4=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.199])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id A0DAEC6E; Tue, 17 Nov 2026 16:40:13 +0800
X-QQ-mid: xmsmtpt1794904813t0e4zgk25
Message-ID: <tencent_3E79DC265C5C09B1C98951775AE90D167707@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5dXmrjEO9y8FyXa/2kTS+cCFIhe5BjIeynOA5Xr5+NcgQhn+yhe
	 1j3rK9VEG0RM2RZxBryByY41vRX/LchtSmGS2sJuxFFixpPnYsxyK3h/V9Q/h1OVgvrzzD5iK6Ef
	 zEWwmB6BhcMN4vuNUqp1OHqF9DgcnwGirDTuSEPcA+pPt0jFzxbR5TVRsmqGHvR81wR9fHbT4Q8V
	 n2yND2tDt2TUtTtHiQ++Unw6JRK0u0NlwL9PDqj/GSebrtwt9w4eLdxWyBwyEVUOTIY51dPjH9yd
	 HSodN27I8SFJnVOwX6orkaOOlIoSStOhO0BZEXfJVdnww+7H3qfQgxkWcfSgPhXApxwCXMzmt8X5
	 InqDuBPowkIkcYHeRdMLH5nXXjEt86BZxiL+tGl/703wIPeKYoMN74wzz0YEv8Dc4OyEzQ/3k20i
	 zfcj59vEIs448TvLBn2aduNFRbtX/BdFKld0Prs3TLXa36Eb9yhzqpaBFm5hy+Lpc6F9YcbIZNQE
	 3azGtG+YndmhngjCqcTo89BLUGMhEdpil/x+1ddYKQQMJiFGeq99Gpe91VP7PfjGQjiIlyoKdI9n
	 UnT6zHeWbmW04dvT7OYnwPAY5nPhgNTmJAi0RqyYDNzgDcg3AcsQcEqHvIRIyFBi+CDLxBM7BzdD
	 0gIdDSWkF8xOJlmu6tQaf3EkydHrCwvM5JwBDxkGUzkAIYGtrKcH7g4JC/uP7UMux9sw3MKofOxw
	 R8UvAL6SqebrlUrnoULFeN9flSnbd3ADVdko1uCWj99jUcvgQknzr70PlIcXim5JOqzOC7413T4M
	 iS5mg2ybrie2FvQiy2nJdC5+75Ln01MoxkxVO24hK10q4xKLrT6OKmu/vwIM3tkujBx9b8KH6s/R
	 NZWz2/zbsG84p/leIxJTjJ6JkG4VJsXAWQ5r6MHPHWWVa9W42lHuqnOreFBHQwucJap1xR32/c1b
	 9fb0A3pkpGu5tjd6O0H5gbJG3gzeCvt1F85J2HSvE1h4/HArfsEchI4HudvIStkZ28DuZ/iBiQ1P
	 OXI7Om6AlNMpdXog5Qj4GCQSU7/xAH14lY1YNJYUecfC3r/+7CqBAcuGm97cigXAgwuK4p1w==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Shuai Liu <847807867@qq.com>
To: sashiko-bot@kernel.org
Cc: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	syzbot+c66e7044aa73c620d862@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org,
	847807867@qq.com
Subject: Re: [PATCH v2] mtd: blktrans: keep reclaim out of the ->release paths
Date: Tue, 17 Nov 2026 16:40:13 +0800
X-OQ-MSGID: <20261117084013.314303-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-218282@kernel.org>
References: <sashiko-outbox-218282@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_004026_500473_E32A5BBC 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

> [Severity: High]
> Does mtd_queue_rq() or mtd_blktrans_work() actually call
> memalloc_noio_save()?

Yes, the I/O path is already covered on the current tree.
mtd_queue_rq() wraps the whole dispatch in memalloc_noio_save() /
memalloc_noio_restore() (drivers/mtd/mtd_blkdevs.c, linux-next
next-20261113):

	static blk_status_t mtd_queue_rq(struct blk_mq_hw_ctx *hctx,
					 const struct blk_mq_queue_data *bd)
	{
		struct mtd_blktrans_dev *dev;
		unsigned int noio_flags;

		dev = hctx->queue->queuedata;
		if (!dev) {
			blk_mq_start_request(bd->rq);
			return BLK_STS_IOERR;
		}

		/* Reclaim must not recurse into I/O while processing requests. */
		noio_flags = memalloc_noio_save();
		spin_lock_irq(&dev->queue_lock);
		list_add_tail(&bd->rq->queuelist, &dev->rq_list);
		mtd_blktrans_work(dev);
		spin_unlock_irq(&dev->queue_lock);
		memalloc_noio_restore(noio_flags);

		return BLK_STS_OK;
	}

This was added by commit d498b2ddda99e ("mtd: block: prevent reclaim
I/O during request processing"), which is also the precedent this patch
mirrors for the ->release() paths.

The REQ_OP_FLUSH example given in the review (mtdblock_flush() ->
write_cached_data() -> erase_write() -> mtd_erase() -> concat_erase())
runs inside mtd_blktrans_work() as called from mtd_queue_rq(), i.e.
within the PF_MEMALLOC_NOIO scope, so it cannot record the
fs_reclaim -> cache_mutex edge.  I verified this empirically in QEMU:
a flush issued while cache pressure is high stays clean, while the
same flush invoked from ->release() (process context, no noio scope
before this patch) triggers the lockdep cycle.

I believe the review comment was based on a truncated snippet that
dropped the memalloc_noio_save()/memalloc_noio_restore() lines
surrounding the quoted block.

Thanks,
Shuai Liu


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
