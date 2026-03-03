Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416EDEB3648
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2026 02:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jWWJeZpZXc/ywPd5dC10ICgxx7tREc8rLohFf8jQkg4=; b=iQBh8l/kkNxGlL
	0mCu/AgYAIX/keJ5VlvBoIl0SyN0/KbjYmAyzIQiS/EoPSYIIGBPvBf9/Fjw0Xh/QrfduN+Ndvzzd
	ldNbTUwhAhRAMHtNF1eS8QXEwkk3fyd1P1YSXm11LXZhTDAxbQWfL5uCgZgVlYVnk5T9tI4jhDFnq
	6BbXLhWTB8OaqiNxWV0faBT0YD6XEP4PxdeKZHEGFpZ6WsJunybqnRn5ZZgmcG2SrWv0lgwr2DFT5
	KwGQl/RmRe6x7IW2p7yeHOmYvFdnFQKgQSmT3IDgArqRqURhPbACD3EQDvvDv6ynllttpt0IoBn6L
	KnEaj484IjJ8pcpozIaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxFUw-0000000EOpm-2a1p;
	Tue, 03 Mar 2026 02:28:34 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxFUs-0000000EOp0-3VUf
	for linux-mtd@lists.infradead.org;
	Tue, 03 Mar 2026 02:28:32 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-35990245493so968941a91.2
        for <linux-mtd@lists.infradead.org>; Mon, 02 Mar 2026 18:28:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772504909; cv=none;
        d=google.com; s=arc-20240605;
        b=RMwZt118nyBjXUoT1z/AmLjCTvcFf2xdhxjrglMXeJjfS5Yu3vxGgvewEWJC4RDRpK
         T1GjT0bKO5urjm1FPpi5ZMOteJ3GA9SD4JlI/Jn4+KBUWJpKTosonU7Rl5pUHoBhpB5G
         VLeCtr1m/o/MUFqPto++txrq2tMmrsVKOIzezpsKv7VSyMeZKvTOk7rpFxVO6aWmU0B7
         m9RsiNjTJm4Ea7Bs6vTkKlCQaHqPmRc+KLH8sJocb1wHa8lHl+fU1ZdbAvGp4zR1zMY7
         nvLc49PmZDL/JOoFla20ekSjwB8SFNfity1c9KMAav7TxwJfh/D2xLhKZpb5wQk4Xpwb
         3Y7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C1bg6xiI4y6+7k2tjKhPvGRGK3TFDQKnfwBJ+EjIYKA=;
        fh=jLNod7gjiGrxUdNVW3Xs3NFIF75hrjUxssgasBUJy7U=;
        b=kQtQvJ0C8lv6So60BmqYwt2uWGskrMy6QUl+mdxBs1Dwm3FigwlkhQiuDGYY1cuVzI
         71f7YS+GmNZkN6igPZ03Lkpzg7b5ZxmByUKK9TdWTQwBU6lkTy7SdritmVL+i4e8HuwC
         EkGwRyV8jRkQz9T4ymOBgMiS96MeJoAm7jLWmIl5748ap6+oLg84YAhacUq5rEvyKHuw
         ovOhM9eo8gcLWCr9NQzK55XLSowunOQGJhk5fAw7k9Iu1OrD4rByCT6mOflaz5OqkNue
         /HjiafPFinUs2xxIeTz/xYuQN/euDUMfAMVkE6fOTGfNau801ffXAvkU9vnyjIUhxWdx
         0KKA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1772504909; x=1773109709; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1bg6xiI4y6+7k2tjKhPvGRGK3TFDQKnfwBJ+EjIYKA=;
        b=O0Ufxz8oimoxJt3y9MDqlTpsfto0pIncRAYNPSYGBGkscw44/lx5MbJt5oxgsh402X
         Rs3edMAP+keyue0WisWPVqFz+KMibj0VB31Jb7HjgsgnTfqjrRItUYydq2TWbYTjZfyd
         Dv73U1TqmW2YCkLtHnegsLj/dRrgBP3U0r5VRpbmz7xEG5zB8nFm9FQ9+VWsAI6fwggX
         fpAerbowo/jKjTVNGIkMHru2qKpyMeJUY4VpKtjv0itQSGXpJTHPyynejG/1xSvmSsl8
         lU98u4b4xjyC67pDZKuynDMlm9ZXdx9MeKTBs7/4YnDe6dWDx5nyudgS6Bff2jFki16S
         9Trg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772504909; x=1773109709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C1bg6xiI4y6+7k2tjKhPvGRGK3TFDQKnfwBJ+EjIYKA=;
        b=slyt2CWd9pBu+1MN3JFGC1RNHZ9re7dLxomE33kuoCjvja7uLxNoXsPQ/Eno0G+KkC
         5NRdbsAJXNBuoaRW7D0ZWKqGOc3kodYbn+ymIYaVxxc6zJ4GpNGjp+2j6NQmlDxR9Pvm
         Z3Uiz61dcmmZ6x15A+rdH03FqW2ncNM5h/QO5F3Bhpq5h+A3F+CQcnPgd9JkKT10VqJ5
         dCs7iKahGpKNiNxPMzInRmgqs7Fxr5lP0/bC38ZambgRKvvHG5KVAI0cMpsIsjqpuCJS
         wCWbf94bOwpA1kJtI2D8FcyzzfuKzYhJ9S8XA9kN/ZRkvSynRKOYzEtGHyWrRz0ERMIK
         K13w==
