Return-Path: <SRS0=aBH3=RZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C459C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2019 22:03:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B99BD2190A
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2019 22:03:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oqNXPOAV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B99BD2190A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=234hzy7KlGl/I2uCYaQGgjIBaTztcceCAAAm8VFC/gQ=; b=oqNXPOAVcM0OvW
	IUhSFbG6k7OAzUeRWuSGS7fpYtQd8QAbBWKU8EXR6XknEJEGip6zPkpq0obSW81wFZ0uf46MQ8t7u
	9JTCjEc7z70iXZa/NpVredPySrnjZ70fhwWZuzgv6gY8rErK1gLsjfmsoKYbVaKAxp4V2m2TtCkfp
	2DH4JY2RBI5/8+0sjZYWJboZhnbCtv40+HXDsMysM7Ra1MMotiEsG325C1Xy1uD1TZAMR7P/qF18N
	DTiSI5sxup/SAgFJgGcgYIsyyzwU/0tnYnxwShRkULktfGg8VUZ1IE5Z+yZ6HHycMbnF09pkKEG9F
	JiKx4MelvdujDubmlGpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7SFn-0003ET-Ne; Fri, 22 Mar 2019 22:03:07 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7SFj-0003DD-S9
 for linux-mtd@lists.infradead.org; Fri, 22 Mar 2019 22:03:05 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 22AD4608A395;
 Fri, 22 Mar 2019 23:02:52 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id bxgElapSClzg; Fri, 22 Mar 2019 23:02:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B507760F6D61;
 Fri, 22 Mar 2019 23:02:51 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id SkcTucd3wTxy; Fri, 22 Mar 2019 23:02:51 +0100 (CET)
Received: from blindfold.localnet (213-47-184-186.cable.dynamic.surfer.at
 [213.47.184.186])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 1D02D608A395;
 Fri, 22 Mar 2019 23:02:51 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [RFC PATCH v3 07/18] fscrypt: add FS_IOC_ADD_ENCRYPTION_KEY ioctl
Date: Fri, 22 Mar 2019 23:02:49 +0100
Message-ID: <4190811.5ckf3pJJgb@blindfold>
In-Reply-To: <20190318230830.GA40545@gmail.com>
References: <20190220065249.32099-1-ebiggers@kernel.org>
 <20190221184203.GB140206@gmail.com> <20190318230830.GA40545@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_150304_113471_DC09D634 
X-CRM114-Status: GOOD (  13.93  )
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
Cc: linux-ext4@vger.kernel.org, "open list:ABI/API" <linux-api@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Satya Tangirala <satyat@google.com>, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ericm

Am Dienstag, 19. M=E4rz 2019, 00:08:31 CET schrieb Eric Biggers:
> I tried using sb->s_bdi->name, but it's still "ubifs" for all UBIFS files=
ystems.

hmpf.
 =

> Perhaps there's a way you can make ->s_id for UBIFS unique?  There are al=
ready
> existing places that log ->s_id, so perhaps you should do it anyway regar=
dless
> of this patchset?

Yes, let me implement that.
ubifs does:
super_setup_bdi_name(sb, "ubifs_%d_%d", c->vi.ubi_num, c->vi.vol_id);

So, I try to set ->s_id also to ubifs_%d_%d.

> > > =

> > > > Note that the keyring name isn't particularly important, since the =
ioctls will
> > > > work regardless.  But we might as well choose something logical, si=
nce the
> > > > keyring name will still show up in /proc/keys.
> > > =

> > > I'm not done with reviewing your patches, but will it be possible to =
use keyctl?
> > > For the a unique name is helpful. :)
> > > =

> > =

> > Not for adding keys, removing keys, or getting a key's status -- those =
are what
> > the ioctls are for.
> > =

> > See e.g. the discussion in patch 7 ("fscrypt: add FS_IOC_ADD_ENCRYPTION=
_KEY
> > ioctl") for why the keyrings syscalls are a poor fit for fscrypt.
> > =

> =

> Anyway, perhaps I should reconsider whether fscrypt should even use the k=
eyrings
> subsystem at all, even just "internally", as its quirks still leak out a =
bit.
> I'd prefer a nice clean API without any quirks like having to name the ke=
yrings
> and assign SELinux labels to the keys just to make the keyrings subsystem=
 happy.

IMHO the keys subsytem is a good fit. For example for stuff like this one:
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1945778.html

We use UBIFS on many embedded systems with crypto hardware.

Thanks,
//richard



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
