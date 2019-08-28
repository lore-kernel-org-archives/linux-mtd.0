Return-Path: <SRS0=Lrxn=WY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDB7C3A5A1
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2019 14:40:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE6DE2064A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2019 14:40:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rAJQYWfD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=android.com header.i=@android.com header.b="OlcPfkFh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE6DE2064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=android.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JTK6MuwlqrETuUm6N/+JAo+o9h4porPNwxPAmAXrtC8=; b=rAJQYWfDpabM82/hgG7MX4go+
	XIqT3D10QnO739Ryg4ENmtPCEsKMExTcA07oNt2OikYjIXuMpuQMF7kSRdr2w8FPdZ8VufJrZk/yO
	mBRIBhoEbCTzD4lmdQiNhYsj0umy8TDM2Zpmpzs2ZGMzMRMHphPtHoVQ1rGYEFZasEjOsoxJSBx4e
	gsofUyoTFAz5zaYz58BHqas4TxZxriQIDZI70joFKx0uHallPG9S3VcHpMQVmvBBqLSresIVsTatN
	Ww/JW/4Iv0psfG84q3w599oDmoQuytWntw/OdWIcFh2M7KUipp+IWbav2WB0p2Gopk0nvDrvJdUPb
	guT2hesQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2z7X-0003rz-86; Wed, 28 Aug 2019 14:40:23 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2z7U-0003rL-6C
 for linux-mtd@lists.infradead.org; Wed, 28 Aug 2019 14:40:21 +0000
Received: by mail-pg1-x542.google.com with SMTP id o13so1571375pgp.12
 for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2019 07:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=otBOnvzgcCfij7khznQb839FNBhUwDL3v2TXcjGpOzs=;
 b=OlcPfkFh4eVXaPXXhh3cHvgBURsJe3iAt4+TEVeWmIUa8zc09e0oQ5MaZNlepG2vze
 B3r7RgJuWq9O6TIbswaNUIKe8aYWW+KNRgEXeCMfCvmELHUyftJPl7HAVt/DUWoqH+mt
 7FiMUsP13ILyRxskXvgoEKTt4mcyDqpG+bZTW39pIt/5h+k8/JBgcB7qNM0XACYD7ale
 oWFmT2jC5R2Rv9fP9CO4NSXlbVjGTO4SWvbIfLdPsT4850CBsX7b6iyMaVYsWWgBm0EJ
 ydfkWGX0BboAbCSeR2RRikvC2V1c34KnlnNThn4oWcDh6RwGfO3sPku0/xiss22u0zC8
 qA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=otBOnvzgcCfij7khznQb839FNBhUwDL3v2TXcjGpOzs=;
 b=QZtXSZlT3kHH4Q8HALrag8fipdNBA+iUsxkR2uhspsNYRyVBdXj79IaZWxNjAwaA5k
 nlpu7AFOlmP8PK5YD75pn0U28zrGIsf3tDnj/7sLyvg2xSOIY3p+Mplvg0zd81F9qrU6
 maQk9VxgkEJCKgZm/lZG/JpNc58P/doQG4EjDFU8phcx083wEZYYxDsYdsAlU64WKDs1
 fz/WY/ocoZqpdrbE+WHXsYf/R212vj/h5AEUJlMyfpmRBiiE0fQm8z1wRFNn3Wa5cLoz
 Nm5SBuljOaMniAF3+EGHgeLkiy2ddPmTcwJxWrqUdDfsTaLMuGom68TRTj1KUHiUviGN
 pQXg==
X-Gm-Message-State: APjAAAVi41ITDupO/YiAxOtqUrP3ICOp+rLtSLt4+iuaBQ4KVTqSGz+Z
 3kJO4fNUsc95sl1c4xtHjtzdhw==
X-Google-Smtp-Source: APXvYqxMi0WkPdC/TIWQ/rEP0W+6WEwgY/rp8ZhYjwRr9PMekyUrfkMqryPcx5ziGSRNx/jQnRs5oA==
X-Received: by 2002:a17:90b:8ca:: with SMTP id
 ds10mr4474530pjb.139.1567003218534; 
 Wed, 28 Aug 2019 07:40:18 -0700 (PDT)
Received: from nebulus.mtv.corp.google.com
 ([2620:15c:211:200:5404:91ba:59dc:9400])
 by smtp.googlemail.com with ESMTPSA id t9sm7295641pgj.89.2019.08.28.07.40.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2019 07:40:17 -0700 (PDT)
Subject: Re: [PATCH v8] Add flags option to get xattr method paired to
 __vfs_getxattr
To: Christoph Hellwig <hch@infradead.org>
References: <20190827150544.151031-1-salyzyn@android.com>
 <20190828142423.GA1955@infradead.org>
