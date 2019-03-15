Return-Path: <SRS0=5Vwq=RS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A085C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2019 13:51:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC10D218AC
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2019 13:51:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d4pS9APa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC10D218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FIUytJvYQYKHpKVOYpjAMX18PGuLFhlVLsktSFJig3s=; b=d4pS9APauUZIeO
	vNH+ke5j988GgWVPJ+reHjiiVC6rk/f6pKTmDg2mTJnjBUHH1kIcyUxhrEYoGNc6arndi8uZC1mBy
	XsZnaW8zPZh62KSegk4k9H0CYgyoggzh88/UI15TdE0+i74+dbHLAL21UmYjWitX7uytoz7EdMVH5
	qi0zqFBKy0Yp9O4Ep2aXYECcDsU6nYLU9c7ko9Awb16h6Kt+uzHz+0BH9059YKf9ZfpKpZfElNG3u
	1o128549PKX/r2NwVac+u+7Jpv1i0QlU7vZGBo5nQ1DEeWgvh04LspIBHKHZr8sLnmgqaZaYAwV4p
	kRgOUTFnh1cPoFZ5NMOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4nFN-0004oP-O0; Fri, 15 Mar 2019 13:51:41 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4nFJ-0004mh-QZ
 for linux-mtd@lists.infradead.org; Fri, 15 Mar 2019 13:51:39 +0000
Received: from callcc.thunk.org ([66.31.38.53]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x2FDpSFM032094
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Mar 2019 09:51:29 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 26C51420AA8; Fri, 15 Mar 2019 09:51:28 -0400 (EDT)
Date: Fri, 15 Mar 2019 09:51:28 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 4/4] ubifs: Implement new mount option,
 fscrypt_key_required
Message-ID: <20190315135128.GL11334@mit.edu>
Mail-Followup-To: Theodore Ts'o <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>,
 Eric Biggers <ebiggers@kernel.org>, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, jaegeuk@kernel.org,
 linux-unionfs@vger.kernel.org, miklos@szeredi.hu,
 amir73il@gmail.com, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, paullawrence@google.com,
 James.Bottomley@HansenPartnership.com
References: <CAJfpegvX4ANfso-Jn1zaB+m4Q_0eK9i-+MCJ+sTH5QzD3PZFMQ@mail.gmail.com>
 <1957441.Hty6t2mpXG@blindfold> <20190314230702.GE6482@mit.edu>
 <3651600.xvQHXhhOD0@blindfold>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3651600.xvQHXhhOD0@blindfold>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_065138_030009_1526C1AF 
X-CRM114-Status: GOOD (  12.85  )
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
Cc: paullawrence@google.com, miklos@szeredi.hu, amir73il@gmail.com,
 linux-unionfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, James.Bottomley@HansenPartnership.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Mar 15, 2019 at 08:48:10AM +0100, Richard Weinberger wrote:
> Ted,
> =

> Am Freitag, 15. M=E4rz 2019, 00:07:02 CET schrieb Theodore Ts'o:
> > Richard --- stepping back for a moment, in your use case, are you
> > assuming that the encryption key is always going to be present while
> > the system is running?
> =

> it is not a hard requirement, it is something what is common on embedded
> systems that utilize UBIFS and fscrypt.
> =

> Well, fscrypt was chosen as UBIFS encryption backend because per-file enc=
ryption
> with derived keys makes a lot of sense.
> Also the implementation was not super hard, David and I weren't keen to r=
einvent
> dm-crypt f=FCr UBI/MTD.
> =

> That said, I'm happy with fscrypt, it works well in production.

OK, but please note that fscrypt leaks i_size and timestamp
information; dm-crypt doesn't.  An enterprising attacker could very
easily be able to do something interesting with that information, so
be sure you've thought through what the threat model for users of
ubifs is going to be.

If you need per-user keying, and you need to be able to mount the file
system and access some of the files without having any keys, and if
it's useful for an admin to be able to delete files without having the
key, then fscrypt is a great fit.

You are proposing changes that (optionally) eliminate that last
advantage of fscrypt.  So I just wanted to sanity check whether or not
the other advantages are useful to you, and worth the security
tradeoffs that are inherent in such a choice.  If it's worth it, then
great.  But if it isn't, I'd much rather that you appropriately
protect your users and your customers rather than be an additional
user of fscrypt.  :-)

Cheers,

						- Ted

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
