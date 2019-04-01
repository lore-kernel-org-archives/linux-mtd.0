Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 318CAC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 20:09:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F38AE20857
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 20:09:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UUSmCZJQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F38AE20857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=grandegger.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=29w431vOCtPxcGY1p/Ym4gIYNSkXSNtllq2O/9X7XhQ=; b=UUSmCZJQelaQN8
	dCRkPKFlDI1dvA8LbJ3gI+vkqiEyk7F7HKVCftqeFmlvmeijHy14qWezUWA2pNpAGkCXjcQEqzSuL
	vDOmdjvUA/W8C/4nSdY4i25psow4w4HCLK4jo2WQG4p/YI4mXTWqVwW3oSn6KSkOVkAhpGgw3x4dA
	4M1umskJq82dU4bzFAG9G5v7zg3kly15Tal6lpyFrp7MHkpEN9pfhE9+0WKzxSShl3rJw6R6b03rX
	swjG4S8lJ+vNwSrF2mA0wa0mfKgZepTDe2fE0P/qLDmA4POzpbOkk9Nz+/BujWlxWA1Di/cOi0mTh
	FhDbXmMXBPPx6MvWIAFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hB3Eq-00056m-2s; Mon, 01 Apr 2019 20:09:00 +0000
Received: from mailproxy07.manitu.net ([217.11.48.71])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hB3Ej-00056Q-KM
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 20:08:55 +0000
Received: from [192.168.178.20] (aftr-185-17-207-219.dynamic.mnet-online.de
 [185.17.207.219])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wg@grandegger.com)
 by mailproxy07.manitu.net (Postfix) with ESMTPSA id BE7BEC80F6;
 Mon,  1 Apr 2019 22:11:09 +0200 (CEST)
Subject: Re: i.MX28 nand driver broken in Linux 4.18
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <8ec3f0b1-b288-d208-c0e4-431b49719d08@grandegger.com>
 <20190304125435.0e33d362@xps13>
 <e5450dfe-9228-569a-2c59-3b6f7bb05d2d@grandegger.com>
 <17beb0d3-6202-00ee-ff42-a656c4d8cb23@grandegger.com>
 <20190306145942.625b5c87@xps13>
 <1c876ede-7321-a7c3-a366-86ca1dafce20@grandegger.com>
 <20190401112349.60bcf6d7@xps13>
