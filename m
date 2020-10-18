Return-Path: <SRS0=OH0o=DZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EFC1C433E7
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Oct 2020 14:05:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27C4B21655
	for <linux-mtd@archiver.kernel.org>; Sun, 18 Oct 2020 14:05:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YJpdBfDb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jl9paAc0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27C4B21655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IjeErqh8CNcy6lIG22RRu27rrSOhNfO63Q5yoXCKixc=; b=YJpdBfDbBm7yvkQ1AywpP3VCd
	QxztpvLYiWgMDX+ihmQrLxeF6/YzYh3C/Mi/9MUzlvtv2B68Se8ekC3iUMqynjMFS79Nvj1dkgPyg
	n91se77ZzGkC/iUl+ftrnwkl7Wi1OybKNCpdU3mLl1yIy6rSN3b5EBnz0KYvbg2T0wxBXq6NZJ1AU
	E7HR0qWy1XCJRrouL6bHYFLNBgE/w6Od0Kg3kt2Rbj7ykVjFtX9qBpsT6eYEO8LeznwWoK6B7Y3zi
	fxbwmS6elSoGh5l9dGhoBEm6cAHGLUhg5sez1v2NtbDJZ2koBO0BDkzo4ELGNTHHkPbfG1KtuRZ0N
	ya/3+1rUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kU9J3-0004ij-6V; Sun, 18 Oct 2020 14:05:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kU9Iy-0004gu-QL
 for linux-mtd@lists.infradead.org; Sun, 18 Oct 2020 14:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603029899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kBVMPnQfqrYuRmZ0mFLSkNqYWCaxPfshC6ZYuKW12NQ=;
 b=Jl9paAc0GYH63Eb3NUP6GiM3Fw7GGnOidJCgYpi8QVeG6+/rM9l63qiNec+9sV/UEw40Fp
 6Dcy8h9JC74FEFPRhmAuEG/+A6irMFkfNOUWRFzU0Yyfj8NfcLBO7z8z0jR393x4mGp5Qv
 9j1xMaC0W0qEZ/gIdqQCRvUnHGfLlkQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-02HbDOZtPJ6zRogZLOmXqA-1; Sun, 18 Oct 2020 10:04:56 -0400
X-MC-Unique: 02HbDOZtPJ6zRogZLOmXqA-1
Received: by mail-qv1-f70.google.com with SMTP id y45so4487862qve.15
 for <linux-mtd@lists.infradead.org>; Sun, 18 Oct 2020 07:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=kBVMPnQfqrYuRmZ0mFLSkNqYWCaxPfshC6ZYuKW12NQ=;
 b=W5mrgLR138F8e6TEPI3R6Rk5wVKoCZc1t9A5gsym01IMFR01mtkZSTNRzfgqZdEGZ+
 Cx34xpJE0Nit4dtzx8+/QXmzj/mk3PVUDiqxeTjNXiuMEK4vQtXGEEHhIdMM/drc/m3y
 7WRLHliA5YqZEeMAeAbWoo3f1mTIKIrbq0u1iSoS9me+NKQSZ5L8v4LCFz2o8EWgaz1Y
 hZ5iVoYwKu7vOCe92Z1kC0LDnme/U0LXd9RIpDuUy4ElQTn/Jnyyg7ku4SElDDTXBeNb
 K5yCRsLATedJqIPMffTwWhHBYB8WEsxD8Bo8moTYmVT2bHnUGJO2XqEm4M0Q9vdadJ56
 bQnw==
X-Gm-Message-State: AOAM530OLBIsTN0pDcYELpyGmzu0Q7qQO2e9bW4YP8EVBzrZcOKf8Z2+
 7Mxh6oRoOOhJA3W+15Syo/XBGQhVL1u6JckXBPwbgvK41peewbpv+Iatfv52T5sVvH8CQMVLEKy
 XFccDwEJpWj+dN8XjAcoLTx7ZKQ==
X-Received: by 2002:a05:620a:1287:: with SMTP id
 w7mr12724328qki.436.1603029896370; 
 Sun, 18 Oct 2020 07:04:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6z5rS79nBj0nCbIqVRZ9qmkAzjArqewdITB0rtwnhi1UUe/kvxLZTENMJDRITA4iBlrUAlw==
X-Received: by 2002:a05:620a:1287:: with SMTP id
 w7mr12724258qki.436.1603029896034; 
 Sun, 18 Oct 2020 07:04:56 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id u16sm3288927qth.42.2020.10.18.07.04.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Oct 2020 07:04:55 -0700 (PDT)
Subject: Re: [RFC] treewide: cleanup unreachable breaks
To: Greg KH <gregkh@linuxfoundation.org>
References: <20201017160928.12698-1-trix@redhat.com>
 <20201018054332.GB593954@kroah.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <eecb7c3e-88b2-ec2f-0235-280da51ae69c@redhat.com>
Date: Sun, 18 Oct 2020 07:04:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201018054332.GB593954@kroah.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201018_100501_106755_F210C1B4 
X-CRM114-Status: GOOD (  12.25  )
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
Cc: alsa-devel@alsa-project.org, clang-built-linux@googlegroups.com,
 linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org,
 storagedev@microchip.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, ath10k@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, usb-storage@lists.one-eyed-alien.net,
 linux-watchdog@vger.kernel.org, devel@driverdev.osuosl.org,
 linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, amd-gfx@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 industrypack-devel@lists.sourceforge.net, linux-pci@vger.kernel.org,
 spice-devel@lists.freedesktop.org, MPT-FusionLinux.pdl@broadcom.com,
 linux-media@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-nfc@lists.01.org, linux-pm@vger.kernel.org, linux-can@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-amlogic@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net, platform-driver-x86@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-crypto@vger.kernel.org,
 patches@opensource.cirrus.com, bpf@vger.kernel.org, ocfs2-devel@oss.oracle.com,
 linux-power@fi.rohmeurope.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 10/17/20 10:43 PM, Greg KH wrote:
> On Sat, Oct 17, 2020 at 09:09:28AM -0700, trix@redhat.com wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> This is a upcoming change to clean up a new warning treewide.
>> I am wondering if the change could be one mega patch (see below) or
>> normal patch per file about 100 patches or somewhere half way by collecting
>> early acks.
> Please break it up into one-patch-per-subsystem, like normal, and get it
> merged that way.

OK.

Thanks,

Tom

>
> Sending us a patch, without even a diffstat to review, isn't going to
> get you very far...
>
> thanks,
>
> greg k-h
>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
