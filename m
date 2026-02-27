Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9672FEFB6E
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Feb 2026 16:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=62RBtpzCjOrpHsnQ2DodMlJ/Mu1fl7cCeOfdS9beUMs=; b=TyT5iSkTY7D1Mr
	SeHCRz/xa9HgBPEzfJ7BfjmYHENeta2WezCGYom/T6BCoY7M0VGuz4YRWSU7xrMLzAg9IksCJjT6k
	4jHPcgwCpuNrei0OV/HVGU4H8oh1x3wQAa96UHzNwqcqDA8pTQXyo/ftKctnYDhzETMkX0nUFBWqN
	0mp/PkT468PPZtHu5i+f/smy8LddTw3F0rPCqVhlofD11qfYBHZIGLcOz2V1TEIGFAirnYMI5SkFb
	1Ry3Nc7L3zogDWweLCmLEHnrsDrGzDNynTZyYQybyfpRFoIRar8ZVJMhkhnZGW2V8Xgv7iRdrvKJl
	vEaegNlMT/vD6J50h60g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0zq-00000008kju-0UGM;
	Fri, 27 Feb 2026 16:47:22 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0zk-00000008kiz-2QoG
	for linux-mtd@lists.infradead.org;
	Fri, 27 Feb 2026 16:47:18 +0000
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 097473FB52
	for <linux-mtd@lists.infradead.org>; Fri, 27 Feb 2026 16:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1772210832;
	bh=BKQzT9t7ZI3mb+6EDIKBTxaX0DX68JkIAcPYLBp08+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=AsZRArcr+IHOjGSBnonu/oj477dSluZfbYqix5/Y3zCBdoV1+uw6mYYHWwc4sPEzW
	 HjFcFZE09FnavTkEnrKbxmF0r3YbTQPiFMojDWqkufdWKDMCZW9OPxWmPLHGl8VYyP
	 aEEDR142r/egN11v+6BUwh9UCjnO7iqcqVKNlvjuimRs6gHHfWgooiT0xYazkycZV9
	 iGaNpfepDa56QYdI4I7j3O9bAMZ5DH4c2WTlkXndqNrhlLiQOUUvwizjaREzzR+RaW
	 G6qhyP2mK34/AwEY8BsSjxU/P2yJBLCVcFF0FazsuIIhPpIJJoppDe/KKLv377XKJO
	 ckRoiSwBJ3h5NMgLM0yT68s2FLDl6gyLkP/lRN3fVuLZu1yxgjda/ENN1odqNnDS9i
	 cUltWCZdejwVb0iOVt7w8SJ+e7iURRxp5NxrVK346lnXyAMDOroqzltJLwTrKWTFrE
	 AN4ruGpriTmmvQ9GwGNvr1LpOw6mwnclV+8SKwiXFM2kWGMs7WC4UqqVSYW/5oxS+O
	 xoiqh6Acy+TYgniHFTAsDU75wpJzuZLSiIVgwW31LUadIpejlNvpg5EcfEaBbQmLVj
	 NgnJJyPdPSKozzmB9LKkQNdrUwMQftfhfgs3hHlvFhllpGK5m8UgazcxDHxIY0+WhT
	 Efp718XcrpREHjvzQoHFxdjs=
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-79868381229so23012917b3.0
        for <linux-mtd@lists.infradead.org>; Fri, 27 Feb 2026 08:47:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772210831; cv=none;
        d=google.com; s=arc-20240605;
        b=RTwvjhA57RKlonzmsSxNMoIwhN4ZBBlNJgJ30N2KL1YWNASFwv9ezGiAQbBJ+0Jk0U
         yzngbY9m6eZ6kko2OtmqIRm0DCDg6XTXdECJ8e5x1qUoHu+2/nAvi4ovtzUMD+RofPGS
         OqusvkUxQW3sP+7l3K0NM6H/1BeRoXepgeMUw/DEuOVKyndIXZ+BOENpAUsIXeNuO3nR
         C9BXjLFYx9EO62zgIlz5fUzKWo5akYE9D6OupTv1aZFtQrtNGnS1pmvnhNXPkXKdYv8g
         3yDnxJgMZwyQSW+1+NEzaXG36D9TbcqFKqjo5hwwC4SpE9+WB1iMaHuFTuO1g4MT2cxG
         u3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=BKQzT9t7ZI3mb+6EDIKBTxaX0DX68JkIAcPYLBp08+M=;
        fh=AHvlOaIkNKCTz9tjEJiuI3kX6pXL8ygnTFpbHAgwdVE=;
        b=abYVUg7fb9DfaDJdfytLlQgdHB5CHJlMVDQEeV0Bok6b28Ewp/FbB7zI/bKoPkzh7j
         2bO8V7nGMakm69z1CFeHeF/a4gAWBJmPDZhA+jqPQlxpxhXP24z7auOVxvJqWWzDh4Gv
         DBaeoZiua3iXyN5Bb+rH5uIu9fk3Me/CQdaXNN9Q9xu9qL9TgCSH/cnWftb8CsG4o/h/
         BJM6fRQOAZD4S4e7f0nvCnXdgwepD/u7gG7wn0oorpNwttccLsAmF/t7yD7UmNTR88G+
         9hfPA6Pl6YDNU+RvefxiKzl/WRbrR9DB4seeeMziXhwqJMmdgjqT2Ony3k+Yy5UCp4rf
         Af3Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772210831; x=1772815631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BKQzT9t7ZI3mb+6EDIKBTxaX0DX68JkIAcPYLBp08+M=;
        b=uY7qkxsbjtj880sZkQ/u9w+30GHDrziF9+yVYsHgKWtZ4HzJVyVL3H9qDu/r2BAagH
         qBAY4Pf1W9Fp+cbcKcCdcynfVQPnRKv0XuzRxIxqtZnDejphIszQQ+aBfAYalkhlUxfe
         s9U37M0Ryx+oUH/64Dn7VKzMOmfzfNSVJOnBv8lasKskeRURjuhy/jV9vgkvXuvgscck
         QO7zw3sbKiqEwKxd9gs8NDr+EuBqSNeHLkHsdledBklMtyt0ARgmj2pCWuSxF15d714O
         cyj0nK6sGByGC1aH3PjoRMY6rkAwpvIY1y1EVttFe7NyG8umXWME8xpAg/tfDVOmk5R8
         Bzeg==
