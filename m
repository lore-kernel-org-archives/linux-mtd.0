Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F2FC433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Apr 2022 09:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ISQWaOnqpZvLGBFHOk/7hy0zEdt1bonbMm2sEBUCkG0=; b=T14GaSz3CRf3yh
	0l5L/bN4TdZpDZ/y3qmjdAHOx1u+yK1OMCFTo0N3rTy+JifoYAqHLEClACbPbn3qWZnKcPhdAa0YE
	Quhaxvuv2IgfjT99I++TgKDwcG5VXe3FmarEQnFbYeplO8Aj0rRoLlGaDYB7OmFgdsoIulhGpkDlw
	nN+fmk4lKZerwUDP7Jrtagj8nvCX5h4RbQM7wdncsFPIEcpFStu1fofl05lY7jFTU33L3T2mlJtQW
	2XqEKQULGd60HVZlCS5XniHop4rmDg2KqPNHvSDXOHAkJx47KW8S1IZkForNfObt7dBwod3t1sLhv
	xXXtCSP0kZPFM6fQOBFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niYby-006HIS-7g; Sun, 24 Apr 2022 09:32:58 +0000
Received: from m1368.mail.163.com ([220.181.13.68])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niYbv-006HHh-C1
 for linux-mtd@lists.infradead.org; Sun, 24 Apr 2022 09:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=AtvzS
 aLWlC7IlkUz6bURf12RR5fmy2viy9vUVKiXeLA=; b=FynjFg56hzD5WVYXB1VsO
 dsVVlFGEGN7c+cqbUGL4Kf8M0gIazT0crimqzaN9FbTe28O+4W39lyzG1/BHyTos
 +G4FsDxZKpj/wb8scEhidrCAWeasSGnFBxElKbmSWgGX/pyi5rbVuzpe6LKf6eZ9
 LgevN+gM9CfOywhCzZCHS0=
Received: from yuanjp89$163.com ( [116.63.76.106] ) by ajax-webmail-wmsvr68
 (Coremail) ; Sun, 24 Apr 2022 17:32:51 +0800 (CST)
X-Originating-IP: [116.63.76.106]
Date: Sun, 24 Apr 2022 17:32:51 +0800 (CST)
From: =?GBK?B?1Ky9qMX0?= <yuanjp89@163.com>
To: linux-mtd@lists.infradead.org
Subject: UBIFS: is the corrupted file in a finite state when power cut ?
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210622(1d4788a8)
 Copyright (c) 2002-2022 www.mailtech.cn 163com
MIME-Version: 1.0
Message-ID: <77eb7829.4ee3.1805aeab188.Coremail.yuanjp89@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: RMGowACnUYlDGWViGLgQAA--.18155W
X-CM-SenderInfo: h1xd0yrsyzqiywtou0bp/xtbBLwTs+GHmmKyViQAAsQ
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_023255_800914_F52D212F 
X-CRM114-Status: UNSURE (   2.03  )
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

These questions puzzles me a lot, and not mentioned in ubifs documents.

Q1. Power cut while writting to a new file,  does the file is in the following finite state, not possible in other state, right ?

	1. the file not exists.
	
	2. the file is empty.
	
	3. the file size is partial, but no tail hole.
	
	4. the file size is partial, but with tail hole.
	
	5. the file size is entire, but with tail hole.
	
	6. the file is right.

Q2. Power cut while truncating old file then write

	1. the file is not changed.
	
	other states are same as Q1 2/3/4/5/6

Q3. power cut only lost tailing writes ?

	write 3 times: a b c, it's not possible that b is lost but a c written.
	
Q4. power cut only lost whole min I/O unit size ?

	with 2048 bytes min io unit size. write 100 bytes in one write() call.
	it's not possible that seen 20 bytes with 80 bytes lost.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
