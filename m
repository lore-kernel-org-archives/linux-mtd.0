Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB8DFD9E0A
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Feb 2026 21:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kKVXOgmGzr3nPlRAmzwq+2ftQFBhOWXljqenYHTIP/0=; b=arx7ArjRgVi/Zq
	XGa89WH7k4Nho5ikTr6nvjrDniYeTnPZW5SkTrI+6oJGJeK00pjt3/9KIkHcf3AxxKR/0ehYP6INx
	J5rX0/fZOM/V1Scium3c6aIl/gbIDjAfLpdNGvjwJHj4wvOrXlXy5Nf3IW7mdv4aNfh5TpsmFL/pk
	5ftbEd3fAkiBFoJAFnRBC6P8AXOCXqdKyQGn4YLIbZJi2a8JaZRXTOQQ1ZFB/T+hh+snWvXR+Q4g0
	0fmdWB4q/ZlOGuUQFP7PmtUYGvE4GxCnerNcpwQ7Bonz70jl0A+wkxNHBTUoQy/d+nFVz+TW2XWok
	m7T0TEkUneGk9pHtiJOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvieN-00000007CpP-1AO2;
	Thu, 26 Feb 2026 21:11:59 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvieK-00000007CoQ-0AL6
	for linux-mtd@lists.infradead.org;
	Thu, 26 Feb 2026 21:11:58 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c70bfef17a4so739149a12.2
        for <linux-mtd@lists.infradead.org>; Thu, 26 Feb 2026 13:11:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772140314; cv=none;
        d=google.com; s=arc-20240605;
        b=lNQzD7/PKwwIB17s7h1733hU6x0AcseKXRMvVdtJFWFZYgUvXkY2DrlKBZdR4ZkRG3
         aomrISVHd67GmTdvna4RtC1DYjaZdwJC/nDVMOG00/JCJd4V6i8sr0vucOgSknmH9Xfu
         ehCPNrKWaX50grySa0EriYQffRgnu5fYoctF6AlzRN1H+zkmyta2DcGFk4Vy2r2A50cP
         ksLQ5tsZDdpbzF126EMR/96EMH4Vr7YLoUJgr5Vj2w1xLtmPLtW534DeEZXEv1gnwtPh
         KzrBCnpmRZFSxRVfAzlT2eHOjhmtYAVkk63Bf1xMGqG3rBaD/KjryAr4RWugq2eHod/1
         vmgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zmNhsrxkJsNmzJoSll+GD0SvmHq0rQdZiw5NaBd3y6o=;
        fh=6s95Ff0y2RPGY8bCw9eBOjoKOKllGXE8KapReykW/b8=;
        b=AENeUb/Vj4iwxzPZPVJxwcjgufk1Xy9G1j/sJXndqvf/fv1pB8uveZiVK/Vk3TxOLm
         +xMvl4CHdGbxcsdTlryCUJzN4E5zrSVz64m45y7MJSlgIN3iXQThMsM0gfOzSGDTFovR
         DszZ5ikdrXkDAGataHVtFJ0P/jQgt9bQJ+atTYRu1PWC+C6opPF2kEHP2+dMiKuOva6d
         5tkgz1+40Ft+E6zzmpHy0SXxRWE29m9VC/VT5VObFzoFKrVyurbUbCU5jVVwSs17wJu9
         1UfntI1YZ4JRcFa1OoLj8TysK7UmUpmRSHWyZpj7Dmj+W3rlCykyx8Bn+fcP777VtR+2
         HMtQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1772140314; x=1772745114; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmNhsrxkJsNmzJoSll+GD0SvmHq0rQdZiw5NaBd3y6o=;
        b=Tf0dPIw/ThU/B/tNzUx5aVT/JffPxJAcvkPGrACiNDbQ+Ui0iBOtedgxUNSFbTWhDB
         vDsOHvYZg7ht3sL+Z0K0ga6/puEig7FYJ6FfWvtHYub1LsrRAv6A13+P/zuO/T/qYck7
         HJd3iiczoer9A+fEiKvoVsKaLXbhEutk03LCgl0wihmZdCYC8/quv28oGWaeD+RdFucY
         jhyM7e56yS/rfxCrG+9qzo9idtQdAXKHbDgIQKuzNuSl2/szXspkSoFLdyJB/CvmZmnJ
         H4XBgFxZ0oqHdVSpnPV0B4cyqxpvbU/Ihm2BM8isvKsPyvHJHmvsD1AihYXZzUFPQHC3
         b2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772140314; x=1772745114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zmNhsrxkJsNmzJoSll+GD0SvmHq0rQdZiw5NaBd3y6o=;
        b=XgVhyeiOtLI6GShu8+IPstdPtPPOT4SC4Gh65a83G71qylJquHSENylzS+eQudVtB0
         gsqo7zUKzmf1SrNXaowB57BG2mE5s/XghU2t8dh6c93rIPS4JiYPSpHf3XtRDQaafiF4
         m5lzPydg/NRSe9v/Rty2dGF7SH+QcDdUZoGaQUmYZxVqjcjZ1/6QDk3y0cvdP70Eilej
         yQSX18ydsUIV52JjVG1RsERq0PJo29GFFA8vgE2Y2bRN4EkAz7vyQdInQvHxcY2GZrEX
         segD5gxySk3nEVaEoirFqE7wUB+lipu7L16SFQHgtx/TlcbcCgAmSyRfqyBuQxxw1b46
         XlJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBMMhHQmafzIeRPdX0/8OmQIS1/8LJaAXdDJNGdkJXZq8IO+YyuI6W9vwSKQlsQcJAoI1l+Y5kbuc=@lists.infradead.org