X-Forwarded-Encrypted: i=1; AJvYcCXBBstuIuGifgCE07kqZpOtOACV25oAfYuMi8J5RKEe8PJLBbHXMShezHOPQ+7+cqlxpCxek7QRH0M=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsqVc1nx8OoxcZxEuHSztffUlPoiTvmcENHy42fZh0NKhv8G+J
	P1PUMBh//V5oBwY9Y9OL1VI5V/agxqbRJco9ZrlIUiNVj+fPHId5P6WZ4JysP1J7R7+4yUotPoE
	3OH5gppmsUy/ofocAoRsJj2nYOD7xK4rJ6MjZYh23BsZB4v/SC310Z1z5X5txdNF0IqPPCie1y8
	BdU3lmIyX+KCD69OtLRywUR4GnyGTUopOVlyXFs5sEFJJKnedSFfWEt3d52A==
X-Gm-Gg: ATEYQzzfQSC5LVnfShIHmSFoi4tJZskLqcSysqVSrOItkYHFMEf4oC7OEZZY8ZVl/ED
	N70s61/I2+XJoZm+tlvr8sg+/REraagRKY49e5dMwqX1zNDpjUMjqaBSBDlrjqRtiPezVmO/oDh
	bwR0XDVVV68XUFNtyqW8Wy4ybuLBsfhgMA425gMbFTcHfNHJBneh1npck22UqSGbv0eQY5VFweG
	y9Sx5VmJ328J7jPHoBHtpI3q5+Eu4Nb16QxV0Egya3SVo7Z1Nc/KwqB6C95WV0pV7w=
X-Received: by 2002:a53:b743:0:b0:64c:9b84:92ee with SMTP id 956f58d0204a3-64cb6f438a9mr3821174d50.31.1772210830738;
        Fri, 27 Feb 2026 08:47:10 -0800 (PST)
X-Received: by 2002:a53:b743:0:b0:64c:9b84:92ee with SMTP id
 956f58d0204a3-64cb6f438a9mr3821130d50.31.1772210830102; Fri, 27 Feb 2026
 08:47:10 -0800 (PST)
MIME-Version: 1.0
References: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org> <20260226-iino-u64-v1-51-ccceff366db9@kernel.org>
In-Reply-To: <20260226-iino-u64-v1-51-ccceff366db9@kernel.org>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Fri, 27 Feb 2026 08:46:58 -0800
X-Gm-Features: AaiRm50sr0j0-BwzNnmwGRvH8jyB1wNkHgZo3vdp3K_4YIT1mBOH-BzuS2c5S3A
Message-ID: <CAKCV-6ujQK3yj8sB2eHafaw4pvrJUeK18Hu4vzvNSjH48RVgYg@mail.gmail.com>
Subject: Re: [PATCH 51/61] security: update audit format strings for u64 i_ino
To: Jeff Layton <jlayton@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox <willy@infradead.org>, Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.org>, Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, Steve French <sfrench@samba.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, Alexander Aring <alex.aring@gmail.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Viacheslav Dubeyko <slava@dubeyko.com>, Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, David Sterba <dsterba@suse.com>, Marc Dionne <marc.dionne@auristor.com>, Ian Kent <raven@themaw.net>, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>, Amir Goldstein <amir73il@gmail.com>, Christoph Hellwig <hch@infradead.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li <frank.li@vivo.com>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Dave Kleikamp <shaggy@kernel.org>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Miklos Szeredi <miklos@szeredi.hu>, Anders Larsen <al@alarsen.net>, Zhihao Cheng <chengzhihao1@huawei.com>, Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, John Johansen <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Casey Schaufler <casey@schaufler-ca.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, "Darrick J. Wong" <djwong@kernel.org>, 
 Martin Schiller <ms@dev.tdt.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, nvdimm@lists.linux.dev, fsverity@lists.linux.dev, linux-mm@kvack.org, netfs@lists.linux.dev, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, linux-nilfs@vger.kernel.org, v9fs@lists.linux.dev, linux-afs@lists.infradead.org, autofs@vger.kernel.org, ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org, linux-mtd@lists.infradead.org, jfs-discussion@lists.sourceforge.net, ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, linux-unionfs@vger.kernel.org, apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, selinux@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, netdev@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-fscrypt@vger.kernel.org, linux-xfs@vger.kernel.org, linux-hams@vger.kernel.org, linux-x25@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_084717_218544_80448668 
