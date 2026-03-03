Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BEAEDA697
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2026 16:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oipexpXR7VZFG8F7Wo1y7kz+99Bls+IpmGNKpQ37P8o=; b=4zlRKsGGeUZlnM
	NOwSErIoYgnbo2rI0rxedxqQL8OntY7gAR+l3YGTpeZsmNrnW/iULOnz8ow+cK+tgAHuHFjzLTw0p
	Fe54vOAqFGAnY+lMkn8+J4qj1L9V50sVLyfiVA8WZrtEbevT2lR/Xm3StttkdYNtRiNWe3FgLJYOW
	6kt90+FGF4MkGsi3w9xm3QbTEH9Mp8uoJW6m6hk4lRhW1pOnWt64Qho2DXBHewYy8aO5fkMXGOOlA
	Y+ePvOYhX4acKyfkACJuT4eveS0OFeCmpDE1EXPDVNWA4ulYF3O91SLvI+sH6d5FQFOQsbcj9Yviy
	r2DNY7UGjbr13YNZf+LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSDh-0000000FVd3-2yXn;
	Tue, 03 Mar 2026 16:03:37 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSDe-0000000FVat-0seK
	for linux-mtd@lists.infradead.org;
	Tue, 03 Mar 2026 16:03:36 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ae50a33ff8so19078825ad.3
        for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2026 08:03:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772553813; cv=none;
        d=google.com; s=arc-20240605;
        b=BDiTvkeMGHslNYj+a1IZWStdeWQYmi6V6PGHJcGwnDGMbBDePpZ6hhpJQPx1kT6Hgj
         B20TSM+MtE8oHcQs/JLpfC3S7gT4RXXyk1fCHaX9mrJaCIhiFWMtJZKc6S7XKMR7uqxW
         g09Ph6RERxLFstxDO7lzq4Bj8cn2OjJUNgOmpusnwVEhG3TNKGgC86WOgm6/YwYB776T
         1iLzYrpTlTW/wd4F6fYwukJkYstwoii3WnRPNj2CdyHjLweD3SG3QynIhLIg6/GwpFY9
         GsoA2kxxFd/p+wk1wCRAHHcB20FhOF542KJDFqAWW1eG+rloi2PiYmFqoiB9aXgxz9WN
         TjAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HCKOB8v5PMk665Bqff0+UwFdzmHKS9yVAUuIB18V7V4=;
        fh=jL17+8w+e1tPdJtTG6W7JvMKWgMn6Iv/vL3QBZySvis=;
        b=RT3hlUJaBulHsGC6iTLAZLz1SgQKhEpqCj2bGg3nHhI1IuMvtHy3ZPNd4ylJhF/3lN
         m6swv1fk1siPw5PimbO04hAUufmuh60FGECweEcIRzSrFrzmHunXRQfYmp8TBz4952Fi
         CjMo1xhbD0vNMF+xXx+cCreW06AyzxdcG/lKRz9C7OuldyBlD93qkfzIcaS1uDArzc7f
         qonyij64CJHyVgwiE3xDhMJEM924D6N73VB3mYi/rgC+uKjBFNty08iG5ml9VbyTWRsM
         6JT5L+J1JknIGERl+f2KfV6Z6e90DCBFQgm1ZRf963YI/9mjcceRmMLf4js6OaLx3VoU
         Oj2Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1772553813; x=1773158613; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCKOB8v5PMk665Bqff0+UwFdzmHKS9yVAUuIB18V7V4=;
        b=SXeOBwOWoSVIkEb9idZJXRK4FrBk9nS1YPJRcleD6rBo1ZYCEr7nFldOG7TBEUpNIt
         stXTL+FUXlVE8VZdGjCrCCKh1FHrTFcPd5PR9d97W1bIIVx0vl7M8z8IoQTiWBiYj5/4
         yHw00GGYc4dAirCnhejrcEYeiokcT6CYiC16K7avRR+jZkMM411Rkzdmz8sfC0YjkWVO
         7fjLtJgIpiFqDu1EOaf2c2qKwpU44TsZiTZKqvkf65B7x80zLvVgHf+fYp5x4leIr7EP
         Jae+hA4FAARrSu/xh43XA4WPf0sEJ9SCTwxTCElvLy51XrN8X911H79OqpWVCTJpu8Lh
         DPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772553813; x=1773158613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HCKOB8v5PMk665Bqff0+UwFdzmHKS9yVAUuIB18V7V4=;
        b=QarFyv8rSrcfbEVRYmL/U2t7CWThUn/cHd9K4HcVe2a5Wg0vljzQ9nXLaoihPTDLKQ
         8FEC0KjSt6mwh0yMwitq/r5QtPcgsQqsM6E2JoSXWJ9rXwwPTNFwDU/oGlp0wGKsnhNX
         PV2hkGKDTyyzdHaVuqhT/MQ2EcXn8bWQ8VBtfvHVpg74zRV6YEFSfDi49k1AvROftEKy
         TnkmvcK2wcUxCVmEBWAwLoBMusZ0wZPcfArQdPdiVonKCv7eJAf/onouXhwQ12CB2MF1
         r5fc2tpXjZ47gJIoTE/S/x5DNdsSeSLInFHoBFQU5hTtL/Bf2D9Z38ZxaicrT/G/wENV
         n83w==
