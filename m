Return-Path: <SRS0=Ul+2=TO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DAD3C04AB4
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2019 08:01:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FFBE208CA
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2019 08:01:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h6gVcQfk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FFBE208CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qPx4lzeyNZRl22rE1ce/aP5xnH0V+Sg1o4L0lgYtGkw=; b=h6gVcQfkApwDjf
	CrMheQWwBA+sU/QZNyHzpLO4GxUaxYjgkP8XC+j6H7+08/pZd10OWgzRmH6WYXIFPYGwLdQcSZ4L1
	pm/fL9780ZUttgww4i/wGPHcQNynSjdgK//6up66rSL8LTtxL9pLNs7kCSvlS6CenDUG2l+7d+TI0
	jNwqRDWsRNsZr1D5Y8ztLM+bo5nfdNBR8oEiROg6mtjaHPjXsK7Xlt9/NFzcBLHRFtVkDwlYNsxGQ
	ZImsu3i0ZYd9VoPBzQEgKIKJnpO8ODEr4ObC//G0ende4SBDIKltudWSgBPSIrrdouj3RiaStU/fg
	jGOXXATkOVaA/bx754Zg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQSNC-0001mF-4N; Tue, 14 May 2019 08:01:18 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQSN8-0001lX-6M
 for linux-mtd@lists.infradead.org; Tue, 14 May 2019 08:01:16 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hQSN5-0000zS-Pz; Tue, 14 May 2019 10:01:11 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hQSN3-0002fE-9q; Tue, 14 May 2019 10:01:09 +0200
Date: Tue, 14 May 2019 10:01:09 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] ubifs: support offline signed images
Message-ID: <20190514080109.se36bgikpq5rofm4@pengutronix.de>
References: <20190401143001.32679-1-s.hauer@pengutronix.de>
 <907546720.46255.1557090818794.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <907546720.46255.1557090818794.JavaMail.zimbra@nod.at>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 15:02:34 up 56 days, 13 min, 90 users,  load average: 1.26, 1.23,
 1.16
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_010114_391742_D6B6FE7D 
X-CRM114-Status: GOOD (  30.67  )
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
Cc: david@sigma-star.at, linux-mtd <linux-mtd@lists.infradead.org>,
 kernel@pengutronix.de
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Richard,

Thanks for review.

On Sun, May 05, 2019 at 11:13:38PM +0200, Richard Weinberger wrote:
> ----- Urspr=FCngliche Mail -----
> > Von: "Sascha Hauer" <s.hauer@pengutronix.de>
> > An: "linux-mtd" <linux-mtd@lists.infradead.org>
> > CC: "richard" <richard@nod.at>, kernel@pengutronix.de, "Sascha Hauer" <=
s.hauer@pengutronix.de>
> > Gesendet: Montag, 1. April 2019 16:30:01
> > Betreff: [PATCH] ubifs: support offline signed images
> =

> > HMACs can only be generated on the system the UBIFS image is running on.
> =

> Because at mkfs.ubifs time you don't have the key which might be hardware
> specific, right?

Yes, right.

> > +int ubifs_sb_verify_signature(struct ubifs_info *c,
> > +			      const struct ubifs_sb_node *sup)
> > +{
> > +	int err;
> > +	struct ubifs_scan_leb *sleb;
> > +	struct ubifs_scan_node *snod;
> > +	const struct ubifs_sig_node *signode;
> > +
> > +	err =3D ubifs_leb_read(c, UBIFS_SB_LNUM, c->sbuf, 0, c->leb_size, 1);
> =

> This line looks wrong here, leftover from old code? :)

Yup, can be removed.

> =

> > +	sleb =3D ubifs_scan(c, UBIFS_SB_LNUM, UBIFS_SB_NODE_SZ, c->sbuf, 0);
> > +	if (IS_ERR(sleb)) {
> > +		err =3D PTR_ERR(sleb);
> > +		return err;
> > +	}
> > +
> > +	if (sleb->nodes_cnt =3D=3D 0) {
> > +		ubifs_err(c, "Unable to find signature node");
> > +		err =3D -EINVAL;
> > +		goto out_destroy;
> > +	}
> > +
> > +	snod =3D list_entry(sleb->nodes.next, struct ubifs_scan_node, list);
> =

> list_first_entry()?

Yes.

> =

> > +	if (snod->type !=3D UBIFS_SIG_NODE) {
> > +		ubifs_err(c, "Signature node is of wrong type");
> > +		err =3D -EINVAL;
> > +		goto out_destroy;
> > +	}
> > +
> > +	signode =3D snod->node;
> > +
> > +	err =3D verify_pkcs7_signature(sup, sizeof(struct ubifs_sb_node),
> > +				     signode->sig, le32_to_cpu(signode->len),
> =

> signode->len is not verified, please embed a check on the length.

Ok.

> =

> > +				     NULL, VERIFYING_UNSPECIFIED_SIGNATURE,
> > +				     NULL, NULL);
> > +
> > +	if (err)
> > +		ubifs_err(c, "Failed to verify signature");
> > +	else
> > +		ubifs_msg(c, "Successfully verified super block signature");
> =

