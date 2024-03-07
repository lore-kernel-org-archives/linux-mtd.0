Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A82C54798
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2024 18:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pVoN7yKVA5mhM8RGHvAj33Aw7271MRG9sI8cw97UST0=; b=p3UbpGrxb9f7v0
	q1EmDtVCL5mSCSYAIWkMODU4BDQEcpc5vjgvm4PzmgVMBaPhunKaGB2MIVHwGzHWbW8amR0A18EHg
	iZbPPqYz9HvXMhaGXfbPgBqZEQEAvTA9u9YxU/Nu90/aCdiUxjanUXVRggT1p83w0rLh5jkeqUImN
	IA63RbneuKN9LvpLf0cLjxyClUmrAGmgDm/6as5+kAXeSACzfAGnP8hOMblU4IwjNVdTVp0943XXj
	TA3ccNMROAz6YkjWECjkrruuKOAHQhwzYu6xmX/ZiVmHORJCkCiPqG5dIC7vn6Tuio1mAwHnM0VXW
	S0cB/aKf9YGjc8ZTdTfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riIbh-00000005t6L-2Crg;
	Thu, 07 Mar 2024 18:36:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riHYU-00000005h15-16gd
	for linux-mtd@bombadil.infradead.org;
	Thu, 07 Mar 2024 17:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=INBnBefA/N55FIuu5yy0zef6mNSIr7WS39BueUt6jTw=; b=ZUv3GhZ9O+uLDwPi+2GQ9lUKd6
	uc5uy/j+48Zac4cOHYgUXrESUC14e3lQIiLbM1bfq/0cTRDZRMFtP8Dqaj88DnVVcD91JuKhJmVSG
	h5BpjlJ1ksYkeIXa/f3+9qKNCYf6zBWyOJlPYB2vKFYMlFWe3wVljb9/DJT+J/WPbBxlMlpXgU/27
	qnUppLoJNNYN74p1U1x3BJgqAXIAqHs40RFEhg6zj0LFUd+Af25/i7iERf1nIDZLGYHNP35nHPJl+
	Iuc+UhSPyFe9ldUbfZUv1T5a7GB9whdAqF8VKivVbgO89u+hf3UAdI6CUZ7iLKWaskMhHwpHvOvXX
	m708ELDQ==;
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riHYL-00000006oMW-1UB6
	for linux-mtd@lists.infradead.org;
	Thu, 07 Mar 2024 17:29:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EACEC0007;
	Thu,  7 Mar 2024 17:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709832543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=INBnBefA/N55FIuu5yy0zef6mNSIr7WS39BueUt6jTw=;
	b=l4aZ7vspb5AUynnn+1oVbm72gNtIkNXJ7I0YQInRWYUZIsLjy0fNPAZx6zgX21fyPVkMj1
	jGlHKmtFHY7Q19x2qGjRy7jsekY7hvmeiBUWn1+jUtvKzlt4orQzErMiMPqEpI2iNKmQhc
	KOBPHljlrHMsepM++ZM62YSdxmOes0SaYvw05N9JIIBwfM6p3aJBRou/iIZWv1kvRHZ+gB
	/c57m3xHlOnCIedk6LIBjMYzCzwUCXylVQ7nipo+dpBXfKBN0aJxwo5XUWs19WTqdSKDuP
	ckVygwgKhhLIirD7uEfRcYJeMtcKrjuE8pYMZQOvo6fmlMUvAKcHv89tHZwSuw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	eagle.alexander923@gmail.com,
	mans@mansr.com,
	martin@geanix.com,
	=?utf-8?q?Sean_Nyekj=C3=A6r?= <sean@geanix.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/3] mtd: rawnand: Fix and simplify again the continuous read derivations
Date: Thu,  7 Mar 2024 18:28:58 +0100
Message-Id: <20240307172859.3455856-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240223115545.354541-2-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b7da181307b928aa44349cf8eecd82a590ffbfac'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_172909_546151_332ED3B2 
X-CRM114-Status: UNSURE (   7.90  )
X-CRM114-Notice: Please train this message.
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

On Fri, 2024-02-23 at 11:55:43 UTC, Miquel Raynal wrote:
> We need to avoid the first page if we don't read it entirely.
> We need to avoid the last page if we don't read it entirely.
> While rather simple, this logic has been failed in the previous
> fix. This time I wrote about 30 unit tests locally to check each
> possible condition, hopefully I covered them all.
> 
> Reported-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Closes: https://lore.kernel.org/linux-mtd/20240221175327.42f7076d@xps-13/T/#m399bacb10db8f58f6b1f0149a1df867ec086bb0a
> Suggested-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Fixes: 828f6df1bcba ("mtd: rawnand: Clarify conditions to enable continuous reads")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Tested-by: Christophe Kerello <christophe.kerello@foss.st.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
