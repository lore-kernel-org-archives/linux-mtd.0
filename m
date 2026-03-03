Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA929EDA694
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2026 16:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eu1HPgVFOPoVfOiZTLXJJC0m7wXgTm9cE/A2gkurGrA=; b=NbH3axwIeSVOXv
	ZVo8Akq/LvNcyy4wDTCZaWGemc9ISBufBNZ9S1oq1LcnwNYulm+UwDYK9iRqjPuaNu3A58CnD5K8V
	NoPeGjYStxzEKOV0lgmo5hhT9LJnq2rpIZB0G8O/Q3l9AmV/JZNxmMsArVzF4frcN3GP55I3Qh1Zl
	7X9Cywyf0Trr/dPWq+sOOBk9O/QuU9nOOoyVgqyElWkQN/8DHtapqXYnz3mn3FTNPSq9wyA7U20ls
	KZ1srn25bSvL7WvLG9xmab2i6q/17FR+WmskUZAhkBQd/fRf6SaSY2T6sZ2lIuI+laasAXsQmnZUZ
	psxWuvljNEpClSiJmWSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSRY-0000000FXt7-0b6T;
	Tue, 03 Mar 2026 16:17:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSRW-0000000FXs8-1mJc
	for linux-mtd@bombadil.infradead.org;
	Tue, 03 Mar 2026 16:17:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vlM0HTuT+/Lu8GovscjfA3KZuqms5GnXWRMciKBvDhQ=; b=mJTUWYt0HoyUZutmAFiBzIsVlA
	Ug2aQFWM2Xi00pA7ylqDCgJ1bbXI6vfX5Ac2XLcTwTuZPqy5a/qOT54hh2Fq9TDBHRQX+rhNLsv7h
	OK5a5WexaLXXM9lHTyul9LghdSMLJIxvS+X/k2YA1oAhC2Du9GM4FTQuOd8oeIzyyu+Z1dua/dL64
	UHKbnrlWgX64tMWODB7qUaDvR70H3QPlKHfZA5QZ8ynjENusrkPzeIGGixa2LS6WAW2vju6Xfw8TP
	BaXarDkcjyt6uuP/8j/JRuEuPm+YIhdl4ZBo+Quu4F62RY1W7T4z3y0mutcF2Al7fJtc7AT9Sy1f0
	8/+BO7UA==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSRT-00000002rxG-1sXj
	for linux-mtd@lists.infradead.org;
	Tue, 03 Mar 2026 16:17:53 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-82418b0178cso3394587b3a.1
        for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2026 08:17:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772554668; cv=none;
        d=google.com; s=arc-20240605;
        b=PbN8mrK/Vjil8pxO/dhlF/TL6XGi2msyr0HEPsCbvRMJShu6KWdJ4I/vNn2YcwFreM
         nnHG/gRGy2aDCqgWkMpVwBn2hz4VoqVjTXySlqEtKtVI+NR3t0z6JItwMFSlCLe11sDF
         44ISNFymCgOa0iLBYjiOa5XwOLOY8yFajIfuqLF/BD22LKJ2NbyckKSIBD61S9lzlA5K
         0p169vQA3dIEFQWEgjZZEl+1xsCm8uWWmrCyQtZa+sycI1uUKBkaWilk0BM8NpPKUQV3
         Cznc5n/TsEsyp/OcNYzEiOx40qhfIcik/Z4BaqQHB65MvAe6rYLZQ8I/LwBIBDFJjixn
         ZmhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vlM0HTuT+/Lu8GovscjfA3KZuqms5GnXWRMciKBvDhQ=;
        fh=UWUVfrp4wJmoOaKd6VgQLP1ndCcaJ5R2C0rxxk3NtQ0=;
        b=gGVEh+09Q17eZpUSCpdnrquGmEuobmTLmV0Q41uV4XVvBRX83a8ghPhDOUTwqB0GFv
         bR5uCSwidh8t2NoOH1E4AL9EyWrOWSfsQWDvd2yqRbj1G1O1oUpglikzWYtdWPdRc3Xv
         6G0Pjb6GXQZ6qjyXwvowGpzbeBcsErbzO5fIfhBtsl/1CBGNzaVPsnEHhR9LIMECLypL
         y+/tBtU2P1FkYx8O6Ewif5FhpH3325m4DFMX65riPfPE1gM8hR5/IwQK4WcWbTL3F4z4
         h0byE1gBfiizXYvZJFbmqicL0XUe5cucdTtUFdppDVBEaveib09jyjeqAVbExnuEsORe
         4IGA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1772554668; x=1773159468; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlM0HTuT+/Lu8GovscjfA3KZuqms5GnXWRMciKBvDhQ=;
        b=Ab7ZsGEMt+PzUaEmeYYpIdmSvHiK25w1rdHSIA6L1vwdjZvrgBQIp/KDetvnYnaSBG
         wuxQxUzP6HEyduBtwhcTKsJtKqMMpU/j4vbv6xyLNR3kiTs3OFEgF3BOaVJrZN6ASzUm
         MM06IXUOZGqlpvWjIRhQ9BKNod/8u3FgUNTzYK+phWpFIl22L8YQ/TGghCJb07c/Cb5A
         TKFboxX38+3RkUf9x4iatt5xeUcbImEwLSCKn3xUu9in4UmNEZVMwm7W/fFGkCVzMIEj
         Cu2aHuk2yhKQmB1jAIsrl/R9VlhUrCeZvrEkIZpF1O9Fa/JLGpcgMm+7bsVU9LEXM47o
         GPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772554668; x=1773159468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vlM0HTuT+/Lu8GovscjfA3KZuqms5GnXWRMciKBvDhQ=;
        b=YWte0M9mOk/NMday/OzUIf7s+VMAfLCp6V6xC//CeDHi3RH3DLvMaoIrtuxrnKrD2/
         4Y0hpVJFnIrd1RkSBB4CUJWXEWj+hVaAn9eqi40fuxe3n7dVbmX8JzfGg7RvuR6oX3OF
         av5QmUBBEegOTTT9R/eUZOvg9hWs13Gj42rT7xFFVMDr8BVTjGNu0m78s7cV+LQAWpR5
         8okbCoMPnHgVyKb3haAKmz45RBvZKdl6AiP8RlFbv+1Ai18/OOvRn/gkC2ZfV5RkOp6Z
         5KOTeLqTZrK29YZz0VhucSo8xaxBnra85E9nAlpIvGp/fyIuUDTzusnQX9hwGvGxT9DZ
         ssEw==