> While this is good news, is it really worth telling the user every time?

No, will remove.

> =

> > +out_destroy:
> > +	ubifs_scan_destroy(sleb);
> > +
> > +	return err;
> > +}
> > +
> > /**
> >  * ubifs_init_authentication - initialize UBIFS authentication support
> >  * @c: UBIFS file-system description object
> > @@ -499,3 +561,22 @@ int ubifs_hmac_wkm(struct ubifs_info *c, u8 *hmac)
> > 		return err;
> > 	return 0;
> > }
> > +
> > +/*
> > + * ubifs_hmac_zero - test if a HMAC is zero
> > + * @c: UBIFS file-system description object
> > + * @hmac: the HMAC to test
> > + *
> > + * This function tests if a HMAC is zero and returns true if it is
> > + * and false otherwise.
> > + */
> > +bool ubifs_hmac_zero(struct ubifs_info *c, const u8 *hmac)
> > +{
> > +	int i;
> > +
> > +	for (i =3D 0; i < c->hmac_desc_len; i++)
> > +		if (hmac[i] !=3D 0)
> > +			return false;
> > +
> > +	return true;
> > +}
> =

> Isn't there an helper available?
> Maybe based on memcmp()?

Indeed there's memchr_inv() - Find an unmatching character in an area of me=
mory.

> =

> > diff --git a/fs/ubifs/master.c b/fs/ubifs/master.c
> > index 5ea51bbd14c7..5655414a76a7 100644
> > --- a/fs/ubifs/master.c
> > +++ b/fs/ubifs/master.c
> > @@ -60,6 +60,40 @@ int ubifs_compare_master_node(struct ubifs_info *c, =
void *m1,
> > void *m2)
> > 	return 0;
> > }
> > =

> > diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
> > index 67fac1e8adfb..3dd195dbd852 100644
> > --- a/fs/ubifs/sb.c
> > +++ b/fs/ubifs/sb.c
> > @@ -761,18 +770,12 @@ int ubifs_read_superblock(struct ubifs_info *c)
> > 	c->old_leb_cnt =3D c->leb_cnt;
> > 	if (c->leb_cnt < c->vi.size && c->leb_cnt < c->max_leb_cnt) {
> > 		c->leb_cnt =3D min_t(int, c->max_leb_cnt, c->vi.size);
> > -		if (c->ro_mount)
> > -			dbg_mnt("Auto resizing (ro) from %d LEBs to %d LEBs",
> > -				c->old_leb_cnt,	c->leb_cnt);
> > -		else {
> > -			dbg_mnt("Auto resizing (sb) from %d LEBs to %d LEBs",
> > -				c->old_leb_cnt, c->leb_cnt);
> > -			sup->leb_cnt =3D cpu_to_le32(c->leb_cnt);
> > -			err =3D ubifs_write_sb_node(c, sup);
> > -			if (err)
> > -				goto out;
> > -			c->old_leb_cnt =3D c->leb_cnt;
> > -		}
> > +		sup->leb_cnt =3D cpu_to_le32(c->leb_cnt);
> > +
> > +		c->superblock_need_write =3D 1;
> > +
> > +		dbg_mnt("Auto resizing from %d LEBs to %d LEBs",
> > +			c->old_leb_cnt,	c->leb_cnt);
> =

> Hmm, I don't fully understand the logic here.
> What happens to c->old_leb_cnt and the ro_mount case?

c->old_leb_cnt is only used by the code to determine if the leb_cnt has
changed, i.e. in ubifs_remount_rw() we have:

	if (c->old_leb_cnt !=3D c->leb_cnt) {
		...
		err =3D ubifs_write_sb_node(c, sup);
	}

We now have the explicit c->superblock_need_write flag which has the
same purpose. c->old_leb_cnt is no longer used, it should have been
removed in this patch, but I missed it. Will do in v2.

In the ro_mount case nothing changes really. The code will set
c->superblock_need_write and based on that flag we will write the
updated superblock when we are going readwrite later. The same happened
before this patch based on (c->old_leb_cnt !=3D c->leb_cnt), only that
I now the master node is written first and the sb_node afterwards.

> > + * struct ubifs_sig_node - node for signing other nodes
> > + * @ch: common header
> > + * @len: The length of the signature data
> > + * @sig: The signature data
> > + */
> > +struct ubifs_sig_node {
> > +	struct ubifs_ch ch;
> > +	__le32 len;
> > +	__u8 sig[];
> > +} __packed;
> > +
> =

> Can we please have a version or type field?
> Just in case we want to support more than PKCS#7 at some point.
> This new node is not used at lot, so we can waste a little space...

Sure, I'll add a type field.

> =

> Did you check, what is the typical length of a signature?
> Maybe adding more padding fields is worth it.

The signature is 670 bytes in my case. It's the x509 file the Kernel
generates for module signing. I don't know how typical that size is.
What I know is that there is no upper limit for the size of a x509 file,
not sure if that can become a problem some day.

Sascha

-- =

Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
