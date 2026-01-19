Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCB3CA6005
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 08:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zixh4i6DSsmFxmrSLKNRZvj+udGnFnom0v4SP5rlHyc=; b=aNgFA/ju+lTLUi
	HCczux0oNV6wW3QOkMlwZd9/Cf96s/tZOAnZxTcc1S3ix6HdE8AjGdU7Q+DOaCiL5UEgGv8A71YKD
	yYMHJSTEpNSM5FLh6stMHg2XzWAL7rM7BkSKFkFlsAtlgs1RvADpn6euG0FEduuaZVKxxolm5jIfU
	dAnoGRjOO4Gpdr+sTiPI7NQXg/UTyrpzF37nFfO7CBht4CFRPFR8DZ59GIKjKr4q5sZ9WlXGRqM8Q
	CLqcZnIWupfstCsfgrPGQOigUqYIXXy9OZTV4p/tTNwOkBPju2NpwxLDZSaM8z5DHpIW+OzbkWn1/
	UwdIjJzcMA0BppcELE7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkoA-00000001ZKy-47GC;
	Mon, 19 Jan 2026 08:40:22 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhko5-00000001ZK8-3WhN
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 08:40:19 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-382fa663249so39093551fa.0
        for <linux-mtd@lists.infradead.org>; Mon, 19 Jan 2026 00:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768812015; x=1769416815; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJoYOa5K18nqNKCWxkYAOdRPH4EyPY3p5tSvazTt+nc=;
        b=eyzsygz10QY8uRCjeHS5SuH3pbQhZryWzg0OPfz6bD8LxCNahlHDaSd2fcTJ0NEQLe
         sSaMJuPrusq+NvKUrJsdAiHNKkL8CJfCBcsKsRV3MF39q5QugtS1HRhIZwpahP2R5Aqs
         AtBbS+MhKq1jLK1qbJgxXPWmxW7tIkU2/6+I25WBwSLpg2RrvPEnwtBnAohQsIpT2PAY
         fql1LTS1DWfcFn94mpV37h8XVqoxQXLDSwmNzOie/BVSJzVFZXOpxI+Ajy+93qd5yHLb
         aEw/peCZP7xfLjjp9O2SImRyo48b9sij0anjaL8jdjIhNjEqrmd/PgXrUmAxXA9o1daZ
         BEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768812015; x=1769416815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KJoYOa5K18nqNKCWxkYAOdRPH4EyPY3p5tSvazTt+nc=;
        b=hTGzra9OQA2xya8tREdqnotid5anE63IbE0aPNoJm8nxpe4X54gCyofNl93xgMKAe6
         k0n/8tcPCc4DL9dn0gSLJsE7TFWZnaJu6QJFhZMalAWPSMVtb8ga2A0aAGdxRb8TaUDE
         aFuYE8Tm9aHmx9S5TydFdskuyzFhmAeIPLy454KcFd6l5Tqa0/o7e54RAZl0VV5Fdl7P
         LgBBB3s7YZbZumCMBq2ERklfPDL4bjGa26p6jQgsBsymyLH3Y2PSEVJ7d2CgQKefeHGu
         KyS77nXasp0K7oWKY/yi7A3oxpT5a33ccYzvauefa9+kW4HeHMzDLK/6L9mJoRgdN4OQ
         nJvw==
X-Forwarded-Encrypted: i=1; AJvYcCUoosaetBIOKUeyeTfjLVNGGBP7m7M+po/veJgPiCrXrPDhiw4P7knXKCdXh/LQ3aTQj1bh52r1488=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd/MG6zKBTWzlO4I3qZ4yVscJy5UvWsC6N5yuKttfedmZTbMhb
	MTY+/1QNYzGNC1d14dMB5odBnI4tbYwmo0ZSl1IhcATkbBqFVV9/P3foKO9H8M8TwZTM9S8NCry
	rits+yYvlGghQGdyOCNH+hEClEFP5zOo=
