Received: from mail-wi0-f178.google.com ([209.85.212.178])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TyhHp-0000VC-8s
 for linux-mtd@lists.infradead.org; Fri, 25 Jan 2013 11:17:34 +0000
Received: by mail-wi0-f178.google.com with SMTP id hn3so210497wib.5
 for <linux-mtd@lists.infradead.org>; Fri, 25 Jan 2013 03:17:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CACna6rwnnXzPxoeyKcsXYoDALyVMD3mz96EavRB=9VuwN5xxwA@mail.gmail.com>
References: <1356526466-27360-1-git-send-email-zajec5@gmail.com>
 <1358256409.2731.137.camel@sauron.fi.intel.com>
 <CACna6rwnnXzPxoeyKcsXYoDALyVMD3mz96EavRB=9VuwN5xxwA@mail.gmail.com>
Date: Fri, 25 Jan 2013 12:17:30 +0100
Message-ID: <CACna6rw5haxDLKS=e6L7xZhSm5LQd82iGGFSaOwf1-nCM2ehrg@mail.gmail.com>
Subject: Re: [PATCH] mtd: bcm47xxsflash: adjust names of bus-specific functions
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/1/18 Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>:
> 2013/1/15 Artem Bityutskiy <dedekind1@gmail.com>:
>> On Wed, 2012-12-26 at 13:54 +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
>>> This is needed to add clean support for other buses (like SSB) in the
>>> future.
>>>
>>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>>
>> Cannot compile-test this patch because of the following build regression
>> in 3.8-rc4:
>>
>> In file included from arch/mips/pci/pci-bcm47xx.c:27:0:
>> include/linux/ssb/ssb.h:440:19: error: field 'gpio' has incomplete type
>> In file included from include/linux/bcma/bcma.h:7:0,
>>                  from arch/mips/pci/pci-bcm47xx.c:28:
>> include/linux/bcma/bcma_driver_chipcommon.h:582:19: error: field 'gpio' =
has incomplete type
>> make[2]: *** [arch/mips/pci/pci-bcm47xx.o] Error 1
>
> This was already explained by Hauke and I believe you applied proper
> patch to the maintaining tools.
>
> Can you re-try to add this patch?

I can see it doesn't apply cleanly anymore. If you didn't resolve that
yet, you can drop this patch and just apply patchset
[PATCH 0/6] mtd: bcm47xx: some fixes for the flash drivers
that applies cleanly.

I can resend this patch rebased on a [PATCH 0/6] mtd: bcm47xx: some
fixes for the flash drivers

--=20
Rafa=C5=82
