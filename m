Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD3AE6B25F
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Dec 2025 05:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nL0m0RLjsTdBf6mVAbsQQKC94Kwqm3AsB7QcvSrf4g0=; b=N66F7vbwMB9gdP
	M2u2hoPaKhQzUFWZSqqNRaZBHaKseBSmnTeX1Yi2txVgPAB1LO2rcYGCTx1ZBOCmUzwnizg8v35rp
	vpgJTjZcEwg8pVEOzThbTwVI51XScJH/MhiBHuA1tdXzUimDKFh41zAjhPDfZECe+cBli+Azn05P9
	pJLV829RY0EOXEt5rC4ycbSqeJZfQ1eogmo/PfSc7wW1/gbwS3yWXGTYdq8APywMG5HCkkKPGLAyD
	aDvraMsRoLyMblTpeIAzM3RsiTrfhrZzfiFUsV1sgS9UnpGzLzggzWySjoHMubWBzL+rPeBmVQgQ8
	a9vxZGbZIYC3qXDhd2nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXv3r-0000000EXgj-0KcK;
	Tue, 23 Dec 2025 05:35:55 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXv3o-0000000EXgN-33HJ
	for linux-mtd@lists.infradead.org;
	Tue, 23 Dec 2025 05:35:53 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-11b6bc976d6so8222834c88.0
        for <linux-mtd@lists.infradead.org>; Mon, 22 Dec 2025 21:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766468152; x=1767072952; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1VDWjicrLkuqVcwGv9d1sh+ocm1fa0mGizT1YHR+Z6c=;
        b=HVWZ0VfQYlJbqkLYoFw7M6tfNgSrAr65xfzVENpo+7RUSoSCBbZir3Q/kYXz9PqSDL
         Wj96wPeGSrf71Cdv+TyaDBVasAhk0keMsZA7Lq25ejSrJPRHNcuf0zbk1HLRlHVMK2k3
         78VOdcXVe+ht6b6NkSjXwUIMUe6vegFTwi3zBT10VQWGDzbq8BJq7cpQEyFZnEJvnSvn
         XfYw1S25+ZqaTKGvbedRO/JpG3+qDZugoVAvVwQgKq7TY9goJsCZert79njPyGHPsk5Z
         zEtCaT8b3mBVdXmhSuQh8EbqhuAOqI8+tHhfsnEDl33guNnJOtof6EtzX4Y7MNpfhN61
         NU1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766468152; x=1767072952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1VDWjicrLkuqVcwGv9d1sh+ocm1fa0mGizT1YHR+Z6c=;
        b=v+poriTniwUDDjoJybTEPhWfgbRYFK7pSyu/q5Ui3cyKj0yb/6pB+q+icbWwAZw0/C
         EoCgnSwg7BUVBMDtKNPFIUKOcl4xCAvGUT6zPREdmCJUUs31PmcsffQ5Xl3md4KNYrU6
         EzFhNkvN99cHA417YJChb7szcN8uW6xZEkAqMitppt+l98cv78IZv4TySsl+Ivg2/WIQ
         BFu2eAFclqJlE6ARAwD7k3Rweh6S+rT0Wi1ArUVdaVe7ymAmij3zhYyWk6blK5uZiRiS
         nvCwB/vnsFaRss7v9BC/DEJcrMQnpSWuMDbb1BYDcaS7QAeHcn5aZzi22v8o0likMTCT
         TnKw==
X-Forwarded-Encrypted: i=1; AJvYcCXjNrB+/ngTal/gJCTqaGoE44ovPVTwBzEDusuOak8qTOi05vXvA3q9+ImRk4e3bIEIPooOibEUQx4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzzYp6fNKdrptmBEyiNX45Treal8ErLADNSrR21xXfhYqcrw8oy
	DlsTop+2/+ONv2twk3G2GszokE5PypnPIJxJotk1GoavweJ9hE5HM4pn
X-Gm-Gg: AY/fxX6nQSY3t6Rf7dSUKd5C+uWMzhMKzv4klqkSHOekRmSG8Si5fd2P9tB0pBLDUfI
	eIv/v1wZT5bjWg635wM5c4E2h5AVqZ3TbcZst10o9yrY2B/9haInQf8Q6WbYXW6ZVfzMVj3yNhy
	8+8RsTvRXz9OM7fN3QgeSNo//1LTVRUsZ2bZyAyfyfT+1LhW1Gu4JGL6etKDyHcqzqU3uStlOe3
	BDx88nOt8+6eJCLCQIYwc5oTibZeShqneld0cIC0uAViNcO4tqQ856KSWKJ231QUhg80lcziUcc
	HvNPOdSrTdwdpga5IvegcuD0lTu66xKXArg6KV90F1S4mRkQ+WiEyEuITM43MVNNB9d0k4qfIdl
	CXzVNXBtloZrVSfm2+Ey2WNGaNB+zYpNyxB8zhuKzEwj2IXfrSzeVJxLLBDOKTLL8HTQ7Sh2IRF
	WEX/qMbgWQkp7ufrcwhYcZFlGYOxAqFP3XkPn4aH+fPtC9q3XYzvF88Hi3MRRv55Fb
X-Google-Smtp-Source: AGHT+IFgD3SNwd/4TCZfokt7AW5oqjEJYNTcZgO21z1zxvgYYO/3rgL7QNl7uSOUpz7Nh4qCGFV22A==
X-Received: by 2002:a05:7022:eacd:b0:11a:4ffb:984f with SMTP id a92af1059eb24-12171a85250mr15323051c88.11.1766468151780;
        Mon, 22 Dec 2025 21:35:51 -0800 (PST)
Received: from ?IPV6:2600:8802:b00:9ce0:637f:5cdc:9df0:d9ab? ([2600:8802:b00:9ce0:637f:5cdc:9df0:d9ab])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121725548b5sm54725089c88.17.2025.12.22.21.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 21:35:51 -0800 (PST)
Message-ID: <6f297260-3c99-4330-92ab-deeb1fc5d8f7@gmail.com>
Date: Mon, 22 Dec 2025 21:35:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] fs: delay the actual timestamp updates in
 inode_update_timestamps
To: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jan Kara <jack@suse.cz>, Mike Marshall <hubcap@omnibond.com>,
 Martin Brandenburg <martin@omnibond.com>, Carlos Maiolino <cem@kernel.org>,
 Stefan Roesch <shr@fb.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, gfs2@lists.linux.dev,
 io-uring@vger.kernel.org, devel@lists.orangefs.org,
 linux-unionfs@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org
References: <20251223003756.409543-1-hch@lst.de>
 <20251223003756.409543-5-hch@lst.de>
Content-Language: en-US
From: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
In-Reply-To: <20251223003756.409543-5-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_213552_778785_2C03B5BA 
X-CRM114-Status: UNSURE (   7.67  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 12/22/25 16:37, Christoph Hellwig wrote:
> Perform the actual updates of the inode timestamp at the very end of
> inode_update_timestamps after finishing all checks.  This prepares for
> adding non-blocking timestamp updates where we might bail out instead of
> performing this updates if the update would block.
>
> Signed-off-by: Christoph Hellwig<hch@lst.de>

Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>

-ck



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