X-Forwarded-Encrypted: i=1; AJvYcCWSGsE8VYh5MyGH1pYKAuLt4dVfnsVDhzCEi6DJ5/w0jf7EDQgAK7MNG4VDFi7b+aK0KQyud2u0czk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdsoipUB+8P+7oLVhJv5Y20EjEzZg8hei7fWS6h4Pf876LaAbt
	H5etIz6Cae10gf1xwhrqHziNgAMv0ufo4E7cFpuG0t3rpkVKa7aM2/iPdR3TDNOMZDos/ICEHz2
	1hgSQZr6/N3pVm5I/Aw6BmpI1vPb8TwofEOkNJhDQ
X-Gm-Gg: ATEYQzwm/kFNq2ikMNHV3S8nW9HPk+HpqtaB6aoxiCAiAAx59NkZq/Z2Yw0Y0+HRhTa
	maSWwLUDpwsiibViHkElhoA9UEMRWrJW6dEFGqJmjGgTMyx+GbLDwCFNXN87tm2+4x8LCd5a3Ty
	lIauqVoWUBtl0hdSQ3zdgiyNCbbEiGYqlKRbu3FUZAIxMp3kI0ZPSzjBM9A4dPCJ8qFqUnnIXfW
	pRdzMp9EcvfttOMQQO8wPKOQ/NxDkcuzoIIb4kIbV2oqOJpqzM2gbetJ81b+vup0yBk2qptiAg4
	6gvIeUk=
X-Received: by 2002:a17:90a:7f93:b0:356:1db4:8fe5 with SMTP id
 98e67ed59e1d1-35965cc714fmr9453563a91.29.1772504909127; Mon, 02 Mar 2026
 18:28:29 -0800 (PST)