X-Forwarded-Encrypted: i=1; AJvYcCXmyqknVtfIuy0LbIjJEpSoa8bIGjUsCZ6ES8KROjX62PDKkLPNo0v9JV1lzkGzDfvjfaztHMLh4j4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwaTK+4AdXDlB/8syAKRIp5mAII/L4Iqz4IC3v+cJY49POfh/rP
	CuIIYvJ/9vTHPVYMcQ+1co7cGXOcyv6HKW656lG7AYTuHlg+izL2pLWabT4pRN+KJV8TcDZheb4
	MTILUGttvhd38HtwTtfeA2uMTI3urdqIik+yps696
X-Gm-Gg: ATEYQzz2ymZqkt0GA35uUwL3ZzA4m/a8HyuDfplcai1EW1NBn5We6s+9AvgvllNO5av
	ezgsf8Jp40DXIL5QSy2KRppR2t8SE2oYWJ3cEkcJpYBEJzZM+xCDGFhtMGKJZenLTyYnECF8GUj
	lkzPJYnE48dyZypnfjd9kadju6sJJICN1qbZacqiyhYLhxKPlmzftYLGeGX2mPWcFV6h3Q/uNfh
	YkPC7mN2+D7ULatqFSfTeFdqSDGcgMAkp9pt9nrwer8/kPee87G7QB8TDs7SW6o0AhXzVoICUGG
	ltXOMhI=
X-Received: by 2002:a17:90b:4c12:b0:359:8d70:c4e6 with SMTP id
 98e67ed59e1d1-3598d70c5admr5344309a91.1.1772554667658; Tue, 03 Mar 2026
 08:17:47 -0800 (PST)
MIME-Version: 1.0
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
 <20260302-iino-u64-v2-3-e5388800dae0@kernel.org> <CAHC9VhRnmBuXEKkUPQhJ_LDzcksjoAJL-ne6mFoJdR1hnDdzsg@mail.gmail.com>
 <7a0165fe39e82a1effd8cce5c2c4e82d6a42cb3a.camel@kernel.org>
 <CAHC9VhTyhnG7-ojnTnVdh_m1x=rKxw9YEH9g7Xp9m4F78aA5cA@mail.gmail.com> <add39953250a4a1b2fe2b09deb3373c2a7482b88.camel@kernel.org>
