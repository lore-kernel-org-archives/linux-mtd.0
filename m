Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA45E6BF0D
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jan 2026 13:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1w99l1MFjX37fjxTuP5OIBrnMx63R6TlyZcAUVm8UJ4=; b=NCQpmK87+91pCS
	fPY7O2kYOWfjbyVpV777q8FoU5Wlg2iPDwMqAKuMiR5KYnvkLG0wltA90RIjX35SyWJZDHf7Vb+LD
	k90UBjUKAPSMtbdkHLXbQjhalyrQFtuQ+vsluPSAnxQxCEJsiIigblRAJ/NCnSEwy6JXThzsMYrTF
	xG4GBpRomNwVk6wBA338yNGqhL7qJ+zg2zIrzwQQXFqEGCMACg+lwJGyD+jWHGzC8oxl8Oa6edGL8
	li9sDLGPkGDyo3XB4JaYaEG63wRkah0PYAhZy7ZokZ8k6pwdXVMvPUl05n3fZtVNP++VBaObDanI+
	ymMy/+TFvWQiTFejSkLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlok0-00000001Y0p-18o2;
	Fri, 30 Jan 2026 13:40:52 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vloju-00000001Xzo-3HiL
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jan 2026 13:40:49 +0000
X-QQ-mid: esmtpgz15t1769780391t7216e907
X-QQ-Originating-IP: uxJwp3J5Jz7kasf0mzapFd1F9HCnZEW4Tuf3NAEbV2M=
Received: from [192.168.0.109] ( [110.81.94.113])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 Jan 2026 21:39:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9357198044114509192
EX-QQ-RecipientCnt: 10
Message-ID: <86F97239DB3D962C+98826904-6649-4c19-815d-73003c046c14@radxa.com>
Date: Fri, 30 Jan 2026 21:39:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Xilin Wu <sophon@radxa.com>,
 Junhao Xie <bigfoot@radxa.com>
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
 <x4sxekwxkrylw54rvtnvwjfyfruhd6bd2jlfe5nv4sehbosetn@sxf5wpb3nas2>
From: Junhao Xie <bigfoot@radxa.com>
In-Reply-To: <x4sxekwxkrylw54rvtnvwjfyfruhd6bd2jlfe5nv4sehbosetn@sxf5wpb3nas2>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: MtYPpoBCfkHltRSTkjoOA0/9Fm2WPhrkzimI8jgFBCBF8yFwCl487xgK
	iMG7vKY+qRBWQ4QDuLyN09/17DLv5ZtA1YrT6DOIzaersVjTcf/RGOIZcN5nCz/LLWClW7d
	0sF7zqmYP7zF9QX4NwPi1x0EtCPm4dkx7KB+HyBGlEQlgf7jaQslA/bRGW2fVerK+OovvaY
	dwuNlwFcP9kB7++vzCYdCfhDymfu7hfLmM4L4Kx1N1VDD04w7laHpQsel8Xb+szN52gXHvq
	7leg6dYW8nihR/Ac+j9L7iTICpqkRciIqK79bwpoEWyU2EQWyhP7JY/pPmglXhYWMlsmdFq
	AHWCm740TGkbVd/qWuxENu4VwAoelj86khb0gKMA01ra/vCCfVXR+pJu9wrqCY1pE7HJr7t
	QWCmnQXzZ/h2lQ1/Orz7/QlqqsTnnqG2wvW1RkbCeokaprSk0D53h7JuxQiAKMCHu8ZATeF
	jZ/ocqWRmyDgWhGWoXYCwEgSQZHi+ld+69wiy/8+y8I2MMKL72wVXJIZC291I2hW7tuU2Kp
	uvR/2WXjJNf+j0W+taIE+qZ9p5Gr4scd0CydXZGFky+J3m2C6p0gvj+Ag2VbBMFkmgNX1Wj
	vxfD4U8k6Z6j2Oiz4pvHq98p2PTw/LjOMqnbWL6Rr0Nwr3YWFjZpikOMfFO8C6izC640glB
	1qCjHew925/UHBBSOPplo5IEXyS4QZQI3wAr6vAdBJs67VLQMEH1HoyUROBKU5wJ4+pcxAz
	ZDs+maw8VXQysvs6gWQprs5kOVtP6DW4sioXfNysSOe3ETcRZGLVsMRfG1BYwJSeGQXROiM
	OgQSwJh/5gnm9lXpVvenYZQUuwl9PoAcNfMSePk8UG7+wqs51Ekz6M7Yf6RTzBu14YFYA/M
	zXgwfvhnL7ObI5xWl7kuJAhUScA+fDEjx4FkE2uZjnHCRizK7as/017RRt2OIQGaUufsvHq
	VVH3UW9giR49lJ5wDhDqoLxAxzHoHtQMujjTHKQo5dEM6Q7OWOLvF9HrV4FOL3iwRwZUHmI
	su6bb7AekWXbQfjgGwp/Ns+ZfuiDBku/aHc+MV2yXb/w3jefiM
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_054047_774003_A945A296 
X-CRM114-Status: GOOD (  26.94  )
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

