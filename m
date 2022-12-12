Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990ADC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Dec 2022 17:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VvXM5fLmbTIQF1P+IE/Yo9Jl6V+J/60N3bvUVAOOspY=; b=aXasbKz5qp1Yef
	ejK3gPDmrx2eMg4XA0QHMKEEH2R/STANj8xy4FTXxjC1c/2LD69TrvFRPz0S3digx0d5F7aX0zbF4
	t4B+Kp8I4mm2AbQQaOipbHDDk3UPN7fN1GvwSGVAt62ECOYLRev0O8OC743ixY2/sObWv7NtM3QML
	5ewoaQLWFSOvaKQ3eK4nOxD3UNdXhTir3SOWOFNnMmb5FDlYYpOEa8nItmwIw3XyyZyyvXzboNuTK
	83LlwMB1lgGlDN/C3BdaQVzQhc3Z8e4I3jTSQ/+n7PmETi5jWJKIO9cVoyPMFEUyGuXIIgKoh79iu
	UhU7hQFyWdIUqt5jfwbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4n3z-003Kaw-3h; Mon, 12 Dec 2022 17:58:03 +0000
Received: from smtpng1.i.mail.ru ([94.100.181.251])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4n3u-003KGS-BF
	for linux-mtd@lists.infradead.org; Mon, 12 Dec 2022 17:58:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail4;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=G4BTKWN2LtadE3xtP4W7JTWNWm2U1sx29SGq9LHxKYc=;
	t=1670867878;x=1670957878; 
	b=IRghhc1+Qx3PUXM3/1X4gaXFEdbe3Hzr3ko/UgwBVR7acdTUy2elhhNNY2+qdrzLbRWnZt/c1gdNjgMmeQdzizawXCJ1a+8cu2Dkre8BlbhyspNj5yyKkyEd+OCl+KpOa6hUKV0h+ds6+vsR+1ySSvORXmi+SVVllez7r/XC8GnLFbzlmqznUEHGNUKm7+dFKcgteoix6aNin4GjvqRrwJz3JlSHaMmGlziBw/2NzrrP5we0smwKFWK5XqxFvcTurd75nSAZEdqkc8FE4hjgkFBtEq1dvt40krK76k/4LWlrlN8HCDKg9jY9z8cnma8ZO71mPlYl4DnjCYgQyv9NwA==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from <fido_max@inbox.ru>)
	id 1p4n3m-0000Qy-Di; Mon, 12 Dec 2022 20:57:51 +0300
Message-ID: <b75a8769-0cc8-beb3-931a-6755aede3af0@inbox.ru>
Date: Mon, 12 Dec 2022 20:57:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: nvmem-cells regression after adding 'call of_platform_populate()
 for MTD partitions'
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Maxim Kiselev <bigunclemax@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Saravana Kannan <saravanak@google.com>
References: <CALHCpMgSZOZdOGpLwTYf0sFD5EMNL7CuqHuFJV_6w5VPSWZnUw@mail.gmail.com>
 <CALHCpMgEZjnR39upkR6iozSk-b5A_GHRo9rcDSPXzzQi6x_qCw@mail.gmail.com>
 <b1b7935d-0785-2e57-bad9-ab2476f0acf2@leemhuis.info>
 <CALHCpMhsM2j=bSXEDC9BWYpOAyvCccgJpJmqXfiRTHvp6=y3tA@mail.gmail.com>
 <20221212101449.4e465181@xps-13>
 <CALHCpMimCqZB0bnHaOdCzucey+92NcRRZXCHXYYH5c9vj0nZaQ@mail.gmail.com>
 <20221212173730.64224599@xps-13>
Content-Language: en-US
From: Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20221212173730.64224599@xps-13>
Authentication-Results: smtpng1.m.smailru.net; auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD90D1502B3BE350FE460E08CDB322628C398144F1A0CCA906500894C459B0CD1B9ABB20FF08B14F5A20B1E811E86927F87078B5411FB1F25F4F5EC2512189958EF
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7BB17EE3498E810FEEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006379BF04B24BEB7B2D58638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8590D056553F31FF1002A9CEDDAE84B036F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE70F3DDF2BBF19B93A9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18CB629EEF1311BF91D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B6D77D8F98F67F34EA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CAA44A86D94E7BBB043847C11F186F3C59DAA53EE0834AAEE
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3435BBF0AC4E3A921CB2F5EB4DC98AB3F4CCE54E6FE01DD48C65728CE7034F86891F03023C34D809491D7E09C32AA3244C4E824EC1D2FB3A5A2A0C928044C56FD939C99C45E8D137E90D282625F6E20647
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojCvDLVb3lQJjtlBj9YOdmFw==
X-Mailru-Sender: 689FA8AB762F73933AF1F914F131DBF526D060A6CE773BB8005E62F5CE2FE9F598CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_095759_064569_9FAFF611 
X-CRM114-Status: GOOD (  16.50  )
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

Hi, Miquel!

On 12.12.2022 19:37, Miquel Raynal wrote:

> Let me try to recap the situation for all the people I just involved:
> 
> * An Ethernet driver gets its mac address from an nvmem cell. The
>    Ethernet controller DT node then has an "nvmem-cells" property
>    pointing towards an nvmem cell.
> * The nvmem cell comes from an mtd partition.
> * The mtd partition is flagged with a particular compatible
>    (which is also named "nvmem-cells") to tell the kernel that the node
>    produces nvmem cells.
> * The mtd partition itself has no driver, but is the child node of a
>    "partitions" container which has one (in this case,
>    "fixed-partitions", see the snippet below).
> 
> Because the "nvmem-cells" property of the Ethernet node points at the
> nvmem-cell node, the core create a device link between the Ethernet
> controller (consumer) and the mtd partition (producer).
> 
> The device link in this case will never be satisfied because no driver
> matches the "nvmem-cells" compatible of the partition node.
> 
> Reverting commit bcdf0315a61a ("mtd: call of_platform_populate() for MTD
> partitions") would IMHO not make much sense, the problem comes from the
> device link side and even there, there is nothing really "wrong",
> because I really expect the mtd device to be ready before the
> Ethernet controller probe, the device link is legitimate.
> 
> So I would like to explore other alternatives. Here are a bunch of
> ideas, but I'm open:

How about to create simple driver with compatible="nvmem-cell" and to 
move all the suff from main mtd driver which serves nvmem-cell to the 
probe function?

Thanks, Maxim.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