In-Reply-To: <add39953250a4a1b2fe2b09deb3373c2a7482b88.camel@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 3 Mar 2026 11:17:34 -0500
X-Gm-Features: AaiRm503AvilRZsmzje3hsLVwZQN2UeIDoaYrT0wwtgoCj-_LcRzyWRvZdGrFAo
Message-ID: <CAHC9VhSb3nAsJBxhqitDVQw=J8hX1CJDe1xqL-JMjOA5J4tUkw@mail.gmail.com>
Subject: Re: [PATCH v2 003/110] audit: widen ino fields to u64
To: Jeff Layton <jlayton@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox <willy@infradead.org>, Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.org>, Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, Steve French <sfrench@samba.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, Alexander Aring <alex.aring@gmail.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Viacheslav Dubeyko <slava@dubeyko.com>, Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, David Sterba <dsterba@suse.com>, Marc Dionne <marc.dionne@auristor.com>, Ian Kent <raven@themaw.net>, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>, Amir Goldstein <amir73il@gmail.com>, Christoph Hellwig <hch@infradead.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li <frank.li@vivo.com>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Dave Kleikamp <shaggy@kernel.org>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Miklos Szeredi <miklos@szeredi.hu>, Anders Larsen <al@alarsen.net>, Zhihao Cheng <chengzhihao1@huawei.com>, Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, John Johansen <john.johansen@canonical.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Casey Schaufler <casey@schaufler-ca.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, "Darrick J. Wong" <djwong@kernel.org>, Martin Schiller <ms@dev.tdt.de>, Eric Paris <eparis@redhat.com>, Joerg Reuter <jreuter@yaina.de>, 
 Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Oliver Hartkopp <socketcan@hartkopp.net>, Marc Kleine-Budde <mkl@pengutronix.de>, David Ahern <dsahern@kernel.org>, Neal Cardwell <ncardwell@google.com>, Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, Remi Denis-Courmont <courmisch@gmail.com>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Xin Long <lucien.xin@gmail.com>, Magnus Karlsson <magnus.karlsson@intel.com>, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, nvdimm@lists.linux.dev, fsverity@lists.linux.dev, linux-mm@kvack.org, netfs@lists.linux.dev, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, linux-nilfs@vger.kernel.org, v9fs@lists.linux.dev, linux-afs@lists.infradead.org, autofs@vger.kernel.org, ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org, linux-mtd@lists.infradead.org, jfs-discussion@lists.sourceforge.net, ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, linux-unionfs@vger.kernel.org, apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, selinux@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, netdev@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-fscrypt@vger.kernel.org, linux-xfs@vger.kernel.org, linux-hams@vger.kernel.org, linux-x25@vger.kernel.org, audit@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-can@vger.kernel.org, linux-sctp@vger.kernel.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_161751_746709_8961C41C 
X-CRM114-Status: GOOD (  36.75  )
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