X-Gm-Message-State: AOJu0YztgWoiTEYqw3DMDtNgiRbFNiw+IzvjIwcvioANEK/oJ4JjIK6S
	OFO23DYBo4COwic3mC+vxpfWRjQkL35IG09of7XWMkgM0/+sa+zpoMBtPEkFbpjZmtYMJWrPDfH
	W2vbuIZGNNiUFFy9pDU2J1KAWXorYzWpkSyTsGjxF
X-Gm-Gg: ATEYQzy8DfkE5SpJ+iHjGcVWMPxcsgK1JrkIAqntcI7qeIiPo8SB2Ngg6dN059eLJfL
	LpCLfS7ZIaU8YW9vLYoOL6B9iug/D4AWy/udnKA2yW7U5FGTpazJzmDN44XuBTUOX0MHANqYqCf
	7f1Y7H8kW+nCArFn0RZg7DaJgv0JW1ghfz9BOaXJ954O7wqPWQULBhCSYS1maDWQstMPghCDOmW
	gSN72H5x1BtOW1Y3428iLS+oWOzK9D2VUM6Tyqw4fdp4Fy9XV0KIJNHlBtUWWG4dqPFVE2cOkgo
	1rIv8u4=
X-Received: by 2002:a17:90b:574f:b0:359:877:370f with SMTP id
 98e67ed59e1d1-35965ccf029mr498632a91.17.1772140313953; Thu, 26 Feb 2026
 13:11:53 -0800 (PST)
MIME-Version: 1.0
References: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org> <20260226-iino-u64-v1-51-ccceff366db9@kernel.org>
In-Reply-To: <20260226-iino-u64-v1-51-ccceff366db9@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 26 Feb 2026 16:11:41 -0500
X-Gm-Features: AaiRm51CHDvKlRV2Z04ZUK5c4lU9AiJhpRFTzD6a70HHA0FgEKDqsojtRqG1Wpw
Message-ID: <CAHC9VhTPutzjNfYoRJigC2AQS4wz1A3vTEYn2koeR0kKetYk0w@mail.gmail.com>
Subject: Re: [PATCH 51/61] security: update audit format strings for u64 i_ino
To: Jeff Layton <jlayton@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox <willy@infradead.org>, Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.org>, Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, Steve French <sfrench@samba.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, Alexander Aring <alex.aring@gmail.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Viacheslav Dubeyko <slava@dubeyko.com>, Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, David Sterba <dsterba@suse.com>, Marc Dionne <marc.dionne@auristor.com>, Ian Kent <raven@themaw.net>, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>, Amir Goldstein <amir73il@gmail.com>, Christoph Hellwig <hch@infradead.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li <frank.li@vivo.com>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Dave Kleikamp <shaggy@kernel.org>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Miklos Szeredi <miklos@szeredi.hu>, Anders Larsen <al@alarsen.net>, Zhihao Cheng <chengzhihao1@huawei.com>, Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, John Johansen <john.johansen@canonical.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Casey Schaufler <casey@schaufler-ca.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, "Darrick J. Wong" <djwong@kernel.org>, Martin Schiller <ms@dev.tdt.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, nvdimm@lists.linux.dev, fsverity@lists.linux.dev, linux-mm@kvack.org, netfs@lists.linux.dev, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, linux-nilfs@vger.kernel.org, v9fs@lists.linux.dev, linux-afs@lists.infradead.org, autofs@vger.kernel.org, ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org, linux-mtd@lists.infradead.org, jfs-discussion@lists.sourceforge.net, ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, linux-unionfs@vger.kernel.org, apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, selinux@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, netdev@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-fscrypt@vger.kernel.org, linux-xfs@vger.kernel.org, linux-hams@vger.kernel.org, linux-x25@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_131156_484196_C338D9CA 
X-CRM114-Status: GOOD (  16.86  )
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