From: Mark Salyzyn <salyzyn@android.com>
Message-ID: <5dd09a38-fffb-36f2-505b-be2ddf6bb750@android.com>
Date: Wed, 28 Aug 2019 07:40:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190828142423.GA1955@infradead.org>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190828_074020_260922_1F0810E7 
X-CRM114-Status: GOOD (  16.75  )
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Hugh Dickins <hughd@google.com>,
 Mike Marshall <hubcap@omnibond.com>, James Morris <jmorris@namei.org>,
 devel@lists.orangefs.org, Eric Van Hensbergen <ericvh@gmail.com>,
 Joel Becker <jlbec@evilplan.org>, Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Jan Kara <jack@suse.com>, Casey Schaufler <casey@schaufler-ca.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Kleikamp <shaggy@kernel.org>,
 linux-doc@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 Chao Yu <yuchao0@huawei.com>, Mimi Zohar <zohar@linux.ibm.com>,
 linux-cifs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 Eric Sandeen <sandeen@sandeen.net>, kernel-team@android.com,
 selinux@vger.kernel.org, Brian Foster <bfoster@redhat.com>,
 reiserfs-devel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-f2fs-devel@lists.sourceforge.net,
 Benjamin Coddington <bcodding@redhat.com>, linux-integrity@vger.kernel.org,
 Martin Brandenburg <martin@omnibond.com>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>, Vyacheslav Dubeyko <slava@dubeyko.com>,
 Allison Henderson <allison.henderson@oracle.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Stephen Smalley <sds@tycho.nsa.gov>, Serge Hallyn <serge@hallyn.com>,
 Gao Xiang <gaoxiang25@huawei.com>, Eric Paris <eparis@parisplace.org>,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org, linux-mm@kvack.org,
 samba-technical@lists.samba.org, linux-xfs@vger.kernel.org,
 Bob Peterson <rpeterso@redhat.com>, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 ocfs2-devel@oss.oracle.com, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, Eric Biggers <ebiggers@google.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Adrian Hunter <adrian.hunter@intel.com>, David Howells <dhowells@redhat.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, devel@driverdev.osuosl.org,
 "J. Bruce Fields" <bfields@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Sage Weil <sage@redhat.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 cluster-devel@redhat.com, Steve French <sfrench@samba.org>,
 v9fs-developer@lists.sourceforge.net, Bharath Vedartham <linux.bhar@gmail.com>,
 Jann Horn <jannh@google.com>, ecryptfs@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, Dave Chinner <dchinner@redhat.com>,
 David Sterba <dsterba@suse.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 netdev@vger.kernel.org, linux-unionfs@vger.kernel.org, stable@vger.kernel.org,
 Tyler Hicks <tyhicks@canonical.com>, linux-security-module@vger.kernel.org,
 Phillip Lougher <phillip@squashfs.org.uk>,
 David Woodhouse <dwmw2@infradead.org>, linux-btrfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gOC8yOC8xOSA3OjI0IEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBPbiBUdWUsIEF1
ZyAyNywgMjAxOSBhdCAwODowNToxNUFNIC0wNzAwLCBNYXJrIFNhbHl6eW4gd3JvdGU6Cj4+IFJl
cGxhY2UgYXJndW1lbnRzIGZvciBnZXQgYW5kIHNldCB4YXR0ciBtZXRob2RzLCBhbmQgX192ZnNf
Z2V0eGF0dHIKPj4gYW5kIF9fdmZzX3NldGF4dHIgZnVuY3Rpb25zIHdpdGggYSByZWZlcmVuY2Ug
dG8gdGhlIGZvbGxvd2luZyBub3cKPj4gY29tbW9uIGFyZ3VtZW50IHN0cnVjdHVyZToKPiBZaWtl
cy4gIFRoYXQgbG9va3MgbGlrZSBhIG1lc3MuICBXaHkgY2FuJ3Qgd2UgcGFzcyBhIGtlcm5lbC1v
bmx5Cj4gZmxhZyBpbiB0aGUgZXhpc3RpbmcgZmxhZ3MgZmllbGQgZm9yIOKCiz5zZXQgYW5kIGFk
ZCBhIGZsYWdzIGZpZWxkCj4gdG8gLT5nZXQ/ICBQYXNzaW5nIG1ldGhvZHMgYnkgc3RydWN0dXJl
IGFsd2F5cyB0ZW5kcyB0byBiZSBhIG1lc3MuCgpUaGlzIHdhcyBhIHJlc3BvbnNlIHRvIEdyZWdL
SEAgY3JpdGljaXNtLCBhbiBlYXJsaWVyIHBhdGNoIHNldCBqdXN0IAphZGRlZCBhIGZsYWcgYXMg
eW91IHN0YXRlZCB0byBnZXQgbWV0aG9kLCB1bnRpbCBjb21wbGFpbnRzIG9mIGFuIApleGNlc3Np
dmVseSBsb25nIGFyZ3VtZW50IGxpc3QgYW5kIGZyYWdpbGl0eSB0byBhZGQgb3IgY2hhbmdlIG1v
cmUgCmFyZ3VtZW50cy4KClNvIG1hbnkgd2F5cyBoYXZlIGJlZW4gdHJpZWQgdG8gc2tpbiB0aGlz
IGNhdCAuLi4gdGhlIHJpc2sgd2FzIHRha2VuIHRvIApwbGVhc2Ugc29tZSwgYW5kIHdlIG5vdyBo
YXZlIGh1bmRyZWRzIG9mIHN0YWtlaG9sZGVycywgd2hlbiB0aGUgZmlyc3QgCnBhdGNoIHNldCB3
YXMgbGVzcyB0aGFuIGEgZG96ZW4uIEEgcmVjaXBlIGZvciBmYWlsdXJlPwoKLS0gTWFyawoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
