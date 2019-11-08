Return-Path: <SRS0=/qel=ZA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5839FA372C
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Nov 2019 04:53:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A95621848
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Nov 2019 04:53:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iYGJVjH8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Aga5bP62"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A95621848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0czFhtcPn0mbTXxe09Qg/PwutvFEUIrezG73St3x54k=; b=iYGJVjH8vqqgM0rX2OdONdURD
	BFXPjc62koqzHp+0naAFPBZKs27r/fESg6ZqL9j82BpwJX43Lo+JQdzNou9m7FIPq0LzKu4ndjwwG
	0dx1ic1fKgWM2Bvrd1JAuf1+MwDLbGvuVCSbPWZvYhswNTa9JDBTV1e5VYPQ9oWw+N0hExoUJvIyF
	+4gZBa4acZ+7cOnds0qR7QbWxCBnYlEg5DF/Zj4xsEBpyfpVWERVLQwVnBR5j7C4mhSRlI4j12S3L
	S29UUMKQwAdOx/0c3nim2WKKYz6JmWec4K6EjO203+2z1fH04QdphQyBbiXOuuZas/H43z6ETr67b
	zsO1EIN8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSwGl-00006d-30; Fri, 08 Nov 2019 04:53:11 +0000
Received: from ozlabs.org ([2401:3900:2:1::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSwGc-0008PN-JB; Fri, 08 Nov 2019 04:53:04 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 478SZB0Shjz9s7T;
 Fri,  8 Nov 2019 15:52:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1573188777;
 bh=lsTl8lWOKmxCnD0se991UB82l6huuBGMFOozceyJHpc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Aga5bP62YWYX6iNtz585PAG4ScKlPSlTrEjqwE3ki+YzY7ybieoqKfiAYYHN3ZWFB
 dgeiWeIzKbrAc1LjDEbqb+7n6BKo8ZoNAEGb/GpuSMY/qWGblDc3ftTHDFdi/3SYk7
 f1uv5aZrwD6T5U/U9em7j4VZ9CxAvSzmWzmiTf/WhUxI4t1uwco2iMnRw+QceM6uTZ
 tLRh0cdl4StpJ6QyKwe/vbR2oz7U5o4mUFwxyUqRMMEe92kUlQJVrFAdfZZd5xU9JS
 ZYhkfWeXPzcZdut4sV7iiXkFFIh/Y1JyCFSYtdaVfsbRy5iI42riGD6QP401UVoRGe
 p7+WJZ1Mo/MGA==
Date: Fri, 8 Nov 2019 15:52:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: generic-iomap tree for linux-next
Message-ID: <20191108155248.0a32a03a@canb.auug.org.au>
In-Reply-To: <20191108132000.3e7bd5b8@canb.auug.org.au>
References: <20191029064834.23438-1-hch@lst.de> <20191107204743.GA22863@lst.de>
 <20191108132000.3e7bd5b8@canb.auug.org.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_205302_832564_D2C24B18 
X-CRM114-Status: GOOD (  11.07  )
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 linux-mtd@lists.infradead.org, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org
Content-Type: multipart/mixed; boundary="===============0761204261002623616=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0761204261002623616==
Content-Type: multipart/signed; boundary="Sig_/tVtmaodFaJa/ooywirx=fo/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tVtmaodFaJa/ooywirx=fo/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christoph,

On Fri, 8 Nov 2019 13:20:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Thu, 7 Nov 2019 21:47:43 +0100 Christoph Hellwig <hch@lst.de> wrote:
> >
> > can you add the generic-ioremap tree:
> >=20
> >    git://git.infradead.org/users/hch/ioremap.git
> >=20
> > to linux-next?  =20
>=20
> I assume you mean the for-next branch?

With that assumption, added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/tVtmaodFaJa/ooywirx=fo/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3E9KAACgkQAVBC80lX
0GzmWwf+Klgi0tTyTa+t0RWIsOgTgCRRshcd2R+zC2TAQiqpOvNWxiNkHSOO6rPt
AIwk9/iB+0v8JHEaYe+JqqmAtlRJjfMKtLkGBCB8WLQ/Sw+V+BW+2kZfZbMDL47C
Q2NA/MqqCVxs38kWlJA+gd3xF1FJLjYYuHlhaksjzlHUVGVcCxeXRrd521DYPcwm
9ZzSoL0488rxdiISFluZ44y3nKSgX3Ye5J4DnymJod7hsctYKZvWL+GxoizD+i6m
HgzcYw5CxoMeQcS9WgBNCafeABW7i7w3jfCsmBjTNWCuUkE+Pruoct6C6G6Q5LqS
jgJAqa5QBfJCS5OsMXSaf1cZapFTkQ==
=R1aO
-----END PGP SIGNATURE-----

--Sig_/tVtmaodFaJa/ooywirx=fo/--


--===============0761204261002623616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0761204261002623616==--

