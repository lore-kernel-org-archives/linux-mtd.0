Return-Path: <SRS0=YFz0=RR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3D3C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2019 23:42:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE0572087C
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2019 23:42:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YiW9RQKF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE0572087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PDN870KHX5ATfm1m3p26jfE0OeE5wTETT7KY+v+AqgQ=; b=YiW9RQKFuFXfKF
	6tW33SPcpZLPlyLoRL0ONSBt2NEdv3j4A+3GitpaY8k96BL0VYP91dpHg9IoMSm8m1ZbIR94UIR1y
	w07xB3kystrawfxofkDBKrQ+pud7bxFA7NRyrKh2hSl/oBPAnMsOa68nok0JdExTZUXy2pjz3hA6e
	XAzjR012HLBjfZ46s5Bc4ahlkFxHKi9pTogMt4mzOH4taGa68F4pJFA7JTZ/V2P3yzBKJsnWhgPkM
	ES8atvIGWRnckZ4sar5BHHGcyNDpvlSTusGnNhdwsRTgWyaVJQcrwYzlg+/xDfGpkDh5G7OffHWK8
	p4f/WneUyLM/Dl6ZVX/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4Zzm-0003vc-QZ; Thu, 14 Mar 2019 23:42:42 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4Zzj-0003uk-9X
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2019 23:42:40 +0000
Received: from callcc.thunk.org (guestnat-104-133-0-99.corp.google.com
 [104.133.0.99] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x2ENgU4n031164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Mar 2019 19:42:31 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id B8B06420AA8; Thu, 14 Mar 2019 19:42:30 -0400 (EDT)
Date: Thu, 14 Mar 2019 19:42:30 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH 4/4] ubifs: Implement new mount option,
 fscrypt_key_required
Message-ID: <20190314234230.GG6482@mit.edu>
Mail-Followup-To: Theodore Ts'o <tytso@mit.edu>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, jaegeuk@kernel.org,
 linux-unionfs@vger.kernel.org, miklos@szeredi.hu,
 amir73il@gmail.com, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, paullawrence@google.com
References: <CAJfpegvX4ANfso-Jn1zaB+m4Q_0eK9i-+MCJ+sTH5QzD3PZFMQ@mail.gmail.com>
 <20190314171559.27584-1-richard@nod.at>
 <20190314171559.27584-5-richard@nod.at>
 <1552605311.2571.6.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1552605311.2571.6.camel@HansenPartnership.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190314_164239_515789_56D62381 
X-CRM114-Status: GOOD (  10.49  )
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
Cc: miklos@szeredi.hu, Richard Weinberger <richard@nod.at>, amir73il@gmail.com,
 linux-unionfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 paullawrence@google.com, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Mar 14, 2019 at 04:15:11PM -0700, James Bottomley wrote:
> On Thu, 2019-03-14 at 18:15 +0100, Richard Weinberger wrote:
> > Usually fscrypt allows limited access to encrypted files even
> > if no key is available.
> > Encrypted filenames are shown and based on this names users
> > can unlink and move files.
> 
> Shouldn't they be able to read/write and create as well (all with the
> ciphertext name and contents, of course) ... otherwise how does backup
> of encrypted files by admin without the key ever work?

That's not currently supported.  Michael Halcrow and I worked out some
designs on how to do this, and I even had some prototype patches, but
it's really, really, messy, and requires a lot of complex machinations
in userspace on the save *and* restore, since there's a lot of crypto
metadata that has to be saved, and you have to handle backing up the
directory per-file keys, and restoring them when you recreate the
directory on a restore, etc.

The simpler approach would have allowed backup of encrypted files
without the key, but would require the user's key to do the restore,
and if we ever actually tried to get this feature supported, that's
the approach I'd suggest.


The fundamental reason why we never went did anything with this was
that the original use case of fscrypt was for Chrome OS, where the
original design premise was that you don't need to do backups, since
everything is in the cloud.  A video from 2010:

	https://www.youtube.com/watch?v=lm-Vnx58UYo

And with Android, backups happen automatically while you have the
encryption key.

There was talk about using fscrypt for Ubuntu desktops as an ecryptfs
replacement, and in that case, we would have use case that would have
required backups of a shared desktop where you don't have all of the
encryption keys for all of the users.  Maybe someday as a Google
Summer of Code project or maybe if some potential corporate user of
fscrypt would be willing to fund the necessary engineering work?

But again, I'll repeat this because it's so important: In the vast
majority of cases, including single-user laptops, desktops, etc., the
real right answer is dm-crypt and *not* fscrypt.  Especially since
time-sharing systems are *so* 1980's.  :-)

So I don't use fscrypt on my upstream development laptop (except for
testing purposes) because it's simply not the right tool for the job.

		      	 	    - Ted

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