X-CRM114-Status: GOOD (  20.80  )
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

T24gVGh1LCBGZWIgMjYsIDIwMjYgYXQgOToxM+KAr0FNIEplZmYgTGF5dG9uIDxqbGF5dG9uQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gVXBkYXRlICVsdS8lbGQgdG8gJWxsdS8lbGxkIGluIHNlY3Vy
aXR5IGF1ZGl0IGxvZ2dpbmcgZnVuY3Rpb25zIHRoYXQKPiBwcmludCBpbm9kZS0+aV9pbm8sIHNp
bmNlIGlfaW5vIGlzIG5vdyB1NjQuCj4KPiBGaWxlcyB1cGRhdGVkOiBhcHBhcm1vci9hcHBhcm1v
cmZzLmMsIGludGVncml0eS9pbnRlZ3JpdHlfYXVkaXQuYywKPiBpcGUvYXVkaXQuYywgbHNtX2F1
ZGl0LmMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKZWZmIExheXRvbiA8amxheXRvbkBrZXJuZWwub3Jn
Pgo+IC0tLQo+ICBzZWN1cml0eS9hcHBhcm1vci9hcHBhcm1vcmZzLmMgICAgICAgfCAgNCArKy0t
Cj4gIHNlY3VyaXR5L2ludGVncml0eS9pbnRlZ3JpdHlfYXVkaXQuYyB8ICAyICstCj4gIHNlY3Vy
aXR5L2lwZS9hdWRpdC5jICAgICAgICAgICAgICAgICB8ICAyICstCj4gIHNlY3VyaXR5L2xzbV9h
dWRpdC5jICAgICAgICAgICAgICAgICB8IDEwICsrKysrLS0tLS0KPiAgc2VjdXJpdHkvc2VsaW51
eC9ob29rcy5jICAgICAgICAgICAgIHwgIDQgKystLQo+ICBzZWN1cml0eS9zbWFjay9zbWFja19s
c20uYyAgICAgICAgICAgfCAxMiArKysrKystLS0tLS0KPiAgNiBmaWxlcyBjaGFuZ2VkLCAxNyBp
bnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9zZWN1cml0eS9h
cHBhcm1vci9hcHBhcm1vcmZzLmMgYi9zZWN1cml0eS9hcHBhcm1vci9hcHBhcm1vcmZzLmMKPiBp
bmRleCAyZjg0YmQyM2VkYjY5ZTdlNjljYjA5N2U1NTQwOTFkZjAxMzI4MTZkLi43YjY0NWY0MGU3
MWM5NTZmMjE2ZmE2YTdkNjljM2VjZDRlMmE1ZmY0IDEwMDY0NAo+IC0tLSBhL3NlY3VyaXR5L2Fw
cGFybW9yL2FwcGFybW9yZnMuYwo+ICsrKyBiL3NlY3VyaXR5L2FwcGFybW9yL2FwcGFybW9yZnMu
Ywo+IEBAIC0xNDksNyArMTQ5LDcgQEAgc3RhdGljIGludCBhYWZzX2NvdW50Owo+Cj4gIHN0YXRp
YyBpbnQgYWFmc19zaG93X3BhdGgoc3RydWN0IHNlcV9maWxlICpzZXEsIHN0cnVjdCBkZW50cnkg
KmRlbnRyeSkKPiAgewo+IC0gICAgICAgc2VxX3ByaW50ZihzZXEsICIlczpbJWx1XSIsIEFBRlNf
TkFNRSwgZF9pbm9kZShkZW50cnkpLT5pX2lubyk7Cj4gKyAgICAgICBzZXFfcHJpbnRmKHNlcSwg
IiVzOlslbGx1XSIsIEFBRlNfTkFNRSwgZF9pbm9kZShkZW50cnkpLT5pX2lubyk7Cj4gICAgICAg
ICByZXR1cm4gMDsKPiAgfQo+Cj4gQEAgLTI2NDQsNyArMjY0NCw3IEBAIHN0YXRpYyBpbnQgcG9s
aWN5X3JlYWRsaW5rKHN0cnVjdCBkZW50cnkgKmRlbnRyeSwgY2hhciBfX3VzZXIgKmJ1ZmZlciwK
PiAgICAgICAgIGNoYXIgbmFtZVszMl07CgpJIGhhdmUgY29uZmlybWVkIHRoYXQgdGhlIGJ1ZmZl
ciBpcyBzdGlsbCBiaWcgZW5vdWdoIGZvciBhIDY0LWJpdCBpbm9kZSBudW1iZXIuCgo+ICAgICAg
ICAgaW50IHJlczsKPgo+IC0gICAgICAgcmVzID0gc25wcmludGYobmFtZSwgc2l6ZW9mKG5hbWUp
LCAiJXM6WyVsdV0iLCBBQUZTX05BTUUsCj4gKyAgICAgICByZXMgPSBzbnByaW50ZihuYW1lLCBz
aXplb2YobmFtZSksICIlczpbJWxsdV0iLCBBQUZTX05BTUUsCj4gICAgICAgICAgICAgICAgICAg
ICAgICBkX2lub2RlKGRlbnRyeSktPmlfaW5vKTsKPiAgICAgICAgIGlmIChyZXMgPiAwICYmIHJl
cyA8IHNpemVvZihuYW1lKSkKPiAgICAgICAgICAgICAgICAgcmVzID0gcmVhZGxpbmtfY29weShi
dWZmZXIsIGJ1ZmxlbiwgbmFtZSwgc3RybGVuKG5hbWUpKTsKCkZvciB0aGUgQXBwQXJtb3IgcG9y
dGlvbjoKClJldmlld2VkLUJ5OiBSeWFuIExlZSA8cnlhbi5sZWVAY2Fub25pY2FsLmNvbT4KCj4g
ZGlmZiAtLWdpdCBhL3NlY3VyaXR5L2ludGVncml0eS9pbnRlZ3JpdHlfYXVkaXQuYyBiL3NlY3Vy
aXR5L2ludGVncml0eS9pbnRlZ3JpdHlfYXVkaXQuYwo+IGluZGV4IDBlYzVlNGMyMmNiMmExMDY2
YzJiODk3Nzc2ZWFkNmQzZGI3MjYzNWMuLmQ4ZDllNWZmMWNkMjJiMDkxZjQ2MmQxZTgzZDI4ZDJk
NmJkOTgzZTkgMTAwNjQ0Cj4gLS0tIGEvc2VjdXJpdHkvaW50ZWdyaXR5L2ludGVncml0eV9hdWRp
dC5jCj4gKysrIGIvc2VjdXJpdHkvaW50ZWdyaXR5L2ludGVncml0eV9hdWRpdC5jCj4gQEAgLTYy
LDcgKzYyLDcgQEAgdm9pZCBpbnRlZ3JpdHlfYXVkaXRfbWVzc2FnZShpbnQgYXVkaXRfbXNnbm8s
IHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4gICAgICAgICBpZiAoaW5vZGUpIHsKPiAgICAgICAgICAg
ICAgICAgYXVkaXRfbG9nX2Zvcm1hdChhYiwgIiBkZXY9Iik7Cj4gICAgICAgICAgICAgICAgIGF1
ZGl0X2xvZ191bnRydXN0ZWRzdHJpbmcoYWIsIGlub2RlLT5pX3NiLT5zX2lkKTsKPiAtICAgICAg
ICAgICAgICAgYXVkaXRfbG9nX2Zvcm1hdChhYiwgIiBpbm89JWx1IiwgaW5vZGUtPmlfaW5vKTsK
PiArICAgICAgICAgICAgICAgYXVkaXRfbG9nX2Zvcm1hdChhYiwgIiBpbm89JWxsdSIsIGlub2Rl
LT5pX2lubyk7Cj4gICAgICAgICB9Cj4gICAgICAgICBhdWRpdF9sb2dfZm9ybWF0KGFiLCAiIHJl
cz0lZCBlcnJubz0lZCIsICFyZXN1bHQsIGVycm5vKTsKPiAgICAgICAgIGF1ZGl0X2xvZ19lbmQo
YWIpOwo+IGRpZmYgLS1naXQgYS9zZWN1cml0eS9pcGUvYXVkaXQuYyBiL3NlY3VyaXR5L2lwZS9h
dWRpdC5jCj4gaW5kZXggM2YwZGVlYjU0OTEyNzMwZDlhY2Y1ZTAyMWE0YTBjYjI5YTM0ZTk4Mi4u
OTNmYjU5ZmJkZGQ2MGI1NmMwYjIyYmUyYTM4YjgwOWVmOWUxOGI3NiAxMDA2NDQKPiAtLS0gYS9z
ZWN1cml0eS9pcGUvYXVkaXQuYwo+ICsrKyBiL3NlY3VyaXR5L2lwZS9hdWRpdC5jCj4gQEAgLTE1
Myw3ICsxNTMsNyBAQCB2b2lkIGlwZV9hdWRpdF9tYXRjaChjb25zdCBzdHJ1Y3QgaXBlX2V2YWxf
Y3R4ICpjb25zdCBjdHgsCj4gICAgICAgICAgICAgICAgIGlmIChpbm9kZSkgewo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGF1ZGl0X2xvZ19mb3JtYXQoYWIsICIgZGV2PSIpOwo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGF1ZGl0X2xvZ191bnRydXN0ZWRzdHJpbmcoYWIsIGlub2RlLT5pX3Ni
LT5zX2lkKTsKPiAtICAgICAgICAgICAgICAgICAgICAgICBhdWRpdF9sb2dfZm9ybWF0KGFiLCAi
IGlubz0lbHUiLCBpbm9kZS0+aV9pbm8pOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGF1ZGl0
X2xvZ19mb3JtYXQoYWIsICIgaW5vPSVsbHUiLCBpbm9kZS0+aV9pbm8pOwo+ICAgICAgICAgICAg
ICAgICB9IGVsc2Ugewo+ICAgICAgICAgICAgICAgICAgICAgICAgIGF1ZGl0X2xvZ19mb3JtYXQo
YWIsICIgZGV2PT8gaW5vPT8iKTsKPiAgICAgICAgICAgICAgICAgfQo+IGRpZmYgLS1naXQgYS9z
ZWN1cml0eS9sc21fYXVkaXQuYyBiL3NlY3VyaXR5L2xzbV9hdWRpdC5jCj4gaW5kZXggN2Q2MjNi
MDA0OTVjMTRiMDc5ZTEwZTk2M2MyMWE5Zjk0OWMxMWYwNy4uNzM3ZjVhMjYzYThmNzk0MTYxMzMz
MTVlZGYzNjNlY2UzZDc5YzcyMiAxMDA2NDQKPiAtLS0gYS9zZWN1cml0eS9sc21fYXVkaXQuYwo+
ICsrKyBiL3NlY3VyaXR5L2xzbV9hdWRpdC5jCj4gQEAgLTIwMiw3ICsyMDIsNyBAQCB2b2lkIGF1
ZGl0X2xvZ19sc21fZGF0YShzdHJ1Y3QgYXVkaXRfYnVmZmVyICphYiwKPiAgICAgICAgICAgICAg
ICAgaWYgKGlub2RlKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgYXVkaXRfbG9nX2Zvcm1h
dChhYiwgIiBkZXY9Iik7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgYXVkaXRfbG9nX3VudHJ1
c3RlZHN0cmluZyhhYiwgaW5vZGUtPmlfc2ItPnNfaWQpOwo+IC0gICAgICAgICAgICAgICAgICAg
ICAgIGF1ZGl0X2xvZ19mb3JtYXQoYWIsICIgaW5vPSVsdSIsIGlub2RlLT5pX2lubyk7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgYXVkaXRfbG9nX2Zvcm1hdChhYiwgIiBpbm89JWxsdSIsIGlu
b2RlLT5pX2lubyk7Cj4gICAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAgICAgYnJlYWs7
Cj4gICAgICAgICB9Cj4gQEAgLTIxNSw3ICsyMTUsNyBAQCB2b2lkIGF1ZGl0X2xvZ19sc21fZGF0
YShzdHJ1Y3QgYXVkaXRfYnVmZmVyICphYiwKPiAgICAgICAgICAgICAgICAgaWYgKGlub2RlKSB7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgYXVkaXRfbG9nX2Zvcm1hdChhYiwgIiBkZXY9Iik7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgYXVkaXRfbG9nX3VudHJ1c3RlZHN0cmluZyhhYiwg
aW5vZGUtPmlfc2ItPnNfaWQpOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIGF1ZGl0X2xvZ19m
b3JtYXQoYWIsICIgaW5vPSVsdSIsIGlub2RlLT5pX2lubyk7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgYXVkaXRfbG9nX2Zvcm1hdChhYiwgIiBpbm89JWxsdSIsIGlub2RlLT5pX2lubyk7Cj4g
ICAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICB9Cj4g
QEAgLTIyOCw3ICsyMjgsNyBAQCB2b2lkIGF1ZGl0X2xvZ19sc21fZGF0YShzdHJ1Y3QgYXVkaXRf
YnVmZmVyICphYiwKPiAgICAgICAgICAgICAgICAgaWYgKGlub2RlKSB7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgYXVkaXRfbG9nX2Zvcm1hdChhYiwgIiBkZXY9Iik7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgYXVkaXRfbG9nX3VudHJ1c3RlZHN0cmluZyhhYiwgaW5vZGUtPmlfc2ItPnNf
aWQpOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIGF1ZGl0X2xvZ19mb3JtYXQoYWIsICIgaW5v
PSVsdSIsIGlub2RlLT5pX2lubyk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgYXVkaXRfbG9n
X2Zvcm1hdChhYiwgIiBpbm89JWxsdSIsIGlub2RlLT5pX2lubyk7Cj4gICAgICAgICAgICAgICAg
IH0KPgo+ICAgICAgICAgICAgICAgICBhdWRpdF9sb2dfZm9ybWF0KGFiLCAiIGlvY3RsY21kPTB4
JWh4IiwgYS0+dS5vcC0+Y21kKTsKPiBAQCAtMjQ2LDcgKzI0Niw3IEBAIHZvaWQgYXVkaXRfbG9n
X2xzbV9kYXRhKHN0cnVjdCBhdWRpdF9idWZmZXIgKmFiLAo+ICAgICAgICAgICAgICAgICBpZiAo
aW5vZGUpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBhdWRpdF9sb2dfZm9ybWF0KGFiLCAi
IGRldj0iKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBhdWRpdF9sb2dfdW50cnVzdGVkc3Ry
aW5nKGFiLCBpbm9kZS0+aV9zYi0+c19pZCk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgYXVk
aXRfbG9nX2Zvcm1hdChhYiwgIiBpbm89JWx1IiwgaW5vZGUtPmlfaW5vKTsKPiArICAgICAgICAg
ICAgICAgICAgICAgICBhdWRpdF9sb2dfZm9ybWF0KGFiLCAiIGlubz0lbGx1IiwgaW5vZGUtPmlf
aW5vKTsKPiAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAg
ICAgIH0KPiBAQCAtMjY1LDcgKzI2NSw3IEBAIHZvaWQgYXVkaXRfbG9nX2xzbV9kYXRhKHN0cnVj
dCBhdWRpdF9idWZmZXIgKmFiLAo+ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAg
IGF1ZGl0X2xvZ19mb3JtYXQoYWIsICIgZGV2PSIpOwo+ICAgICAgICAgICAgICAgICBhdWRpdF9s
b2dfdW50cnVzdGVkc3RyaW5nKGFiLCBpbm9kZS0+aV9zYi0+c19pZCk7Cj4gLSAgICAgICAgICAg
ICAgIGF1ZGl0X2xvZ19mb3JtYXQoYWIsICIgaW5vPSVsdSIsIGlub2RlLT5pX2lubyk7Cj4gKyAg
ICAgICAgICAgICAgIGF1ZGl0X2xvZ19mb3JtYXQoYWIsICIgaW5vPSVsbHUiLCBpbm9kZS0+aV9p
bm8pOwo+ICAgICAgICAgICAgICAgICByY3VfcmVhZF91bmxvY2soKTsKPiAgICAgICAgICAgICAg
ICAgYnJlYWs7Cj4gICAgICAgICB9Cj4gZGlmZiAtLWdpdCBhL3NlY3VyaXR5L3NlbGludXgvaG9v
a3MuYyBiL3NlY3VyaXR5L3NlbGludXgvaG9va3MuYwo+IGluZGV4IGQ4MjI0ZWExMTNkMWFjMjcz
YWFjMWZiNTIzMjRmMDBiMzMwMWFlNzUuLjE1MGVhODZlYmMxZjdjN2Y4MzkxYWY0MTA5YTNkYTgy
YjEyZDAwZDIgMTAwNjQ0Cj4gLS0tIGEvc2VjdXJpdHkvc2VsaW51eC9ob29rcy5jCj4gKysrIGIv
c2VjdXJpdHkvc2VsaW51eC9ob29rcy5jCj4gQEAgLTE0MDAsNyArMTQwMCw3IEBAIHN0YXRpYyBp
bnQgaW5vZGVfZG9pbml0X3VzZV94YXR0cihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZGVu
dHJ5ICpkZW50cnksCj4gICAgICAgICBpZiAocmMgPCAwKSB7Cj4gICAgICAgICAgICAgICAgIGtm
cmVlKGNvbnRleHQpOwo+ICAgICAgICAgICAgICAgICBpZiAocmMgIT0gLUVOT0RBVEEpIHsKPiAt
ICAgICAgICAgICAgICAgICAgICAgICBwcl93YXJuKCJTRUxpbnV4OiAlczogIGdldHhhdHRyIHJl
dHVybmVkICVkIGZvciBkZXY9JXMgaW5vPSVsZFxuIiwKPiArICAgICAgICAgICAgICAgICAgICAg
ICBwcl93YXJuKCJTRUxpbnV4OiAlczogIGdldHhhdHRyIHJldHVybmVkICVkIGZvciBkZXY9JXMg
aW5vPSVsbGRcbiIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywg
LXJjLCBpbm9kZS0+aV9zYi0+c19pZCwgaW5vZGUtPmlfaW5vKTsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gcmM7Cj4gICAgICAgICAgICAgICAgIH0KPiBAQCAtMzQ3Nyw3ICszNDc3
LDcgQEAgc3RhdGljIHZvaWQgc2VsaW51eF9pbm9kZV9wb3N0X3NldHhhdHRyKHN0cnVjdCBkZW50
cnkgKmRlbnRyeSwgY29uc3QgY2hhciAqbmFtZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgJm5ld3NpZCk7Cj4gICAgICAgICBpZiAocmMpIHsKPiAgICAgICAg
ICAgICAgICAgcHJfZXJyKCJTRUxpbnV4OiAgdW5hYmxlIHRvIG1hcCBjb250ZXh0IHRvIFNJRCIK
PiAtICAgICAgICAgICAgICAgICAgICAgICJmb3IgKCVzLCAlbHUpLCByYz0lZFxuIiwKPiArICAg
ICAgICAgICAgICAgICAgICAgICJmb3IgKCVzLCAlbGx1KSwgcmM9JWRcbiIsCj4gICAgICAgICAg
ICAgICAgICAgICAgICBpbm9kZS0+aV9zYi0+c19pZCwgaW5vZGUtPmlfaW5vLCAtcmMpOwo+ICAg
ICAgICAgICAgICAgICByZXR1cm47Cj4gICAgICAgICB9Cj4gZGlmZiAtLWdpdCBhL3NlY3VyaXR5
L3NtYWNrL3NtYWNrX2xzbS5jIGIvc2VjdXJpdHkvc21hY2svc21hY2tfbHNtLmMKPiBpbmRleCA5
OGFmOWQ3Yjk0MzQ2OWQwZGRkMzQ0ZmM3OGMwYjg3Y2E0MGMxNmM0Li43ZTJmNTRjMTdhNWQ1Yzcw
NzQwYmJmYTkyYmE0ZDRmMWFjYTJjZjIyIDEwMDY0NAo+IC0tLSBhL3NlY3VyaXR5L3NtYWNrL3Nt
YWNrX2xzbS5jCj4gKysrIGIvc2VjdXJpdHkvc21hY2svc21hY2tfbHNtLmMKPiBAQCAtMTgyLDcg
KzE4Miw3IEBAIHN0YXRpYyBpbnQgc21rX2J1X2lub2RlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGlu
dCBtb2RlLCBpbnQgcmMpCj4gICAgICAgICBjaGFyIGFjY1tTTUtfTlVNX0FDQ0VTU19UWVBFICsg
MV07Cj4KPiAgICAgICAgIGlmIChpc3AtPnNta19mbGFncyAmIFNNS19JTk9ERV9JTVBVUkUpCj4g
LSAgICAgICAgICAgICAgIHByX2luZm8oIlNtYWNrIFVuY29uZmluZWQgQ29ycnVwdGlvbjogaW5v
ZGU9KCVzICVsZCkgJXNcbiIsCj4gKyAgICAgICAgICAgICAgIHByX2luZm8oIlNtYWNrIFVuY29u
ZmluZWQgQ29ycnVwdGlvbjogaW5vZGU9KCVzICVsbGQpICVzXG4iLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGlub2RlLT5pX3NiLT5zX2lkLCBpbm9kZS0+aV9pbm8sIGN1cnJlbnQtPmNvbW0p
Owo+Cj4gICAgICAgICBpZiAocmMgPD0gMCkKPiBAQCAtMTk1LDcgKzE5NSw3IEBAIHN0YXRpYyBp
bnQgc21rX2J1X2lub2RlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGludCBtb2RlLCBpbnQgcmMpCj4K
PiAgICAgICAgIHNta19idV9tb2RlKG1vZGUsIGFjYyk7Cj4KPiAtICAgICAgIHByX2luZm8oIlNt
YWNrICVzOiAoJXMgJXMgJXMpIGlub2RlPSglcyAlbGQpICVzXG4iLCBzbWtfYnVfbWVzc1tyY10s
Cj4gKyAgICAgICBwcl9pbmZvKCJTbWFjayAlczogKCVzICVzICVzKSBpbm9kZT0oJXMgJWxsZCkg
JXNcbiIsIHNta19idV9tZXNzW3JjXSwKPiAgICAgICAgICAgICAgICAgdHNwLT5zbWtfdGFzay0+
c21rX2tub3duLCBpc3AtPnNta19pbm9kZS0+c21rX2tub3duLCBhY2MsCj4gICAgICAgICAgICAg
ICAgIGlub2RlLT5pX3NiLT5zX2lkLCBpbm9kZS0+aV9pbm8sIGN1cnJlbnQtPmNvbW0pOwo+ICAg
ICAgICAgcmV0dXJuIDA7Cj4gQEAgLTIxNCw3ICsyMTQsNyBAQCBzdGF0aWMgaW50IHNta19idV9m
aWxlKHN0cnVjdCBmaWxlICpmaWxlLCBpbnQgbW9kZSwgaW50IHJjKQo+ICAgICAgICAgY2hhciBh
Y2NbU01LX05VTV9BQ0NFU1NfVFlQRSArIDFdOwo+Cj4gICAgICAgICBpZiAoaXNwLT5zbWtfZmxh
Z3MgJiBTTUtfSU5PREVfSU1QVVJFKQo+IC0gICAgICAgICAgICAgICBwcl9pbmZvKCJTbWFjayBV
bmNvbmZpbmVkIENvcnJ1cHRpb246IGlub2RlPSglcyAlbGQpICVzXG4iLAo+ICsgICAgICAgICAg
ICAgICBwcl9pbmZvKCJTbWFjayBVbmNvbmZpbmVkIENvcnJ1cHRpb246IGlub2RlPSglcyAlbGxk
KSAlc1xuIiwKPiAgICAgICAgICAgICAgICAgICAgICAgICBpbm9kZS0+aV9zYi0+c19pZCwgaW5v
ZGUtPmlfaW5vLCBjdXJyZW50LT5jb21tKTsKPgo+ICAgICAgICAgaWYgKHJjIDw9IDApCj4gQEAg
LTIyMyw3ICsyMjMsNyBAQCBzdGF0aWMgaW50IHNta19idV9maWxlKHN0cnVjdCBmaWxlICpmaWxl
LCBpbnQgbW9kZSwgaW50IHJjKQo+ICAgICAgICAgICAgICAgICByYyA9IDA7Cj4KPiAgICAgICAg
IHNta19idV9tb2RlKG1vZGUsIGFjYyk7Cj4gLSAgICAgICBwcl9pbmZvKCJTbWFjayAlczogKCVz
ICVzICVzKSBmaWxlPSglcyAlbGQgJXBEKSAlc1xuIiwgc21rX2J1X21lc3NbcmNdLAo+ICsgICAg
ICAgcHJfaW5mbygiU21hY2sgJXM6ICglcyAlcyAlcykgZmlsZT0oJXMgJWxsZCAlcEQpICVzXG4i
LCBzbWtfYnVfbWVzc1tyY10sCj4gICAgICAgICAgICAgICAgIHNza3AtPnNta19rbm93biwgc21r
X29mX2lub2RlKGlub2RlKS0+c21rX2tub3duLCBhY2MsCj4gICAgICAgICAgICAgICAgIGlub2Rl
LT5pX3NiLT5zX2lkLCBpbm9kZS0+aV9pbm8sIGZpbGUsCj4gICAgICAgICAgICAgICAgIGN1cnJl
bnQtPmNvbW0pOwo+IEBAIC0yNDQsNyArMjQ0LDcgQEAgc3RhdGljIGludCBzbWtfYnVfY3JlZGZp
bGUoY29uc3Qgc3RydWN0IGNyZWQgKmNyZWQsIHN0cnVjdCBmaWxlICpmaWxlLAo+ICAgICAgICAg
Y2hhciBhY2NbU01LX05VTV9BQ0NFU1NfVFlQRSArIDFdOwo+Cj4gICAgICAgICBpZiAoaXNwLT5z
bWtfZmxhZ3MgJiBTTUtfSU5PREVfSU1QVVJFKQo+IC0gICAgICAgICAgICAgICBwcl9pbmZvKCJT
bWFjayBVbmNvbmZpbmVkIENvcnJ1cHRpb246IGlub2RlPSglcyAlbGQpICVzXG4iLAo+ICsgICAg
ICAgICAgICAgICBwcl9pbmZvKCJTbWFjayBVbmNvbmZpbmVkIENvcnJ1cHRpb246IGlub2RlPSgl
cyAlbGxkKSAlc1xuIiwKPiAgICAgICAgICAgICAgICAgICAgICAgICBpbm9kZS0+aV9zYi0+c19p
ZCwgaW5vZGUtPmlfaW5vLCBjdXJyZW50LT5jb21tKTsKPgo+ICAgICAgICAgaWYgKHJjIDw9IDAp
Cj4gQEAgLTI1Myw3ICsyNTMsNyBAQCBzdGF0aWMgaW50IHNta19idV9jcmVkZmlsZShjb25zdCBz
dHJ1Y3QgY3JlZCAqY3JlZCwgc3RydWN0IGZpbGUgKmZpbGUsCj4gICAgICAgICAgICAgICAgIHJj
ID0gMDsKPgo+ICAgICAgICAgc21rX2J1X21vZGUobW9kZSwgYWNjKTsKPiAtICAgICAgIHByX2lu
Zm8oIlNtYWNrICVzOiAoJXMgJXMgJXMpIGZpbGU9KCVzICVsZCAlcEQpICVzXG4iLCBzbWtfYnVf
bWVzc1tyY10sCj4gKyAgICAgICBwcl9pbmZvKCJTbWFjayAlczogKCVzICVzICVzKSBmaWxlPSgl
cyAlbGxkICVwRCkgJXNcbiIsIHNta19idV9tZXNzW3JjXSwKPiAgICAgICAgICAgICAgICAgc3Nr
cC0+c21rX2tub3duLCBzbWtfb2ZfaW5vZGUoaW5vZGUpLT5zbWtfa25vd24sIGFjYywKPiAgICAg
ICAgICAgICAgICAgaW5vZGUtPmlfc2ItPnNfaWQsIGlub2RlLT5pX2lubywgZmlsZSwKPiAgICAg
ICAgICAgICAgICAgY3VycmVudC0+Y29tbSk7Cj4KPiAtLQo+IDIuNTMuMAo+Cj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
