Return-Path: <SRS0=FYfc=VZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42492C7618F
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Jul 2019 18:50:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D5FA206A2
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Jul 2019 18:50:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n1CvCB7h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D5FA206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fGxUaq13wKrr22BwgTWckhElZUOPdzsIix5NmqXBnO4=; b=n1CvCB7ho4eOby
	VNuufhJlV+b937st1szJVGo0q8Bl9vOVA73s3hN9b1BUn0vtNzTxyaqxdnI308bOoGPqndZFGcI9n
	uf67VokOl3rb23DO4bPe0+mKjWhUEZAo2Tz6D2y0OlOzX7sN3VGJv3FvZ+UJs0XpUc9FRh/BM3Hfb
	F4EujdZRrnIfKlRr3aqkRD4XwkiAhnRvuqNy0vp50NhaXHtrMO2+n+S6t6qFHPU0GVlhPwfl1qaYw
	FnoQ+A6YWfwdD0wfpyNBLek/3FdHnQpPXikgU9p0WRgvGO+PgI9N43G8+p/9ALQo772GO3aaFykQ1
	/fulDf+eEXCGfV07wFqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hroFL-0000aE-13; Sun, 28 Jul 2019 18:50:15 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hroFI-0000Zs-L1
 for linux-mtd@lists.infradead.org; Sun, 28 Jul 2019 18:50:14 +0000
Received: from callcc.thunk.org (96-72-102-169-static.hfc.comcastbusiness.net
 [96.72.102.169] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x6SIo4Jb028047
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 28 Jul 2019 14:50:05 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 68A2E4202F5; Sun, 28 Jul 2019 14:50:03 -0400 (EDT)
Date: Sun, 28 Jul 2019 14:50:03 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v7 06/16] fscrypt: add FS_IOC_ADD_ENCRYPTION_KEY ioctl
Message-ID: <20190728185003.GF6088@mit.edu>
References: <20190726224141.14044-1-ebiggers@kernel.org>
 <20190726224141.14044-7-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726224141.14044-7-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190728_115012_861667_A6F6D4F0 
X-CRM114-Status: GOOD (  12.82  )
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
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jul 26, 2019 at 03:41:31PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Add a new fscrypt ioctl, FS_IOC_ADD_ENCRYPTION_KEY.  This ioctl adds an
> encryption key to the filesystem's fscrypt keyring ->s_master_keys,
> making any files encrypted with that key appear "unlocked".

Note: it think it's going to be useful to make the keyring id
available someplace like /sys/fs/<fs>/<blkdev>/keyring, or preferably
in the new fsinfo system call.  Yes, the system administrator can paw
through /proc/keys and try to figure it out, but it will be nicer if
there's a direct way to do that.

For that matter, we could just add a new ioctl which returns the file
system's keyring id.  That way an application program won't have to
try to figure out what a file's underlying sb->s_id happens to be.
(Especially if things like overlayfs are involved.)

> diff --git a/include/uapi/linux/fscrypt.h b/include/uapi/linux/fscrypt.h
> index 29a945d165def..93d6eabaa7de4 100644
> --- a/include/uapi/linux/fscrypt.h
> +++ b/include/uapi/linux/fscrypt.h
> +
> +struct fscrypt_key_specifier {
> +#define FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR	1
> +	__u32 type;
> +	__u32 __reserved;

Can you move the definition of FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR
outside of the structure definition, and then add a comment about what
is a "descriptor" key spec?  (And then in a later patch, please add a
comment about what is an "identifier" key type.)  There's an
explanation in Documentation/filesystems/fscrypt.rst, I know, but a
one or two line comment plus a pointer to
Documentation/filesystems/fscrypt.rst in the header file would be
really helpful.

Otherwise, it looks good.   Feel free to add:

Reviewed-by: Theodore Ts'o <tytso@mit.edu>

						- Ted

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
