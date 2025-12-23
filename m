Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E92E6B25F
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Dec 2025 05:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TpqB2Fx0+7PB+MSa+Sho61NyZd/h89ygetM/+KmfHrM=; b=f7R3OMDA5wQNC/
	BLoZG7z9WZnyn882HavCxVwvB10zFw3y5EXNryVaJcR7J5GOCiRksYtl4t231I0+51udkhgbataO3
	Fvki/scjZV4lSd94No2bCXE4IEGWSsCyCdVhIOOpDtvxgQ20cILPgbfX2t1DiHq0dz5c8XY93biQm
	UVFxTT9wsi8ZNsXpO4GiiFBjE+R5ufLH8lR0V9b3bZ9+/Cfb3KtwZ30XDop/lKsO/ohy4Tq2Ugb7J
	EdkC32lsgWCU5+JFpeVNN57bp1ovqwIWXm2l4kmGr6lnMyH8rPrY6BlvEIdob6QriMiWoMGN3kPDr
	KwXphrElfES50jP/wHMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXv49-0000000EXje-1hyK;
	Tue, 23 Dec 2025 05:36:13 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXv46-0000000EXj6-27d4
	for linux-mtd@lists.infradead.org;
	Tue, 23 Dec 2025 05:36:11 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-34ca40c1213so3889815a91.0
        for <linux-mtd@lists.infradead.org>; Mon, 22 Dec 2025 21:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766468169; x=1767072969; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lW+UmIWRSVZ7zpivjjDN2RAk8y2uECMzZoBmWD3afKc=;
        b=S883QQC+y6d2Jl05FsdGBU77ZRuzwOIyl4Lz4guMR6piW2kXjfCVeYPxo2Pvt0PmiE
         WEwv/ERM2X5pe7yLYZNNhwOOCmEyfcbLw7QM7oWOF4PxV9KPd/WEO21poYV5pzKu3vhE
         8+6OxHolmcJGn8SbvVZ/zcQBrDMpeduw5TpiePY2RftaCN7gyjYlxuAnknLdFaNLaZmj
         tLJPwOPur1HJdzeavhGm6kn4L1AANf0DdUzs1mnOsPchONNt2JYSZoT7L2v1rX7h8CG3
         p818LZ32RhbIblnIxcFfOypxxRE0o6zxr6+UbFJbzb9iIv3fVRmqwin/tX8o6+/Jg7EU
         vHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766468169; x=1767072969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lW+UmIWRSVZ7zpivjjDN2RAk8y2uECMzZoBmWD3afKc=;
        b=ofFt7VcZy274l+dfF1B79sGQO2wZNeLofWz/44tasqL82LWXkSRGqCLKawYR5QhbDe
         roMHIEmrDQkCicCy5iXOwMCn/RmqdK9OhNqZtZrcgKQm8NQ71P3XzPym/DND2sgDm7Ws
         WqEyPOef/+KvDAo4BjokV7LQJuHlYYkGy1RKQ9wnT1BKiNCC9I7v6EuucARVTWbyzSFM
         qS5oPsw+qzYRUXG4fzMOpYAt83/pLpDL6vplEPkxJvps1ZyQDLNAqWDrZ/ANL5pWDZho
         oxk3HG+EJzoBwLvgordN1bbAarnXj2Bn8/YveS3PLehvB7LF2zNq4gGfLny3+C1sV1wz
         8ChQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5XqH3p91LBUf5b5BROpcs6fXqAJCb4d/PIWS83dZWyelk9uWpqjltHPL40umupHA1/JLcl5AbtIY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwgGES9JHVGq07IuWTdoH0TcQ7WjXgK+AMPj+keHyRrpaCF2Bgv
	vEwcrMl1RDwrox4dXgfsgAKKPD+315jfiQdAZ1EXmald15HErueWV3vX
X-Gm-Gg: AY/fxX4RY7oH1B1fmi3sAmTJo4c5eeAufPAepte+zrNJiMYiQ8fCLG0A1Z7S5SuW/vD
	tVcO6FoObZtXHGUFx2hMyBi0x7ZvmVu/pIZPTmKvBzprUrIWhslIxAOIWYipYesKirQr7OlgNxf
	/HNZwlej798zIJN7bCK2ukhSX5YUTmlel5bFtGgAkZptFe8Htu3ShNOW7PSypNARIfIWSKluixK
	7/fRcQ3FUQnHUlVOtS+r38yqxI757sh6USwRNU7YIwoyoCQVA91Z8Z2bPLsftpfD2ELwlhun11r
	yHsnCCw3vZ562+f+U9gPuG61kvXzkcCuu21cbgyf7KDI9Ce8DZ5uN109xnn0MuZXSbEwv0BwMSQ
	slPEfk7qvmSwMZpPnsamDZgjwzejjKmbXZDcPSvw262AvjvmCWcl5CLAWEzHANuztCt0lJWuWN+
	ARbfOrRaymCqugVJ50cGHh6VH+a+NKyO0+HtgDn4Ochi6OFXstM2VcHPIgcvx9E0ni
X-Google-Smtp-Source: AGHT+IH379xsDZ0d7vjKdC6ERRiENfgRNsDKq+A1tK8cXdwsmB2ywvOol5d1N83fquxU7SkCjjJrLg==
X-Received: by 2002:a05:7022:3b8a:b0:11b:79f1:850 with SMTP id a92af1059eb24-121722b7f23mr14589383c88.14.1766468169469;
        Mon, 22 Dec 2025 21:36:09 -0800 (PST)
Received: from ?IPV6:2600:8802:b00:9ce0:637f:5cdc:9df0:d9ab? ([2600:8802:b00:9ce0:637f:5cdc:9df0:d9ab])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254ce49sm52556580c88.15.2025.12.22.21.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 21:36:09 -0800 (PST)
Message-ID: <e2d34cef-c0f4-4f27-91a0-439f85ed26b5@gmail.com>
Date: Mon, 22 Dec 2025 21:36:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] fs: return I_DIRTY_* and allow error returns from
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
 <20251223003756.409543-6-hch@lst.de>
Content-Language: en-US
From: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
In-Reply-To: <20251223003756.409543-6-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_213610_554599_C9DB2D66 
X-CRM114-Status: UNSURE (   8.37  )
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
> Change the inode_update_timestamps calling convention, so that instead
> of returning the updated flags that are only needed to calculate the
> I_DIRTY_* flags, return the I_DIRTY_* flags diretly in an argument, and
> reserve the return value to return an error code, which will be needed to
> support non-blocking timestamp updates.
>
> Signed-off-by: Christoph Hellwig<hch@lst.de>

Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>

-ck



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
