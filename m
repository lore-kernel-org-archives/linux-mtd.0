Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEDFC433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 16 Apr 2022 10:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S/OgAlKXEu7vU6mQjgfWevzIWcXm5FExR4hEMwo/lC4=; b=WZwa9M7Rt6NkW4
	T/FrynGl0ELSsnWKh4mfxrl0RjgAWbl0Ne8SxprXHkHxruo9JLqN9u6Ry2Noa4ndSJEBUQf2yxBlP
	rB3oC7bq1yHBQENIvddJvE8Ii6o82bbnWa2khqUE56hww9Kuf+gkYXb5qhqoIpwXU+LWIv2sorD7Z
	93eZ1Qw2HU8/Mdh1/c1OPC7l5rNB5DQpvQQJHxc51JsxSsCsX8AsKMqtuyfU5CghLcgo8q9PWr1Z7
	kZ3rgDlKrRipiy1HShqL7SxE/t2vkX1DOhh5eXfrIfsHq8kq6BNhIJFpObTTeaPLCXzA3GsIaSi8p
	i2pjRR6Vkb1JBTIvQWjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nffOL-00Civm-RO; Sat, 16 Apr 2022 10:10:57 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nffOI-00CiuP-Bf
 for linux-mtd@lists.infradead.org; Sat, 16 Apr 2022 10:10:55 +0000
Received: by mail-oi1-x235.google.com with SMTP id k10so10408530oia.0
 for <linux-mtd@lists.infradead.org>; Sat, 16 Apr 2022 03:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aXXQ+U+tk4JSfC1gjVM3Xbh0G9pUMtcnqO0SSYt0pko=;
 b=STPo7oWtCQGs3gAUCj90BeZahvQdrXOc666NI2dF+jjdKYwqsQ7v41qKkF1r5/VmQ9
 oBOa7kdd2CbSD3MAfuIjK52irzYW8LXeV6bao2Z2RJ7hCH5BZ1jOjsHw54bjMaCgTYuQ
 EBPGy67Kn2apfplRaimWr9vC6AXsZB1vFEcinWUb/glKuxjXlE0HfpLa4ZMStV3/0Jk0
 zrVRw6D5j9YraYGJZmqJiVjTgdrE3pHAZn46uiXvF8xHFUymDBj/sPXzy1wuQIW5GTzV
 o0K3fcumXxyjwuWvxwBLNjPLDtUSfXlKSy3ea1uCrZRFdAJn6A+07P6uHdyFip3WopCR
 PFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aXXQ+U+tk4JSfC1gjVM3Xbh0G9pUMtcnqO0SSYt0pko=;
 b=fziHoNMe/g4Lco4LPi65Gq1l0Z02kqTaHUd0tDUWP04vXtpquzvkyC8O9i4v9W5OQX
 K5e38s9rolyAkmmfgJktrQjCLsDc4JC5ex7d7RHsU7BLHEZ3PAOXgrolh38E48VhWkY/
 9DGtOI1EjoDqrK3qKoKM/Z+vBnscbh0eyMi7KbjfOiBEypG9WHa5P2rMDmS6XfkJ5Jyv
 HmpRsWhQg1SFyoqt5yoSRm6H8zBk2XsfLryLgwqynvv1pAZCUbK7shkNu789CBIJfi2y
 LxOrfGHnNTiKALb6uRsfZ4nDsjFbaj6ek5FNqqqKbacC098zopzVhVyNY4I199dnDH61
 Y+Xg==
X-Gm-Message-State: AOAM533xIfwhjsCv7AeO2fhuKZdF9ComncNv4Tzcu+h9y5XKqP0KZ2bL
 eKSo/K5hC6vkkatr3vZDxYsucDG5fCm+7EeWPLE=
X-Google-Smtp-Source: ABdhPJwErbIxWFTJas7LYVag6rDpUS0BW6A67CjZ7Be3Nkh10XkWs28CGVYWGGDMO0LrouKjDTJvVNA1QnTxRM2aHGk=
X-Received: by 2002:a05:6808:10d4:b0:322:2f79:bd2c with SMTP id
 s20-20020a05680810d400b003222f79bd2cmr3224781ois.53.1650103852247; Sat, 16
 Apr 2022 03:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220415034844.1024538-1-gch981213@gmail.com>
 <20220415034844.1024538-4-gch981213@gmail.com>
In-Reply-To: <20220415034844.1024538-4-gch981213@gmail.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sat, 16 Apr 2022 18:10:40 +0800
Message-ID: <CAJsYDVJsJqCdMG54p_1hRrCfH23bMu116Bqs7KG8WM9MAN1hZQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mtd: spinand: probe Winbond W25N01GV/W using param
 page
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Mark Brown <broonie@kernel.org>, 
 Daniel Palmer <daniel@0x0f.com>, linux-mtd@lists.infradead.org, 
 open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220416_031054_452731_E5BC0143 
X-CRM114-Status: UNSURE (   7.32  )
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

Hi!

On Fri, Apr 15, 2022 at 11:49 AM Chuanhong Guo <gch981213@gmail.com> wrote:
>
> The JEDEC ID of EFAA21 is assigned to both W25N01G and W25N01K.
> Probing the chip with JEDEC ID isn't reliable anymore. Use parameter
> page instead.

I just found an old W25N01GV with no valid parameter page.
I need to rethink how to deal with this crap then. This patchset is
abandoned.

-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