On 2026/1/29 4:42, Bjorn Andersson wrote:
> On Mon, Jan 26, 2026 at 07:44:50PM +0800, Junhao Xie wrote:
>> This patch series adds support for accessing storage devices managed by
>> Qualcomm TrustZone firmware via SCM (Secure Channel Manager) by
>> introducing a new MTD driver.
>>
>> On some Qualcomm platforms, firmware or BIOS-related storage (typically
>> SPI NOR flash) is not directly accessible from the non-secure world.
>> All read, write, and erase operations must be performed through SCM
>> interfaces provided by the secure firmware. As a result, existing MTD
>> SPI NOR drivers cannot be used directly on these systems.
>>
>> This series introduces a new MTD device driver that exposes such
>> firmware-managed storage as a standard MTD device in the Linux kernel.
>> The driver is built on top of the existing Qualcomm SCM infrastructure
>> and integrates with the MTD subsystem to provide a uniform interface to
>> userspace.
>>
>> This driver has been tested on Radxa Dragon Q6A, based on the Qualcomm
>> QCS6490 SoC, with a Winbond W25Q256JWPIQ SPI NOR flash device.
>>
>> Note that this platform previously used the standard Qualcomm Linux
>> firmware, which allowed direct access to the QSPI controller without
>> needing this driver. However, we plan to migrate to a Windows-compatible
>> firmware which is more feature-complete but restricts direct access.
>> Device tree changes for this transition will be sent separately.
>>
>> If kernel boots with EL2, access to the SCM storage will be denied. This
>> needs more investigation.
>>
> Sorry, I missed your reply to me on v1.
>
>
> You replied that this allow your users to update "BIOS" firmware
> directly from Linux, which I can see being more convenient than relying
> on UEFI update capsules, in particular in a development environment.
>
> The concern I have with this is that I don't think an end-user of such
> system, has a way to recover from breaking the content on their SPI-NOR.
>
> As such, exposing such a convenient interface for the end-user to brick
> their devices is probably not a good idea.
>
> I think we should somehow lock the interface down to be read-only by
> default, and perhaps have some mechanism to unlock the write mode (like
> a module parameter expecting the sentence "YES, I DO HAVE THE FIREHOSE
> PROGRAMMER FOR THIS BOARD").
>
>
> I don't believe you answered my question regarding how to access this
> interface from the kernel. On many of these devices we can find the MAC
> addresses of the system in the "DPP" partition. Do you have any ideas
> about how we could access this from within the kernel?
>
> Regards,
> Bjorn

I agree with your point. I will add a module param in v3 for default
read-only mode. e.g.: /sys/module/qcom_scm_storage/parameters/allow_write

For something like the "DPP" partition, I think it's better to access it
from userspace than from kernel.

Best regards,
Junhao Xie

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
