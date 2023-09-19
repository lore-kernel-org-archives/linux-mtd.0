Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445EECD3447
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Sep 2023 07:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uSfKNOaXmJJ3IQu3mraAdE+wZ7Z+/QOeOULST1BG7lQ=; b=VX54FyIXvmk4Sp
	6pi4CsnEBHxKxmtRscj7JGcV+pw7xcpben5UeVnk8+cQ6qhIOySIMlijxGlgko745KdQowM1SLsiA
	IYGR9+xXgJmIGAmSALR6zjIMYhfp/X2O1arK256JbpVfUFEMLLdCWYqaMVZS37Ek0ZKW9c2wfXWrM
	D/o3rAxTnh6liEWansPfUEIkrhlol+f594ZaLsc5M+gW+9jYLyxcLOV3HdcRhxIKJAT6CTmmEWWBd
	sKp6erJvHJxQsC8LUg5VFpIw7k4bDKebWHln3y4+6UH972r7LiObFyL8i3/oikU3KmX4F06eNfRDr
	iY66ygQQYfVaS+LHArIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiUoE-00HBqo-1I;
	Tue, 19 Sep 2023 07:06:10 +0000
Received: from rivendell.linuxfromscratch.org ([208.118.68.85])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiUo7-00HBpY-2y;
	Tue, 19 Sep 2023 07:06:08 +0000