X-Forwarded-Encrypted: i=1; AJvYcCWYmBmazLuoKXs9csgCLQr92CXQqhy2htbjlnYh8tIUMnIjmxH2oZkX3TcNcjHbCFI6jdgpxc+5hfg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzSlk7Vi04jBkkdaEADxNFyMX0VKrJfAkiY5FFSLnkDSpGQOs8P
	8ggRDa8FEbS7smqT09T/8vv8iggWMQW1fLRAYESSrZdDmjeq8+KsgHg9xIgYjV1/7khe0sEVHND
	E39XsBs8w3eMi/h1sPaUscJjSj17ETb8m2zyll5Wv
X-Gm-Gg: ATEYQzxS2W8siZmdAkvCcAUq9uwOZaQwq5zgc1oXNmvkiypW7NlnQPpxGmyA+qghHIu
	vK39IhKRx197iM9Ze+NspzLJWxN+95sRoF0bu356NqWHi0boTVKkKUy5a65qzi0ZBggmcuVy6sC
	1rQgNsBT8wg7XQeG5JdmdVuV66xDJFLehC1KSjQ+zgCElKhbaPtcxJjthH94Fv18z5r9lWXhk7k
	i2BLbuQWRcTXjyTXcJNFC87nltVoqqoQJmKOBUDeKTMRlGTP/WD9WbSnTji0jhcecEgrkImZUOm
	5lwuzc4=
X-Received: by 2002:a17:902:f60d:b0:2ae:6457:30b4 with SMTP id
 d9443c01a7336-2ae645735cdmr15498765ad.36.1772553812817; Tue, 03 Mar 2026
 08:03:32 -0800 (PST)
MIME-Version: 1.0
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
 <20260302-iino-u64-v2-3-e5388800dae0@kernel.org> <CAHC9VhRnmBuXEKkUPQhJ_LDzcksjoAJL-ne6mFoJdR1hnDdzsg@mail.gmail.com>
 <7a0165fe39e82a1effd8cce5c2c4e82d6a42cb3a.camel@kernel.org>
