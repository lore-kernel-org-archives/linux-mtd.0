Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB1B606A32A
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 17:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TXNARFCJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bb78xoRv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hE1G+hRra4A/+vZyomSC5G9KV3DlExelIPIzjFVNqME=; b=TXNARFCJ+oDQrTj9QX6vhkMURA
	HwHSVGCssSP2DaTttNy6loGSdBHN2zm0poJR0sxxm7vmDzk5gD3MF57vQjSgRm1urbM34RRI2a0Cd
	9wTXEY4Tpg8FN0Z0ShG4b8dE259GpilZL4pbnwFJ7/PXbs6IZOpShb7O5BL67C0awXELnwcOMPWmo
	4inmgJ0sZEptRZ5Ft0CvPI9+DeBwaIuUnLJGS7HZPKVrGFSe0QwkErRWh1gvPLd8YuIke8C/NrZPr
	5k72JLECcYiEbU4YZu/xHCE1utGHtyPWwFnDu4bD+ZQRHcPF5+Uvwgce0DwbBcFaHjtlryv9jeFkS
	ajva798A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjDR-00000009jhY-44Mi;
	Wed, 18 Nov 2026 17:13:01 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjDM-00000009jgi-2lHC
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 17:12:58 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48df160bb9cso120321f8f.1
        for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2026 09:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795021972; x=1795626772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Upxleu5PclylbFkFy5/TUrklY/Ium3UhTzAwysVorX4=;
        b=bb78xoRv2W/h53RuhqCHipM4/h3kj8E2huXVmqQ+JoGSufy1QzaDI860wCgBVHplbC
         GHSKuYWbqwBOpgvaJDttgs3CEy6tFAeox8A0AxPOuDBoZpanhpB6/Y8+NrvhhYkMIcYt
         3o3WGAPmF0eWVIq/EkTPEKLcowPsvUl+ffExkJ3NS/vkOOOc7GaWe79t0+dcMXbEapI6
         A1kwogOK2WIVn/2FbAsBhNNfB+5ZxOKWPeiEWRZg9Lc1AQv94N+c1ogSnkUUHLXNtaQR
         q3dHzdch6Dv2gFalY/BWXiRvFypqqTV1IeR/MDStf4CVd0TQ45KRtBzflekxBB/cihMV
         uteQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021972; x=1795626772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Upxleu5PclylbFkFy5/TUrklY/Ium3UhTzAwysVorX4=;
        b=nMZcOzD99dcY0qbUTSqiLsqnDD4VheYaF469KOO8E4LAq4rp6ocVTz7ZWE7NzXFZL0
         AO8L6kq8FAx09clRHpMV2YAde1JU3okwyLan+K0ZmBuxVCQqtV3qJBGwEuBqGAi/wsax
         pb0b98SU1gL8PWbRFQ+fkgMaj1c/o6ZjseJou6I7byDGjWMknnsDoxrbDSdVerBab92+
         peKXbPyv5CMKfUf0DAhnlPx+DRSG2pZPK2LQR+L6iEZFicW29W8V2eg97ghLUlB4n4T/
         NihuShXxQzBf0PvBs3KNcwMGGJBa9iePmeZXqaB7H2d7SmRppz5yXXrq5JqqWHtTEcgb
         iNAQ==
X-Forwarded-Encrypted: i=1; AL+hErF3IEZsxQ557RJzJLZTW50Z1vCsc49xSPAWgTQ1PRkwglr8c2SMKEitsevczle2hii/OpoPa5Rr35s=@lists.infradead.org
X-Gm-Message-State: APuU4Z+mGkiR7pGCvx2nyoYK6AZVNCQvVSbfqAVubkHv8xajJO2mtGNv
	7oGXO3SwteBsH3DpOpvsyxemKhuuygvDrrNYP/ji6SLRSrQ+bGeyzmR9
