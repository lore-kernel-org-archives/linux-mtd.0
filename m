Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B2AC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 10:08:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9886F218D3
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 10:08:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gwG1D/EP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PpGc6WeM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bofh-nu.20150623.gappssmtp.com header.i=@bofh-nu.20150623.gappssmtp.com header.b="X/Ur4wc1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9886F218D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bofh.nu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=qmfwtlw5AfQUnS7E2HPm1THaSEqB+rqXBIR3v9hbaLM=; b=gwG
	1D/EPhwTPvPBw35GBVP66HwNKyqziTh27ELz2l/iZh1mi/jGDiaXjnhW3hrZsaftRsCuKrqWqKreA
	BRtBJ+txlszi2+1/7TlxsFSlir22pMLHm5SaZIzb5cVLSzIr5nLsWUxWV3VsaHVd5B2AQViTcOmoX
	yydPaCcUYNsOSF9Ig3eoG+2yPZ97X6gmSBEtXujonzQ+B/w+jf0y3vmKOrmhxqgsV3pYNBvbuvtS8
	W0Gs2abWqpP17yudk7xac2/uUwrOfFEA6dL0LVO2lW8r2bMul4iaiP9DA7b4lA8q9a9pPMEi0/Dfa
	v4Kh+C6SGhoxZxWcKKb8GyswpaLXRrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6ucf-0003Cr-SW; Thu, 21 Mar 2019 10:08:29 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6uWu-0000MS-Mx
 for linux-mtd@bombadil.infradead.org; Thu, 21 Mar 2019 10:02:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:To:Subject:Message-ID:Date
 :From:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=doybul+lVaccYgKrdY9/Cs0C2qVwT/C08IoXuGmO8PQ=; b=PpGc6WeM5XBGWLjOHfGzSE8hfA
 ArC4biInLYLm+ZXJS5Crk/KK6y2dFIqmgTsyvBOOfq1nytXXfuV54qPBKRDipf1l6fpdZnb0r9DtM
 7lFzrNfDFjh6je9IGIyj4Lrs9W50RQgpMQJ88GlgYlS0U+lMUoTbY8gqWR+qJgyLHqjjXrn2MKV45
 sTfyPnFkUxo9VLh2AhGjYsG1VuIUMA05qZqmk4ptXlemr6mlz6wEewKonaCcXGkJAIjjeib8UbYBd
 moElzwfYmjOkpkSPxYLmv9wkCu+bxDMmJOzgoJ24/I9OoDeAETyahT+5XWr6lQla0U2NwaTYTFhMf
 5StGp4xA==;
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6uWq-0000q1-QX
 for linux-mtd@lists.infradead.org; Thu, 21 Mar 2019 10:02:30 +0000
Received: by mail-ot1-x344.google.com with SMTP id 103so4880441otd.9
 for <linux-mtd@lists.infradead.org>; Thu, 21 Mar 2019 03:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bofh-nu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=doybul+lVaccYgKrdY9/Cs0C2qVwT/C08IoXuGmO8PQ=;
 b=X/Ur4wc13WKIY5potnxjLErRs74sa+RvSs2sPNLrXOCK2vauDH4JHFyuxVUIJtUY7/
 EBdYNaptiijfap45YSg3VTqNorO1RQI58gfsRoASeb8A7smVfwgU+aEX4FTFcJPcVnAh
 Q9ubA1KYPIhOtNSDG+MqeJHkd2Kho7b26LzzgK9D9QoS39fgNV2e3WhhgS8yCKtaqsbz
 +YwNujA44bGkASuYec4lrzfpg1832jqW2zU1EpQz60DsMvOGaqHPAEYRGOM0T2Ipqf45
 NzBCcL6ZFNLx/RMYiPs8wnFwDKn4bQ2cK0pHB1kL1uyVMHN1txSTBBcs6f5EeYR7izJY
 SSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=doybul+lVaccYgKrdY9/Cs0C2qVwT/C08IoXuGmO8PQ=;
 b=mISFI1eauApPTVh8F7isjTbSE6b56aYDKmovUyoE5WAU/gVSien4VwTsRVVZo/9ulb
 72ehP3dIfwGPgeZI769NEp+1ALMcKWwqkKwkBCl0yZvmTTQQnnb4ibbWt7Ofz0yTQUyo
 eJ0jejk/e1vr1K4aK0Q0QH7PY3QrjDKqw5DukGdg6JFVEDtk90Z21a7lq78lMhTpzovF
 ZIsO4CGB7jJjeDwA/Ja3OwLMpkbVSAmQUAccc8i5FURJQmF+VXknSczg0gKAgeqrHaOV
 nuRPATO+sZ+9agI64pCM3t1ATcWM4TqoHpXxG2g0tiKZAbZvCqVN0sOM7WDCbSCBQEj/
 7J8A==
