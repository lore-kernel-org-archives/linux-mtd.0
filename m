Return-Path: <SRS0=UT8Q=ZG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49317C432C3
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Nov 2019 06:28:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E1D720709
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Nov 2019 06:28:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GJjlGZdZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E1D720709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:From:Subject:
	To:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P/Zs5SEtuqopBFu+/xAdrOJDoI8RSxuL6MuYkTJY/KU=; b=GJjlGZdZ7eKseX
	CSlVONv96MqfRwNzk7reFvOJUXOIYVUYZ/McFn68QwhRETk230MB7iF3IHMvuOOJ4EIaVcxqlEpJK
	CmLEeo0pzVDXKjVhql5Asnwa+GwK+o5k+WftrwHb6dcIvorXhQ1xvkJduTbVg9xkzcW+IA51NsZpO
	5AUn+b+2VtOoIjdMiJmO5KTX3q7MUVNGahN2l2+8pXCnj02eKypIWCNKoTiwulAhJZZQXW5hS0pgb
	j+ObuDNbIooharmrI3gRIDSOLrRGgH/JggwiKMBdksFbtKsIhK1k6pfY3ykVScp42yS4/R8AKQC9v
	hp4B8vnhjUVTV2dGNDnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iV8bj-0003A3-UC; Thu, 14 Nov 2019 06:27:55 +0000
Received: from [157.230.188.97] (helo=srv1.arihantpolypacks.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iV8bh-00039V-OE
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2019 06:27:54 +0000
Received: by srv1.arihantpolypacks.com (Postfix, from userid 1038)
 id 3D0913F7C1A; Thu, 14 Nov 2019 12:06:09 +0545 (+0545)
To: linux-mtd@lists.infradead.org
Subject: Acknowledgement from RKG GOLCHHA GROUP
From: deltatechaadensah@gmail.com
Message-Id: <20191114062109.3D0913F7C1A@srv1.arihantpolypacks.com>
Date: Thu, 14 Nov 2019 12:06:09 +0545 (+0545)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191113_222753_859853_FE78DD1F 
X-CRM114-Status: UNSURE (   0.52  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello, 

We have received your message and will get back to you soon.

Thanks

RKG GOlHHA Group

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
