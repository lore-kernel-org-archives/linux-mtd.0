Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF34DFC97F3
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2026 15:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jKIQYj58WZzszb6mUzFMzQDRe6WpAy62jd5xT5lybf8=; b=s1p/8URRP9JxIZ
	hK6Dy2IXy4b2G5pdrTDRsZbm4FW3qJFWvF0QujCpVa8V46CBoY0tJBppPQKlhU7swja1FNBXCEroI
	vFcFXoCWHsEy86w+NMgbz5O+jgp07Tmsqlqo5UzEuhKlpvLh7rH6bfYMYrY9msB7/lfPV6cNbbvO2
	dIRFqZNVZgFro1f7wEawkKJ/yzbe8GHAqAPL7rO5Be3pbGk+aSUZChlI/kjtP6aamULioct6yAM8/
	wv4iQrdYmfm3BgPUNY/0hzAD0ytUhrPQYaRRL4suToQuQGdFzer0gmsUP+cLq6povW9rXx8tv0HGT
	4KFNnDZioo3vOe1WX7/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7E6O-0000000BXId-2tgD;
	Mon, 30 Mar 2026 15:00:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7E6J-0000000BXFa-3tT6
	for linux-mtd@lists.infradead.org;
	Mon, 30 Mar 2026 15:00:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 14B9860054;
	Mon, 30 Mar 2026 14:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D94F6C4CEF7;
	Mon, 30 Mar 2026 14:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774882792;
	bh=3yqYiQng4m8v5YKa4rUJigsrZ0PGZov19nOKLuZSoV4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=F8Ea2zKRZtE1pfJkS5FtgdCqfdd9+QUha905fogbbJfPMYKQNtUYoIq5SpgU03qtP
	 /Oz4/RZZdX5XtDqKOoIFFYTeDQ1J7iyQTn8gPA/+vPTvv+A989JeJzr7kYOMklmg2z
	 +W2Ncn4cwHP8zYQNa8PtE2XEB12D8zFRQivgLsBV04bC4XzWpLaThLS19ZXiYkR0KN
	 NLTQbnMYr0Kh/Xa/K90tksX7XMk/yeWPRRIR4lrYJp0O+Rw7MyO1Z2lflDVSpgulPD
	 lKLh7eD+vbx0EQ6S/9y3F6PaAK+ZSDjEVZax0Bd5IQnLH0+fNBQFRGP7ii4P3u4UWo
	 tLGti3rLO+zWg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Eliav Farber
 <farbere@amazon.com>,  <tudor.ambarus@linaro.org>,  <mwalle@kernel.org>,
  <richard@nod.at>,  <vigneshr@ti.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] mtd: spi-nor: winbond: Fix protection handling
In-Reply-To: <87pl4l9z3c.fsf@bootlin.com> (Miquel Raynal's message of "Mon, 30
	Mar 2026 16:22:15 +0200")
References: <20260218143523.17467-1-farbere@amazon.com>
	<2vxzcy0l1k7g.fsf@kernel.org> <87pl4l9z3c.fsf@bootlin.com>
Date: Mon, 30 Mar 2026 14:59:49 +0000
Message-ID: <2vxzzf3picre.fsf@kernel.org>
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

On Mon, Mar 30 2026, Miquel Raynal wrote:

>>> The devices do not correctly describe their Status Register layout and
>>> protection capabilities (locking flags, TB bit, BP bit configuration).
>>> As a result, the spi-nor core rejects protection requests and locking
>>> operations fail with -EINVAL, e.g.:
>>>
>>>   flash_lock -l /dev/mtd29
>>>   flash_lock: error!: could not lock device: /dev/mtd29
>>>   error 22 (Invalid argument)
>>>
>>> Update the device flags to match the actual hardware behavior so that
>>> locking and unlocking regions work correctly.
>>>
>>> All changes were validated using flash_lock on the affected devices.
>>
>> Applied patches 1 and 3 to spi-nor/next. Thanks!
>>
>> Skipped patch 2 since you say that you haven't got a device to test
>> with. I don't have a very strong opinion on this, but I do think we
>> should test patches on real hardware just to we get some sanity checking
>> for the patch.
>
> Honestly, I am pretty convinced patch 2 cannot make more harm as the
> block protection is already badly broken by not being described at
> all. Furthermore, for similar chips I have, these bits are relevant, so
> I would rather be in favour of going forward with patch 2, because at
> most it will just not fix the behaviour as it pretends it does.
>
> My 2cts :)

Hmm, okay, I'll apply that one too then.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
