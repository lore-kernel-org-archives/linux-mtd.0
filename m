Return-Path: <SRS0=ctmN=LY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E8BC11F65
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 14:32:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9E8461477
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 14:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9E8461477
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRWEcu18k552EwMBnsdfRLwE/B+IJPulESGGamItsns=; b=J7wpYshN+dPL8SGq5PE7g1vjAq
	g0xbGuAp4ofCZhRh1yag+OMJGE30WSnqENfIgNsXY5bE3tDRbGdGOB9NBs7GmLgTB1M/OJsaiM1br
	Uq9+hpxZkcVhKWt8OpKqFBVRXF3D9fL+PnknvMpB0mTcdVlRX/qwDI3sbtNKtORr9Tw3OzZD8TYen
	qgfbi8FUVHz0ut2Y/7Iay7PbV/iD6YpnItKjch0CUuOtZfiAb68CL+4jLDSEt3Q0qgjgvOtF+LncL
	Z/3XSdvr+gTwE2ITSaWE1A9X2KqEfE963dpwBxMVkuWazBFKlQOxevZmAKM40JCvbfRYIDWbgFeQ3
	0tG2TVJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lybFk-00ENmH-Qa; Wed, 30 Jun 2021 14:31:48 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyb0D-00EJZ4-UI
 for linux-mtd@lists.infradead.org; Wed, 30 Jun 2021 14:15:51 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 3159622256;
 Wed, 30 Jun 2021 16:15:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1625062543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SX/9eBY4x1bVLRTwmiIGVEkZkYCSKmmnZrPEoWHtXIU=;
 b=N+BllY4qWN167p/5p2A3RHLWXTSjgV7a7Snl2DCKBGFDPqSRz3VhdezBPNHTmQKCX9+GAM
 iZokpON3cjU14LP9HBylBhq7Qj9UDfvKng/RJzg2YmU+EQzIuCx4sxcl4V7X5YaMrTcF+F
 +W4ReEyki485TzXPQyp8rsEGExDGy6A=
MIME-Version: 1.0
Date: Wed, 30 Jun 2021 16:15:43 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: code@reto-schneider.ch, linux-mtd@lists.infradead.org, sr@denx.de,
 reto.schneider@husqvarnagroup.com, miquel.raynal@bootlin.com,
 p.yadav@ti.com, richard@nod.at, vigneshr@ti.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mtd: spi-nor: Add support for XM25QH64C
In-Reply-To: <0328347c-572d-b636-5542-99cb36e9efa9@microchip.com>
References: <20210613121248.1529292-1-code@reto-schneider.ch>
 <1ba367f93650cb65122acd32fb4a4159@walle.cc>
 <0328347c-572d-b636-5542-99cb36e9efa9@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <064317e561f1ad20282efe778f633723@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_071546_230368_4290235A 
X-CRM114-Status: GOOD (  18.99  )
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

Am 2021-06-28 06:55, schrieb Tudor.Ambarus@microchip.com:
> On 6/14/21 9:56 AM, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> Hi Reto,
>> 
>> Am 2021-06-13 14:12, schrieb Reto Schneider:
>>> From: Reto Schneider <reto.schneider@husqvarnagroup.com>
>>> 
>>> The data sheets can be found here:
>>> http://xmcwh.com/Uploads/2020-12-17/XM25QH64C_Ver1.1.pdf
>> 
>> Could you add that as a "Datasheet:" tag before your Sob tag?
>> 
>>> This chip has been (briefly) tested on the MediaTek MT7688 based
>>> GARDENA
>>> smart gateway.
>> 
>> Could you also apply my SFDP patch [1] and send the dump? 
>> Unfortunately,
>> I can't think of a good way to do that along with the patch and if 
>> this
>> in some way regarded as copyrighted material. So feel free to send it 
>> to
>> me privately. I'm starting to build a database.
>> 
> 
> Can the SFDP dump fit in the commit message when introducing a new 
> flash ID?

As ASCII hex dump? I'd guess we need some instructions how to do
that. 4k would be 256 lines with 16 byte per line.

But yes, I had the same thought.

> The SFDP standard is public. SFDP reveals just what the flash
> supports, why would that be sensitive information?

copyright material must not be sensitive information, no? I'm no
laywer, thus I'd played it safe.

> Reto, would you please dump the SFDP tables here?

FWIW, he already provided me a binary dump for the flash (actually
for the former version, too) and its already in my DB which you
should have access, too.

If we mandate that (and I am all for it) for new flashes, we will
have to come up with a common format. Something like

  echo "-----BEGIN SFDP (JEDEC ID ...)------"
  cat sfdp | xxd -ps -c 20
  echo "-----END SFDP------"

I really don't know if such meta data belongs into the
commit logs, though.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
