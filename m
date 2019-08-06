Return-Path: <SRS0=yOTt=WC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28211C31E40
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Aug 2019 20:45:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB5032070D
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Aug 2019 20:45:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J+reJ9R0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="dHVvyaXF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB5032070D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m0C9YWJTpoPrNLxQ7mBlZg+GPImSzJrW3s5D1k+L3pU=; b=J+reJ9R0t8MzoQ
	eWz1vXmvKuJQRcNF8+nHZYzEzB6Zg8RnXnDsrLSP4l9VvE5E0DaxzlxY1q22K+foHcJm0EdTQh+zN
	ECwqY4teNBAeWKIJR+JHlIlGOMlf0QTdINqfAjnDFTtLI/k6HXEJwNxcbaqUrQxTPb5rFSH1t8bP0
	JZ2x8qwTiVicyLXSV+4Ua5bAuGlVRy96gG3OzEwI9p9YF+WfKflx4dieOeIN/dx3IAIF1B4f2PpDT
	9jTVUpZfbGOGCN9x0QZ/91P4pi+fC2pBLwvF0PLLyh9fmvtbhpMtyc91jlkDH/M5CiK6rtU9YQ8pA
	D54ecF4yxNdrSUGsUXyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hv6KX-0004bX-0n; Tue, 06 Aug 2019 20:45:13 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hv6KU-0004ae-FM
 for linux-mtd@lists.infradead.org; Tue, 06 Aug 2019 20:45:11 +0000
Received: by mail-lf1-x141.google.com with SMTP id z15so58010440lfh.13
 for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2019 13:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qNvWstZCi3NXF5KJDOazsGSKWj42nw3rueoSXYGmGRc=;
 b=dHVvyaXFUfwdTrXm8Qxe3g47TjDPWLCdOevoaBSnsuB2cWvNXEXQshBBZ2xZ66S7gF
 dDcbZzQwewKYPA4UdVMJKe+OULJcTBNQRzBEpqMJtuldr2635kPtBlgaOJqp7jvup6Ax
 2vW3nYb6r+xDz87ptI4JAiQyQuYpbmMXpvlUN04K30/rtTwPeJM0ZXVBbg5JrFVgVC6X
 TBupMMeehgE7wdlI130er0HeQc0ZJzdmc/c0HBvb/zb3EkUecBEQJthkHIywW1i3UI3k
 hoUKHmZFqSoR2uZzN5Z42y/WAneWxoHJkgWOGaDPO+v7fcApJ9Sd6+EPurKzfbO0Qzx7
 FJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qNvWstZCi3NXF5KJDOazsGSKWj42nw3rueoSXYGmGRc=;
 b=pAMWNsx9AV5zDZ3z++Yvpq2nwZrS/sJ3Y+j5Y2rEa+t14dfPcgEqKZpv3cgwXUNgxP
 L6Utc1rRuN1mu21ihMDkOYPS+5QNjiFAJlaZiqrwRe+nUUM10ed9731a58iyBHAV0mH0
 wPWS0dV/fsvcq+SkYio6n/t3D++qg3mKtI/wYdcLbPcSy01dfdGDSrh5mGMNPO98i8Rl
 t4S+hdlPeCQCO3kW/HJhBpXVySYC1ekKZWEK30LgkWSGq5hV2xFPkJOK3i6b+ly5cE4G
 lOdo3LdLuPEu34s92KY4mJdIYkZ6l3TtICNPdTpqVYljTrlm9bu+lpWMxKihDc+DtghE
 gKtA==
X-Gm-Message-State: APjAAAX1SvI5mEV9PvvE8fXlXrdF4dDDdb1k859AxsWP7gmxeXu5Yj8F
 dFE8cLp9jY6nbuOEVcb3Ev4ZDfG6BEE2IVgmziQEgw==
