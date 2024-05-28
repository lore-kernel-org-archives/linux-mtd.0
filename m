Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C938AC25B78
	for <linux-mtd@archiver.kernel.org>; Tue, 28 May 2024 11:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4aX6DGJzUgGMRQ2/l7g25sLaH4M/LSwbzo5lO4sw+g=; b=PwtSwMjycBHC/1
	stSVzhPG63B0jK4kEJMmO0CQ7De7rvERdhIYqL6RZ3wcN60xoSaCNPGrZSbCyi7hF1R+OzNPdKuZP
	zC+zoGmOa9RpZyDknAg/SMvAVFF8N07GW4cDRpMu37mK+qiQhPesRzEad8fDfgENYy77QtY9ZdHxR
	un58KEGwP6SDKq0J/22yqxqa2K5CeeP9EzdPUw6WVFxchfCCJtOEVx3TXohYDh8Rgsp8tYaPvyXAw
	aavnbb8GkqZIJmmlwQvDxvST6re+yojdhhDgX7FH8++l/LZKvwFu4+kl98g924fomALc5qQJbnMZK
	otIsLJdKRGH1+TLS4p+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBua3-00000000IT9-0cAY;
	Tue, 28 May 2024 11:01:23 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBua0-00000000ISD-2SzS
	for linux-mtd@lists.infradead.org;
	Tue, 28 May 2024 11:01:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Hs/HaD02iDeto1uLspqeiJWInIgpGjlvaek2azNHp58=; b=Pe8RHyiHjJYpdVm8fFoeYeRPkS
	3xkMMMGxye0zx+UtVGsa64mID/7Afu8Td7szz69x6LWa+osV9j5lKjZS7UEKaKuH39HTthO8lh2WZ
	BWZw/TCFkjOgBQpRcVsQwh5iyY+3FrHLc1d7+PCpC17S8lnuEAqopJ3VtwSOaPRvydmS8Zk2K/kF/
	BgDY6YL5aRzQe4W6n7mABxANtdo5EowU8Tft/ND0T/LUtahPJiBmagekAtGqdnjut7BnUpMffWCWQ
	t9wkjbaDvLC1kfIq67FXTuLdIMlZWmNoNt8z2o3DBZkyXrpXPayG1LRs0wmBW8cC94+dpP0rsoK0x
	5kWplkaA==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sBuZy-000PLs-Td; Tue, 28 May 2024 13:01:18 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sBuZy-000AHn-2B;
	Tue, 28 May 2024 13:01:18 +0200
From: Esben Haabendal <esben@geanix.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH] memory: fsl_ifc: Make FSL_IFC config visible and
 selectable
In-Reply-To: <ccdacf52-1b31-43a1-a8fd-33a252e24d51@kernel.org> (Krzysztof
	Kozlowski's message of "Tue, 28 May 2024 12:21:02 +0200")
References: <20240523-fsl-ifc-config-v1-1-6eff73bdc7e6@geanix.com>
	<979fd913-050b-445d-9ca8-0ec6906ce3ea@kernel.org>
	<87cypc38gu.fsf@geanix.com>
	<9a7f73f4-f5dc-4342-855b-08df6a839bb5@kernel.org>
	<87le3zoatn.fsf@geanix.com>
	<6c166ad5-8004-4bc4-9107-a47ba9a72161@kernel.org>
	<87ttijaglp.fsf@geanix.com>
	<c045f1a4-9ddf-4c53-a69b-22ceb68a1ce8@kernel.org>
	<87msobaes6.fsf@geanix.com> <87ikyzae7v.fsf@geanix.com>
	<e3aa72af-c824-4b71-a99d-c0b9294bfd8a@kernel.org>
	<87y17ul0cb.fsf@geanix.com>
	<ccdacf52-1b31-43a1-a8fd-33a252e24d51@kernel.org>
Date: Tue, 28 May 2024 13:01:17 +0200
Message-ID: <87plt6kxoi.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27289/Tue May 28 10:30:59 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_040120_779133_3CD00E55 
X-CRM114-Status: GOOD (  19.27  )
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

Krzysztof Kozlowski <krzk@kernel.org> writes:

> On 28/05/2024 12:03, Esben Haabendal wrote:
>> Krzysztof Kozlowski <krzk@kernel.org> writes:
>> 
>>> On 27/05/2024 09:47, Esben Haabendal wrote:
>>>>
>>>> Ok, I seem to still be confused as to what you want from me. If you are
>>>> saying that the kernel is not supposed to care about out-of-tree DTS
>>>> (and thereby any bootloader provided DTB), I would like to bring your
>>>> attention to arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts in upstream:
>>>>
>>>> &ifc {
>>>>         #address-cells = <2>;
>>>>         #size-cells = <1>;
>>>>         /* NOR Flash on board */
>>>>         ranges = <0x0 0x0 0x0 0x60000000 0x08000000>;
>>>>         status = "okay";
>>>>
>>>>         nor@0,0 {
>>>>                 #address-cells = <1>;
>>>>                 #size-cells = <1>;
>>>>                 compatible = "cfi-flash";
>>>>                 reg = <0x0 0x0 0x8000000>;
>>>>                 big-endian;
>>>>                 bank-width = <2>;
>>>>                 device-width = <1>;
>>>>         };
>>>> };
>>>>
>>>
>>> I don't understand why it took so many emails to answer that (my first)
>>> question...
>> 
>> Because I did not understand the question. Primarely because I was (and
>> is) surprised that out-of-tree DTS is not supported. I was convinced
>> that out-of-tree DTS was the right way for hardware which is not
>> commonly available.
>
> Even some non-GA hardware could, and IMHO should, be upstreamed, at
> least some parts of it. This gives the user/upstreamer reason to do
> changes. Otherwise you might get questions for contributions: why you
> are doing and why this is worth?
>
> Downstream or any fork is not really answer to such questions, because
> they are allowed to make whatever stupid choices they want (not saying
> it was done here, but in general), which should not be a reason to do
> anything upstream. If downstream creates wrong DTS files, shall we
> create wrong device drivers or bindings for them? No.

Of-course not. But to be fair, in this case, there has not been any new
bindings created, and no creative usage of existing bindings. Only
straight forward usage of existing drivers (IFC and physmap MTD driver),
which I am surprised no one else had seen the need to fix in upstream.

But do you/we really want to open the flood gates for DTS maintenance of
a gazillion embedded boards that only a few in the world have an
interest in? I suspect it would create quite a lot of patches to flow
through maintainers, with very litle benefit to most people. But for me
(as in the companies doing such these kind of embedded hardware), it is
a clear benefit to put upstream DTS files.

But what about boards where device-tree is created/modified dynamically
by bootloader? Is that also not really supported?

>>> Sounds good, however you did not update the existing select.
>>> Drivers are not supposed to select user-visible symbols (leads to
>>> issues), so you need to change it to depends and update defconfigs.
>> 
>> Do you wan this split into multiple commits, or a single commit changing
>> the Kconfig to make FSL_IFC user-visible, and changing select of it to
>> DEPENDS, and updating the related defconfig(s)?
>
> One commit for Kconfigs (nand and memory), additional commits for
> defconfigs, one per each arch, because defconfigs might go via arch tree.

Sounds good. I will send a v2 with that.

/Esben

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
