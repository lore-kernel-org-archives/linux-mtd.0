Return-Path: <SRS0=AYH6=Y5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5789C5DF60
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2019 15:37:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B82382087E
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2019 15:37:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h+hrz2J8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=android.com header.i=@android.com header.b="R8lPpHZa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B82382087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=android.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XdbXUShe0aSGlrAreyhgXxrDjz5MmijTbTuRbmB4Iuc=; b=h+hrz2J88GoDtLZufKmstz9qC
	whOLR0EUdvFQPowlN8fybgyJrM7ZiwriMwLkpxHmqjHFX/33gaSPscojhSqNbKFJ8AD7xrI9W5Dia
	T/tJr5KxPhdJUzZUfHMUNHYnDNJd1nDIVvKNuBmD3RQC3GhQj/FZ4i6EtJXa3UrpAMy4s+peAtFlJ
	Zzu8uefZ/XsMqjx3sW/79Q2WHpuYhDwaszSVSiqpDoSyU/YXTtqodS/+JFXfqhsD299gqW89jyfzL
	g5sNS7yfZc1tUDNhvy6WU7JaepRy33q6QtpZeK9nnrX/+c+Hl7/8F5HB+ii1HytY41JINIbsGAvMU
	ZpfIfWHeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iS0tL-0007ib-Vl; Tue, 05 Nov 2019 15:37:11 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iS0tJ-0007hi-9y
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2019 15:37:10 +0000
Received: by mail-pf1-x441.google.com with SMTP id r4so15735501pfl.7
 for <linux-mtd@lists.infradead.org>; Tue, 05 Nov 2019 07:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=2/8/BwrhtmEXI7dj68SMTpCzdsjoLETsRSfZ5j8yePw=;
 b=R8lPpHZaNTKC1//4X3YRy/co01wfSuPnFkkkoDrdRRcs8xZqXtNYPLgm9OjzsXnJfg
 w/sgCdd9n+99HdKAd13HjrpckBRQK4F+I41/fuJw7ICMDJgQ0tKfn8kAw++u9jIK9Pl7
 wc3lGWI+tLAg5Fo7mlf+u1oz4ZCnt5dRpAwNiKM1EwVqGR4FwH3zMLPET/FX6DvXl/Cq
 XMn8MNwm1G21DoBMHo9twX6ox9SH+JhzmjDChdy5f2tzhmNnEaRv4FiGKkmYlD/OTP+l
 39M21mPDgGHAV1JVejM/uCulS4TGW/MwgQAeZfS0L3/q73lP5U74GqdSjn6t5WS3czii
 QV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=2/8/BwrhtmEXI7dj68SMTpCzdsjoLETsRSfZ5j8yePw=;
 b=fsOKcMTO8QKgrSR0pCeglJmXkpiKYIEvyhSsutaKicO8y4EDaE0vKQ48t5EVjZc7FL
 IGk7chUyTgNzbQUqEpy2LKQamHEQETRaAhA1j08smGvSnhiq2hrhdlrAHOC0ePo9qzZa
 3cVSEsa0xGyhdVAmaDTnfPakRoPK/rAu5cZTe6MirHUuzah4Lf/Uo5lQJ7d4eZY3oGfg
 NLVJHz3zzsdMWGHmAU+EY31vbbFYkDYDORfcMX2Wu+CC4341WuVAj5RVGp7mN7sqdTwl
 a3m5lgpDKNADP8S3sq5iQuORTkzFHeSc2cebHDW80ayd1PgmaXAScYtcgofAIMLO28n0
 mbbA==
X-Gm-Message-State: APjAAAV/eZdS4p+Wv985Qgm7YCmuzvuR5ZcCTEHqGNBYGvOefzW/KGup
 xJDn2YG/uuSOVw/Vk+ULcVWTtw==
X-Google-Smtp-Source: APXvYqy6Q+jW7Nx8yhUJvITL/ENlgb+bvGP0zh9whSnmepYB/pthS+WgqdQwDBfJOEs5VO1iezn2Pw==
X-Received: by 2002:a62:e519:: with SMTP id n25mr38428065pff.144.1572968227784; 
 Tue, 05 Nov 2019 07:37:07 -0800 (PST)