From: Wolfgang Grandegger <wg@grandegger.com>
Openpgp: preference=signencrypt
Autocrypt: addr=wg@grandegger.com; prefer-encrypt=mutual; keydata=
 mQINBFtEb5MBEAC5aRjs5jLwjbOaEE6rczZSqck7B3iGK8ldrV8HGSjxb1MAf4VbvDWrzXfA
 phEgX3e54AnYhnKcf6BA3J9TlSDdUAW7r/ijOFl+TehMz7holgjhlDK41acJ/klwXJotIqby
 bWqFgFw6o7b8hfbVzPi8Pz/+WOIKaDOb1Keb989mn253RF1yFakgvoQfCyAeVcnO5kcByW17
 zbTEHsSduYi0Zir26Oedb2Vtas4SovrEXVh4e2dRdbEbHlI8po3Ih117CuGIPAe2RSfZKY88
 8c9m+WsJKtrIDIMY+f5kcHG5mib++u1oTg7wjfFgTr925g2WjzT63YRibW8Vazot9yXquMo2
 HYQStmnN9MuAkL/jslnxhGKNwTzpXv6FD2g/9hcLfSjaaCwGzj2j2ucJglJnO1n+ibVB14l2
 JLVe+IKJaE1gvm2v9HPsE+o1P4O8I9iCiAbQ6BGUszHADOg7r8CeTQ+AOCypfEZ5l1Hwa3gw
 V+TtqyCU70U9LA0AKaDZ02vf0hFRWeXV/ErFq878GOXbbVMZu8G5aO0EcCBC75/KQnyi0WEl
 KVIcyTyxKel/Ext7vUFIkiA16JNWRpS85YDfe9CoEZcZK+nUU268j6Bp5a7MYaF/dZaLT+Du
 hLA82ry8IkPQvyV5yV+B0PwDM/w7de8zIzMy9YBXU8KGGDmgYQARAQABtCdXb2xmZ2FuZyBH
 cmFuZGVnZ2VyIDx3Z0BncmFuZGVnZ2VyLmNvbT6JAj8EEwECACkFAltEb5MCGyMFCQlmAYAH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRDwuz7LbZzIUhvED/4vTUqS0c/V5a4hc5Md
 u/8qkF7qg011tM0lXrZZxMQ8NrjdFuDhUefZ1q59QbLFU9da9D/CRVJUSx6BnY9jkR6lIm9l
 OGqS9ZlzubGXJCZhv1ONWPwY/i1RXTtauhRy+nkcyJk2Bzs5PWq1i4hWXpX//GfGUbCt+2bX
 2+9bmHSPFtZ/MpIigS1E8RehIzlzqC/NCJspY8H0HKtLR6kpanRBYCuYSlBom/1LEP2MmXhh
 9LgjQINp+jZJwnBj5L5JaUn/sg2WO+IiN6IphzyS2TvrlRhkhPJv5EOf0QmYzDgz5eU/h35x
 aCclLSJ0Go83GO0bXFGCzN86VreRgLRGTa7/x9VW05LiBdlsuLpG23IHM5f6p0WpYgE+jdri
 TrMued/DquQEcw/xNXpa3n9zTghLcWgcqGIdK3AE3yPjQBR3N6WoT4VOXnZjg6pyNHQ3W4qj
 LQgzJ3Tq2gPMhRLFcLXyk6V3rQ0ffn4LCXkFYVIBGAN8hHMOFeV6NESkUcEil6V4oOsLLGuJ
 XreFjAl1Cz3vIaVgzZEfub1z60DDM71lIr+UvWXLeMyKiSMWiJBPL3LUoUWmzpafaTJakDWm
 CEXa871Jlw7sy99MGVhiVG74JHjtPE6ontM1dKCP1+yT53TeGp1o/3Hj3sUielfDr5nV/kT6
 p5zmgQN/1bJgV/3sKrkCDQRbRG+TARAA37mw9iosCWO5OtCrbvgJJwzOR3XrijVKi9KTNzDO
 NT2iy7teKP4+C+9why6iZhoJbBrTo56mbmI2nvfyOthxCa8nT14js8q0EgSMiyxXVeRvzEIQ
 sYcG4zgbGjwJ94Vrr5tMCFn5B6cYKJffTGmfY0D3b2V4GqaCGxVs3lWcQJeKl/raL8lp4YWz
 AI0jVx104W7rUbCTDvcSVfPqwM+9A6xaP4b1jwyYwGHgOTq6SeimRrGgM+UNtWqMU3+vUelG
 8gKDyfIIo4IrceeHss5OuRREQZq5vNuzkeIY6faYWv65KT+IQ6EyC9UEGkMdcStfEsZO53Qq
 buA7Kha6lVViDM3vjGS+fnNq/od53dosWeWQ4O8M7Z6nxgp+EOPuJf041eKmIrcaRiXb+027
 x4D0Kwv/xVsFa6cC2lkITWahENFIXwKOZ3imr2ZCtVF61qnm/GQ5P27JQKXMbPOM6wm0EjJ1
 9t2EkSpgVHI0Cd0ldxD4eaGNwpeHJ5WGGzZrOE7PCcRziJX0qO/FpLjTQ6scf+bPACgduY71
 AwXyA24mg7F2vK+Vth+Yp7MlgwYBMUy6D140jrkWrcRxKYfW1BgcKpbG/dh5DhUAvoOzFD7i
 zHrGK5FhzqJDBwKk7n9jGohf/MJWs2UKai/u4ogZBhhD5JPR8GG6VzO4snWisFLFuAEAEQEA
 AYkCJQQYAQIADwUCW0RvkwIbDAUJCWYBgAAKCRDwuz7LbZzIUkA3D/wJOvcQ7rTeoRiamOIB
 kD4n2Jsv8Vti/XfM0DTmhfnWL4y96VzSzNfl+EHAwXE4161qnXxTHnFK1hq7QklNdDiGW3iH
 nKZUyHUTnlUlCocv8jWtlqrpH0XVtF12JET65mE14Hga6BQ4ECXwU2GcP3202A55EzMj31b/
 59GD3CDIJy7bjQi+pIRuA9ZQRsFas7Od7AWO/nFns2wJ6AJkjXdCUCZ4iOuf82gLK9olDSmd
 H73Epc6l3jca62L2Lzei405LQSsfOZ06uH2aGPUJX4odUlEF6arm2j+9Q8Vyi4CJ316f2kAa
 sl7LhAwZtaj8hjl/PUWfd5w47dUBDUZjIRYcdM2TTU3Spgvg3zqXUzur5+r0jkUl2naeiSB1
 vwjfIwnPqZOVr9FAXuLbAdUyCCC0ohGLrq5Nsc1A02rxpQHRxTSm2FOdn2jYvuD7JUgkhmUh
 /TXb8aL6A4hfX7oV4tGq7nSmDOCmgWRmAHAGp85fVq2iylCxZ1kKi8EYCSa28eQzetukFbAx
 JwmcrUSaCOK+jpHlNY0PkghSIzAE/7Se+c37unJ39xJLkrgehLYmUF7cBeNWhfchu4fAJosM
 5mXohGkBKcd5YYmF13imYtAG5/VSmBm/0CFNGFO49MVTNGXGBznrPrWwtPZNwjJdi7JrvEbm
 8QEfHnPzgykCs2DOOQ==
