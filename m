Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951B9606A89A
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 08:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eMAY+bWr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lFcdQ8Pk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UPowu19DpSD5nbSUVRdEZVnmOvmFSpM/j8uMxv++nTE=; b=eMAY+bWrVR8FVUgwDMvF/wpWsj
	7WdHayL7QBCIXmbbP+Ue7g8zFeyljJKDdQ9HM6vKfvx7ATYmufstBXazlEAfOC2Ze/jo7utYfY1Fo
	hf02AwOi36VMCU+VG0ZdFsx4DCS89PytF9SK185IZmyeS6KyMBckQ9mJdotansXoIOOZaOjKlM+PR
	czo4hK64ZjUPNQ1urk/SvUMSCD9O30dJ8cXdZ70/Kxu2lRPQ9cl6rtD7eiKY53AxA/XML8IMimPFt
	prqRQkLpQ7PIAOtpdWdHkdFgayBgbSwRq8JnfggLOBC5PNDjyrQylcWPpcaDSxTLG2QOd43HuUsc0
	Ufj/DQbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTErG-00000004x1z-2q6F;
	Tue, 17 Nov 2026 08:48:06 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTErE-00000004wzc-0SGS
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 08:48:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 33423C4EDB9;
	Tue, 17 Nov 2026 08:48:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D09645FC81;
	Tue, 17 Nov 2026 08:48:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8BF9611BC05B4;
	Tue, 17 Nov 2026 09:47:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794905280; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=GMyeOCsyGmqM0NGa1D39iQ2yejMGrgEyQhAWsjlLHwA=;
	b=lFcdQ8PkPSBaiStysmxpPVTBLxmywr0b6pErWiPibBHQekSfhmjSJJIwhTFyJiY8oF50PE
	GLICO9NWMTTTROMe1XuSuOyJ7eVqYoT1zV5V8oDEsiakvaqk6FVkwkAAVKCTVz3x4ziZuO
	o5x2K88fOqQ3uKhCum+CJRYQ3YM8h9BLeZmdj3fYgHaXYlWn434/PJkMvF0Jnv2lZcEE93
	4k5jE8Z71O7EwMNuGImTKeukmh+gBHE22CdXGe6j0QcEwkK8TSkDKNIi4NyrtgeVethg64
	af1h00oYDDPSDfVoOa17NI+39gsf2PIC88PK2v4RmVBGgoldnmuPY1/Vyz49FA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH] mtd: spi-nor: Reschedule in spi_nor_wait_till_ready()
In-Reply-To: <534257c9-6f48-4a01-8589-330e4e4e41e1@acm.org> (Bart Van Assche's
	message of "Fri, 6 Nov 2026 13:11:08 -0800")
References: <1b755e40b80fded4b4b4c1f1c81f0d171012a1de.1793999093.git.bvanassche@acm.org>
	<534257c9-6f48-4a01-8589-330e4e4e41e1@acm.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 09:47:56 +0100
Message-ID: <87pkw3oncz.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_004804_331975_49894D19 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 06/11/2026 at 13:11:08 -08, Bart Van Assche <bvanassche@acm.org> wrote:

> On 11/6/26 1:04 PM, Bart Van Assche wrote:
>> In spi_nor_wait_till_ready_with_timeout(), cond_resched() is only
>> called after spi_nor_ready() returns 0. If the flash is already ready on
>> the first status check, the function returns before reaching
>> cond_resched(). This happens e.g. under QEMU, where SPI NOR page
>> programs and sector erases complete synchronously during the MMIO write,
>> combined with a controller driver that polls without sleeping.
>> Consequently, multi-sector erases in spi_nor_erase() and multi-page
>> writes in spi_nor_write() may iterate over thousands of sectors or pages
>> without ever yielding the CPU on kernels built without
>> CONFIG_PREEMPTION, e.g. ARM32 kernels with CONFIG_PREEMPT_VOLUNTARY=y.
>> This triggers soft lockup and RCU stall reports.
>> Move cond_resched() to the start of the polling loop such that every
>> call reschedules if needed, even if the flash is ready on the first
>> check. Doing this in the shared wait helper instead of in the
>> spi_nor_erase() and spi_nor_write() loops covers all callers that wait
>> for a program or erase operation to complete.
>> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
>> ---

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