Received: from [192.168.3.211] (unknown [36.44.140.33])
	by rivendell.linuxfromscratch.org (Postfix) with ESMTPSA id 26A431C1DD6;
	Tue, 19 Sep 2023 07:05:30 +0000 (GMT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.0.0 at rivendell.linuxfromscratch.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfromscratch.org;
	s=cert4; t=1695107155;
	bh=9wNEeAzCOPg0mCdyHRKNEVbZmXBmTaugcI3ERiby3k0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aqoK/Ilc8LvyUE+Xk4kK0TbIhFHarWsn2uBwrCvOIBF6xZoiA1f4tJ9dbKWFKRiu6
	 paL+GBbo9SPpEBIbiWrsPB0XfpKTd2+G50VtbF86FGHEVOMJSrRDmkMaTUMORk6h/3
	 qLapgrTCCQmetnyxXQd0oMfEVgIT+/HKvVoU4IKX272amD2+FjwGF7/9QSILQuggfV
	 BI6kNxpQvUY/+hAogUxC35kr9T5IahyPaFtyYIDE5cZir6pdZggqKuZtpzkHOubZ1J
	 isHMMtWcQM3xaSsKJn5GsqEfCinyGk71Ww3uWLHV11gy8ssXk8BO2mWnXKo2ok/N19
	 WGA2g3mo4aO4w==
Message-ID: <bf0524debb976627693e12ad23690094e4514303.camel@linuxfromscratch.org>
Subject: Re: [PATCH v7 12/13] ext4: switch to multigrain timestamps
From: Xi Ruoyao <xry111@linuxfromscratch.org>
To: Jeff Layton <jlayton@kernel.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>,  Christian Brauner <brauner@kernel.org>, Eric
 Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck
 <linux_oss@crudebyte.com>, David Howells <dhowells@redhat.com>, Marc Dionne
 <marc.dionne@auristor.com>, Chris Mason <clm@fb.com>, Josef Bacik
 <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Xiubo Li
 <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, Jan Harkes
 <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Tyler Hicks <code@tyhicks.com>, Gao
 Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, Yue Hu
 <huyue2@coolpad.com>,  Jeffle Xu <jefflexu@linux.alibaba.com>, Namjae Jeon
 <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, Jan Kara
 <jack@suse.com>, Theodore Ts'o <tytso@mit.edu>,  Andreas Dilger
 <adilger.kernel@dilger.ca>, Jaegeuk Kim <jaegeuk@kernel.org>, OGAWA
 Hirofumi <hirofumi@mail.parknet.co.jp>, Miklos Szeredi <miklos@szeredi.hu>,
 Bob Peterson <rpeterso@redhat.com>, Andreas Gruenbacher
 <agruenba@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tejun Heo <tj@kernel.org>, Trond Myklebust
 <trond.myklebust@hammerspace.com>, Anna Schumaker <anna@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh
 <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi
 <joseph.qi@linux.alibaba.com>, Mike Marshall <hubcap@omnibond.com>, Martin
 Brandenburg <martin@omnibond.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Kees Cook <keescook@chromium.org>, Iurii Zaikin <yzaikin@google.com>, 
 Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N
 <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Richard Weinberger <richard@nod.at>, Hans de
 Goede <hdegoede@redhat.com>, Hugh Dickins <hughd@google.com>,  Andrew
 Morton <akpm@linux-foundation.org>, Amir Goldstein <amir73il@gmail.com>,
 "Darrick J. Wong" <djwong@kernel.org>, Benjamin Coddington
 <bcodding@redhat.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 v9fs@lists.linux.dev, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org,  ceph-devel@vger.kernel.org,
 codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org, 
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com, 
 linux-nfs@vger.kernel.org, ntfs3@lists.linux.dev,
 ocfs2-devel@lists.linux.dev,  devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org,  samba-technical@lists.samba.org,
 linux-mtd@lists.infradead.org,  linux-mm@kvack.org,
 linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org,  Jan Kara
 <jack@suse.cz>, bug-gnulib@gnu.org
Date: Tue, 19 Sep 2023 15:05:24 +0800
In-Reply-To: <20230807-mgctime-v7-12-d1dec143a704@kernel.org>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
	 <20230807-mgctime-v7-12-d1dec143a704@kernel.org>
User-Agent: Evolution 3.50.0 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_000604_037507_3A2AB878 
X-CRM114-Status: GOOD (  17.00  )
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

T24gTW9uLCAyMDIzLTA4LTA3IGF0IDE1OjM4IC0wNDAwLCBKZWZmIExheXRvbiB3cm90ZToKPiBF
bmFibGUgbXVsdGlncmFpbiB0aW1lc3RhbXBzLCB3aGljaCBzaG91bGQgZW5zdXJlIHRoYXQgdGhl
cmUgaXMgYW4KPiBhcHBhcmVudCBjaGFuZ2UgdG8gdGhlIHRpbWVzdGFtcCB3aGVuZXZlciBpdCBo
YXMgYmVlbiB3cml0dGVuIGFmdGVyCj4gYmVpbmcgYWN0aXZlbHkgb2JzZXJ2ZWQgdmlhIGdldGF0
dHIuCj4gCj4gRm9yIGV4dDQsIHdlIG9ubHkgbmVlZCB0byBlbmFibGUgdGhlIEZTX01HVElNRSBm
bGFnLgoKSGkgSmVmZiwKClRoaXMgcGF0Y2ggY2F1c2VzIGEgZ251bGliIHRlc3QgZmFpbHVyZToK
CiQgfi9zb3VyY2VzL2xmcy9ncmVwLTMuMTEvZ251bGliLXRlc3RzL3Rlc3Qtc3RhdC10aW1lCnRl
c3Qtc3RhdC10aW1lLmM6MTQxOiBhc3NlcnRpb24gJ3N0YXRpbmZvWzBdLnN0X210aW1lIDwgc3Rh
dGluZm9bMl0uc3RfbXRpbWUgfHwgKHN0YXRpbmZvWzBdLnN0X210aW1lID09IHN0YXRpbmZvWzJd
LnN0X210aW1lICYmIChnZXRfc3RhdF9tdGltZV9ucyAoJnN0YXRpbmZvWzBdKSA8IGdldF9zdGF0
X210aW1lX25zICgmc3RhdGluZm9bMl0pKSknIGZhaWxlZApBYm9ydGVkIChjb3JlIGR1bXBlZCkK
ClRoZSBzb3VyY2UgY29kZSBvZiB0aGUgdGVzdDoKaHR0cHM6Ly9naXQuc2F2YW5uYWguZ251Lm9y
Zy9jZ2l0L2dudWxpYi5naXQvdHJlZS90ZXN0cy90ZXN0LXN0YXQtdGltZS5jCgpJcyB0aGlzIGFu
IGV4cGVjdGVkIGNoYW5nZT8KCj4gQWNrZWQtYnk6IFRoZW9kb3JlIFRzJ28gPHR5dHNvQG1pdC5l
ZHU+Cj4gUmV2aWV3ZWQtYnk6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+Cj4gU2lnbmVkLW9mZi1i
eTogSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4KPiAtLS0KPiDCoGZzL2V4dDQvc3Vw
ZXIuYyB8IDIgKy0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQo+IAo+IGRpZmYgLS1naXQgYS9mcy9leHQ0L3N1cGVyLmMgYi9mcy9leHQ0L3N1cGVyLmMK
PiBpbmRleCBiNTRjNzBlMWE3NGUuLmNiMWZmNDdhZjE1NiAxMDA2NDQKPiAtLS0gYS9mcy9leHQ0
L3N1cGVyLmMKPiArKysgYi9mcy9leHQ0L3N1cGVyLmMKPiBAQCAtNzI3OSw3ICs3Mjc5LDcgQEAg
c3RhdGljIHN0cnVjdCBmaWxlX3N5c3RlbV90eXBlIGV4dDRfZnNfdHlwZSA9IHsKPiDCoAkuaW5p
dF9mc19jb250ZXh0CT0gZXh0NF9pbml0X2ZzX2NvbnRleHQsCj4gwqAJLnBhcmFtZXRlcnMJCT0g
ZXh0NF9wYXJhbV9zcGVjcywKPiDCoAkua2lsbF9zYgkJPSBraWxsX2Jsb2NrX3N1cGVyLAo+IC0J
LmZzX2ZsYWdzCQk9IEZTX1JFUVVJUkVTX0RFViB8IEZTX0FMTE9XX0lETUFQLAo+ICsJLmZzX2Zs
YWdzCQk9IEZTX1JFUVVJUkVTX0RFViB8IEZTX0FMTE9XX0lETUFQIHwKPiBGU19NR1RJTUUsCj4g
wqB9Owo+IMKgTU9EVUxFX0FMSUFTX0ZTKCJleHQ0Iik7Cj4gwqAKPiAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
