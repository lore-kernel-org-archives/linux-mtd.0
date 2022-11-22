Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59796C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Nov 2022 09:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C54aVdvR5rh8KKxC7q1STXLOlYhQe25BJOfN99ElQ1A=; b=oyZk0XBHUpl99i
	vRsyCP2tZEusKC2PHqhpKUOU8rr18yN0gx/Ns3mRVB9OYyIqf8Tp9ZI15IywMnDAI+Pyr6f0TCSSw
	tECP+K07wH518kMmYDU47Ujp/HKqbrfRBXLXq3jkRdltfwn+FMshU2yX5O4fG2MlUx9HsWQuZwQhD
	lI6wsgSdGcrCtdFaP6F1DEHA8b1R9S+6GzpLEf1+ILiJO2SR/3mOOX6Hkn84rancwbJsB9qwPG5re
	5GojIlyef06spTlRbzdPU6dXGOQyJCc7AG7H2ZlWwZ6l1zg1y1x5M0qq0bWt9bqccTghsjE4ddHpK
	VQvMxBF6J+GjGdDZIWgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPNR-006s0x-Oy; Tue, 22 Nov 2022 09:15:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPNO-006rzp-Qq
	for linux-mtd@bombadil.infradead.org; Tue, 22 Nov 2022 09:15:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=0BgaW9t8GFER5QecxVkFsHrVi3gO/4V5KAZgJaiRYBs=; b=e5Wad9w2CVmIwOq1DOYo8/ak7O
	RaRBiiWlSkpLtOf7cbeVMISruyZtK8IMp6v84LKz0xZxq8YSbF8Jo3LtCVY8UmKzv/u0KtsBI6+Xq
	feYrQRom9TDgVCs1Q3tPw1kYWaj8vEHUVHsuBG0XfpnN9rJyMxwENrhwAIrtfl3bPrLzqNZWS4tEt
	dTlIq0p+7qgT4wYgNH0SXn6s9SN7T+8nUtGK9Se3cGWPKVQqHI+5WLOw9gYk4tdxdv+G/GBe1g7sY
	clSca3xJIfA1tdJR9ZOx9epmnQE3Rqag5SY6mwszRdzzvRP2HRim+GcUfOQNbxe5Tw9UoMrSwr9Wd
	vqoIJGog==;
Received: from mail.axisfairfi.com ([94.177.230.134])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPNL-003O9k-NS
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2022 09:15:33 +0000
Received: by mail.axisfairfi.com (Postfix, from userid 1001)
	id C79E082592; Tue, 22 Nov 2022 09:15:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=axisfairfi.com;
	s=mail; t=1669108527;
	bh=0BgaW9t8GFER5QecxVkFsHrVi3gO/4V5KAZgJaiRYBs=;
	h=Date:From:To:Subject:From;
	b=O1RRWmjp2NTQO8xMj10HeKgNz3paK74Og6QlvdnS3o79oZwA9j5edF/K7mdVehAK9
	 eRRxeh+5EjSouTto3oUBaNaiAs+F9lNdA29kFw7aGvuqJfU6Y/NDcA8pijMiGw9sIi
	 0hIJqvGgC567HuLVYvvcHcrUWwE2SmfdDXF8Gjtrc8aKJKKCnJgp0/RRgUhHqZNjR8
	 xdNhimHpLJyaRTocSM6DLGWQVrc+mVlaZ8wyg9p0UaUy2QufoplHuMOmx6TxtxHfcI
	 Xb7k+O9T/oDBFMC5LT4jpZ7LcqtrDwLOoH3iUAMFne8QA9unAcEpJWSeXrImMNx/zX
	 sKuvEt5cxP18A==
Received: by mail.axisfairfi.com for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2022 09:15:27 GMT
Message-ID: <20221122074500-0.1.d.o7w.0.mp5yp4mc7m@axisfairfi.com>
Date: Tue, 22 Nov 2022 09:15:27 GMT
From: "Zbynek Spacek" <zbynek.spacek@axisfairfi.com>
To: <linux-mtd@lists.infradead.org>
Subject: Silikonmischungen
X-Mailer: mail.axisfairfi.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_091531_873305_DCF955CB 
X-CRM114-Status: UNSURE (   1.66  )
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

Good morning,

do you need intermediates for processing, plastics (e.g. rubber) or silicone mixtures?

We provide a wide range of silicone rubbers with various properties, silicone mixtures from renowned manufacturers such as Wacker, Elastosil LR and dyes, stabilizers, primers and anti-adhesive additives.

We also produce technical silicone compounds with increased resistance to oils, resistant to high temperatures and water vapor, conductive and many more.

We provide fast order fulfillment, timely deliveries and cost optimization.

Can I introduce what we can offer you?


Zbynek Spacek

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