X-Gm-Gg: AY/fxX4KkbH9EocSe7jJLy2bpKo42arlVrnEKW5SV4DNTCqXn1YWluX1FgRyE/xwOaf
	LzS9JN9xNlv/drJtafYTk+1rD09pr5bgoDxxbKsvmNXbXUzaYZ2d008W3ByPkt1xwlTHmqMWrSb
	AOprY390x7o9wwBfW57cewN9anftpX47b2UuhUJhIsIu8vVlCX2SnFGxZOCL8iqTkCRXI2LO04S
	pwSLsZuigG/lVIDQQYsAIGSgB3D5mDDjuKm9EURnQ7JEQQyeq3VnBiNhE7OkXtP/4vMObEe
X-Received: by 2002:a05:651c:31d3:b0:37b:9ab6:a071 with SMTP id
 38308e7fff4ca-383842a1f56mr38777111fa.28.1768812014411; Mon, 19 Jan 2026
 00:40:14 -0800 (PST)
MIME-Version: 1.0
References: <20260115-exportfs-nfsd-v1-0-8e80160e3c0c@kernel.org> <20260115-exportfs-nfsd-v1-20-8e80160e3c0c@kernel.org>
In-Reply-To: <20260115-exportfs-nfsd-v1-20-8e80160e3c0c@kernel.org>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Mon, 19 Jan 2026 17:39:57 +0900
X-Gm-Features: AZwV_QgvoiJk-4c_7XszNQLNhAbjR94vrEkk8toY4eDKXl6u9TqMllUY3n06aqo
Message-ID: <CAKFNMomS-8MMAjy8yuFwzuLBuQQA8r7gPJeJh1ci6RvVc9u4EA@mail.gmail.com>
Subject: Re: [PATCH 20/29] nilfs2: add EXPORT_OP_STABLE_HANDLES flag to export operations
To: Jeff Layton <jlayton@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, 
	Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Amir Goldstein <amir73il@gmail.com>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Theodore Ts'o" <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, 
	Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale <dhavale@google.com>, 
	Hongbo Li <lihongbo22@huawei.com>, Chunhai Guo <guochunhai@vivo.com>, 
	Carlos Maiolino <cem@kernel.org>, Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
	Viacheslav Dubeyko <slava@dubeyko.com>, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
	Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, 
	Phillip Lougher <phillip@squashfs.org.uk>, Steve French <sfrench@samba.org>, 
	Paulo Alcantara <pc@manguebit.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Mike Marshall <hubcap@omnibond.com>, 
	Martin Brandenburg <martin@omnibond.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Dave Kleikamp <shaggy@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Jan Kara <jack@suse.cz>, 
	Andreas Gruenbacher <agruenba@redhat.com>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Christoph Hellwig <hch@infradead.org>, linux-nfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-xfs@vger.kernel.org, ceph-devel@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org, 
	devel@lists.orangefs.org, ocfs2-devel@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-nilfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
	linux-mtd@lists.infradead.org, gfs2@lists.linux.dev, 
	linux-f2fs-devel@lists.sourceforge.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_004018_187891_31687C19 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKYW4gMTYsIDIwMjYgYXQgMjo1MOKAr0FNIEplZmYgTGF5dG9uIHdyb3RlOgo+Cj4g
QWRkIHRoZSBFWFBPUlRfT1BfU1RBQkxFX0hBTkRMRVMgZmxhZyB0byBuaWxmczIgZXhwb3J0IG9w
ZXJhdGlvbnMgdG8gaW5kaWNhdGUKPiB0aGF0IHRoaXMgZmlsZXN5c3RlbSBjYW4gYmUgZXhwb3J0
ZWQgdmlhIE5GUy4KPgo+IFNpZ25lZC1vZmYtYnk6IEplZmYgTGF5dG9uIDxqbGF5dG9uQGtlcm5l
bC5vcmc+CgpBY2tlZC1ieTogUnl1c3VrZSBLb25pc2hpIDxrb25pc2hpLnJ5dXN1a2VAZ21haWwu
Y29tPgoKVGhhbmtzLApSeXVzdWtlIEtvbmlzaGkKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
