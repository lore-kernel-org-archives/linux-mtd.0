Return-Path: <SRS0=okf0=X3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADE1C352AA
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Oct 2019 10:35:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF06A218DE
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Oct 2019 10:35:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qMsimbPD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0A7Gy1s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF06A218DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=2OPYYKZ4CK/Ho2vATn47NA8cpE7bI31lbPJ8RyHPDlY=; b=qMs
	imbPDjL9DAfdFax6ylH5Cr3p/LcyOjF71OWSor4xdO+pgPO/ZglvL2uO+QcpnnfYIgYQ7ySd9Ae6o
	rHrZ/9q1xsCT16eMNo7Puli6tF2EDT36RzJsNYm1YpoiSy4AtZ29zyGjIiNXf5w4uSgdcEtHeZMmw
	MczCrflWA8AcuBnbhOop1h7n3mWyBOA+qYqUvXUzfZplGfwZwSLXuxIqMAXB8tvT9QUbfvJDNV3jd
	ax5v+8X6hSMsijwHtjbQM12XWD0Q8m5s1t+VP1o1ZY8objbrDB2smweiMQFsQuwmLyo16qKiKS0oP
	vU2tL5wG8O2BIfo0CG0pOdXhm+dJKCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFbyj-00022I-6Y; Wed, 02 Oct 2019 10:35:29 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFbyQ-0000dd-OB
 for linux-mtd@lists.infradead.org; Wed, 02 Oct 2019 10:35:12 +0000
Received: by mail-io1-xd30.google.com with SMTP id b19so27605010iob.4
 for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2019 03:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=M7vYlpMJ89gA+SFnjdyZevwr9HL0pTRicyc2j4W84Tk=;
 b=M0A7Gy1srCA3NfdEs26iXJyVB8Wb64XLUn16yi9x1IjVvXN9ZEWDWWKu9+Z3+uEt58
 srUA3DXA4HtjCBR44IjgUp5PbMaER/ufMIt+mfEP7fsgqBU/hgc5Vbe1F672zj626LEt
 dj4gaAcQPWxIAg8YKAwRwTiXrUHnnIN/pYwLNUbnlFbQx+1gSmw2t5knuVMCloXdRqjU
 vqmjCBUh1Yp7Sder7xwiqK9A0wyhpmwzTlB7WT2kOG9sOe4QbJ1I7byH05zeZgMwQnMC
 qRIP1WRD3aMoVyw+Y31R0517A9JYmjE4yHwXGhw3JPROEOAgpcIu1mOD3y2fEsx3zcBD
 Y0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=M7vYlpMJ89gA+SFnjdyZevwr9HL0pTRicyc2j4W84Tk=;
 b=k8y//yyZ9yaVyGjg6mOTIuMWcFp7t+E0JiY3SwJBVyHKc+MDq7e3gQDE4KPsC6Vhut
 7IIysocFPXVnvIsQRxqazlHte1JFVPODSoJig2l4CVjc+IfgW77dfs9ItlZ0bujatCh8
 qzKZTqI+EyjTQYgjrXl4+TTg+k4PDvjMj09WYFhbWXAPmz3loAcCjvORagIwif+vgKFo
 xtc2hrpDEd7xQA8yCwwoLvy5x/aWLQ5H/Icjelq+rWC2/VY8DkaZYcmOgrOfEYFIAa+y
 G2lz3m8u8bnTOm3SsqwQdSBMzsqlVSg7KEorGlOD0IOvyZsL3smvlhr3iqE4qrULtMJf
 QSwg==
X-Gm-Message-State: APjAAAUYwUAlTrdDdrEr4DTmtK5ouDtO1JZDSCZ5v9m/KFZe5UxDZKaV
 4qpQAYy6PEc4b2bXMDpRznIFiD3weqiL6IoXG5KJKO0h
X-Google-Smtp-Source: APXvYqw0O5nUZ6SFXXxGzDG2FUsql21cWbwBlDwZEbKNxvgW+Ne1+K/ndtMbWT3QIKW12PT3EGkxqt4+sJDrU477X8I=
X-Received: by 2002:a6b:740c:: with SMTP id s12mr2683890iog.301.1570012508788; 
 Wed, 02 Oct 2019 03:35:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:9c85:0:0:0:0:0 with HTTP;
 Wed, 2 Oct 2019 03:35:08 -0700 (PDT)
From: JH <jupiter.hce@gmail.com>
Date: Wed, 2 Oct 2019 20:35:08 +1000
Message-ID: <CAA=hcWSR52BJB4+k2k4CwLTQUVmvJvR=bjRx6kqe2aar-PH21w@mail.gmail.com>
Subject: How the bad blocks occured in despite MTD manages the bad blocks
To: linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191002_033510_833678_153020E8 
X-CRM114-Status: UNSURE (   5.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

My understinding is that MTD manages the NAND bad blocks, but can the
MTD prevent bad blocks happening?

My iMX6 NAND device was only up and running about a month, it now
failed to boot from NAND due to the bad blocks:

Questions:

(a) what could be common cause to trigger bad blacks?
(b) if I reflush the NAND will the bad blacks recovered or just mapped
it to bad block list?

.......
Bad block table found at page 131008, version 0x01
Bad block table found at page 130944, version 0x01
................
[FAILED] Failed to mount Kernel Debug File System.
[FAILED] Failed to mount Temporary Directory (/tmp).
[FAILED] Failed to start Remount Root and Kernel File Systems.
[FAILED] Failed to mount /var/volatile.
[FAILED] Failed to mount FUSE Control File System.
..............

Thank you.

Kind regards,

- jupiter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