In-Reply-To: <7a0165fe39e82a1effd8cce5c2c4e82d6a42cb3a.camel@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 3 Mar 2026 11:03:20 -0500
X-Gm-Features: AaiRm51FwCY5Sd0470l_ykVC0rIb7qnpGdc7B1bNvF1bAK1vXw1y1CZQ64VgwhQ
Message-ID: <CAHC9VhTyhnG7-ojnTnVdh_m1x=rKxw9YEH9g7Xp9m4F78aA5cA@mail.gmail.com>
Subject: Re: [PATCH v2 003/110] audit: widen ino fields to u64
To: Jeff Layton <jlayton@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox <willy@infradead.org>, Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.org>, Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, Steve French <sfrench@samba.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, Alexander Aring <alex.aring@gmail.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Viacheslav Dubeyko <slava@dubeyko.com>, Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, David Sterba <dsterba@suse.com>, Marc Dionne <marc.dionne@auristor.com>, Ian Kent <raven@themaw.net>, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>, Amir Goldstein <amir73il@gmail.com>, Christoph Hellwig <hch@infradead.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li <frank.li@vivo.com>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Dave Kleikamp <shaggy@kernel.org>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Miklos Szeredi <miklos@szeredi.hu>, Anders Larsen <al@alarsen.net>, Zhihao Cheng <chengzhihao1@huawei.com>, Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, John Johansen <john.johansen@canonical.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Casey Schaufler <casey@schaufler-ca.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, "Darrick J. Wong" <djwong@kernel.org>, Martin Schiller <ms@dev.tdt.de>, Eric Paris <eparis@redhat.com>, Joerg Reuter <jreuter@yaina.de>, 
 Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Oliver Hartkopp <socketcan@hartkopp.net>, Marc Kleine-Budde <mkl@pengutronix.de>, David Ahern <dsahern@kernel.org>, Neal Cardwell <ncardwell@google.com>, Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, Remi Denis-Courmont <courmisch@gmail.com>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Xin Long <lucien.xin@gmail.com>, Magnus Karlsson <magnus.karlsson@intel.com>, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, nvdimm@lists.linux.dev, fsverity@lists.linux.dev, linux-mm@kvack.org, netfs@lists.linux.dev, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, linux-nilfs@vger.kernel.org, v9fs@lists.linux.dev, linux-afs@lists.infradead.org, autofs@vger.kernel.org, ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org, linux-mtd@lists.infradead.org, jfs-discussion@lists.sourceforge.net, ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, linux-unionfs@vger.kernel.org, apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, selinux@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, netdev@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-fscrypt@vger.kernel.org, linux-xfs@vger.kernel.org, linux-hams@vger.kernel.org, linux-x25@vger.kernel.org, audit@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-can@vger.kernel.org, linux-sctp@vger.kernel.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_080334_613043_D7FEA6F8 
X-CRM114-Status: GOOD (  29.20  )
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

