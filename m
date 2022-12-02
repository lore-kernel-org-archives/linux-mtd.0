Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B2CC4321E
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 15:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dUxjGgBBfHTw85fQ0A4GdvkGCzTCpgwmGakZns5gwHM=; b=d0Jmt0bdxtmuPS
	8yn6YspA2kBuk31XOLmQajbvAD4ugHcGo8KTmAq55aVVtTcg0xbixNg2in/hqTgqPawDHbAijuhXv
	3TfavJ/gXnyXUQVoLonWhocE3gZvOER876fA1ab2ywy+RQzzp7tI5N6QJYI4XYvnvA2hMW7cvbfPT
	hL663XuIM0g7a/TCHTyQIJVzy9rlBZqenjqvUkSnXUTzBcx/BfcJ7pSLJKJ1KYsgSVDlRLfLP/PiF
	TPGP8Y6RTtOYqAlwis9OkPax28gmGEJ2L7IVpJDMK/gHToax3dWr/i3lpVjz3l8QoSBtI5PiWLSVy
	tuqtyZgjMBqAyBzFCIEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p17t9-00H41n-SN; Fri, 02 Dec 2022 15:23:43 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p17sy-00H3zC-K5; Fri, 02 Dec 2022 15:23:34 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 4C5A482A0A;
	Fri,  2 Dec 2022 16:23:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1669994611;
	bh=FjNc72d88EtpHVUFPRlV9jQ4MgH1XMswRIXxAkTYQqE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=yTMVKYBpiaA3apV+F/BKc+U5iNWDA2lUgnnvv0wdQ21WLmQAhbwGdPZe9zCHOiI6i
	 or/dlonUdzHh/J6LbQRiRgFnRe7Zet0734Dqm6SUSMWj1NgqyJhWlEJU6u8hAgd9c7
	 0KJrUa8SKlNXFWCPkd6WGwWsnqJu/GujuWTocNCr4cDSXJ+mZO3yYA6xxg/Az7B2my
	 JbZsCJ8tE+Yh5RT8t5/73DFjymBuyLFGJbtUizVCZxMp6cn1bq+O5E6CfqSpDA+h9u
	 DYNOg1dtdbxxRUqDnSQ49aUYJOknFyvLjVTSBTxtlUlvUoFu3rz3I0scwOPSaBRa65
	 ZvJC2DUs6/odQ==
Message-ID: <223b7a4e-3aff-8070-7387-c77d2ded1dd6@denx.de>
Date: Fri, 2 Dec 2022 16:23:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1] mtd: parsers: ofpart: Fix parsing when size-cells is 0
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, u-boot@lists.denx.de
References: <20221202071900.1143950-1-francesco@dolcini.it>
 <20221202101418.6b4b3711@xps-13>
 <Y4nPmzdgaabg3a3/@francesco-nb.int.toradex.com>
 <Y4nSXQirO2N5IRfu@francesco-nb.int.toradex.com>
 <20221202115327.4475d3a2@xps-13>
 <Y4ngOaKq224LIpQc@francesco-nb.int.toradex.com>
 <20221202150556.14c5ae43@xps-13>
 <2b6fc52d-60b9-d0f4-ab91-4cf7a8095999@denx.de>
 <20221202160030.1b8d0b8a@xps-13>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221202160030.1b8d0b8a@xps-13>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_072333_193119_05F12F6D 
X-CRM114-Status: GOOD (  33.58  )
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

On 12/2/22 16:00, Miquel Raynal wrote:
> Hi Marek,

Hi,

> marex@denx.de wrote on Fri, 2 Dec 2022 15:31:40 +0100:
> 
>> On 12/2/22 15:05, Miquel Raynal wrote:
>>> Hi Francesco,
>>
>> Hi,
>>
>> [...]
>>
>>> I still strongly disagree with the initial proposal but what I think we
>>> can do is:
>>>
>>> 1. To prevent future breakages:
>>>     Fix fdt_fixup_mtdparts() in u-boot. This way newer U-Boot + any
>>>     kernel should work.
>>>
>>> 2. To help tracking down situations like that:
>>>     Keep the warning in ofpart.c but continue to fail.
>>>
>>> 3. To fix the current situation:
>>>      Immediately revert commit (and prevent it from being backported):
>>>      753395ea1e45 ("ARM: dts: imx7: Fix NAND controller size-cells")
>>>      This way your own boot flow is fixed in the short term.
>>
>> Here I disagree, the fix is correct and I think we shouldn't
>> proliferate incorrect DTs which don't match the binding document.
> 
> I agree we should not proliferate incorrect DTs, so let's use a modern
> description then

Yes please !

> , with a controller and a child node which defines the
> chip.

But what if there is no chip connected to the controller node ?

If I understand the proposal here right (please correct me if I'm 
wrong), then:

1) This is the original, old, wrong binding:
&gpmi {
   #size-cells = <1>;
   ...
   partition@N { ... };
};


2) This is the newer, but still wrong binding:
&gpmi {
   #size-cells = <0>;
   ...
   partitions {
     partition@N { ... };
   };
};

3) This is the newest binding, what we want:
&gpmi {
   #size-cells = <0>;
   ...
   nand-chip {
     partitions {
       partition@N { ... };
     };
   };
};

But if there is no physical nand chip connected to the controller, would 
we end up with empty nand-chip node in DT, like this?
&gpmi {
   #size-cells = <X>;
   ...
   nand-chip { /* empty */ };
};
What would be the gpmi controller size cells (X) in that case, still 0, 
right ? So how does that help solve this problem, wouldn't U-Boot still 
populate the partitions directly under the gpmi node or into partitions 
sub-node ?

>> Rather, if a bootloader generates incorrect (new) DT entries, I
>> believe the driver should implement a fixup and warn user about this.
>> PC does that as well with broken ACPI tables as far as I can tell.
>>
>> I'm not convinced making a DT non-compliant with bindings again,
> 
> I am sorry to say so, but while warnings reported by the tools
> should be fixed, it's not because the tool does not scream at you that
> the description is valid. We are actively working on enhancing the
> schema so that "all" improper descriptions get warnings (see the series
> pointed earlier), but in no way this change makes the node compliant
> with modern bindings.
> 
> I'm not saying the fix is wrong, but let's be pragmatic, it currently
> leads to boot failures.

I fully agree that we do have a problem, and that it trickled into 
stable makes it even worse. Maybe I don't fully understand the thing 
with nand-chip proposal, see my question above, esp. the last part.

>> only to work around a problem induced by bootloader, is the right approach
>> here.
> 
> When a patch breaks a board and there is no straight fix, you revert
> it, then you think harder. That's what I am saying. This is a temporary
> solution.

Isn't this patch the straight fix, at least until the bootloader can be 
updated to generate the nand-chip node correctly ?

>> This would be setting a dangerous example, where anyone could request a DT fix to be reverted because their random bootloader does the wrong thing and with valid DT clean up, something broke.
> 
> Please, you know this is not valid DT clean up. We've been decoupling
> controller and chip description since 2016. What I am proposing is a
> valid DT cleanup, not to the latest standard, but way closer than the
> current solution.

I think I really need one more explanation of the nand-chip part above.

[...]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