Message-ID: <98aebd37-ec31-85e1-3f3c-d327eda1939e@grandegger.com>
Date: Mon, 1 Apr 2019 22:08:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190401112349.60bcf6d7@xps13>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_130853_821091_D01837F4 
X-CRM114-Status: GOOD (  17.90  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Miquel;

Am 01.04.19 um 11:23 schrieb Miquel Raynal:
> Hi Wolfgang,
> 
> Wolfgang Grandegger <wg@grandegger.com> wrote on Sat, 23 Mar 2019
> 20:55:19 +0100:
> 
>> Hello Miquel,
>>
>> Am 06.03.19 um 14:59 schrieb Miquel Raynal:
>>> Hi Wolfgang,
>>>
>>> Wolfgang Grandegger <wg@grandegger.com> wrote on Tue, 5 Mar 2019
>>> 15:52:52 +0100:
>>>   
>>>> Hello,
>>>>
>>>> I will bisect the problem next week when I have access to the
>>>> hardware... more soon...
>>>>  
>>>
>>> Great, thanks.  
>>
>> Here is the result of git bisection:
>>
>> wolf@bernex:~/git/linux$ git bisect good
>> 76e1a0086a0c3276b384f77905345e0fcc886fdd is the first bad commit
>> commit 76e1a0086a0c3276b384f77905345e0fcc886fdd
>> Author: Miquel Raynal <miquel.raynal@bootlin.com>
>> Date:   Fri Mar 2 15:38:39 2018 +0100
>>
>>     mtd: rawnand: gpmi: support ->setup_data_interface()
>>     
>>     Until now the GPMI driver had its own timings logic while the core
>>     already handles that and request the NAND controller drivers to support
>>     the ->setup_data_interface() hook. Implement that hook by reusing the
>>     already existing function. No real glue is necessary between core timing
>>     delays and GPMI registers because the driver already translates the
>>     ONFI timing modes into register values.
>>     
>>     Make use of the core's tREA, tRLOH and tRHOH values that allow computing
>>     more precise timings for mode [0-3] and get significantly better values
>>     (+20% with an i.MX6 Sabre Auto board). Otherwise use the existing logic.
>>     
>>     Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>>     Tested-by: Han Xu <han.xu@nxp.com>
>>     Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> 
> Thank you for the bisection, there is definitely something wrong with
> this commit but it worked for me and for Han so it's quite difficult to
> find out what is failing if I cannot reproduce. Could you please dump
> the timing registers in both cases (working/not working) and observer if
> there are odd values ? (0, too short or too big values, etc).

here are some first figures:

76e1a0086a0c3276b384f77905345e0fcc886fdd^:
[    1.911760] clock_period_in_ns : 41
[    1.922818] address_setup_in_cycles : 1
[    1.915343] data_setup_in_cycles : 3
[    1.919254] data_hold_in_cycles : 2
[    1.926709] HW_GPMI_TIMING0 : 0x10203
[    1.930641] HW_GPMI_TIMING1 : 0x5000000

v4.18:
[    2.090621] period_ps : 45454
[    2.076601] addr_setup_cycles : 1
[    2.080002] data_setup_cycles : 1
[    2.083598] data_hold_cycles : 1
[    2.093849] HW_GPMI_TIMING0 : 0x10101
[    2.096890] HW_GPMI_TIMING1 : 0x90000000

Hope that's what you are looking for. Unfortunately, the code of both
versions is very different (complete rewrite). I will have a closer look
tomorrow.

Wolfgang.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
