Return-Path: <SRS0=L51Y=CT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F186DC433E2
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2020 06:53:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 922FA208A9
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2020 06:53:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bU79hKQP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="e3Jk9M7Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 922FA208A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SlIGH/5n6yowMbsM6za1KnJ8Et9+MxRx6K1ACPDUCDs=; b=bU79hKQPGbIvPKg8Nneh2Yxdy
	Vd1yBe2QRwHlGRW8oFwmbCYIJaVLxNZo98xyaOo6JiFQIDnP2Seo8sinQyFFhhcPYxkaaOatDyLLy
	KE47N8hx6SxpaU7c1Ld6GeqBIBLnIbyisFTiojEzdY9GEOlBw+Ctgzlg9uIkT0iUNNXpx6naX8K+d
	Snhf1XyjBQrjmzl0WNhqBSLm/2SXmI4LLXk8ZnyZTJ8QQ0nqnVNknC4IFXI3tUrL0fJBoGWjsLlil
	x3Rh2CWU05YSrDbgZP2GVls+5kEarZxVyZkLH4i64yk2ZjLYkg9pKVy1LMcwNRK7V0M1WimR2Xfb7
	jZ83hhO3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGGSQ-0007zV-Oi; Thu, 10 Sep 2020 06:53:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGGSK-0007xt-8t; Thu, 10 Sep 2020 06:53:17 +0000
Received: from localhost (p5486ceec.dip0.t-ipconnect.de [84.134.206.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 93A222078E;
 Thu, 10 Sep 2020 06:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599720795;
 bh=/LOePKGDUR83plqAhx1ySvpBeTmOBTt4AYD41Ar10p8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e3Jk9M7ZKtsnsBd892ykDqq6ldjJyX23IqJ7DyDWgKOR2vkDHWpTUx3L4W3ZSGRl8
 gbJ25CK/q4T0DRgLEQdFDMLfOBf9AoSauHV2UkWklXje0SfXK1Ub2yM0Bl5ncgFE73
 tRqSbJwVN+gRudxLpTtOTt3VxbQSMkA19oVYS08w=
Date: Thu, 10 Sep 2020 08:53:12 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [trivial PATCH] treewide: Convert switch/case fallthrough; to
 break;
Message-ID: <20200910065312.GH1031@ninjato>
References: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
MIME-Version: 1.0
In-Reply-To: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_025316_498346_B24286BD 
X-CRM114-Status: GOOD (  12.12  )
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
Cc: linux-wireless@vger.kernel.org, linux-fbdev@vger.kernel.org,
 oss-drivers@netronome.com, nouveau@lists.freedesktop.org,
 alsa-devel <alsa-devel@alsa-project.org>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-ide@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 sparclinux@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
 linux-rtc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, dccp@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-atm-general@lists.sourceforge.net, linux-afs@lists.infradead.org,
 coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-mmc@vger.kernel.org, Kees Cook <kees.cook@canonical.com>,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-sctp@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-nvme@lists.infradead.org,
 storagedev@microchip.com, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 Jiri Kosina <trivial@kernel.org>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: multipart/mixed; boundary="===============6391488289607393091=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6391488289607393091==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OpLPJvDmhXTZE4Lg"
Content-Disposition: inline


--OpLPJvDmhXTZE4Lg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index e32ef3f01fe8..b13b1cbcac29 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1785,7 +1785,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  		fallthrough;
>  	case PCI_DEVICE_ID_INTEL_82801CA_3:
>  		priv->features |= FEATURE_HOST_NOTIFY;
> -		fallthrough;
> +		break;
>  	case PCI_DEVICE_ID_INTEL_82801BA_2:
>  	case PCI_DEVICE_ID_INTEL_82801AB_3:
>  	case PCI_DEVICE_ID_INTEL_82801AA_3:

I am not the maintainer (Jean is) but I suggest to drop this hunk. The
code is more complex with multiple 'fallthrough', so this change alone
actually makes the code inconsistent. A rework would need a seperate
patch.


--OpLPJvDmhXTZE4Lg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9ZzVQACgkQFA3kzBSg
KbYNuA//cymFe0KsFqywRHv3eBWJhoqwvWN2Xhwrx5/b6N3kkKGTo61aOo1ZI2gU
55rQoGusy8OzGXaxlyhNS8Ea9ztPZc/tHEohOHKPYr52ErUMXlbMo3I3q7sZAZEI
O/bRlnPKUCKqKOpZBin0ri6NE3FNYybTW30HgIk/LFUeCuaup10cUcxCmPfXHlNc
M/2M2tBVyyBOqlVVsPxIfEZ4jGDaikxt7mBZDj4QMJnivnuMFuuz8U7gYzkXIHfO
4ahGx+dBLCCInwFNFjEIPr+biq6Bgt/Vl9bbgN/BYbzdgbbJcikEhWHd9FxEoxQ5
Y4M6/HxLDuCwTLIoFHjVifsFHK4Emk5ECc0xBWjHu3CJDunZSmy6yS5gbD1BrstW
Djf0Ue1kyqnVPBDKE0EwFmwz1z1V14bhhXVC1fkiJjTpYRA6g3zMwH1oan6XIbGj
v4OuWFDkQLEfzCCBIASGS849HtQ4rNafKxX3KQ3qxngh7XBrK7X92SLf3qRJurdt
h5Ozd/zYDzyKQ1nOf/XWAOP5SKZH2ANjTrFKgIZE8MRkTmbzrlZkCnDnFD0pKPlB
Z9h9uPZ7kifAejwaRPfsTu6/B9XJafMKfLa3hKTg2kgO+p67ItBEQ0W8wrXLE1/1
c5FW5PqdkjKnx/9yUqosjEsHV2goh1guE4cziLkF1pZXcrElbtk=
=ZP3J
-----END PGP SIGNATURE-----

--OpLPJvDmhXTZE4Lg--


--===============6391488289607393091==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6391488289607393091==--

