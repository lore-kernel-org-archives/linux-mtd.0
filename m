Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D350ACA5FFC
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2026 21:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bPv0w5y1bMrcvVXpJ5VKZgvObnhZQipj6TS/yoGQtCs=; b=Dq2Py/VZtwDh0/
	g0n7coBXiC8gB7hJNjbbDELVoFkSLkRAwrQA88qmXpWO4BpO/k+FtBYA8e6uP2qQOzAM4K5hmzG/h
	Ci7UTSm6V+mm0j/4JmFcEVoRl9VS9fxUml1rZQjfVCPcUrGgjeLgsVBtQGgl+wl+lKE7irimNBasv
	c+Pe0X3q7JR1ipEj4eKuAg+iqTUi7jcMTHOj5zniYnPOXvJFDUcPqQISTbirnbifbx2H+9UOnaF2e
	qpj7lUPdHTyBl1xHOaBwMlaom2Kz/bcDlCDlbFouUmaIciBIffCfBIefucT8IsCHVart3uRLuBLcs
	Ew+sVwjoZX9YHxg0/yng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xECpr-00000001Po2-0yYz;
	Tue, 06 Oct 2026 21:36:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xECpq-00000001Pnv-2AZb
	for linux-mtd@lists.infradead.org;
	Tue, 06 Oct 2026 21:36:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 82186600C8;
	Tue,  6 Oct 2026 21:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B016F1F0089C;
	Tue,  6 Oct 2026 21:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791322589;
	bh=LDBhAUhPbYAtpsIsnb4FK5rAk3mUFJa9SCOXScvfWaM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lT9n2STAdyYFo6gzvAZXdZdCOwJA6qs5B/6SMD/cmB2QH3o1eLyxVya8uhj86szxi
	 l3HgHjYNZ3S07+WXVGQcyqjk+0sIR1yc4PZJwSMw+1eil1qJvVMUSRE80Vz5up+Qxh
	 j4LVu32qsS7H5lVi8FFtSP2Jd/MiTZynhEQKHC1HNdegoQaMcfTjFUCrQZr0MXXHfr
	 O4g0cAnl1RlC3LpwEUJHou7htpG1gpc3esE14u+Q7bO6Icm+EVgfg023vG+Qx/zWqN
	 l0yQAApHV9hAv9Jl0ZSjyyHSy2teNkVBXhCeu7DBkvziu65nuPFXqBDBehJC2HmSFG
	 xbCiHuikHSCEA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	mehmet.fide@screeningeagle.com,
	Mehmet Fide <mehmet.fide@gmail.com>
Subject: Re: Please apply 68fe2faf5c69 ("mtd: rawnand: vf610_nfc: fix false bitflips on reads of erased pages") to the stable trees
Date: Tue,  6 Oct 2026 17:35:44 -0400
Message-ID: <2026-10-06-1-daily-reply-0012-vf610-nfc-erased-pages@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005153956.238827-1-mehmet.fide@gmail.com>
References: <20261005153956.238827-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
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

> please consider
>
>   68fe2faf5c69 ("mtd: rawnand: vf610_nfc: fix false bitflips on reads of erased pages")

Queued for 7.2, 6.18, 6.12, 6.6, 6.1, 5.15 and 5.10, thanks.

-- 
Thanks,
Sasha

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
