Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBAED232E9
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 07:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QmJsoPHxP1m2jrt2JIyo3KniTr1I+xFWSzoEJRt/EPs=; b=D6nxHMrRflAQcERLKprRudJ3P2
	2DOfTxr0iidOb+f58XQFoh0LPfF4NI5/zutiw01DAMyMjGNtqsf9IBoAmWy/FaXQ7D3hTnrmBQ3Mg
	fVabAo1z47CauAg7bxzh4hfGJV+KbJ/4z20Mq25qOdmWtynBJoEiP/XFzLaGNqDmd1g695cCRDYh/
	NLpfOpTniK8mqNsDZgjrqThIzF2Q20RiDfH7LcCQk4nAK6oivj7NZw6+7703zDixsa4KSVmiGxS/X
	z1l4QvHVJIZN0WnyBulxRqPRYqa/51xfLBOIzELNPfyjEjFDf8IfUgNmsPSsvmHGaCuojO5Uue5TZ
	KaxvFCNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve775-00000001laG-0QQ4;
	Fri, 09 Jan 2026 07:40:51 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve771-00000001lYh-2nVz
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 07:40:50 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 8503429ABE4;
	Fri,  9 Jan 2026 08:40:40 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 4Z-nBiPgjzSg; Fri,  9 Jan 2026 08:40:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 9463229ABDC;
	Fri,  9 Jan 2026 08:40:39 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ipM5fPbFtVak; Fri,  9 Jan 2026 08:40:39 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id C28E529ABCA;
	Fri,  9 Jan 2026 08:40:38 +0100 (CET)
Date: Fri, 9 Jan 2026 08:40:38 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Jeff Layton <jlayton@kernel.org>
Cc: Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, 
	Nicolas Pitre <nico@fluxnic.net>, 
	Christoph Hellwig <hch@infradead.org>, Jan Kara <jack@suse.cz>, 
	Anders Larsen <al@alarsen.net>, Al Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, 
	David Sterba <dsterba@suse.com>, Chris Mason <clm@fb.com>, 
	Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
	Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>, 
	Sandeep Dhavale <dhavale@google.com>, 
	Hongbo Li <lihongbo22@huawei.com>, Chunhai Guo <guochunhai@vivo.com>, 
	Jan Kara <jack@suse.com>, tytso <tytso@mit.edu>, 
	Andreas Dilger <adilger.kernel@dilger.ca>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, 
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, 
	David Woodhouse <dwmw2@infradead.org>, 
	Dave Kleikamp <shaggy@kernel.org>, 
	Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
	Viacheslav Dubeyko <slava@dubeyko.com>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
	Joseph Qi <joseph.qi@linux.alibaba.com>, 
	Mike Marshall <hubcap@omnibond.com>, 
	Martin Brandenburg <martin@omnibond.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, 
	Amir Goldstein <amir73il@gmail.com>, 
	Phillip Lougher <phillip@squashfs.org.uk>, 
	Carlos Maiolino <cem@kernel.org>, hughd <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, 
	Yuezhang Mo <yuezhang.mo@sony.com>, 
	chuck lever <chuck.lever@oracle.com>, 
	Alexander Aring <alex.aring@gmail.com>, 
	Andreas Gruenbacher <agruenba@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, 
	Matthew Wilcox <willy@infradead.org>, 
	Eric Van Hensbergen <ericvh@kernel.org>, 
	Latchesar Ionkov <lucho@ionkov.net>, 
	Dominique Martinet <asmadeus@codewreck.org>, 
	Christian Schoenebeck <linux_oss@crudebyte.com>, 
	Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, 
	Trond Myklebust <trondmy@kernel.org>, anna <anna@kernel.org>, 
	Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.org>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, 
	Bharath SM <bharathsm@microsoft.com>, 
	Hans de Goede <hansg@kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	linux-btrfs <linux-btrfs@vger.kernel.org>, 
	linux-erofs <linux-erofs@lists.ozlabs.org>, 
	linux-ext4 <linux-ext4@vger.kernel.org>, 
	linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	jfs-discussion@lists.sourceforge.net, 
	linux-nilfs <linux-nilfs@vger.kernel.org>, ntfs3@lists.linux.dev, 
	ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, 
	linux-unionfs <linux-unionfs@vger.kernel.org>, 
	linux-xfs <linux-xfs@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
	gfs2@lists.linux.dev, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	v9fs@lists.linux.dev, ceph-devel <ceph-devel@vger.kernel.org>, 
	linux-nfs <linux-nfs@vger.kernel.org>, 
	linux-cifs <linux-cifs@vger.kernel.org>, 
	samba-technical@lists.samba.org
Message-ID: <218403128.88322.1767944438487.JavaMail.zimbra@nod.at>
In-Reply-To: <20260108-setlease-6-20-v1-12-ea4dec9b67fa@kernel.org>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org> <20260108-setlease-6-20-v1-12-ea4dec9b67fa@kernel.org>
Subject: Re: [PATCH 12/24] jfs: add setlease file operation
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF146 (Linux)/8.8.12_GA_3809)
Thread-Topic: add setlease file operation
Thread-Index: Ijb4veyM6wDb0tIeqxd8skdz5qkIYA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_234048_037211_FE58CC0A 
X-CRM114-Status: UNSURE (   9.02  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkplZmYgTGF5dG9uIiA8amxh
eXRvbkBrZXJuZWwub3JnPgo+IEFkZCB0aGUgc2V0bGVhc2UgZmlsZV9vcGVyYXRpb24gdG8gamZz
X2ZpbGVfb3BlcmF0aW9ucyBhbmQKPiBqZnNfZGlyX29wZXJhdGlvbnMsIHBvaW50aW5nIHRvIGdl
bmVyaWNfc2V0bGVhc2UuICBBIGZ1dHVyZSBwYXRjaCB3aWxsCj4gY2hhbmdlIHRoZSBkZWZhdWx0
IGJlaGF2aW9yIHRvIHJlamVjdCBsZWFzZSBhdHRlbXB0cyB3aXRoIC1FSU5WQUwgd2hlbgo+IHRo
ZXJlIGlzIG5vIHNldGxlYXNlIGZpbGUgb3BlcmF0aW9uIGRlZmluZWQuIEFkZCBnZW5lcmljX3Nl
dGxlYXNlIHRvCj4gcmV0YWluIHRoZSBhYmlsaXR5IHRvIHNldCBsZWFzZXMgb24gdGhpcyBmaWxl
c3lzdGVtLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEplZmYgTGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5v
cmc+Cj4gLS0tCj4gZnMvamZzL2ZpbGUuYyAgfCAyICsrCj4gZnMvamZzL25hbWVpLmMgfCAyICsr
Cj4gMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCkFja2VkLWJ5OiBSaWNoYXJkIFdl
aW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
