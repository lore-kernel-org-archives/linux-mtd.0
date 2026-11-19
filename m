Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B6F606A320
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 14:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FGgHkPdp;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jM8M99lU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=il2a0Lth74luiQrOKLD+F4b3oKLViaQtyOkjsJImszY=; b=FGgHkPdpoucoaZRZcquDHkhmP/
	lYqDyNEIE5no5ZoaTncSwF9li2gaIRWyMlwBtnbI+zICdWvRxDO68Copwkin1lfpRDT9cDCGenpMW
	1RCjSXnYGwOgYrOJTV5xut6U2/Rf7rypil5T8Xd7IqzdbkpiDf2jxtqJGpPrvrvYiH3I2MrhtPOyK
	gQu2njYn867CnIzLZDGZQDRlQCU769kMu6UrsPE5MIC6EOSNPl6czpIRbnX2U4pt2Gz/z4xJuIkMd
	1eJJWfZrKM1yjwxeqfUJJfQUdZOM90406bvv6lRmnEU/fCcs2W2zVCfQl/Uzw7/pDiVNvWTjGWxwO
	qYhLBJpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2hU-0000000CAIB-0g0R;
	Thu, 19 Nov 2026 14:01:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2hS-0000000CAHu-0T4Q
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 14:01:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 6006A60D47;
	Thu, 19 Nov 2026 14:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 4D7B71F000C4;
	Thu, 19 Nov 2026 14:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096877;
	bh=/yhXF4dYa6GQ6SQ2pZILWrMX9tMQLpG8x7TuaSX3fSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jM8M99lULsGDL3yhFyk0tBc89kBQMS1bQlKuuq5n0RPGSWOgb9SSqMGElbnU/Acq9
	 Q9edfbKlOUuXIkreDY69Z9zO4VTqfTWxKVDPprXLrwg2r7uJazEEVPN4lVv7aqIk3V
	 mwW4WUKr64gYtCUuc31j01ef+I6lgzwT+U1VRTTm1tmR0TxU/0PtDtof8vNPf2hhUe
	 3Rwh9d2IE7CuvKqLqZ5uY+sX8ZY6PmabBmVYyVQfVYdwOUwvuXsxZwXGNd4kn6sSro
	 p2XqLsREM6SnIPeXcTQKLjZaZpe1nJL5SCNXodF/s6Wpy8YsT5LmP2GETinE5GUMdO
	 MYy7d10aHCgQQ==
Date: Thu, 19 Nov 2026 15:01:13 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Michael Walle <mwalle@kernel.org>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 11/11] nvmem: allow providers to specify an explicit NULL
 owner
Message-ID: <qsu6fn7366roc2sq3eiahsnw4ucyaocyycbxfobil27uy232fq@qmlu663id5i7>
References: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
 <20261117-submit-nvmem-provider-lifetime-v1-v1-11-3cfbd48812b5@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261117-submit-nvmem-provider-lifetime-v1-v1-11-3cfbd48812b5@gmail.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 12:38:18PM -0700, James Hilliard wrote:
> The owner fallback treats NULL as an unspecified module. A provider whose
> operations belong to built-in subsystem code therefore cannot distinguish
> its deliberate NULL owner from a request to use the parent driver module.
> 
> Add owner_is_explicit so such providers can select their actual callback
> owner. Leave existing callers on the parent-module fallback. Unregister
> still disconnects and drains callbacks before the provider releases its
> state.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