T24gVHVlLCBNYXIgMywgMjAyNiBhdCA2OjA14oCvQU0gSmVmZiBMYXl0b24gPGpsYXl0b25Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gT24gTW9uLCAyMDI2LTAzLTAyIGF0IDE4OjQ0IC0wNTAwLCBQYXVs
IE1vb3JlIHdyb3RlOgo+ID4gT24gTW9uLCBNYXIgMiwgMjAyNiBhdCAzOjI14oCvUE0gSmVmZiBM
YXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IGlub2RlLT5pX2lu
byBpcyBiZWluZyB3aWRlbmVkIGZyb20gdW5zaWduZWQgbG9uZyB0byB1NjQuIFRoZSBhdWRpdAo+
ID4gPiBzdWJzeXN0ZW0gdXNlcyB1bnNpZ25lZCBsb25nIGlubyBpbiBzdHJ1Y3QgZmllbGRzLCBm
dW5jdGlvbiBwYXJhbWV0ZXJzLAo+ID4gPiBhbmQgbG9jYWwgdmFyaWFibGVzIHRoYXQgc3RvcmUg
aW5vZGUgbnVtYmVycyBmcm9tIGFyYml0cmFyeSBmaWxlc3lzdGVtcy4KPiA+ID4gT24gMzItYml0
IHBsYXRmb3JtcyB0aGlzIHRydW5jYXRlcyBpbm9kZSBudW1iZXJzIHRoYXQgZXhjZWVkIDMyIGJp
dHMsCj4gPiA+IHdoaWNoIHdpbGwgY2F1c2UgaW5jb3JyZWN0IGF1ZGl0IGxvZyBlbnRyaWVzIGFu
ZCBicm9rZW4gd2F0Y2gvbWFyawo+ID4gPiBjb21wYXJpc29ucy4KPiA+ID4KPiA+ID4gV2lkZW4g
YWxsIGF1ZGl0IGlubyBmaWVsZHMsIHBhcmFtZXRlcnMsIGFuZCBsb2NhbHMgdG8gdTY0LCBhbmQg
dXBkYXRlCj4gPiA+IHRoZSBpbm9kZSBmb3JtYXQgc3RyaW5nIGZyb20gJWx1IHRvICVsbHUgdG8g
bWF0Y2guCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEplZmYgTGF5dG9uIDxqbGF5dG9uQGtl
cm5lbC5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgaW5jbHVkZS9saW51eC9hdWRpdC5oICAgfCAyICst
Cj4gPiA+ICBrZXJuZWwvYXVkaXQuaCAgICAgICAgICB8IDkgKysrKy0tLS0tCj4gPiA+ICBrZXJu
ZWwvYXVkaXRfZnNub3RpZnkuYyB8IDQgKystLQo+ID4gPiAga2VybmVsL2F1ZGl0X3dhdGNoLmMg
ICAgfCA4ICsrKystLS0tCj4gPiA+ICBrZXJuZWwvYXVkaXRzYy5jICAgICAgICB8IDIgKy0KPiA+
ID4gIDUgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4g
Pgo+ID4gV2Ugc2hvdWxkIGFsc28gdXBkYXRlIGF1ZGl0X2hhc2hfaW5vKCkgaW4ga2VybmVsL2F1
ZGl0LmguICBJdCBpcyBhCj4gPiAqdmVyeSogYmFzaWMgaGFzaCBmdW5jdGlvbiwgc28gSSB0aGlu
ayBsZWF2aW5nIHRoZSBmdW5jdGlvbiBhcy1pcyBhbmQKPiA+IGp1c3QgY2hhbmdpbmcgdGhlIGlu
b2RlIHBhcmFtZXRlciBmcm9tIHUzMiB0byB1NjQgc2hvdWxkIGJlIGZpbmUuCgouLi4KCj4gSXQg
ZG9lc24ndCBsb29rIGxpa2UgY2hhbmdpbmcgdGhlIGFyZ3VtZW50IHR5cGUgd2lsbCBtYWtlIGFu
eSBtYXRlcmlhbAo+IGRpZmZlcmVuY2UuIEdpdmVuIHRoYXQgaXQgc2hvdWxkIHN0aWxsIHdvcmsg
d2l0aG91dCB0aGF0IGNoYW5nZSwgY2FuIHdlCj4gbGVhdmUgdGhpcyBjbGVhbnVwIGZvciB5b3Ug
dG8gZG8gaW4gYSBmb2xsb3ctb24gcGF0Y2hzZXQ/CgpJIHdvdWxkIHByZWZlciBpZiB5b3UgbWFk
ZSB0aGUgY2hhbmdlIGFzIHBhcnQgb2YgdGhlIHBhdGNoLCBtYWlubHkgdG8Ka2VlcCBhIHBhdGNo
IHJlY29yZCBvZiB0aGlzIGJlaW5nIHJlbGF0ZWQuCgpJZGVhbGx5IEknZCByZWFsbHkgbGlrZSB0
byBzZWUga2lub190IHVzZWQgaW4gdGhlIGF1ZGl0IGNvZGUgaW5zdGVhZApvZiB1NjQsIGJ1dCBw
ZXJoYXBzIHRoYXQgaXMgZG9uZSBpbiBhIGxhdGVyIHBhdGNoIHRoYXQgSSBkaWRuJ3Qgc2VlLgoK
LS0gCnBhdWwtbW9vcmUuY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
