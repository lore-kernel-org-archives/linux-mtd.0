Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA55C5519F
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 17:07:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2BB2208CA
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 17:07:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yh8+CNhn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="GXpeoeRh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2BB2208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RAhjFk9mii+4s724sTyZknb9HP4Dxjoqiy26ecpG9jg=; b=yh8+CNhnBNREM8LtQCgrotvA3
	G+0XX51RAsswcaQC+ZNNuph7pulSnttAUVuEzH0xC0foLV1vWbTiNlRp1ml/3iCuLyRg7z2e6+QTn
	JTcK02dH+5Q+Z6g+zK7fXlvq/9cYlG5mVDa8cyJYDOgxQWfj6iRi654yqsH7FCbGdWtlvByfWaow2
	mXrDyKccxNitMxi68mJRO1MlyjkOkX+5SZiS2Vt28h4Qya9ah8Pynh8g0JIWoeUUN8i0EmmHyzEme
	KLu+nra+TPQDTCqoI822D6rhScBHzMgDymXPQibgz2dZeeWqe1F1lW+wRBISIUbw7n7vNoiXA2iAj
	Vc8GgZu8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kihCG-000697-MN; Fri, 27 Nov 2020 17:06:12 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kihCA-00066a-Oq
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 17:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1606496763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ApdXLLCo2ftbSslD3CiTtwOwkkM/Xi+DO5JZlq3AnXI=;
 b=GXpeoeRhdKDRv+PJzx+f0ywR4NFkbgICRjEtuZ7IYO3wPR5MkXMn18Bl+jlMGV9zO19Dr0
 hVhz8BDkoldZv1+dWcqoicbkhuIbGzEe4n77if8SVI6g8ZiiZdkUpmsO8QvI7HzEDzpnco
 NGIVdGM6Fp6ZLhmI3kkbplfAjXV/4x8=
From: Sven Eckelmann <sven@narfation.org>
To: ron minnich <rminnich@gmail.com>
Subject: Re: [PATCH] mtd: parser: cmdline: Support MTD names containing one or
 more colons
Date: Fri, 27 Nov 2020 18:05:55 +0100
Message-ID: <2666350.AiC22s8V5E@sven-edge>
In-Reply-To: <CAP6exYKEN-sQXGxTC1CSzfyuYmbbMPHKEosCP7DciFTLOhAFCQ@mail.gmail.com>
References: <20200429165347.48909-1-rminnich@google.com>
 <7171837.EvYhyI6sBW@sven-edge>
 <CAP6exYKEN-sQXGxTC1CSzfyuYmbbMPHKEosCP7DciFTLOhAFCQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_120607_152760_AD33BD8C 
X-CRM114-Status: GOOD (  16.71  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Ron Minnich <rminnich@google.com>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Adrian Schmutzler <freifunk@adrianschmutzler.de>, jstefek@datto.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 John Audia <graysky@archlinux.us>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: multipart/mixed; boundary="===============5245992950730616427=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============5245992950730616427==
Content-Type: multipart/signed; boundary="nextPart1733315.QZUTf85G27"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1733315.QZUTf85G27
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: ron minnich <rminnich@gmail.com>
Cc: linux-mtd@lists.infradead.org, John Audia <graysky@archlinux.us>, Adrian Schmutzler <freifunk@adrianschmutzler.de>, jstefek@datto.com, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Boris Brezillon <boris.brezillon@collabora.com>, Ron Minnich <rminnich@google.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] mtd: parser: cmdline: Support MTD names containing one or more colons
Date: Fri, 27 Nov 2020 18:05:55 +0100
Message-ID: <2666350.AiC22s8V5E@sven-edge>
In-Reply-To: <CAP6exYKEN-sQXGxTC1CSzfyuYmbbMPHKEosCP7DciFTLOhAFCQ@mail.gmail.com>
References: <20200429165347.48909-1-rminnich@google.com> <7171837.EvYhyI6sBW@sven-edge> <CAP6exYKEN-sQXGxTC1CSzfyuYmbbMPHKEosCP7DciFTLOhAFCQ@mail.gmail.com>

On Friday, 27 November 2020 17:32:02 CET ron minnich wrote:
> I'm a bit worried about how tricky this starts to get. I'm inclined to
> go back to an earlier implementation which used a character that had
> not yet been used (iirc I used [] around the PCI ID in a very early
> version). What if we used, e.g, a single ! and searched for that? It
> need not be !; pick a character. Just something not already in use, as
> the ambiguity around which ':' delimits the device has become an
> issue, as you show.
> 
> Almost nothing in the original patch would change, save the character
> being searched for. By using a character we'd never used, we'd avoid
> breaking existing usage.

What? Doesn't make any sense to me. The mtdparts shown in the the commit 
message is as it is. I cannot simply change it because it is in the control of 
the bootloader - not the linux kernel or me. So I can also not introduce a 
different character like ! for separating things.

KInd regards,
	Sven


--nextPart1733315.QZUTf85G27
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl/BMfQACgkQXYcKB8Em
e0ZTIQ//UHqFRKnJ1Uwupj9kBv6+9klmGzPptfBdx8T92GKLoRbmp5VprWR5KByY
sKC5q+XdXn7MVfcAZUA8WCwrJBW+yq6FkC8gYdSZkrvm/ZFCsDWXhLwFnmDuAUhJ
103VyP5OnsrKowBYgiGxaV+A/xKRzBMaEuKooTiSk6oUrETXOxKYUl6SGwoOKZ4G
faxoMyMFzGdC42SIZIclJqc3Vtg2MGJ6bX+jEJc7NlEFYrGDGKBGfoueYXGV4NUF
soqJ7RiftWB/XqtpCsIEKL4viZqMxjkl28pV2UbqrOxsFInvFNpI/Q0uUyXlDV0F
EFW3532oNBITOKAY7uBPFxJZMlNscIrD380CUvtNpppAAKyFOkTqhFzbuWrMwwCr
0nCVaOyhageznzkpyZT1AEqx/z3F7xEOx0vBjL4JhTek09cIJp4EP4mGimRujGfK
2BUAYnWYy1+tdBvXVx/mZFZWHb2W+farCUsytJdKH8IiGE5SrwYo2CC2Z+lL8Rut
9jvZRYuozMF0eSo7iDUmAf+jSP35iBvjJGJbNmm9E9b+hQmbYlbBZ+0CPxc087LN
L7vh8dV5F8zUf0UAwZPfbRxukvULn5KYXjDlm5VYBGhwhtZFMclCLcBAuk6Ly65M
B+Mu56txrHUbWrf1C95ghPfEvM18INnQVrzJzuckQU2V3/MRJ0o=
=GJxP
-----END PGP SIGNATURE-----

--nextPart1733315.QZUTf85G27--





--===============5245992950730616427==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5245992950730616427==--