X-Gm-Message-State: APjAAAV8N3cLYtqE6SSuvicFfdyV0GnrZekXT1yvNGtWPT5IhthKx684
 pWUDI8h7C/+pUoarqnW0ts5liluiJGYq7aoroiQOOCCzc+Q=
X-Google-Smtp-Source: APXvYqwNOeodJKvjsze8JRoyfiz5sV46pM/OoXjOYiCGLgadzUwBlPN2XgaxgmHVDwFn2SN3y9segLb+iHdQJEjulWY=
X-Received: by 2002:a9d:6185:: with SMTP id g5mr1954299otk.346.1553162539741; 
 Thu, 21 Mar 2019 03:02:19 -0700 (PDT)
MIME-Version: 1.0
From: Lars Persson <lists@bofh.nu>
Date: Thu, 21 Mar 2019 11:02:09 +0100
Message-ID: <CADnJP=vQURY9u7Fb=Bt=udf89A6VX_TccBXfk8q2kdkqMnqj4A@mail.gmail.com>
Subject: UBIFS file-system corruption (missing inode) after power-cut on
 4.14.96
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_060229_004818_0B5FD927 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

Hi

We have recently encountered multiple cases of corrupted UBIFS volumes that
were triggered by a power-cut during startup. It may be a regression in the
4.14 stable branch.

The symptom is seen when accessing a file in the corrupted FS:
  UBIFS error (ubi0:20 pid 513): ubifs_iget: failed to read inode 348, error -2
  UBIFS error (ubi0:20 pid 513): ubifs_lookup: dead directory entry
'tampering.conf', error -2
  UBIFS warning (ubi0:20 pid 513): ubifs_ro_mode.part.0: switched to
read-only mode, error -2
  [<80506a51>] (dump_stack) from [<80297e2f>] (ubifs_lookup+0x29b/0x300)
  [<80297e2f>] (ubifs_lookup) from [<80226169>] (lookup_slow+0x69/0xe4)

We enabled chk_fs and reproduced it:
  UBIFS error (ubi0:20 pid 120): read_add_inode: inode 352 not found in index
  UBIFS error (ubi0:20 pid 120): check_leaf: error -2 while processing
entry node and trying to find inode node 352
  UBIFS (ubi0:20): dump of node at LEB 29:94656
        magic          0x6101831
        crc            0xda5d6bee
        node_type      2 (direntry node)
        group_type     1 (in node group)
        sqnum          4079
        len            70
        key            (66, direntry, 0x4974b0f)
        inum           352
        type           0
        nlen           13
        name           emotiond.conf
  UBIFS error (ubi0:20 pid 120): dbg_walk_index: leaf checking
function returned error -2, for leaf at LEB 29:94656
  UBIFS (ubi0:20): dump of znode at LEB 37:57680
  znode be0bf000, LEB 37:57680 len 128 parent be0af800 iip 1 level 0
child_cnt 5 flags 0
  zbranches:
        0: LNC   (null) LEB 32:53248 len 81 key (66, direntry, 0x363e97f)
        1: LNC   (null) LEB 29:94208 len 63 key (66, direntry, 0x3f88c71)
        2: LNC   (null) LEB 12:92160 len 74 key (66, direntry, 0x477308e)
        3: LNC   (null) LEB 29:94656 len 70 key (66, direntry, 0x4974b0f)
        4: LNC be084600 LEB 814:49152 len 63 key (66, direntry, 0x49bb6f7)
  UBIFS error (ubi0:20 pid 120): dbg_check_filesystem: file-system
check failed with error -2

The setup of our system is:
An overlayfs stack for /etc with:
- The lower file-system is a read-only squashfs on ubi
- The upper file-system is an ubifs

The ubi partition resides on an SLC NAND from Toshiba (TH58NVG2S3HBAI4).

The missing inode is always triggered on those two particular files
emotiond.conf and tampering.conf that share the same write pattern at startup:

 cp file file.tmp
 echo some data > file.tmp
 mv file.tmp file
 fsync file

Do not ask me about the logic of this script :> It overwrites the result of cp
and does not implement a proper atomic move.. Anyway the end result must not be
a file-system that is corrupt and mounts as RO.

BR,
 Lars

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
