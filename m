Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF14EF513E9
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Mar 2026 03:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hNQMG5SIBKh8aH/gVY4prUpXOz/0Jjw81s4fKWhAVtY=; b=etDEpTJEAp3oWP
	uhW67E/il5IQfN9lcKrlKLriu84S6TBsAP1sl+o2EKVptRJVsxEk3o4X954gJ8E0BNfCqa+35XYeC
	cNROLgU1UVw4h/F29RHJZ6KCWJ/L1WjcOD3O0ER1SWzaGqThU7EUgFzduXei/hWnyqlbxClFnX6Rc
	gHHILSU680epkDwWfkwDqj+5Vmg9MMh/o+OaB4pdA0kWVf6HeGccGovnNhf+cQo5Bz4/PjZC9xOSc
	kvyPi/YfErh3b+Hqu1hn/Z9xzb/1G+8Dtqg28bgk34/40U5YEMemPx6bGDUYLz/fIrH/NTTJwRYRy
	DYN9DF/jKmW7FNIkSiQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLZB-00000002vqy-2zgU;
	Fri, 06 Mar 2026 03:09:29 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyLZ8-00000002vpo-10wc
	for linux-mtd@lists.infradead.org;
	Fri, 06 Mar 2026 03:09:28 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3597b474cbdso3158008a91.1
        for <linux-mtd@lists.infradead.org>; Thu, 05 Mar 2026 19:09:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772766565; cv=none;
        d=google.com; s=arc-20240605;
        b=QvpcVgiw+IkBPYf7/N9nEe8bZPtxOFZ+mDa0eiba0zb9Zf5lF0bbcCXRjrR9sHdcOv
         h60ZedsDjfISb5bLQeMls3m9B6mL+tb5NVHeorzEvsB4+usHP3SKZWieayQ8IWJ1PTSV
         z1APqRb3KaOJxqBORKRIIrU4GKBTf7b3P+M7PIgMTxKkkOQlZ32f8JHSj6p6pM+ZzpBE
         LU6VfO/kHuEuA1M3FlDvM2qNchJGrDh8RJCjXsfPo9tzg2XhEPhVbq1itrTxeiM6ieIi
         E5I3D14CxxmUbslChIM7nFDyc6buD00YN6vLcohiSQuleQDdOX9eHsTBJbGxD9JkvKlp
         y2ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a2wyFmqtgQuSSxu/y1lHXpYQVnaUEjD/9HUkzSu97q4=;
        fh=YNC5wP0dWrILlF2DBzgMDGgb46efi/Ob8HD/hZjs20w=;
        b=AenewXMJqZhkgAoqvK/4FGll8Sg95RvbTUFN+8bwD4ADvY3U0/XOnK1jsudu7pAhv5
         ZXTyZ7nuk55i4Q84Y/O1soLE3a3LJgwUmpxJTDLac1vtjgoBQF42JDu7CyVJlyl++QuT
         XkonayAsMo7IF4ml21IKE/hnujD1FRrTUgvF4uxT47G1uEN+44KTnIHdfO4WhOW/aRaW
         FoX7rM1nLGsT+rYi8eCxPd4mcW00ul1j40bdPpo6GR2pZ3/GEvhmlEljein4Pc5FUGB2
         Kp4ONnmEhRN0EhoaPdLLMu/zpbXWme/4W9c8dsk2C57h6/GPwSkyjvc1Ksi3kR7tNAw8
         XPUw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1772766565; x=1773371365; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2wyFmqtgQuSSxu/y1lHXpYQVnaUEjD/9HUkzSu97q4=;
        b=bN0rS8CnXJllMeLq06zKIEO399UYMp5Y7l+oHtB+zcWLFiI30u3Jz4suXLkYTXhOh+
         b17rE5bIfkWjU2TFfZNgKuZhrR0sa8pT1v8VCipUiJBxM9yP9Gt+A5OLmaUNRiCYNLbo
         V3uy4Y0nLY1634LarGUHr47dBOJHw/E1LJ4hH8IxNwxUMGadKRhXuD2h3+NgNnQtx5fq
         j0zsDrtt8R6DPszICvaUNs+nb4p+HdkmYfKhIN32UQfwThJp9JzBOwHuHLq4IOOvjKnf
         nL9GMSbydvc8xoEROodoM3fOax62QJwi8LRuu8HN/+PVZCjnajPsplU47enU0+dLsPcF
         d08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772766565; x=1773371365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a2wyFmqtgQuSSxu/y1lHXpYQVnaUEjD/9HUkzSu97q4=;
        b=uqnDvHC8tRTlE4uLnmco7iL/Iie5oqhJqcR15cmPvhnUubQzzOy/J1ZvEvphLUQY4P
         TNrQZcGdPgb0+8E1gys2eiU/VnYqehcSn992WWQ6PnRySXgf2rh2a/4elAXWv6d5Nnvf
         akKOeIQDQs7UbfOL1jG7LTCMrj3Z8fIG2HE4iGoPEN63NuFL+pRLuZt4NJeHA/ysyavI
         o3SMRLAsVF6g0jHaauMGPI6s6GOf4VYsfWZ+zOyy5dfXDHdfXOWQBoSkPiUCnlXbAQ1A
         O1qH/cLPiMEa3zvOcyaxo3yn4bwNtehtwq6X+OAjR73eWxrodvUvLlUB4DtHgE11tiRC
         Fy6g==
