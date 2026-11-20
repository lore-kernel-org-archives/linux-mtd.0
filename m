Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E053606A331
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 02:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hHHyXmdc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dq2Owl4T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:Message-ID
	:In-Reply-To:From:Subject:Cc:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0+5YkI3CRZcSFb9Gb61yBl1dN8hICOmx88ifo5V25z8=; b=hHHyXmdciXnEbIbu5/wH7z6WeA
	W2WnpUHZzi/Zh9nn8t72M2RYHisTd7cPS97eLpbUWQ0RB4hsg0kslGN6kza+JOMptDIomdHnyg/jb
	2CGTnn/BA/TTJJwH3PUTz5Nao4UQ5U9LeGCBgIxBUUw1n6M6Ldwg+rdhaNoMMvtMCATelKUxBoVVh
	icYKVMcPHLY9FeHVtOXER1F2QPswJhyLkeFyIa7835ozxbjTtn7MqcqLot1s600EhC7TjbnwygHh6
	8qRc6Te6QQCFjFrgmLWcBEIg+BM13Ynrn5Uq+vHI6dTfMJXYC4GObdxX3Oyuc5UJZnC7dEzGDHPci
	GjlOJaDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUESY-0000000DtZ0-1MNi;
	Fri, 20 Nov 2026 02:34:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUESW-0000000DtYi-4Aep
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 02:34:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E1BBF601C9;
	Fri, 20 Nov 2026 02:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6D31F000C6;
	Fri, 20 Nov 2026 02:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795142079;
	bh=yLxaIFgMgiNdJ6EvHj90KmNsd7UyUa4rOHQt8MkQ4o8=;
	h=To:Cc:Subject:From:In-Reply-To:References:Date;
	b=dq2Owl4TQH5i1O8lPJeqrs/bhVJe74UawaV8WZGOjcpXryG9VX5bBPEuofmjMl6C8
	 KEMZUEWUmofCrIT9kL1mF9sqs29c0Cyil2oxP83BwPsBQxJM3XbOQHwaj2x7OkBm3R
	 Ubt4udGPNHycSNftWKTVPyy9zKiSLnNOhFSlFIOPsiCL9/KFgmw/r+jfOmYYUs/VC/
	 SAI+QguGa/5ffH3iaZeehgrULZs3TCS3y0wcIRBQ7+1cYjuY8NOZbiPkIC9OoceHPS
	 +R5fZniZZazVx2uAAw4qgmr08ft+ySZxWB+NNVSP3BxvosYlgijyZSgy8PCf4WR5j7
	 gqEvBh4+Qs7GQ==
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,  Jonathan Corbet <corbet@lwn.net>,  Shuah
 Khan <skhan@linuxfoundation.org>,  linux-doc@vger.kernel.org,  David
 Hildenbrand <david@kernel.org>,  Andrew Morton
 <akpm@linux-foundation.org>,  Jason Gunthorpe <jgg@nvidia.com>,  Leon
 Romanovsky <leonro@nvidia.com>,  linux-mm@kvack.org,  Jaroslav Kysela
 <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,
  linux-sound@vger.kernel.org,  Jens Axboe <axboe@kernel.dk>,
  linux-block@vger.kernel.org,  Marcel Holtmann <marcel@holtmann.org>,
  Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
  linux-bluetooth@vger.kernel.org,  Willem de Bruijn
 <willemdebruijn.kernel@gmail.com>,  Jason Wang <jasowangio@gmail.com>,
  David Heidelberg <david@ixit.cz>,  oe-linux-nfc@lists.linux.dev,  Chas
 Williams <3chas3@gmail.com>,  "David S. Miller" <davem@davemloft.net>,
  Eric Dumazet <edumazet@kernel.org>,  Jakub Kicinski <kuba@kernel.org>,
  Paolo Abeni <pabeni@redhat.com>,  netdev@vger.kernel.org,  Helge Deller
 <deller@gmx.de>,  linux-fbdev@vger.kernel.org,
  dri-devel@lists.freedesktop.org,  MPT-FusionLinux.pdl@broadcom.com,
  "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,  "Martin
 K. Petersen" <mkp@kernel.org>,  linux-scsi@vger.kernel.org,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Zhihao Cheng
 <chengzhihao1@huawei.com>,  linux-mtd@lists.infradead.org,  Neill Kapron
 <nkapron@google.com>,  Andrey Konovalov <andreyknvl@gmail.com>,  Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,  linux-usb@vger.kernel.org,
  Juergen Gross <jgross@suse.com>,  Stefano Stabellini
 <sstabellini@kernel.org>,  xen-devel@lists.xenproject.org,  Hans de Goede
 <hansg@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Eugenio =?utf-8?Q?P=C3=A9rez?= <eperezma@redhat.com>,
  Sean
 Christopherson <seanjc@google.com>,  Paolo Bonzini <pbonzini@redhat.com>,
  kvm@vger.kernel.org,  virtualization@lists.linux.dev,  Jan Kara
 <jack@suse.cz>,  linux-fsdevel@vger.kernel.org,  "Theodore Ts'o"
 <tytso@mit.edu>,  linux-ext4@vger.kernel.org,  Mike Marshall
 <hubcap@omnibond.com>,  devel@lists.orangefs.org,  Paulo Alcantara
 <pc@manguebit.org>,  Namjae Jeon <linkinjeon@kernel.org>,
  linux-cifs@vger.kernel.org,  Jaegeuk Kim <jaegeuk@kernel.org>,  Chao Yu
 <chao@kernel.org>,  linux-f2fs-devel@lists.sourceforge.net,  Florian
 Fainelli <florian.fainelli@broadcom.com>,  Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>,  Tzung-Bi Shih
 <tzungbi@kernel.org>,  Benson Leung <bleung@chromium.org>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Alex Deucher
 <alexander.deucher@amd.com>,  Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
  amd-gfx@lists.freedesktop.org,  Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,
  Tvrtko Ursulin <tursulin@ursulin.net>,  intel-gfx@lists.freedesktop.org,
  Matthew Brost <matthew.brost@intel.com>,  Thomas =?utf-8?Q?Hellstr=C3=B6?=
 =?utf-8?Q?m?=
 <thomas.hellstrom@linux.intel.com>,  intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 06/12] docs: ioctl-number: update SCSI entries
From: "Martin K. Petersen" <mkp@kernel.org>
In-Reply-To: <20261119053514.255348-7-rdunlap@infradead.org>
Message-ID: <yq1eccgqlhr.fsf@mail.kernel.org>
References: <20261119053514.255348-1-rdunlap@infradead.org>
	<20261119053514.255348-7-rdunlap@infradead.org>
Date: Thu, 19 Nov 2026 21:34:38 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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


Randy,

> Update the list of files where SCSI ioctls are defined and update the
> ranges of function numbers that are used.

Reviewed-by: Martin K. Petersen (Oracle) <mkp@kernel.org>

-- 
Martin K. Petersen

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
