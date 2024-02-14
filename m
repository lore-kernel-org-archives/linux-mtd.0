Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F39DC48BC3
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Feb 2024 13:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TwKpVISAqRpsqdtubg8+JtR3LrnaGlB1wuG7/TkPEuc=; b=a/2YYHK4ya6mI+TSywrf+IjzHB
	YxmRZb9JVF/Yri2WXcEpoRFPx/NCJ7U6lH+VeroUaH+wsGz4cqchQTO4vvKUVBobx39ofnZ7JpMko
	dPt8hr/6Ab3EGVYvdW5EDGjsOHHjjE7DbqcuIKjhGZh5HrDX7ol5DsYfl7Qr5WvqiJOYyhcJoN5rC
	2M8srtCp53m7Kturkp58ga6AUsEuq02rrcg5LtOGIeCOdiBR+hliPbWHcNBw+1GDCRLgXP7mwtM2w
	dPEwj16GzMGv12bDtN1avu2WChDhY1/B7bW5Fvev+dQX8YUX/YACcRkUUjRo4v5TtBACgBW2ueYI6
	+XMgKu/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raFSJ-0000000D2gR-03VN;
	Wed, 14 Feb 2024 13:37:43 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raFSG-0000000D2g3-11au
	for linux-mtd@lists.infradead.org;
	Wed, 14 Feb 2024 13:37:42 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-56394d0ee54so6397a12.3
        for <linux-mtd@lists.infradead.org>; Wed, 14 Feb 2024 05:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1707917857; x=1708522657; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jcIG+sES/UDj2UMTbml6c3yDM4TLL6h8rRnGCcVcC2U=;
        b=YRACqJQ+hBgMIilCjbck+LU35k0Xtf+nIE8qj7+2AwaejFoG9hUK5LUfAvbeuLWEab
         OKNYn7Ls9u5qZAdmrpsnRb1X2dusnC6+mg6q9X85jOvfM+mbebMyCEALcBVL1fUyMaa1
         VGWuBxSE3Vi5aAm1x7u76WDiGlLLYuCP7vg/PY19M3CEwQRmxmLJD9JaQVOht7MfGIvM
         NAZOSTT+Mdtcq2lpiv70CQm7T2E3/ydDvdH1TIPC7puHjQsGv+PQVOzdjoIM92V9O3Sd
         DPY5UYVWj9u+d7OQFD16kjcKczMBMY6ezPdLkT75yihcFEQyIANagbpUDRY5369Br0r7
         zJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707917857; x=1708522657;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jcIG+sES/UDj2UMTbml6c3yDM4TLL6h8rRnGCcVcC2U=;
        b=jZiThWkbrks8/InleE26PWwD7hgo7OQCdLzjdKQCox/MW+4321INYETu4HUBYlGsnK
         aAEMIUunNmA7bDR6MoM/gVBywrbP2I9yWIhzDgPELIuO5BogVYvKBGrf2IU2mQd4f4Fu
         WVLvGSU5Neru9NHoJh+hZ8IUxUqDXsLguu/wFNkwC2noj8juw+9KsRkrYmSTWOFS9wuJ
         lkRK92Qs4ThW2hb7ykTIbhyZNfMlRdMXGdQCbEHS1Ult5VRF04c1rpolvyN5IyxTnNic
         8UIUUc3a5P0d08vE1Lek+bO/AS3U5Tqd+yT6Qfx+VFgCZGVo3mRAVPBrbnpj53thCAg7
         j1/A==
X-Forwarded-Encrypted: i=1; AJvYcCWewR8Fw+2HtkHL7Ia+0VS3RkWGtNvECMWQAy7FBL2xMrNyC/JnBr/nZpUzKLH0qUnqUkUnnT+9PDUhwYuYxB42TIUJQ6qZ2OzWk9N7Cg==
X-Gm-Message-State: AOJu0Yxti36b8m48plgwkhLOu7SLEmxb6kloZaOQnE/dvQO6bW0g/CGc
	5sqkEkWJP9CRyFSeETYRopy2ip57iUmAcJUhZtS3fqnt11EvSIfhjgQrd04QUHY+pymUU2mWV7i
	Q
X-Google-Smtp-Source: AGHT+IGPNI3X0Y9jf0uqhM0zJTVNQaPLxWkWbL3Uj91D4n8k6GJTDZM9eAYa869V7c51WHdj3KR9Jw==
X-Received: by 2002:aa7:d707:0:b0:561:ff30:2d44 with SMTP id t7-20020aa7d707000000b00561ff302d44mr2137169edq.17.1707917856802;
        Wed, 14 Feb 2024 05:37:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWFvvKVfAKVBbHn2Y4SLO7uSWwB9DTc2GMnL8fc6u5Pca5iXVxa7au1+YGt9t2zE+j0TuDccybGZMr/KUA1JTFEfxNLh0t9S6dT3rjvjg==
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id s9-20020aa7c549000000b00561f800686asm1438748edr.23.2024.02.14.05.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 05:37:36 -0800 (PST)
Message-ID: <c9c1f8bb-41b6-4ccd-ada4-86ea6f127b25@sigma-star.at>
Date: Wed, 14 Feb 2024 14:37:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Wrong "ar" is used when crosscompiling since 2.1.6
Content-Language: en-US
To: Rolf Eike Beer <eb@emlix.com>, linux-mtd@lists.infradead.org
References: <12380359.O9o76ZdvQC@devpool47.emlix.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <12380359.O9o76ZdvQC@devpool47.emlix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_053740_627223_562D6613 
X-CRM114-Status: UNSURE (   8.31  )
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

Hi,

On 2/14/24 12:06, Rolf Eike Beer wrote:
> since version 2.1.6 building will always use plain "ar" when creating static
> libraries. Before it used the one matching the target triplet when
> crosscompiling. I can circumvent this by passing "AR=foo-bar-ar" to make for
> the moment. I suspect it is a side effect of the libtool removal.
> 

this indeed seems to be the case. I patched the autoconf file to include a check
for ar. I quickly verified both the broken behavior and the fix with a yocto
toolchain. The fix is now pushed to mtd-utils.git master (the commit hash is
1be992db04fc71296a98303724635b2b6b0cd10d).

Thanks,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
