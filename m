Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E77C7882C
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Sep 2024 11:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:To:
	Message-ID:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U/wzTlqZkpJN4dpbF7epnoh7iCSABMkPXgvyeoSJwz0=; b=CcXj7cGtoZnBA6
	Ko2fSP1lpS6p8WcRBRSVPoN1oPVoAeTB2YjAS3jaUdY8fBMWTDdZqIMei+EKGHDMqypXVPoyv0kEK
	6beQZB+YXEth7BNNBlHG+FLnMTsWjVQmtofqpBpJjyi+4yeWKURdm9jV1F3gX/17Ives3Ga5YNxHl
	acvhiIW+gCeZwj2mDu4XXW0TYwMdkED5jRvewIN7Dlxe6iKk7xDkgK80xUM84hK0fZMIZkH7SY38j
	DL7vEHNeSf9vqerK3a4KkGXZCHD/UA5SleXfxY77+kdfdfZUxeIspCp8rWSJl2UCRBdPj7nYrJa4U
	XcmGgiMjQ/g0E7yOxe9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srcAY-0000000C7W2-46mo;
	Fri, 20 Sep 2024 11:51:26 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1src9d-0000000C7QR-3ckA
	for linux-mtd@lists.infradead.org;
	Fri, 20 Sep 2024 11:50:30 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-20688fbaeafso21441975ad.0
        for <linux-mtd@lists.infradead.org>; Fri, 20 Sep 2024 04:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726833029; x=1727437829; darn=lists.infradead.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MxitZxgmvoGPY/D0MWsatY/SG1INnyxTi18mvHYSZYE=;
        b=CcGSKEnL9qeU/3LrvfsFbS31H12rNIRySOGrOPPiIx+nXg6RfMAOKP3GaCALUnqTx0
         AJXUsYLUN7ftxNHSfxJ6s7RlyYEXxEmufohmRwv/7AJTveLZ1x0U2gfeLxMRbli/fj25
         OLTaB7mG3sY2PJuF+AY8jZvOQ3XX0cJ/eMoupsk1o8HB7Z3tWE3IdzkSZOdjjRQCFryA
         BZN7Mx5bn20Md1xKk4/OHfOMO4HQRYX6kh916Jf6cLk+Q0/dEXI/KXViT/buiHlm1NQa
         9iCvdN2KJzVmmKVvlLBfgUZMmMDE2t8wtasuYqWchwJzoD6WXxvdODGyy+WtR31CSq2X
         iUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726833029; x=1727437829;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MxitZxgmvoGPY/D0MWsatY/SG1INnyxTi18mvHYSZYE=;
        b=qJW8TI0ISwwXJjGgWNbYSSnMMr9LnerCu4aD6pnZQ9Wr8yrzxjyaFV1z40rVmFAA7m
         tTZRKP8mCvDyCSH01/93W1sp17Zde3nzT63uk5cI9NFejjjevHMy4/FEhC7VhLh2/BUe
         l6GnIFc6ixgfkvNBwpPPRPSyf9vLZ3o9WlUxe3jVHpMt4f3wmoZfp28bVgoYlwTVs3nn
         RkIiTwZZAhCSWLfNyB4HTWGqI7Frq7Pve6pDm+JhGh9pZzqkjuFEpsOa/wWLVyrOK3GO
         Gvwf4ln8B2qAivovdb4X7ZUIRV26DUFHYMSCCdn5/4sQ5WFQJvZFTP6N507ENm7W6ieM
         +TCA==
X-Gm-Message-State: AOJu0YzEvZJGpjdxsT3/uaiSN5hfV1P0HARpWRZXvHun7qPPj3DK78VX
	rqEi91PWdSD7Q52ZpSkTCNcxjMRDQKcadWlEGP2MK49aiiDq/bPG1zu6D3da
X-Google-Smtp-Source: AGHT+IFprQ4U7Gv97PIgqMesgi/IEPeAvEglL/oXXyzGsb+DGPyEHKmkxUX3/lTOxxW1cWgTq7Jl3A==
X-Received: by 2002:a17:902:c952:b0:207:20c5:42c with SMTP id d9443c01a7336-208d83fe7cdmr47233155ad.45.1726833028715;
        Fri, 20 Sep 2024 04:50:28 -0700 (PDT)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079473d080sm94011255ad.284.2024.09.20.04.50.27
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Sep 2024 04:50:28 -0700 (PDT)
From: Michelle Fangman <mzencir404@gmail.com>
X-Google-Original-From: Michelle Fangman <michfangman@outlook.com>
Message-ID: <abe50e1102d87b4ea45843792d836c0ed4dd7789c369c5589dcf1e6be5b17f70@mx.google.com>
To: linux-mtd@lists.infradead.org
Subject: Baby Grand Piano  09/20
Date: Fri, 20 Sep 2024 07:50:27 -0400
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_045029_907256_037BC875 
X-CRM114-Status: UNSURE (   3.93  )
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
Reply-To: michfangman@outlook.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

I'm offering my late husband's Yamaha Piano to any music enthusiast who may appreciate it. If you or someone you know might be interested in receiving this instrument for free, please feel free to reach out to me.

Warm regards,
Michelle 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
