Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EBFC636CC
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 14:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqDwcd2O/gnVclfC49HYsMyRcKDK5Aghx+E+lwA+Klw=; b=HymJZych4UBW4rWJ52umgegWQN
	zQyjE6hqgQJDKLamI/prsVy5m77XnWt293k9+MiTEUrX/qvo4r/iSkK0maG4TR6LFgVTnvSxgQT4r
	GIzeH43VkiMW12sDaKK/nO2l3EVHCUW5Sig4kZzI/umjfqVA2bKO19cUuIkSAGimlxeV4/t44Ut8z
	+T4CPUHxwLD5ZbJrJJmtw0FSa7vMvDt/l1TpmpTT0gtKAqoNMZFtMDxuYniir0gHNosSm26VIlS5o
	FD5PqTY/JoJWPwX42B3z/nrl1R4NPcxfTNGi1AeFOVhmumYsBfpD6gpkWn+JFyR9J2Z5zTO0bNYVb
	556wYb1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPlNH-00Ft77-QV; Wed, 08 Feb 2023 14:24:39 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPlNE-00Ft4V-5G
	for linux-mtd@lists.infradead.org; Wed, 08 Feb 2023 14:24:37 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 950FC41;
	Wed,  8 Feb 2023 15:24:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1675866271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=drL93NXnDDD64IhXZUmZIWPeKMBa8824+z2G2QnTmD0=;
	b=MyAQ6ZVbAhn2BRsrnLu3YgakBYpoziFb8zMRyaVIt0++NAeEFE+2WdlnPw3iENBkrXTmLP
	02zF9gTRY0+oghhu10N062ZSUyAlx6ExGnFpIUiY8rTvILzXGiA6nbc6mf56hJFzO+owCr
	/CO1ATLJ2wbq4R5QdkGEWPg263WMohdXfEyo7m3fqtJjhPz2o+6soUk6duyAw+uCC3VqSX
	imIqKZiMJ4ZikNlFQuG4gqnbtmBisz0t+Kj59QwbZXGNYWjsaCPFWSM+c9M/qIEUUdhQYc
	i1EfBeX2Ra/H/0dfX06di+kcq6ByWfMAFNeysFUMkG8IhKC71Sv1XeS6w5gNZg==
MIME-Version: 1.0
Date: Wed, 08 Feb 2023 15:24:31 +0100
From: Michael Walle <michael@walle.cc>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, stable
 <stable@kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: fix memory leak when using
 debugfs_lookup()
In-Reply-To: <Y+Ot0FXLgrSoLy7Q@kroah.com>
References: <20230208125758.1515806-1-gregkh@linuxfoundation.org>
 <69fbf8b55dcb9c5c0a1a5d59b2248670@walle.cc> <Y+Ot0FXLgrSoLy7Q@kroah.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <e9c24836696de76959bbf808b2a90863@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_062436_388209_A8F5A5EA 
X-CRM114-Status: GOOD (  21.85  )
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

Am 2023-02-08 15:12, schrieb Greg Kroah-Hartman:
> On Wed, Feb 08, 2023 at 02:36:23PM +0100, Michael Walle wrote:
>> Am 2023-02-08 13:57, schrieb Greg Kroah-Hartman:
>> > When calling debugfs_lookup() the result must have dput() called on it,
>> > otherwise the memory will leak over time.
>> >
>> > Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
>> > Cc: Pratyush Yadav <pratyush@kernel.org>
>> > Cc: Michael Walle <michael@walle.cc>
>> > Cc: Miquel Raynal <miquel.raynal@bootlin.com>
>> > Cc: Richard Weinberger <richard@nod.at>
>> > Cc: Vignesh Raghavendra <vigneshr@ti.com>
>> > Cc: linux-mtd@lists.infradead.org
>> > Cc: stable <stable@kernel.org>
>> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> > ---
>> > v2: fix up to work when module is removed and added, making the fix
>> >     much simpler.
>> >
>> >  drivers/mtd/spi-nor/debugfs.c | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/drivers/mtd/spi-nor/debugfs.c
>> > b/drivers/mtd/spi-nor/debugfs.c
>> > index ff895f6758ea..af41fbc09a97 100644
>> > --- a/drivers/mtd/spi-nor/debugfs.c
>> > +++ b/drivers/mtd/spi-nor/debugfs.c
>> > @@ -242,6 +242,7 @@ void spi_nor_debugfs_register(struct spi_nor *nor)
>> >
>> >  	d = debugfs_create_dir(dev_name(nor->dev), rootdir);
>> >  	nor->debugfs_root = d;
>> > +	dput(rootdir);
>> 
>> rootdir might either be the return value of debugfs_lookup() or
>> debugfs_create_dir(). dput() is probably wrong for the latter,
>> right? Also there is an early return, where the dput() is missing,
>> too.
> 
> {sigh}
> 
> Yeah, this is all wrong, sorry.  Let me fix this up again, properly.
> And to do it properly, let's have the module remove the directory if it
> is unloaded, like a good module should :)

There were some complications. IIRC you'd need to do reference counting,
to determine whether you are the last user of the rootdir. Other subsys
create an empty rootdir in their .init(). But that was hard to do in 
MTD.
Again memory is hazy.. Therefore, I resorted to create it on the fly if
there isn't already one.

Maybe you got some better/simpler idea :)

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