X-Forwarded-Encrypted: i=1; AJvYcCV4wCwzyYMb4EOtj0LATsKT4ud6skxpOImFP5v2jDf0U7H9hdTDutl2h0abDSl1F9lSCcXA2Iwd5AA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzP0Pc6ywiPJ863uSxxl+YRLx1F+ns3iOoyLqwTTPxY3p7/YqPB
	tR3dWaM0vkS/kPFSUaMql2Nq9HswLIg4n3iiAJApe6xTpWVeNINp+SUVozovhmCpY6pivGnXZNJ
	mCbRiSCK98voFD7mYXGN7KpxC5hlGZq/WiX+UgUrR
X-Gm-Gg: ATEYQzy/ER+hEyNfEJVkVLJqrnegFFcmyoC9gbtfslQHUvNQu6aSlBrHzFGo/QhlKZD
	C5u/HB6w/TAWJG+fXHXdF/+Ykljd0Cu7ZxZn9PDdXeDtTQO+S/0LuRJWXfM+sLGBBjbljrjs04F
	uqyeCU7jVAu6W6F+V8CrB/oudXOEKxVLh6gktbaaR3Er5GdjFhQ6+JfH+oEcqMfPtp3LLl5gDhB
	ImL6oCBqB4y+8K0iiYTCZk+Y6nMOHjKbJjQ1eLfJzLDPz+5oMPg8caEY95zadH0mRdwZub4BVfK
	MseU+LU=
X-Received: by 2002:a17:90b:390a:b0:34c:35ce:3c5f with SMTP id
 98e67ed59e1d1-359be28da81mr585228a91.5.1772766564424; Thu, 05 Mar 2026
 19:09:24 -0800 (PST)
MIME-Version: 1.0
References: <20260304-iino-u64-v3-0-2257ad83d372@kernel.org> <20260304-iino-u64-v3-2-2257ad83d372@kernel.org>
In-Reply-To: <20260304-iino-u64-v3-2-2257ad83d372@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 5 Mar 2026 22:09:12 -0500
X-Gm-Features: AaiRm51A9fGFpauPslQfX6LBJuSyutri4HG-shh7wAOHtGm4QDzvXC5jtThE_pI
Message-ID: <CAHC9VhQix8opxrX--w-pw5vEAiLaYX=kPhnm4x+dEFEwHiVnfQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/12] audit: widen ino fields to u64
To: Jeff Layton <jlayton@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Dan Williams <dan.j.williams@intel.com>, Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.org>, Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, Steve French <sfrench@samba.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, Alexander Aring <alex.aring@gmail.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Viacheslav Dubeyko <slava@dubeyko.com>, Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, David Sterba <dsterba@suse.com>, Marc Dionne <marc.dionne@auristor.com>, Ian Kent <raven@themaw.net>, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>, Amir Goldstein <amir73il@gmail.com>, Christoph Hellwig <hch@infradead.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li <frank.li@vivo.com>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Dave Kleikamp <shaggy@kernel.org>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Miklos Szeredi <miklos@szeredi.hu>, Anders Larsen <al@alarsen.net>, Zhihao Cheng <chengzhihao1@huawei.com>, Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, John Johansen <john.johansen@canonical.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Casey Schaufler <casey@schaufler-ca.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, "Darrick J. Wong" <djwong@kernel.org>, Martin Schiller <ms@dev.tdt.de>, Eric Paris <eparis@redhat.com>, Joerg Reuter <jreuter@yaina.de>, 
 Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Oliver Hartkopp <socketcan@hartkopp.net>, Marc Kleine-Budde <mkl@pengutronix.de>, David Ahern <dsahern@kernel.org>, Neal Cardwell <ncardwell@google.com>, Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, Remi Denis-Courmont <courmisch@gmail.com>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Xin Long <lucien.xin@gmail.com>, Magnus Karlsson <magnus.karlsson@intel.com>, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, nvdimm@lists.linux.dev, fsverity@lists.linux.dev, linux-mm@kvack.org, netfs@lists.linux.dev, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, linux-nilfs@vger.kernel.org, v9fs@lists.linux.dev, linux-afs@lists.infradead.org, autofs@vger.kernel.org, ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org, linux-mtd@lists.infradead.org, jfs-discussion@lists.sourceforge.net, ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, linux-unionfs@vger.kernel.org, apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, selinux@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, netdev@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-fscrypt@vger.kernel.org, linux-xfs@vger.kernel.org, linux-hams@vger.kernel.org, linux-x25@vger.kernel.org, audit@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-can@vger.kernel.org, linux-sctp@vger.kernel.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_190926_721174_5FC64B03 
