Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE31C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Oct 2022 04:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=DFsY+drmKpLHt1zGucVJpg8u0NpCz2MEZahNdTPKTyQ=; b=TLj
	HWXTn7Xv+Ykw3743FKAk0geV0yQIOlgqhciTYPQoJPsTeH/9iBMpxkvnmDoYroEW/Zm6nMW1lHkYO
	mTDOaFtjauEDzIwPRytUnPfiSnBumnTQp/wott98R0FmQQZUcZrDXtarn/OjLIJmIw/fL6Lr5wHyR
	aU2VrKelnM/jorcY6GZJXJoXZliEbt7QAh1EnmlE5V6x1M0Oc9KEI+WLAPVhH5F2Jeg4lyLFEFMb3
	MQPkvs0iXbGFhgKSf3hI9jTZMMmmD9J4q06deFwNHjQLSmkmyMCOAU8mvOLOmIBc660Mdrk1u0ea1
	R/sBd4tzOWi64pHUTt1PIPAtAiuHoNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohkpa-00H1jn-Tu; Mon, 10 Oct 2022 04:55:58 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohkpX-00H1hg-NB
	for linux-mtd@lists.infradead.org; Mon, 10 Oct 2022 04:55:56 +0000
Received: by mail-pl1-x64a.google.com with SMTP id c10-20020a170902d48a00b001825736b382so1129864plg.15
        for <linux-mtd@lists.infradead.org>; Sun, 09 Oct 2022 21:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9D7woQS/Y7LRv3lLBPcVe2U8L04aJULWGfNbH/mytNA=;
        b=QiO/CgdadSqQtuPLK8JXrESg1qT7iViO6B+t51xivdvGTGM1afQkRkKxuD32ol9Gbi
         gRNy6BTuIlp/Poa8qc+Mt6Qgy99uNSHFnqgtP3KyVuAwvSRBLX+VKLXlfw1CJdHMTPYw
         rQkeuMavZx49fnBF3Zvputi3lhOq9ONcfFrWAiHxLEDDGDDIvkTqT37dzu1UI2vf/Y6n
         1tMPpAmrd2jaMk+CNdzvNPfWs3N4kTPAh7GKpDEANgGgl3dgeNqDa0tvRZivWDjPZvMC
         qZqdRuiWM/kUo4u7+byGJJOkGTlS1exdPQnHSL6Rz5wj7ekFQ+m64ozAG+shZFWeWuBA
         pxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9D7woQS/Y7LRv3lLBPcVe2U8L04aJULWGfNbH/mytNA=;
        b=3BCx4rRuDGt8sJd+M8d411j4YNbCaWRjyZrmXN0lhlWjvDwpG7qjFJZoUfMJDNHZxy
         HwInP3cQ29YIof0b9CfGwjjpfhVxtjxp7UVr+sF8OLw6c6F++f+7GjCIGZNNxZJUU7eU
         JubpypNqukGpgLVg/37b86ml9K9ovzt1zduJQf9yNQ0Pn+yKgKLOZV2Lh2inAXM2R/gZ
         buBJHJ1RZDT6SjFB5to8X7mxs1RgcfHPoIbPQxlnkGE8W05Pxah4cHGkR8Ngh+gapuf8
         6sg+wvZj+tVxrD64BJYzSRxSH2wnlASatP1hntRaI6NF/yQ/ZsTqf8Y6mAo0+ZkyInZm
         E0pw==
X-Gm-Message-State: ACrzQf1Wqtakras/qc/3I84bkvU8cQ6JF2Q2b47j2INzJp6y5Nh2gvFB
	7lhwaSe6TUbQ0sFkXGu0fHk7b5fW3J5I
X-Google-Smtp-Source: AMsMyM7buICJcvtAVcA/hb70MWhtXei9yPJ71Nfeow8q5GbMquyDCR+wh7GjIUw8Ei9dlCpBwzVeiMEx+Jt6
X-Received: from sgzhang.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3d89])
 (user=sgzhang job=sendgmr) by 2002:a17:90a:f417:b0:20b:6d04:a502 with SMTP id
 ch23-20020a17090af41700b0020b6d04a502mr17631808pjb.76.1665377753399; Sun, 09
 Oct 2022 21:55:53 -0700 (PDT)
Date: Mon, 10 Oct 2022 04:55:46 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20221010045549.2221965-1-sgzhang@google.com>
Subject: [PATCH v4 0/3] mtd: mtdoops: use pr_ functions, add and direct call
 mtdoops_erase function when panic
From: Ray Zhang <sgzhang@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ray Zhang <sgzhang@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_215555_794995_892164C1 
X-CRM114-Status: UNSURE (   6.47  )
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

In mtdoops driver, to comply with latest kernel code requirement, change
printk() to counterpart pr_ functions. [Note: change to pr_debug() may
cause behavior difference.] Add mtdoops_erase function; When panic
function invokes mtdoops, if needed, call mtdoops_erase function
immediately.

Ray Zhang (3):
  mtd: mtdoops: change printk() to counterpart pr_ functions
  mtd: mtdoops: add mtdoops_erase function and move mtdoops_inc_counter
    to after it
  mtd: mtdoops: panic caused mtdoops to call mtdoops_erase function
    immediately

 drivers/mtd/mtdoops.c | 109 ++++++++++++++++++++++++------------------
 1 file changed, 62 insertions(+), 47 deletions(-)

-- 
2.38.0.rc1.362.ged0d419d3c-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