Received: from nebulus.mtv.corp.google.com
 ([2620:15c:211:200:5404:91ba:59dc:9400])
 by smtp.googlemail.com with ESMTPSA id m13sm18037460pga.70.2019.11.05.07.37.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2019 07:37:07 -0800 (PST)
Subject: Re: [PATCH v15 1/4] Add flags option to get xattr method paired to
 __vfs_getxattr
To: Jan Kara <jack@suse.cz>
References: <20191104215253.141818-1-salyzyn@android.com>
 <20191104215253.141818-2-salyzyn@android.com>
 <20191105094830.GL22379@quack2.suse.cz>
From: Mark Salyzyn <salyzyn@android.com>
Message-ID: <1de43656-e751-53a2-c0da-ff44ecbabbc4@android.com>
Date: Tue, 5 Nov 2019 07:37:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191105094830.GL22379@quack2.suse.cz>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_073709_344974_23E49A5D 
X-CRM114-Status: GOOD (  14.81  )
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
 jfs-discussion@lists.sourceforge.net, linux-doc@vger.kernel.org,
 linux-integrity@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Martin Brandenburg <martin@omnibond.com>, samba-technical@lists.samba.org,
 Dominique Martinet <asmadeus@codewreck.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, "David S. Miller" <davem@davemloft.net>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Eric Paris <eparis@parisplace.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, netdev@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 linux-unionfs@vger.kernel.org, Andreas Gruenbacher <agruenba@redhat.com>,
 Sage Weil <sage@redhat.com>, "Darrick J . Wong" <darrick.wong@oracle.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Eric Biggers <ebiggers@google.com>, Hugh Dickins <hughd@google.com>,
 James Morris <jmorris@namei.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, cluster-devel@redhat.com,
 selinux@vger.kernel.org, Benjamin Coddington <bcodding@redhat.com>,
 Casey Schaufler <casey@schaufler-ca.com>, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Stephen Smalley <sds@tycho.nsa.gov>, linux-mm@kvack.org,
 Mark Salyzyn <salyzyn@google.com>, Serge Hallyn <serge@hallyn.com>,
 ecryptfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 Eric Van Hensbergen <ericvh@gmail.com>, Chao Yu <chao@kernel.org>,
 linux-erofs@lists.ozlabs.org, Josef Bacik <josef@toxicpanda.com>,
 reiserfs-devel@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
 Joel Becker <jlbec@evilplan.org>, linux-mtd@lists.infradead.org,
 Phillip Lougher <phillip@squashfs.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 devel@lists.orangefs.org, Gao Xiang <xiang@kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Paul Moore <paul@paul-moore.com>,
 linux-nfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-fsdevel@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Mathieu Malaterre <malat@debian.org>, kernel-team@android.com,
 Jonathan Corbet <corbet@lwn.net>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
 Steve French <sfrench@samba.org>, linux-security-module@vger.kernel.org,
 ocfs2-devel@oss.oracle.com, Jan Kara <jack@suse.com>,
 Bob Peterson <rpeterso@redhat.com>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Anna Schumaker <anna.schumaker@netapp.com>, linux-btrfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11/5/19 1:48 AM, Jan Kara wrote:
>> @@ -228,11 +228,11 @@ static int afs_xattr_get_yfs(const struct xattr_handler *handler,
>>   		break;
>>   	case 1:
>>   		data = buf;
>> -		dsize = snprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
>> +		dsize = scnprintf(buf, sizeof(buf), "%u", yacl->inherit_flag);
>>   		break;
>>   	case 2:
>>   		data = buf;
>> -		dsize = snprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
>> +		dsize = scnprintf(buf, sizeof(buf), "%u", yacl->num_cleaned);
>>   		break;
>>   	case 3:
> These scnprintf() changes (and there are more in the patch) probably
> shouldn't be here... Otherwise the patch still looks good to me :).
>
> 								Honza
>
Good catch, they were done in locality, I forgot about them, this patch 
series has been living for almost a year now and time has become its 
enemy ... will spin this as a separate patch. They strike as a security 
issue with the possibility of fragile UAF when the code is maintained by 
future selves.

-- Mark


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