MIME-Version: 1.0
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org> <20260302-iino-u64-v2-49-e5388800dae0@kernel.org>
In-Reply-To: <20260302-iino-u64-v2-49-e5388800dae0@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 2 Mar 2026 21:28:17 -0500
X-Gm-Features: AaiRm53ToDAKLnqMzF7h_Rr5obeE3dnKPI4TQkaY52RSs5vb8oGyabc3Zmeif9I
Message-ID: <CAHC9VhRLAhMYL1ax3+LCeLLhnK0XGnvs0kGPGgHaptTaDynroA@mail.gmail.com>
Subject: Re: [PATCH v2 049/110] security: use PRIino format for i_ino
To: Jeff Layton <jlayton@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox <willy@infradead.org>, Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.org>, Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, Steve French <sfrench@samba.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, Alexander Aring <alex.aring@gmail.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Viacheslav Dubeyko <slava@dubeyko.com>, Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, David Sterba <dsterba@suse.com>, Marc Dionne <marc.dionne@auristor.com>, Ian Kent <raven@themaw.net>, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>, Amir Goldstein <amir73il@gmail.com>, Christoph Hellwig <hch@infradead.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li <frank.li@vivo.com>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Dave Kleikamp <shaggy@kernel.org>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Miklos Szeredi <miklos@szeredi.hu>, Anders Larsen <al@alarsen.net>, Zhihao Cheng <chengzhihao1@huawei.com>, Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, John Johansen <john.johansen@canonical.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Casey Schaufler <casey@schaufler-ca.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, "Darrick J. Wong" <djwong@kernel.org>, Martin Schiller <ms@dev.tdt.de>, Eric Paris <eparis@redhat.com>, Joerg Reuter <jreuter@yaina.de>, 
 Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Oliver Hartkopp <socketcan@hartkopp.net>, Marc Kleine-Budde <mkl@pengutronix.de>, David Ahern <dsahern@kernel.org>, Neal Cardwell <ncardwell@google.com>, Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, Remi Denis-Courmont <courmisch@gmail.com>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Xin Long <lucien.xin@gmail.com>, Magnus Karlsson <magnus.karlsson@intel.com>, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, nvdimm@lists.linux.dev, fsverity@lists.linux.dev, linux-mm@kvack.org, netfs@lists.linux.dev, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, linux-nilfs@vger.kernel.org, v9fs@lists.linux.dev, linux-afs@lists.infradead.org, autofs@vger.kernel.org, ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org, linux-mtd@lists.infradead.org, jfs-discussion@lists.sourceforge.net, ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, linux-unionfs@vger.kernel.org, apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, selinux@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, netdev@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-fscrypt@vger.kernel.org, linux-xfs@vger.kernel.org, linux-hams@vger.kernel.org, linux-x25@vger.kernel.org, audit@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-can@vger.kernel.org, linux-sctp@vger.kernel.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_182831_285731_872819F4 
X-CRM114-Status: GOOD (  15.52  )
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

T24gTW9uLCBNYXIgMiwgMjAyNiBhdCAzOjM24oCvUE0gSmVmZiBMYXl0b24gPGpsYXl0b25Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBDb252ZXJ0IHNlY3VyaXR5IGlfaW5vIGZvcm1hdCBzdHJpbmdz
IHRvIHVzZSB0aGUgUFJJaW5vIGZvcm1hdAo+IG1hY3JvIGluIHByZXBhcmF0aW9uIGZvciB0aGUg
d2lkZW5pbmcgb2YgaV9pbm8gdmlhIGtpbm9fdC4KPgo+IEFsc28gY29ycmVjdCBzaWduZWQgZm9y
bWF0IHNwZWNpZmllcnMgdG8gdW5zaWduZWQsIHNpbmNlIGlub2RlCj4gbnVtYmVycyBhcmUgdW5z
aWduZWQgdmFsdWVzLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmVmZiBMYXl0b24gPGpsYXl0b25Aa2Vy
bmVsLm9yZz4KPiAtLS0KPiAgc2VjdXJpdHkvYXBwYXJtb3IvYXBwYXJtb3Jmcy5jICAgICAgIHwg
IDQgKystLQo+ICBzZWN1cml0eS9pbnRlZ3JpdHkvaW50ZWdyaXR5X2F1ZGl0LmMgfCAgMiArLQo+
ICBzZWN1cml0eS9pcGUvYXVkaXQuYyAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICBzZWN1cml0
eS9sc21fYXVkaXQuYyAgICAgICAgICAgICAgICAgfCAxMCArKysrKy0tLS0tCj4gIHNlY3VyaXR5
L3NlbGludXgvaG9va3MuYyAgICAgICAgICAgICB8IDEwICsrKysrLS0tLS0KPiAgc2VjdXJpdHkv
c21hY2svc21hY2tfbHNtLmMgICAgICAgICAgIHwgMTIgKysrKysrLS0tLS0tCj4gIDYgZmlsZXMg
Y2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCgpObyBjb21tZW50IG9u
IHRoZSBQUklpbm8gc3BlY2lmaWVyLCBidXQgdGhlIExTTSBmcmFtZXdvcmsgYW5kIFNFTGludXgK
Y2hhbmdlcyBzZWVtIGNvbXBsZXRlLgoKQWNrZWQtYnk6IFBhdWwgTW9vcmUgPHBhdWxAcGF1bC1t
b29yZS5jb20+IChMU00vU0VMaW51eCkKCi0tIApwYXVsLW1vb3JlLmNvbQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
