Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814D1C25B7D
	for <linux-mtd@archiver.kernel.org>; Fri, 24 May 2024 08:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CXaH9on3/cIICXt6F3AQV2DS08LsQ4SE3ppcxC092Xs=; b=FF49TTLokO1EBD
	n0amnaKyJNb0fWA0c/re2jGP6BkLwjKZMyETaMK5edz4IS1DZ8Tki/FU75q/UijgmxYq7hLyvwnO+
	s9JuALyXKk2sHD1Bsemp11S6lfrsnEwlolwEW9kG6OqNEkBnsvHEScRuY3n5U1u5IsuFBmdQfOjWM
	Tv20DhUMyTEYb1XmOdq4Bvf/BPvjQ5tCjZBOg0vFvK6a0zlSMdbYHeJwSRBGz3UnoWqFfOxHwipB5
	TQRW+o4WnOQgMjJDlIukFqLuFtZTT521kiNOCjW1k7JpwvP0+TCHFjLV8NcYb7Lcj2yfaSFkNsgBi
	hczlrSKbHqDbr/OmGqgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAQaj-00000008Pvn-4AWr;
	Fri, 24 May 2024 08:47:58 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAQag-00000008Pv3-49cl
	for linux-mtd@lists.infradead.org;
	Fri, 24 May 2024 08:47:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=+37b90Lx/brt8rw4v1F6llZaQY8yfFwNx63kKufwdlE=; b=hMyYGSxi0p2F+gDPEhOi/EfhDT
	s3Kii6AQ8H54ZZjgdQgtE8OS8NrHwl69Q6Yhwp73bUOgDKRzBX2RFzYGN0jLSXNwwXCn6y1sZ8pLD
	PweQGkRqZix293wWYhSG8NdvfyO83188dNO+PY38VCoqEePIbNF9bNlBeYKNgMEbfuspT9s4wvCJj
	qJlDiC+3nZGL51jOLskf2W7EpEmQvQJWVbOGxRjUsbGKGWCEvbQw0AWKwzldbz8ILP12v+7cJOlIP
	hl5+0ZMsm7a+cHp55dcAQZ1r1YEDchuMDPyUO9aqSTYQm8a7YlnIfDdFRqQl6M0PawfNgjjHqfmf8
	6w9Amslw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sAQac-00028n-3a; Fri, 24 May 2024 10:47:50 +0200
Received: from [80.62.117.110] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sAQab-000IJR-2z;
	Fri, 24 May 2024 10:47:49 +0200
From: Esben Haabendal <esben@geanix.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH] memory: fsl_ifc: Make FSL_IFC config visible and
 selectable
In-Reply-To: <9a7f73f4-f5dc-4342-855b-08df6a839bb5@kernel.org> (Krzysztof
	Kozlowski's message of "Thu, 23 May 2024 16:36:17 +0200")
References: <20240523-fsl-ifc-config-v1-1-6eff73bdc7e6@geanix.com>
	<979fd913-050b-445d-9ca8-0ec6906ce3ea@kernel.org>
	<87cypc38gu.fsf@geanix.com>
	<9a7f73f4-f5dc-4342-855b-08df6a839bb5@kernel.org>
Date: Fri, 24 May 2024 10:47:48 +0200
Message-ID: <87le3zoatn.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27284/Thu May 23 10:32:30 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_014755_421568_CEB78831 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

> On 23/05/2024 16:32, Esben Haabendal wrote:
>> Krzysztof Kozlowski <krzk@kernel.org> writes:
>> 
>>> On 23/05/2024 15:58, Esben Haabendal wrote:
>>>> While use of fsl_ifc driver with NAND flash is fine, as the fsl_ifc_nand
>>>> driver selects FSL_IFC automatically, we need the option to be selectable
>>>> for platforms using fsl_ifc with NOR flash.
>>>
>>> Which driver is that?
>> 
>> This is drivers/memory/fsl_ifc.o driver. It is for Integrated Flash
>> Controller (IFC) from NXP. It is used in various Layerscape socs.
>
> ? I know that, I mean the NOR flash working here.

Ah, sorry. The NOR flash I am using here is a Spansion S29AL016J.

>>> Which DTS?
>> 
>> It is for "fsl,ifc" compatible devices.
>
> That's not a NOR flash.

Nope.  The binding used for the NOR flash is "cfi-flash".

/Esben

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
