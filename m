Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A02C282DD
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 11:10:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB0C92183E
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 11:10:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JCRBvdlm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB0C92183E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lyZoYHsDL4bSDreqWIf8AAhgKZgNIn+vsZKXefLqvHo=; b=JCRBvdlm+VUY4uG2+vJ1n/uB/
	OOSl0ROOTYabSHF8lV0CSXPuqytIDFTlKfDecs0a/WU44FsW+uxZAaEs0TXtpt+5TRH2Jg3lusMnK
	VBKv1oAI00PpUohJrcwn84ck79UuH5+fi8vnaeVrfNuQum3ip1FcxHUBXqyWEy8nuachR3Z+2agot
	6qvLDWpDbmEPzoN7Px5o3cRrXHOa3vqAJyCe5x7DN4lamBU8WtfFH/ZDbqIQBAbvPdgp0EC23szEW
	MEKQyDRavDtS/2JwbAiRllQWxxO8yrlp3szqqe9TibB1ZUt0YMw+0MzysfrOfHIKcZA+mIBBIfBPh
	INE58f9nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH4wA-00069J-Hu; Thu, 18 Apr 2019 11:10:38 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH4w2-00062T-RC; Thu, 18 Apr 2019 11:10:32 +0000
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BAC1330058D9;
 Thu, 18 Apr 2019 11:10:28 +0000 (UTC)
Received: from localhost (ovpn-116-27.ams2.redhat.com [10.36.116.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B691C608C7;
 Thu, 18 Apr 2019 11:10:18 +0000 (UTC)
Date: Thu, 18 Apr 2019 12:10:17 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 09/26] compat_ioctl: move drivers to compat_ptr_ioctl
Message-ID: <20190418111017.GE23876@stefanha-x1.localdomain>
References: <20190416202013.4034148-1-arnd@arndb.de>
 <20190416202013.4034148-10-arnd@arndb.de>
MIME-Version: 1.0
In-Reply-To: <20190416202013.4034148-10-arnd@arndb.de>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Thu, 18 Apr 2019 11:10:29 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_041030_919863_0118185A 
X-CRM114-Status: GOOD (  18.33  )
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
Cc: linux-usb@vger.kernel.org, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jason Wang <jasowang@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-mtd@lists.infradead.org, Peter Huewe <peterhuewe@gmx.de>,
 linux1394-devel@lists.sourceforge.net,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 Marek Vasut <marek.vasut@gmail.com>, y2038@lists.linaro.org,
 Richard Weinberger <richard@nod.at>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jason Gunthorpe <jgg@mellanox.com>, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Jiri Kosina <jikos@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Willem de Bruijn <willemb@google.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 linux-integrity@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Content-Type: multipart/mixed; boundary="===============7587243775470980528=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7587243775470980528==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KlAEzMkarCnErv5Q"
Content-Disposition: inline


--KlAEzMkarCnErv5Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2019 at 10:19:47PM +0200, Arnd Bergmann wrote:
> Each of these drivers has a copy of the same trivial helper function to
> convert the pointer argument and then call the native ioctl handler.
>=20
> We now have a generic implementation of that, so use it.
>=20
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/char/ppdev.c              | 12 +---------
>  drivers/char/tpm/tpm_vtpm_proxy.c | 12 +---------
>  drivers/firewire/core-cdev.c      | 12 +---------
>  drivers/hid/usbhid/hiddev.c       | 11 +--------
>  drivers/hwtracing/stm/core.c      | 12 +---------
>  drivers/misc/mei/main.c           | 22 +----------------
>  drivers/mtd/ubi/cdev.c            | 36 +++-------------------------
>  drivers/net/tap.c                 | 12 +---------
>  drivers/staging/pi433/pi433_if.c  | 12 +---------
>  drivers/usb/core/devio.c          | 16 +------------
>  drivers/vfio/vfio.c               | 39 +++----------------------------
>  drivers/vhost/net.c               | 12 +---------
>  drivers/vhost/scsi.c              | 12 +---------
>  drivers/vhost/test.c              | 12 +---------
>  drivers/vhost/vsock.c             | 12 +---------
>  fs/fat/file.c                     | 13 +----------
>  16 files changed, 20 insertions(+), 237 deletions(-)

The vhost parts look good:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--KlAEzMkarCnErv5Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcuFsZAAoJEJykq7OBq3PIjmUH/3YzT8r/nZGWhf+D9Jhao8p9
N6eNCnBkQtsAj+s6IhmhZxdmPlkw0b8X0ws3iIw/zE3PNeLtIt2hG92evE9QSRzD
dkSG0m+8KJ1fQK73GrmLousrFnSOagczYoTD/svPhC3WMptVGlPB4aqBZO4Eh79w
SyUrD7cXe2NQXUFVRI9/QVj+yu59BtvUivzkDwGZxYa5Y8RvwDvelz+xTAkKP/cl
CZ9Gnc2gCrzuK26f5odjmby93QWbAVkiMe5k22pzy/RRpuzsijL5ujr+Ayeti45g
cDTLJ4YjNSzM07rYoa8nqHgZATbSokG/gvbNByeC//MoqtmpE23wNzmMwuFJdi8=
=85Rm
-----END PGP SIGNATURE-----

--KlAEzMkarCnErv5Q--


--===============7587243775470980528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7587243775470980528==--