T24gVGh1LCBGZWIgMjYsIDIwMjYgYXQgMTE6MDbigK9BTSBKZWZmIExheXRvbiA8amxheXRvbkBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IFVwZGF0ZSAlbHUvJWxkIHRvICVsbHUvJWxsZCBpbiBzZWN1
cml0eSBhdWRpdCBsb2dnaW5nIGZ1bmN0aW9ucyB0aGF0Cj4gcHJpbnQgaW5vZGUtPmlfaW5vLCBz
aW5jZSBpX2lubyBpcyBub3cgdTY0Lgo+Cj4gRmlsZXMgdXBkYXRlZDogYXBwYXJtb3IvYXBwYXJt
b3Jmcy5jLCBpbnRlZ3JpdHkvaW50ZWdyaXR5X2F1ZGl0LmMsCj4gaXBlL2F1ZGl0LmMsIGxzbV9h
dWRpdC5jLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9y
Zz4KPiAtLS0KPiAgc2VjdXJpdHkvYXBwYXJtb3IvYXBwYXJtb3Jmcy5jICAgICAgIHwgIDQgKyst
LQo+ICBzZWN1cml0eS9pbnRlZ3JpdHkvaW50ZWdyaXR5X2F1ZGl0LmMgfCAgMiArLQo+ICBzZWN1
cml0eS9pcGUvYXVkaXQuYyAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBzZWN1cml0eS9sc21f
YXVkaXQuYyAgICAgICAgICAgICAgICAgfCAxMCArKysrKy0tLS0tCj4gIHNlY3VyaXR5L3NlbGlu
dXgvaG9va3MuYyAgICAgICAgICAgICB8ICA0ICsrLS0KPiAgc2VjdXJpdHkvc21hY2svc21hY2tf
bHNtLmMgICAgICAgICAgIHwgMTIgKysrKysrLS0tLS0tCj4gIDYgZmlsZXMgY2hhbmdlZCwgMTcg
aW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCgouLi4KCj4gZGlmZiAtLWdpdCBhL3NlY3Vy
aXR5L2xzbV9hdWRpdC5jIGIvc2VjdXJpdHkvbHNtX2F1ZGl0LmMKPiBpbmRleCA3ZDYyM2IwMDQ5
NWMxNGIwNzllMTBlOTYzYzIxYTlmOTQ5YzExZjA3Li43MzdmNWEyNjNhOGY3OTQxNjEzMzMxNWVk
ZjM2M2VjZTNkNzljNzIyIDEwMDY0NAo+IC0tLSBhL3NlY3VyaXR5L2xzbV9hdWRpdC5jCj4gKysr
IGIvc2VjdXJpdHkvbHNtX2F1ZGl0LmMKCkV2ZXJ5dGhpbmcgaW4gc2VjdXJpdHkvbHNtX2F1ZGl0
LmMgbG9va3Mgb2theS4KCj4gZGlmZiAtLWdpdCBhL3NlY3VyaXR5L3NlbGludXgvaG9va3MuYyBi
L3NlY3VyaXR5L3NlbGludXgvaG9va3MuYwo+IGluZGV4IGQ4MjI0ZWExMTNkMWFjMjczYWFjMWZi
NTIzMjRmMDBiMzMwMWFlNzUuLjE1MGVhODZlYmMxZjdjN2Y4MzkxYWY0MTA5YTNkYTgyYjEyZDAw
ZDIgMTAwNjQ0Cj4gLS0tIGEvc2VjdXJpdHkvc2VsaW51eC9ob29rcy5jCj4gKysrIGIvc2VjdXJp
dHkvc2VsaW51eC9ob29rcy5jCj4gQEAgLTE0MDAsNyArMTQwMCw3IEBAIHN0YXRpYyBpbnQgaW5v
ZGVfZG9pbml0X3VzZV94YXR0cihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZGVudHJ5ICpk
ZW50cnksCj4gICAgICAgICBpZiAocmMgPCAwKSB7Cj4gICAgICAgICAgICAgICAgIGtmcmVlKGNv
bnRleHQpOwo+ICAgICAgICAgICAgICAgICBpZiAocmMgIT0gLUVOT0RBVEEpIHsKPiAtICAgICAg
ICAgICAgICAgICAgICAgICBwcl93YXJuKCJTRUxpbnV4OiAlczogIGdldHhhdHRyIHJldHVybmVk
ICVkIGZvciBkZXY9JXMgaW5vPSVsZFxuIiwKPiArICAgICAgICAgICAgICAgICAgICAgICBwcl93
YXJuKCJTRUxpbnV4OiAlczogIGdldHhhdHRyIHJldHVybmVkICVkIGZvciBkZXY9JXMgaW5vPSVs
bGRcbiIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgLXJjLCBp
bm9kZS0+aV9zYi0+c19pZCwgaW5vZGUtPmlfaW5vKTsKPiAgICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gcmM7Cj4gICAgICAgICAgICAgICAgIH0KCkFkZGl0aW9uYWxseSwgbGF0ZXIgaW4g
dGhpcyBmdW5jdGlvbiB0aGVyZSBhcmUgcHJfbm90aWNlX3JhdGVsaW1pdGVkKCkKYW5kIHByX3dh
cm4oKSBjYWxscyB0aGF0IHByaW50IGlub2RlIG51bWJlcnMgYW5kIG5lZWQgdG8gYmUgdXBkYXRl
ZC4KCi0tIApwYXVsLW1vb3JlLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
