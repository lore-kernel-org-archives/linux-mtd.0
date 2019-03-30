Return-Path: <SRS0=1krx=SB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B07C43381
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Mar 2019 03:44:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0D392184C
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Mar 2019 03:44:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PIwQmvjo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Ldy3Kn5V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0D392184C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=nUwZ3YhLGkeidDP1hO5uK4RAph+IZZDRhNiwXpwNn20=; b=PIw
	Qmvjomf3nkVr3/hdeJ08rh3ApmMmMA9YFjzhQqJlpNcfcJJxiLdxbUp6tVqTCBNujtk7wMH89/9vC
	H+oP8wrO2Nb0WcxxVCmRFydRg4Y1OcNZq9lQLROFLt6MLeD22iToE/CmgiSkVNDM2VTqpP+VJRSAi
	xDX7KKIyZrK4B1AHa6VWhRkKKyl6Qpq9Yhk5lQLEry1h09GHec8KXnJotOgvZeeJK9PwQf4Zgh1s7
	jm+4+uDmeu9FZC0d67w9BkubMFHdmGtrnRzdQG+uLg/s10uIj0Dlv5QwQbG73QX2OtDi6yljk1Cx4
	i5ZOxftKR2Gnazvi0E9qV+b42RKMv+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hA4ui-0001t8-Am; Sat, 30 Mar 2019 03:44:12 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hA4uf-0001sr-E2
 for linux-mtd@lists.infradead.org; Sat, 30 Mar 2019 03:44:10 +0000
Received: by mail-qt1-x835.google.com with SMTP id d13so4998466qth.5
 for <linux-mtd@lists.infradead.org>; Fri, 29 Mar 2019 20:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=yd4YHuLs8Pwd6d/mf6/B+zn2EanjfkuCBHcpXzwDElc=;
 b=Ldy3Kn5VgfdZXduIrSatoe3z/f2yqelZJaQWS1NbCSaWwnCk2HGPV1pmTwASvHOj44
 QGRObR9bok6H0YgRm8xMvUIeGJfGNczqm1yMOEZXXsAO4vIStYzlgaBzHhdNdI5e5BSD
 xMJMemKewRVA7lUqmG1tmL8d4GHQwwYuGkWfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=yd4YHuLs8Pwd6d/mf6/B+zn2EanjfkuCBHcpXzwDElc=;
 b=GqGIM669GPp+0vU04qyDG2lnr+ImDIj2nKmNZ+3OTpBIBluNz9y2VFriOkP5lTjVrI
 cXeQRROQq+8CmjS3fVEP0lfCT93zmH8QE5p/kovzkfjEFIG7n63mgs778ujMqu9Axyv3
 WEr6b2EfTrkTB+vUGy6ZCBDPPj2DcwqPhRYwMv3eANZUcpdblOGZTk5OC2bSA+mYd7LT
 4SgC1snDmCpjD3e89aLtgyKEGq2P+n9wKocIMrTW1dWlsM98ol757CkSq7L2U81LvVb+
 vM2kccRsdhFR8ONkJZzXvNpjR+/M/6C0RbdYmzhZbiGV9oB3Lj7EI/luVpwKeOrFni9E
 D4KQ==
X-Gm-Message-State: APjAAAVNJts0TGD7VP+Sas24nVtYwusPyZbFbP/IiRDYu/+x4fINCtmH
 zRGasEOqqq1QzlVs946a15ivXHNaiWLVFLc8NOx2uLqYdXchZw==
X-Google-Smtp-Source: APXvYqxzdzWLVDuqfzGXYM6Jt5t+5vtYQHv7oizJnoidt98IW9cKEiltmKS7ZyTidfLoB2HupFBvQkdYuWSRWqFKqko=
X-Received: by 2002:a0c:947a:: with SMTP id i55mr43765815qvi.223.1553917447710; 
 Fri, 29 Mar 2019 20:44:07 -0700 (PDT)
MIME-Version: 1.0
From: Markus Mayer <markus.mayer@broadcom.com>
Date: Fri, 29 Mar 2019 20:43:56 -0700
Message-ID: <CAGt4E5tYNVD5n7QmYOpCQs3SOG7w0qJrk9LikQ9NDR5G3QoyCQ@mail.gmail.com>
Subject: mkfs.ubifs issues with mtd-utils 2.1.0
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_204409_473664_D49941BC 
X-CRM114-Status: UNSURE (   7.09  )
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

Hi,

After the switch from mtd-utils 2.0.2 to 2.1.0, mkfs.ubifs fails to
create a file system that it used to be able to create.

Specifically, what is happening is the following:

$ ./mkfs.ubifs -U -D misc/devtable.txt -r arm64/target -o
/tmp/ubifs.img -m 1 -e 65408 -c 2047
Error: Expected symlink

For starters, the error message "Expected symlink" without giving the
offending file name is more annoying than it is helpful. "It didn't
work" doesn't convey much information after all. What, specifically,
didn't work, that is the question.

Using GDB, I was able to track down the file it didn't like. It was
"/dev/console" from the device table:

$ cat misc/devtable.txt
/dev            d 755 0 0 - - - - -
/dev/console    c 600 0 0 5 1 0 0 -

The code that's complaining:

./ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
1533         if (data_len) {
1534                 if (!S_ISLNK(st->st_mode))
1535                         return err_msg("Expected symlink");

Clearly, checking just for symlinks at this points seems to be too
restrictive. /dev/console is a character device, and there is no
reason why mkfs.ubifs should refuse to create it. After all, it has
always worked in the past.

Since I am not entirely sure of the purpose of the check, I am also
unsure what solution to propose. Would
    if (S_ISREG(st->st_mode)) /* error here */
or
    if (S_ISREG(st->st_mode) || S_ISDIR(st->st_mode)) /* error here */
be sufficient? This would allow links, character & block devices, sockets, etc.

Thanks,
-Markus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
