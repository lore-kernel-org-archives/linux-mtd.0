Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D109D1BDC0
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Nov 2024 16:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=8qmFIoArSVRW0yqQ5oOrBdrmp7M0WjOB6zklsSkMM4k=; b=bFx
	Q7+WbiThjS3cxfHmKh8twxS7QYrGOSzOZehpEvZN/oT3K3IJ1i68zGW6JgkapIkiZUYRfNvjgXSht
	U4+5XmqScHaOcmhdhfDeDrt4jADVCEwyCRmR3r6Rn0YRKAc5h02Et/z2rZE1Y52+jtzsyMfgB7+Kj
	lT5nBBE8zHEymGJhHd7nV6TNLtYoJEAA6lLZ8nFDMK4e0U7/fjdKkaCg9XO1IzHgOdFu/lJqt+xVY
	7Dxe21nseUMaOJpF1cixTJWiuT7NjzQ86jmAtTnHUM1hquvsIPeq1iB6LXGslIOJUv+AOUZjVlohQ
	lhOpp2DS4Fh7FnaL558psnelHLb9IeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zbJ-0000000EKCt-0QIA;
	Mon, 04 Nov 2024 16:06:45 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zWf-0000000EJPO-2BoT
	for linux-mtd@lists.infradead.org;
	Mon, 04 Nov 2024 16:01:59 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5cb15b84544so5315044a12.2
        for <linux-mtd@lists.infradead.org>; Mon, 04 Nov 2024 08:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730736115; x=1731340915; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YvKoIOOkvJEnQBDbahbYaGbHqf/hPtCl7rH9zCSjFEk=;
        b=DyNjaBts+gMYoSAt8d2NZFT2LdrZd1Y2U/q22QXouc+Gy7BVXiT2pohnoNHHx2Q+E3
         x4fjKIE5pcbGsVlcc74vSxO6W/ThXJ6JBCoNNliQ/+wqAp7kladwrWWdWdhzud3lvdKp
         E0cf1fkHCuceVbNE76m4y1Hw3opX3p45sNgIpIU+koOzKVHzHWr/kFP2ujWLBJ8gqXi6
         +IUbwL9R41ijgfmmvmEWjL8qhVi/skKhKSasrogXU2chDfVAjlC7PQlec4TzyKoeGDBE
         oGbFH9kZ3Cbx4Gl6934BAUbVIohmZy/USZhHH1VMdNgR4ob+m4/FXXk2osuJCghXKKzo
         lazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730736115; x=1731340915;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YvKoIOOkvJEnQBDbahbYaGbHqf/hPtCl7rH9zCSjFEk=;
        b=wP33IygMsvPu2Be28SkDYIKHaSQSiV2Bf0x128n4Qk0xmLDMAZckfWOyn0VKO4MdQO
         u+uazwGVZT6macFfDD0KxoZS3CLrHNn9D+4sjO3HU6fmMdUilpxp9ol21j2QY+fG1+Hx
         m8SucBARreQIMwQX1XJcaec3lPmbxLceD/QEb8PnJwIrSAMOgS/m4cQG/zg8b8KEiti0
         i6R9LkFW0IPT/qiiUb2lQpQ7Hh3xObpPP3vzDQLLBz7zlNdusE04+2s0riiWCwO9vb/f
         X2vMFyE1AaL5g1NlVAgQETBehIJ7T9tDdaD8rukG3lpnJMDz0HfT6ez3tT+/H4/U3tN4
         wApg==
X-Forwarded-Encrypted: i=1; AJvYcCXmyE7/cfLRFolRiWL3m+Jb75TT6TMgIWHOKxQtgdZvIUZCOfiR5F5frwE46nujP7DyWyf+RAseL0g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz19DkmE3SNZF+iTnvKR9WmoDAJc175tECxbZXqhZ5wMfOz8Try
	K1XeGxhtp1mKE3Y741KgRkQFRuSSeIPNm+HGxW+93d5cgq2bTp6qK75H1tNlQIahzzvS4+gDZ/h
	Z3f8ZqJx/eKHV9Gg1O1ANXcrCjCY=
X-Google-Smtp-Source: AGHT+IFD4Fq/TdQFqSO8aET/K3J8TZOIw5kV+WMdn1t15hKY6DXVv/zGJQH25V1eTACsaHEbcVs5Dfl6i/VbBWFzW30=
X-Received: by 2002:a05:6402:5cc:b0:5cb:6ca3:af96 with SMTP id
 4fb4d7f45d1cf-5ceb9287385mr9451669a12.19.1730736114077; Mon, 04 Nov 2024
 08:01:54 -0800 (PST)
MIME-Version: 1.0
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Mon, 4 Nov 2024 21:31:42 +0530
Message-ID: <CAOuPNLhxBBihr38p_XMQEgkiLFc+DPxkQf4oewF8U1+ihaFn-Q@mail.gmail.com>
Subject: Block based OTA update needs mtdblock
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>, chengzhihao1@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_080157_615824_965AF0E5 
X-CRM114-Status: UNSURE (   9.46  )
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

Hi All,

For one of our automotive products we have the following configuration:
QC chipset, arm64, Kernel-5.15, NAND Flash 1GB, A/B system, UBI
volumes (squashfs, ubifs), DM-verity for rootfs (squashfs), simple
busybox platform.

For OTA updates we have a strong dependency with MTD_BLOCK.

Till now, we were using ubiblock for mounting squashfs volumes and
completely got rid of mtd_block by configuring it as a loadable
module.
But, we also need to support OTA updates (Full, Incremental) on A/B
volumes using the same Android OTA framework.
https://source.android.com/docs/core/ota/nonab/block

OTA update will be applied to the B (inactive) partition.
OTA updates prefer block based update over file based especially for
dm-verity enabled devices.

Now, the problem is, on MTD we only have 2 options for block based
updates; ubi_block or mtd_block.
We cannot use ubiblock for OTA updates as it is read only.
For full update volume, we can use "ubiupdatevol" interface to
completely replace the volume content, but for partial or incremental
update we need to update only specific blocks and not entire
partitions.
Thus, we have to use the MTD_BLOCK (/dev/mtdblock) interface to
support block based OTA updates on UBI volumes.
Thus, during ota updates (only) we need to install the mtdblock
module, perform the update and then uninstall the module.

That means, we cannot completely get rid of MTD_BLOCK from our product
especially for OTA use cases.

Is this the only way, or do we have any other option to support OTA
updates over UBI volumes ?


Thank you,
Regards,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
