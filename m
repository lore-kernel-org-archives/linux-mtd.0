Return-Path: <SRS0=eEUd=2Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B81C2D0C2
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jan 2020 16:57:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFF91206DB
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jan 2020 16:57:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B42Myyie";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kxXw7SXw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFF91206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=slXz8L/xEMHIcepulqmB1mekEhC9CHEcb9DPDRQ6Pcw=; b=B42Myyie2YBSc2
	dGIBL6U1zbcfQFv9cw2GPxFtgQdWKLAweBXZtdEZGI4ZVejTDhPszU+QF0wCpnLdWj9r36tfslnET
	FJbB9CMtBEbwckQqvgb2baJ9xZ5q3YdlgsWgxheCC0xEJE/0rECRj+XLgMnheDhQOmUMUTqcKlDc+
	3Ig7+U6/PRwf44R5P/d7MSh/enBRs+nsvKwWLQlMPZVQ7Jf8BFuG5QcU4iDS2TJ5fVms/z34/GwpR
	So8k9HtduA9H0iyrPTjLoRJ2w3iHoWYbnJEDBMGrw8BsnqLeaaZuX2cZk1cZxzm1QOd2xhnFMxB3/
	QIDslZ1p5ELdB8S/8wQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inQGS-0002I5-LF; Fri, 03 Jan 2020 16:57:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inQGP-0002GT-RF
 for linux-mtd@lists.infradead.org; Fri, 03 Jan 2020 16:57:31 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C5DA7206DB;
 Fri,  3 Jan 2020 16:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578070649;
 bh=RL+yaap+s7Gb++esPrb+ddyBAFUgLJGNTPp2fhE5Iv0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kxXw7SXw9knA6E1AFwsb7GlSx8TbEgrh+y/7fgxxpaTXB0F5IZCHr/2+nyXyPozfw
 ILl+8PJ4ckpEtM8xPBGI2xuFFCndo7KoiDhyzVqKfQU8Jg6s2/6sW1x7+8GxdVCmlv
 Etw2e1txnGpwPLJlYb/D0D+m8j+Y3f1VWe9VXDjA=
Date: Fri, 3 Jan 2020 08:57:27 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: Re: [PATCH v2] fscrypt: support passing a keyring key to
 FS_IOC_ADD_ENCRYPTION_KEY
Message-ID: <20200103165727.GB19521@gmail.com>
References: <20191119222447.226853-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191119222447.226853-1-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200103_085729_902054_AD9730CF 
X-CRM114-Status: GOOD (  19.24  )
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
Cc: Paul Lawrence <paullawrence@google.com>,
 "Theodore Y . Ts'o" <tytso@mit.edu>, Ondrej Mosnacek <omosnace@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 Ondrej Kozina <okozina@redhat.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 19, 2019 at 02:24:47PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Extend the FS_IOC_ADD_ENCRYPTION_KEY ioctl to allow the raw key to be
> specified by a Linux keyring key, rather than specified directly.
> 
> This is useful because fscrypt keys belong to a particular filesystem
> instance, so they are destroyed when that filesystem is unmounted.
> Usually this is desired.  But in some cases, userspace may need to
> unmount and re-mount the filesystem while keeping the keys, e.g. during
> a system update.  This requires keeping the keys somewhere else too.
> 
> The keys could be kept in memory in a userspace daemon.  But depending
> on the security architecture and assumptions, it can be preferable to
> keep them only in kernel memory, where they are unreadable by userspace.
> 
> We also can't solve this by going back to the original fscrypt API
> (where for each file, the master key was looked up in the process's
> keyring hierarchy) because that caused lots of problems of its own.
> 
> Therefore, add the ability for FS_IOC_ADD_ENCRYPTION_KEY to accept a
> Linux keyring key.  This solves the problem by allowing userspace to (if
> needed) save the keys securely in a Linux keyring for re-provisioning,
> while still using the new fscrypt key management ioctls.
> 
> This is analogous to how dm-crypt accepts a Linux keyring key, but the
> key is then stored internally in the dm-crypt data structures rather
> than being looked up again each time the dm-crypt device is accessed.
> 
> Use a custom key type "fscrypt-provisioning" rather than one of the
> existing key types such as "logon".  This is strongly desired because it
> enforces that these keys are only usable for a particular purpose: for
> fscrypt as input to a particular KDF.  Otherwise, the keys could also be
> passed to any kernel API that accepts a "logon" key with any service
> prefix, e.g. dm-crypt, UBIFS, or (recently proposed) AF_ALG.  This would
> risk leaking information about the raw key despite it ostensibly being
> unreadable.  Of course, this mistake has already been made for multiple
> kernel APIs; but since this is a new API, let's do it right.
> 
> This patch has been tested using an xfstest which I wrote to test it.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Applied to fscrypt.git#master for 5.6.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