T24gVHVlLCBNYXIgMywgMjAyNiBhdCAxMToxMuKAr0FNIEplZmYgTGF5dG9uIDxqbGF5dG9uQGtl
cm5lbC5vcmc+IHdyb3RlOgo+IE9uIFR1ZSwgMjAyNi0wMy0wMyBhdCAxMTowMyAtMDUwMCwgUGF1
bCBNb29yZSB3cm90ZToKPiA+IE9uIFR1ZSwgTWFyIDMsIDIwMjYgYXQgNjowNeKAr0FNIEplZmYg
TGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiBPbiBNb24sIDIwMjYtMDMt
MDIgYXQgMTg6NDQgLTA1MDAsIFBhdWwgTW9vcmUgd3JvdGU6Cj4gPiA+ID4gT24gTW9uLCBNYXIg
MiwgMjAyNiBhdCAzOjI14oCvUE0gSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gaW5vZGUtPmlfaW5vIGlzIGJlaW5nIHdpZGVuZWQgZnJv
bSB1bnNpZ25lZCBsb25nIHRvIHU2NC4gVGhlIGF1ZGl0Cj4gPiA+ID4gPiBzdWJzeXN0ZW0gdXNl
cyB1bnNpZ25lZCBsb25nIGlubyBpbiBzdHJ1Y3QgZmllbGRzLCBmdW5jdGlvbiBwYXJhbWV0ZXJz
LAo+ID4gPiA+ID4gYW5kIGxvY2FsIHZhcmlhYmxlcyB0aGF0IHN0b3JlIGlub2RlIG51bWJlcnMg
ZnJvbSBhcmJpdHJhcnkgZmlsZXN5c3RlbXMuCj4gPiA+ID4gPiBPbiAzMi1iaXQgcGxhdGZvcm1z
IHRoaXMgdHJ1bmNhdGVzIGlub2RlIG51bWJlcnMgdGhhdCBleGNlZWQgMzIgYml0cywKPiA+ID4g
PiA+IHdoaWNoIHdpbGwgY2F1c2UgaW5jb3JyZWN0IGF1ZGl0IGxvZyBlbnRyaWVzIGFuZCBicm9r
ZW4gd2F0Y2gvbWFyawo+ID4gPiA+ID4gY29tcGFyaXNvbnMuCj4gPiA+ID4gPgo+ID4gPiA+ID4g
V2lkZW4gYWxsIGF1ZGl0IGlubyBmaWVsZHMsIHBhcmFtZXRlcnMsIGFuZCBsb2NhbHMgdG8gdTY0
LCBhbmQgdXBkYXRlCj4gPiA+ID4gPiB0aGUgaW5vZGUgZm9ybWF0IHN0cmluZyBmcm9tICVsdSB0
byAlbGx1IHRvIG1hdGNoLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEplZmYg
TGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5vcmc+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICBpbmNs
dWRlL2xpbnV4L2F1ZGl0LmggICB8IDIgKy0KPiA+ID4gPiA+ICBrZXJuZWwvYXVkaXQuaCAgICAg
ICAgICB8IDkgKysrKy0tLS0tCj4gPiA+ID4gPiAga2VybmVsL2F1ZGl0X2Zzbm90aWZ5LmMgfCA0
ICsrLS0KPiA+ID4gPiA+ICBrZXJuZWwvYXVkaXRfd2F0Y2guYyAgICB8IDggKysrKy0tLS0KPiA+
ID4gPiA+ICBrZXJuZWwvYXVkaXRzYy5jICAgICAgICB8IDIgKy0KPiA+ID4gPiA+ICA1IGZpbGVz
IGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4gPiA+
ID4gV2Ugc2hvdWxkIGFsc28gdXBkYXRlIGF1ZGl0X2hhc2hfaW5vKCkgaW4ga2VybmVsL2F1ZGl0
LmguICBJdCBpcyBhCj4gPiA+ID4gKnZlcnkqIGJhc2ljIGhhc2ggZnVuY3Rpb24sIHNvIEkgdGhp
bmsgbGVhdmluZyB0aGUgZnVuY3Rpb24gYXMtaXMgYW5kCj4gPiA+ID4ganVzdCBjaGFuZ2luZyB0
aGUgaW5vZGUgcGFyYW1ldGVyIGZyb20gdTMyIHRvIHU2NCBzaG91bGQgYmUgZmluZS4KPiA+Cj4g
PiAuLi4KPiA+Cj4gPiA+IEl0IGRvZXNuJ3QgbG9vayBsaWtlIGNoYW5naW5nIHRoZSBhcmd1bWVu
dCB0eXBlIHdpbGwgbWFrZSBhbnkgbWF0ZXJpYWwKPiA+ID4gZGlmZmVyZW5jZS4gR2l2ZW4gdGhh
dCBpdCBzaG91bGQgc3RpbGwgd29yayB3aXRob3V0IHRoYXQgY2hhbmdlLCBjYW4gd2UKPiA+ID4g
bGVhdmUgdGhpcyBjbGVhbnVwIGZvciB5b3UgdG8gZG8gaW4gYSBmb2xsb3ctb24gcGF0Y2hzZXQ/
Cj4gPgo+ID4gSSB3b3VsZCBwcmVmZXIgaWYgeW91IG1hZGUgdGhlIGNoYW5nZSBhcyBwYXJ0IG9m
IHRoZSBwYXRjaCwgbWFpbmx5IHRvCj4gPiBrZWVwIGEgcGF0Y2ggcmVjb3JkIG9mIHRoaXMgYmVp
bmcgcmVsYXRlZC4KPgo+IE9rLCBJJ2xsIHNlZSBhYm91dCBmYWN0b3JpbmcgdGhhdCBpbi4KClRo
YW5rcy4KCj4gPiBJZGVhbGx5IEknZCByZWFsbHkgbGlrZSB0byBzZWUga2lub190IHVzZWQgaW4g
dGhlIGF1ZGl0IGNvZGUgaW5zdGVhZAo+ID4gb2YgdTY0LCBidXQgcGVyaGFwcyB0aGF0IGlzIGRv
bmUgaW4gYSBsYXRlciBwYXRjaCB0aGF0IEkgZGlkbid0IHNlZS4KPgo+IEkgdGhpbmsgSSBkaWRu
J3QgbWFrZSB0aGlzIGNsZWFyIGVub3VnaCBpbiB0aGUgY292ZXIgbGV0dGVyLCBidXQga2lub190
Cj4gaXMgcmVtb3ZlZCBhdCB0aGUgZW5kIG9mIHRoZSBzZXJpZXMuIEl0J3MganVzdCB0aGVyZSB0
byBzdXBwb3J0IHRoZQo+IGNoYW5nZSBkdXJpbmcgdGhlIGludGVyaW0uCgpBaCwgZ290Y2hhLCB0
aGFua3MgZm9yIHRoZSBlZHVjYXRpb24gOikKCj4gSWYgSENIIGdldHMgaGlzIHdheSB0byBkbyB0
aGUgY2hhbmdlcyBhcyBvbmUgYmlnIHBhdGNoLCBpdCdsbCBnbyBhd2F5Cj4gZW50aXJlbHkuCgot
LSAKcGF1bC1tb29yZS5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
