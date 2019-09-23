Return-Path: <SRS0=TNJo=XS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2A9C04EBF
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2019 10:38:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6264120835
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2019 10:38:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B56jPxCy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="V5hOthMa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6264120835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HERHQd+6bpHnpl+ZiTTRyi7rGRArShNMg+tmg2UewjE=; b=B56jPxCyrhwa3Vu1eX3MvF77W
	KIpUALVZs8rlAYbTA5f+g1ImuVEZvi2kjocvc5jiYEyOSe2fO9luwXP5D12PYcGtcy5TfCaOwwVNk
	Mq7BTM4ZyF99HSjXU1ZrPaHZkoBhlali8m2Ff1vtAI0hbWoRVICmM3f1kxXhvQly1I7oQrONucV8g
	KMqOqfHvDDkjyOqey+MclzKuCkeguGhH0W8sd/FP1Fye8DNPydB5jUHc5VsbiGRDZ2vaZUFTUkTQa
	XEQlUxxN51+l8ZsdKaqmMMreQPNZi/IvM23vkbILvloZzpSzHcpY/Yl3awC2PoLbTveEWJx5AoUub
	ZwOFVofRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCLjk-0005vK-Ug; Mon, 23 Sep 2019 10:38:32 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCLjh-0005uJ-3s
 for linux-mtd@lists.infradead.org; Mon, 23 Sep 2019 10:38:30 +0000
Received: from [192.168.100.95] (unknown [95.138.208.137])
 by first.geanix.com (Postfix) with ESMTPSA id 4AFBC839B9;
 Mon, 23 Sep 2019 10:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1569235079; bh=ySHhKCuFdhLYxwuxXnWTUd2yzNcREzp83CcW9ACr61Y=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To;
 b=V5hOthMableISvgJNH2Mm0Lxev89c+mJ3C9c+2jSgKXNmYx1u200v7lNFBH/T7igl
 9ASyF04vj/7lNqzT3hiMa3M3aPDoYT/Mx0ZnheVTVtM9T3/ED82MKATLArKdsjn/hC
 rdTBOtQPKOP+jiNOMSmaujB/lb+SE0oxVKtXjQUjFn877wopfX8nE3VqbOObqkbqPY
 DtBYwI158KO1VIz3vhYV/m4tkipoYmhsvLPsywREtynY3HTGT8bcw+MTD0Qo3QTYX0
 URxy1FlKrewa4qNd9GdgLvoslT5/wTn4oh85yEj2jTdGx6wJPUQg4uujt+nU5W7OAR
 abmghXpooskjQ==
Subject: Re: [Bug] mtd: rawnand: gpmi
To: Sascha Hauer <s.hauer@pengutronix.de>
References: <6a333d0f-09b2-d0d1-a3a5-955b31b6291e@geanix.com>
 <20190910095515.yjg6zcoqrtwylyg3@pengutronix.de>
 <a0f518e3-2465-8e64-418b-cac27cde98de@geanix.com>
 <20190910104807.7r3x2crdhpcteomn@pengutronix.de>
 <b26d583f-454f-fbf1-280d-f1753cc13896@geanix.com>
 <20190910110833.5ngkqpgdps4y3t2v@pengutronix.de>
 <3a1a0bf1-4dd0-9be1-23bd-a2e1f2bc6783@geanix.com>
 <a4a68ef3-3f66-3e5e-b0d9-cf5d5e898b40@geanix.com>
 <20190919132719.3ca48967@xps13>
 <6c0a1fdb-45cc-87aa-d1fb-f07f7e21a4a5@geanix.com>
 <20190920091726.qitfnktswgvpqxj5@pengutronix.de>
From: Sean Nyekjaer <sean@geanix.com>
Message-ID: <965e4192-26de-f654-c41f-e6420b008dc5@geanix.com>
Date: Mon, 23 Sep 2019 12:37:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190920091726.qitfnktswgvpqxj5@pengutronix.de>
Content-Language: en-US-large
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190923_033829_487226_01B2937F 
X-CRM114-Status: GOOD (  14.47  )
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
Cc: mkl@pengutronix.de, linux-mtd@lists.infradead.org,
 =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 20/09/2019 11.17, Sascha Hauer wrote:
> I don't think that U-Boot is corrupting the table. Apparently
> ef347c0cfd619a925 introduces a unwanted change in the page layout of the
> NAND. I would expect that with the known good kernel you have a bbt
> written by either the Kernel or U-Boot, doesn't matter, both parties can
> read it. Once you start the broken Kernel the kernel can no longer read
> the table, re-writes it, can now read it itself, but U-Boot no longer
> can read it, then re-writes it with the effect that Linux re-writes it
> again.
> 
> I don't know how the differences look, you have to nail that down
> yourself by systematically using nandwrite and nandread, maybe with or
> without oob. Once you found the differences I can help you in finding
> the issue in my patch. Alternatively I can offer you to have a look
> myself, but you would have to provide me a board, either physically
> by mail or virtually by ssh.
> 
> Sascha
> 

We are using suspend (to ram).
And it seems that it's suspend that triggers the UBI errors.

I'm getting this in the log:
[  661.348790] gpmi_reset_block(5cbb0f7e): module reset timeout
[  661.348889] gpmi-nand 1806000.gpmi-nand: Error setting GPMI : -110
[  661.348928] PM: dpm_run_callback(): platform_pm_resume+0x0/0x44 
returns -110
[  661.348961] PM: Device 1806000.gpmi-nand failed to resume: error -110

[  686.595724] ubi0 error: ubi_io_read: error -74 (ECC error) while 
reading 188 bytes from PEB 949:247208, read 188 bytes
[  686.607767] UBIFS error (ubi0:8 pid 284): ubifs_read_node: bad node 
type (0 but expected 9)
[  686.616592] UBIFS error (ubi0:8 pid 284): ubifs_read_node: bad node 
at LEB 204:239016, LEB mapping status 1
[  686.626462] Not a node, first 24 bytes:
[  686.626482] 00000000: 00 5e 04 00 00 2d 05 00 20 bb 00 00 00 a0 44 02 
00 bc 00 00 00 5e 04 00                          .^...-.. .....D......^..
[  686.645435] UBIFS error (ubi0:8 pid 284): ubifs_evict_inode: can't 
delete inode 1118, error -22
[  686.655449] UBIFS error (ubi0:8 pid 252): make_reservation: cannot 
reserve 328 bytes in jhead 1, error -30
[  716.895990] UBIFS error (ubi0:8 pid 272): make_reservation: cannot 
reserve 160 bytes in jhead 1, error -30
[  716.905996] UBIFS error (ubi0:8 pid 272): ubifs_write_inode: can't 
write inode 1119, error -30

/Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
