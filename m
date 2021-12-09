Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240ECC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 22:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Oti+0BQVSyLZ6XTUNYJPk+9Uz2WSx8ybWBA54+2nw4=; b=pibUAK+unHaPDzmSA9LOh5jxXZ
	U8230hXzr3jmmdcaS7cYjAsMSVY8WRpdQpxOAQJeEMKXzv5umc6QMDJF/AJrK2I4Iq9BAUz8ZLjga
	fVqjBzTQVV1LWxoHH8gsNH5VbRti2B0qa7aaoowTluoaqMfTYNZqfJtOrHr7Prxv+r5eNq8GV+ITM
	QBQ5Gjbr/M9baP5xtDlCYkTcHUaTy6D1pNYvR8fxfchk5aG2POQDTHi4ArvVhYzvxYuEG1M+CIdrI
	KW2Rthm1ICL1B+jYU27KEjiQAREMGHMkKfRy7Ak64msqP3CMly9ayfm9w5swKlav3hP8Nz6ZnP37u
	7RJ1cQbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvRgZ-000Bma-Sq; Thu, 09 Dec 2021 22:14:43 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvRgW-000BlA-WF
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 22:14:42 +0000
Received: by mail-lf1-x12e.google.com with SMTP id l22so14695391lfg.7
 for <linux-mtd@lists.infradead.org>; Thu, 09 Dec 2021 14:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:references:from
 :in-reply-to:content-transfer-encoding;
 bh=gIpbEmPxDp4BAdPOvRY3Yj0DvCa/hv+HcAkpqZLuC1Q=;
 b=m/SqmLOR9v+Eb0rCMH25MR/U8lhrsVMqK7waw3UwIEgQb6zs4Zv8M7RMV7Ts38qHMV
 Mn8CWhVj6uLD/t1lWqpeuMnMq5opzuj6tIJ++AG4ZQWtRfkU9h/sdYuKvNnNOlNrLrgH
 jPmmzC0DGb+q4ai0hWLTD/nRmMze2RjwWTlwNOzGZLoYqaKGIeu2hb5bcpDHcImu3px2
 fjsfNBPJvjY3THP9RsyoQ05+p8SE/J1x2JirBI3Oqp16OaDLTaY1uIHh+gKhPNy8X0ed
 FweDLnbOHwsCAMFVaFza7bIBIMHMPN61ozFfdVDoUlEblzif2ez4mQ/rDmiLGZRiKz70
 nkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:references:from:in-reply-to:content-transfer-encoding;
 bh=gIpbEmPxDp4BAdPOvRY3Yj0DvCa/hv+HcAkpqZLuC1Q=;
 b=nplUB2ZkwQgKeFcdccnJ+hMEntBCqSs31XT3A/y/VtzB60/IMU+nGQ2blMKXSxyeJN
 peHTN7IvhDWgzeND3f6W23zbZckXA6CabAzWc4ya10d+urc9C8lBWuLm+MZhpHFlwyPU
 i5tQRdpqoI/q6rSB9jxTsCyzCYAT3jL/nF6YKLCHnmqLYp3o5FCbTx5XDB8u7duu3LRe
 wbH4Y7BqHoNNc/qmfbXREk2kOvb6s3ZHkxMOM/sFTYgMeBFqIEqs1UQcPK34rFV5Eng0
 /sB/gYRYLax4QEkzuSb85tmZ1Z6qmsvOTa8sREiITBXBIhR9WCE1SfQsx4sY38bTNBog
 bGCA==
X-Gm-Message-State: AOAM5334RnLpl4ur35Wka3LO8+UPGGQHiJuy8ijJ16zL1B5be2mk6Y6i
 X1VgjF/OG4rdSxM3FRGBFk6Tr6+g5E0=
X-Google-Smtp-Source: ABdhPJxZgwHMdb6mXwc+Q+tU0H+v1/8nmOEmr66X706IjzHa1D3mZM1Ni9IPhNxQg09Omb/QdOQ9yA==
X-Received: by 2002:a05:6512:693:: with SMTP id
 t19mr8712951lfe.647.1639088079262; 
 Thu, 09 Dec 2021 14:14:39 -0800 (PST)
Received: from [192.168.26.149]
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id t7sm120049lji.43.2021.12.09.14.14.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 14:14:38 -0800 (PST)
Message-ID: <85498617-e63e-c746-6f42-662b5ea3df63@gmail.com>
Date: Thu, 9 Dec 2021 23:14:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: Identifying UBI volume instance / storing UBI volume metadata
To: Olivier Valentin <valentio@free.fr>, openwrt-devel@lists.openwrt.org,
 MTD Maling List <linux-mtd@lists.infradead.org>
References: <CACna6rwRtP-_SoAZVV0ZjFAcWQucRWVoZ0bxSZrFtDFW2McyYw@mail.gmail.com>
 <48BBA9D3-3DFB-4666-9FC5-6D4431486314@free.fr>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <48BBA9D3-3DFB-4666-9FC5-6D4431486314@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_141441_090441_EA9E1DE9 
X-CRM114-Status: GOOD (  11.89  )
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

On 9.12.2021 21:11, Olivier Valentin wrote:
> How about storing the squashfs into the rootfs ubi volume (as a bare file), start with an initramfs appended to the kernel and mount the root file with loopback block dev. The RW overlay part would be stored directly in the ubifs. (All modifications to the root image file would go in the overlay, so impossible to break the image)
> 
> This way, when you flash a new firmware, everything gets wiped, and you can factory reset by rm the RW directory.
> 
> It diverges quite a bit from OpenWRT usual way though.

Thanks for your reply. It doesn't fit OpenWrt's current design well but
I think it's probably time to rework OpenWrt's init if needed.

Just to make sure I understood your correctly:

Do you suggest "rootfs" UBI volume using ubifs with something like:
/root.squashfs
/overlay/

(and then initramfs as you described)?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
