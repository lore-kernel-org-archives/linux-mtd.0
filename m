Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E0CCCFA13
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Nov 2025 10:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WmcvFn4RPLsr7nGMIDp5yuNblxrRbzeq8qaM6JACUlM=; b=oq4kkGRVl+bedE
	B3V497fZHGRF5CS4VLPHdQHKBwxhALtnWRl6VR25oawKh6xgoNv6e0zTKEGMsEWMlLUXYsaGAt38h
	z28eOexS6Agz/CVSEhCugtQ/UVLfhT6tV9SUNhf/OJjeHBk9RR08Yc09ipeonBCxfbMuIRpGi4mM7
	Sig744/PMZLrvyd4smd/i4Tg0uZ29WR4WpxzTJ1vQqH/ijG5gwSdCOWchRm66bvRLDD0u6o7lUpty
	KKYzrgBcTS9gQftj2kx3QScdmffNZOCal4Z3NRTszFvMO14x1PdrNvKmbwXSNS9ke1dhWOWROhjky
	EXTJXo4sSBXFFpdIQfRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOvf-00000005AIg-2PHq;
	Mon, 10 Nov 2025 10:15:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOvd-00000005AIM-4407
	for linux-mtd@lists.infradead.org;
	Mon, 10 Nov 2025 10:15:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D06760146;
	Mon, 10 Nov 2025 10:15:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3005BC4CEF5;
	Mon, 10 Nov 2025 10:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762769716;
	bh=/rtTEMCWlk5a9mHq0PRXNCsvExHLysVcX2D+JNGWi6w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LRK2nL+sXLhkBD5L1oOcawpqfQkg+qf/gaqim7gWBUysH1RbXL8O+IebMn5b7+b4A
	 /K908yhfwXYKVT/OcA6DqQaxyy65lzNN7osZVyuhZTncZb2EOHijvQysm9Rjzz5S3M
	 nLK8ImCmQyBLrJO73jQukZFj5m4tJwvf3jmK3xlvLwl1NR1EgP6WsmWWL1bFeUxqZq
	 qzzDEbPZmEZvAgfPhpQhPdbIjyEqsA0OWbV5Rqyhh/n1OjN8tL5QbI1ckxb6AJl+A0
	 rCGD9DlgZy1W1Fp44KM+vpy6QdE8i3IRawthtMgqlUIEFA4RfGr9fpSjUC10Z3ZRfh
	 dXmebYFDMrp8g==
From: Pratyush Yadav <pratyush@kernel.org>
To: Takahiro Kuwano <tkuw584924@gmail.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Michael Walle <mwalle@kernel.org>,  Miquel
 Raynal <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Marek Vasut
 <marek.vasut+renesas@mailbox.org>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v2 0/3] mtd: spi-nor: spansion: Add SMPT fixup for S25FS-S
In-Reply-To: <e46094b8-911d-4838-8be0-1a085e04685f@gmail.com> (Takahiro
	Kuwano's message of "Sat, 8 Nov 2025 11:07:46 +0900")
References: <20251105-s25fs-s-smpt-fixup-v2-0-c0fbd0f05ce7@infineon.com>
	<mafs04ir5bynq.fsf@kernel.org>
	<e46094b8-911d-4838-8be0-1a085e04685f@gmail.com>
Date: Mon, 10 Nov 2025 11:15:13 +0100
Message-ID: <mafs0zf8u9osu.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

On Sat, Nov 08 2025, Takahiro Kuwano wrote:

> Hi Pratyush,
>
> On 11/8/2025 1:22 AM, Pratyush Yadav wrote:
>> Hi Takahiro,
>> 
>> On Wed, Nov 05 2025, Takahiro Kuwano wrote:
>> 
>>> Suggest new series as the result of discussion in the thread:
>>> https://patchwork.ozlabs.org/project/linux-mtd/patch/20240914220859.128540-1-marek.vasut+renesas@mailbox.org/
>>>
>>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> 
>> Checkpatch complains on all 3 patches:
>> 
>> WARNING: From:/Signed-off-by: email address mismatch: 'From: Takahiro Kuwano <tkuw584924@gmail.com>' != 'Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>'
>> 
>> Take a look at why your git-send-email didn't add the extra "From:" in the patch?
>> 
> Thanks for pointing out. I used 'b4 send' that time.
> I will check the settings.
>
>> For this patch series, is it okay if I change the author name to
>> Takahiro Kuwano <Takahiro.Kuwano@infineon.com> on all patches?
>> 
> Yes, please.

Applied to spi-nor/next with the author changed. Thanks!

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