X-CRM114-Status: GOOD (  14.75  )
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

T24gV2VkLCBNYXIgNCwgMjAyNiBhdCAxMDozM+KAr0FNIEplZmYgTGF5dG9uIDxqbGF5dG9uQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gaW5vZGUtPmlfaW5vIGlzIGJlaW5nIHdpZGVuZWQgZnJvbSB1
bnNpZ25lZCBsb25nIHRvIHU2NC4gVGhlIGF1ZGl0Cj4gc3Vic3lzdGVtIHVzZXMgdW5zaWduZWQg
bG9uZyBpbm8gaW4gc3RydWN0IGZpZWxkcywgZnVuY3Rpb24gcGFyYW1ldGVycywKPiBhbmQgbG9j
YWwgdmFyaWFibGVzIHRoYXQgc3RvcmUgaW5vZGUgbnVtYmVycyBmcm9tIGFyYml0cmFyeSBmaWxl
c3lzdGVtcy4KPiBPbiAzMi1iaXQgcGxhdGZvcm1zIHRoaXMgdHJ1bmNhdGVzIGlub2RlIG51bWJl
cnMgdGhhdCBleGNlZWQgMzIgYml0cywKPiB3aGljaCB3aWxsIGNhdXNlIGluY29ycmVjdCBhdWRp
dCBsb2cgZW50cmllcyBhbmQgYnJva2VuIHdhdGNoL21hcmsKPiBjb21wYXJpc29ucy4KPgo+IFdp
ZGVuIGFsbCBhdWRpdCBpbm8gZmllbGRzLCBwYXJhbWV0ZXJzLCBhbmQgbG9jYWxzIHRvIHU2NCwg
YW5kIHVwZGF0ZQo+IHRoZSBpbm9kZSBmb3JtYXQgc3RyaW5nIGZyb20gJWx1IHRvICVsbHUgdG8g
bWF0Y2guCj4KPiBTaWduZWQtb2ZmLWJ5OiBKZWZmIExheXRvbiA8amxheXRvbkBrZXJuZWwub3Jn
Pgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L2F1ZGl0LmggICB8ICAyICstCj4gIGtlcm5lbC9hdWRp
dC5oICAgICAgICAgIHwgMTMgKysrKysrLS0tLS0tLQo+ICBrZXJuZWwvYXVkaXRfZnNub3RpZnku
YyB8ICA0ICsrLS0KPiAga2VybmVsL2F1ZGl0X3dhdGNoLmMgICAgfCAxMiArKysrKystLS0tLS0K
PiAga2VybmVsL2F1ZGl0c2MuYyAgICAgICAgfCAgNCArKy0tCj4gIDUgZmlsZXMgY2hhbmdlZCwg
MTcgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgpBY2tlZC1ieTogUGF1bCBNb29yZSA8
cGF1bEBwYXVsLW1vb3JlLmNvbT4KCi0tIApwYXVsLW1vb3JlLmNvbQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