X-Gm-Gg: AZFdTZfAYkInpan8b72JUUg5DnQlNqFB6SWGziIL/nM631rAPoZmbi/S8wODGW+Y8WY
	dIxHS3avJJn4s/XtmlSF3LayTkeMLbun6Didm4eXErdMSsqgWeoEs8+Ac6XkOyl1QG9ZyW3+r3I
	sBeBq3qRwDK0yMN056wYgDqEx8daEkftvdD7OXG5siU+vLrAV7etuhdNnULC0rh9AT41yd9nSbc
	sMThuhETatwLhsZGwOpx5PH66WZLFdLTYT//PdlBbzk1TZkee8/OZweJU4thf7JJQNblmYGH5/8
	OOM8pBFmt591qP279D7nxUzXvI0FPCS5odVrRPihZ+ThB20ImsdiadoRhX2jeKCQfFLGdqybiGA
	WA9gAPoMI4mKc3XXHF9y+M0BiHIev2Mbw8xtyPxCb8O9zwGP76AAD+0Oxyxo8xELDiDgaSmvOQN
	WGXMc+eqVagJgQC2g6F30S0JfFj7qD73B/U51L5wRiLHdHHn44Mheby7r+wWeLWmi7asNMGqK7J
	IjGjR2p8JDUg7RYsrTrjpKu/9hPmM06uP5kFKijNzSuevOwGZxllOzklVPdADmzzD6+aljGDhIm
	+H4ehCKCinSvZRhvi6/sTtDGvTwyBlUIEli+U4rX+POEkmw6p5C8/ICfiqNpdgGk7oaqhig=
X-Received: by 2002:a05:6000:2405:b0:4a8:eed3:770 with SMTP id ffacd0b85a97d-4a8eed3127amr182443f8f.4.1795021972366;
        Wed, 18 Nov 2026 09:12:52 -0800 (PST)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573baa9fsm6313344f8f.57.2026.11.18.09.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:12:51 -0800 (PST)
From: Itai Handler <itai.handler@gmail.com>
To: mwalle@kernel.org
Cc: miquel.raynal@bootlin.com,
	pratyush@kernel.org,
	richard@nod.at,
	vigneshr@ti.com,
	takahiro.kuwano@infineon.com,
	tudor.ambarus@linaro.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v5] mtd: spi-nor: take the flash lock around spi_nor_restore()
Date: Wed, 18 Nov 2026 19:12:35 +0200
Message-Id: <20261118171235.3886698-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DMYDITU0H48Z.2LA5KF2TFNUY2@kernel.org>
References: <20261029210153.3986211-1-itai.handler@gmail.com> <DMYDITU0H48Z.2LA5KF2TFNUY2@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_091256_735266_312BD2FB 
X-CRM114-Status: GOOD (  20.33  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed Nov 18, 2026 at 2:33 PM CET, Michael Walle wrote:
>> +	if (!ret && nor->shutdown) {
>> +		spi_nor_unlock_and_unprep(nor);
>> +		return -ESHUTDOWN;
>
> This will be propagated to userspace, correct? Not sure this is a
> valid error code outside of sockets. Maybe EIO?

Yes, it reaches user space, e.g. through the MTD char device. v6
returns -EIO, which is also what the CFI drivers return once they have
reset the flash for a reboot.

>> +static void spi_nor_unlock_and_unprep_pe(struct spi_nor *nor, loff_t start, size_t len);
>> +
>
> Please avoid forward declarations and move the functions.

Done.

>> +	ret = spi_nor_prep_and_lock(nor);
>> +	if (ret == -ESHUTDOWN)
>
> This is actually really hard to follow. It's tested for even before
> it is set down below. Also probably wont work with an EIO return
> code. See more below

Agreed. v6 tests the flag instead.

>> +	if (!ret) {
>> +		nor->shutdown = true;
>
> Why don't you set the flag unconditionally?

No good reason. v6 sets it unconditionally. When the lock could not be
taken, another operation can then read the flag at the same time, so
v6 uses WRITE_ONCE() and READ_ONCE() for it.

> So why don't you just keep spi_nor_restore() and just add the
> locking there?
>
> What about the following:

v6 does that, as in your sketch, except that it tests the flag before
taking the lock. Your order works too, since spi_nor_prep_and_lock()
fails for a restored flash and releases the lock again, but testing
first does not rely on that. Only spi_nor_restore() sets the flag, and
it runs from ->shutdown() and ->remove(), which the driver core
serializes with the device lock, so that test needs no lock.

One more change in v6: spi_nor_remove() restored the flash before
mtd_device_unregister(), so with the flag, the unregister could no
longer write back data, e.g. mtdblock's cache. v6 unregisters first.

>> + * @shutdown:		the flash was restored, refuse further operations
>
> shutdown only covers some of its meaning, it might also just get
> unbinded etc. So what about 'restored'?

Renamed to "restored".

v6 is out now.

Thanks,
Itai

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