X-Google-Smtp-Source: APXvYqytA61jT3xOdp0Ac43cHqnLjnFVkdCXmd0Vh+wU5xDCKIN1tOrExheH0FZXClBUGoxDy7me4b7UmNyIp24tkW4=
X-Received: by 2002:ac2:54bc:: with SMTP id w28mr3504887lfk.17.1565124308213; 
 Tue, 06 Aug 2019 13:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190805162521.90882-1-ebiggers@kernel.org>
 <20190805162521.90882-14-ebiggers@kernel.org>
In-Reply-To: <20190805162521.90882-14-ebiggers@kernel.org>
From: Paul Crowley <paulcrowley@google.com>
Date: Tue, 6 Aug 2019 13:44:56 -0700
Message-ID: <CA+_SqcAWniLLTk4eqWX81ypgMqnh2_9N=0JDKs3JopeV6XX_HA@mail.gmail.com>
Subject: Re: [PATCH v8 13/20] fscrypt: v2 encryption policy support
To: Eric Biggers <ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_134510_541385_DAE8CCAF 
X-CRM114-Status: GOOD (  20.83  )
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
Cc: Satya Tangirala <satyat@google.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-api@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 5 Aug 2019 at 09:28, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Add a new fscrypt policy version, "v2".  It has the following changes
> from the original policy version, which we call "v1" (*):
>
> - Master keys (the user-provided encryption keys) are only ever used as
>   input to HKDF-SHA512.  This is more flexible and less error-prone, and
>   it avoids the quirks and limitations of the AES-128-ECB based KDF.
>   Three classes of cryptographically isolated subkeys are defined:
>
>     - Per-file keys, like used in v1 policies except for the new KDF.
>
>     - Per-mode keys.  These implement the semantics of the DIRECT_KEY
>       flag, which for v1 policies made the master key be used directly.
>       These are also planned to be used for inline encryption when
>       support for it is added.
>
>     - Key identifiers (see below).
>
> - Each master key is identified by a 16-byte master_key_identifier,
>   which is derived from the key itself using HKDF-SHA512.  This prevents
>   users from associating the wrong key with an encrypted file or
>   directory.  This was easily possible with v1 policies, which
>   identified the key by an arbitrary 8-byte master_key_descriptor.
>
> - The key must be provided in the filesystem-level keyring, not in a
>   process-subscribed keyring.
>
> The following UAPI additions are made:
>
> - The existing ioctl FS_IOC_SET_ENCRYPTION_POLICY can now be passed a
>   fscrypt_policy_v2 to set a v2 encryption policy.  It's disambiguated
>   from fscrypt_policy/fscrypt_policy_v1 by the version code prefix.
>
> - A new ioctl FS_IOC_GET_ENCRYPTION_POLICY_EX is added.  It allows
>   getting the v1 or v2 encryption policy of an encrypted file or
>   directory.  The existing FS_IOC_GET_ENCRYPTION_POLICY ioctl could not
>   be used because it did not have a way for userspace to indicate which
>   policy structure is expected.  The new ioctl includes a size field, so
>   it is extensible to future fscrypt policy versions.
>
> - The ioctls FS_IOC_ADD_ENCRYPTION_KEY, FS_IOC_REMOVE_ENCRYPTION_KEY,
>   and FS_IOC_GET_ENCRYPTION_KEY_STATUS now support managing keys for v2
>   encryption policies.  Such keys are kept logically separate from keys
>   for v1 encryption policies, and are identified by 'identifier' rather
>   than by 'descriptor'.  The 'identifier' need not be provided when
>   adding a key, since the kernel will calculate it anyway.
>
> This patch temporarily keeps adding/removing v2 policy keys behind the
> same permission check done for adding/removing v1 policy keys:
> capable(CAP_SYS_ADMIN).  However, the next patch will carefully take
> advantage of the cryptographically secure master_key_identifier to allow
> non-root users to add/remove v2 policy keys, thus providing a full
> replacement for v1 policies.
>
> (*) Actually, in the API fscrypt_policy::version is 0 while on-disk
>     fscrypt_context::format is 1.  But I believe it makes the most sense
>     to advance both to '2' to have them be in sync, and to consider the
>     numbering to start at 1 except for the API quirk.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good, feel free to add:

Reviewed-by: Paul Crowley <paulcrowley@google.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
