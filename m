Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CA5EB364A
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2026 02:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u7WxYE9nmLadboaT4GFHtiIwdLpxDufx9pX1ZMzmxN8=; b=Qj8lGj74SE455h
	H7X16VT4y1JO5jEeoKqy7gnTymTAPHpTvP+Qzgs2bl5uu3R3aAp0CJgHpFqFm6lU515QEhJmYpHN3
	EZWaHTBZE3iglE/ise0Ya2fU1IdbS8UHxK8zY/FSfolFDMpL00R2DC86zVHbHczQC55RahQlb/ICf
	3xiJ0jWWe3bOX8TcpMdCl6N6yOgsjFi+PdESNf0vXezkGb9zuUKHXZPYV25LyNdVJDqUlELBz/GOJ
	sRzJDQUGyGQcAVMHdtj6EphTdtVBT53IcU9VuGjnK7R3nO24PbLsaDZfFoiHzlstTa/AWY/3EFjN6
	SAXCdE6BdPUF7a/6WQng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxFWn-0000000EPCJ-0cPb;
	Tue, 03 Mar 2026 02:30:29 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxFWi-0000000EPBT-3EoF
	for linux-mtd@lists.infradead.org;
	Tue, 03 Mar 2026 02:30:26 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c70378ddaafso3484797a12.3
        for <linux-mtd@lists.infradead.org>; Mon, 02 Mar 2026 18:30:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772505024; cv=none;
        d=google.com; s=arc-20240605;
        b=VkJR/ZMJ/wki5sKsOISqePwwpqbtTGhd2mbc6s1e3hWQ2cQyXhE6FLkXrgRTtbqtZL
         3vKYflxCJ0Ykgz5kPaGcCc9/eTpYTfZ+Gflw0ZGsoXEesfz3v/RisbD5wuHdvRg23oxq
         ORND5X4RJn9iR2obVlNjJtdBYbsEqwniDFXtAw6d4ADSAq2HsHu+U2mnHKzoL8UfanSj
         Pzcx7hOTxabb2OQNU4hJcOE7JYDY7RyRd0CPsD+I3PSEjvbYm4E4s+WT9sOLh7A2nIxa
         rEiCmZmF6cCZl2KdvEQeU1IzZwsBp6gRcI7symA+EU9oP8mCp6It0zihYeDT2ZhbNkZA
         +7wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VKlMqpEd7YBdXym1IpYpN4BFku3eaQLOirqfkrIT+SY=;
        fh=Xj0Nh2y0FQiZxCez1FvHleQiRWMz59yZWAK33EjHzu8=;
        b=cg0B+MNXuRPQHG0ioSSMfMaUR3KqFNVtNLI9MG24oOulTGERIKOBn105MIb2vmzEB5
         wZx/TGxLiphuDYuTLahNn4VZ335sw+9lSHdZxmsp8ypLXMgO45RRU9QbfzA6/oUEPWX4
         upEsTfEt+msGoOG5QzuoGLULrMN4Vz+A0rpsW3PDlndMqOg2KqG//BUHekgwjI02jqzL
         aFuIs/1QqLn1Qfl/vl8Ot3sqTjKtKZjSTP972UgtIRAUW19LadnKew9bPQ22k/RcsLxc
         M/KGTaCTFrXsdcdkpnmP5WcIFwT8BIxUk5w7Xa+/45KLo6rflH/FBmU2QPzmaTLnuabW
         W1bg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1772505024; x=1773109824; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKlMqpEd7YBdXym1IpYpN4BFku3eaQLOirqfkrIT+SY=;
        b=M3DqDp4IOHi1aotHBV5LERHYq70NvUTIu4z1K0dixkWalwBunu2UAOG36r3FngbKzf
         jSC/NmmNyRLMTG+eTkLPejM4Ul99Gdasawftm7dOD9ucJvrfKissOb1H9lGGbW16ziLd
         FGj4PuAdWb43h+1TDN4qCYfWtr5w2rjjcYVKqWmO2Y8aSk4c89YgPjbmKIZh64y5pB3x
         nys6kyEAYmq/rma0LQGJyZdzfYF9wTk4wcguSJnBfr8Wpn1KNxMxX5F+j2Hj7hu1rayG
         wFSK8Gc0rJF8ZstVGxZFL9ugrE6IJZDt0tka5ZWvkCKah8FWDiE8+TEpDknn/s2kLUCX
         Gmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772505024; x=1773109824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VKlMqpEd7YBdXym1IpYpN4BFku3eaQLOirqfkrIT+SY=;
        b=jVlRWTQxRc+WBwIyjSfSXo37MRrFRxlzUVF1FvxApBHh5M/XSQ7deltb848TZzbgEr
         1mVQ/XHLyEWRNg5QH6d+yFMmqZdxj6SWCeGWFBrdOhS/o6hs+H5lqsE2bCAbYfXs8r5v
         2bGg16eGuq5q9h01Y3C356qNh7X568BDX5t/xA8Y+43t1kPAx4d5iKe5tc3/LHcdJnLM
         lTEo7yOIJ79pZ439rMiijTBZ4SxHaD2ukraivm6kd+6F45+L+AyeNRLl0V6tBImLKFKN
         +S22MXmhP1P0YOkTIGK5Edz4yTDOQ8iNdnIJkqD9aXNVQSMcTzK1mdSjEzBGcJ1/lgv1
         rUcg==
X-Forwarded-Encrypted: i=1; AJvYcCVJP4Re4jPe/vKmQWX8TWLdndZHqAcwIO5Hah/5Dm8uJgopY/8V0hHx/bz8D9Xy0r0JqLk9KiIItOY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7jH5lJW8fgE5OOgiFBXli6i5JZMRXl4asMeOeA6+LJ7V3o71Z
	1T8wWTKsQ0aIR5S9wuR1sB8MzOmnjMfmFI5nPiWOF7fWIKpZEB4PO90mgSvslXHDf5zKNLKGQ3j
	zUAaOKmJnb0iVY3OjhMM4rk6dCUwQGydVlUHQR/qO
X-Gm-Gg: ATEYQzwZnvWGTy9mpReALNxJd2b/S0sF2BTCw8wVEMz0i+QG8ngW99JNNIC13HcSAye
	Z1jRYZ+QpYPV5q8jZ+57jDIh2BwVCh71mPUXmCCj4x2/N1z7uC1a0J8AWTLz5jdxYiyAKBU7a7M
	UinHCHQaqutLNBKDyOv0QPJjqMx2qu9pvUugsncuLU2vTVKXI+L4MqzfD3HXp65GW1D8cHi/T7y
	at8ToeCu+FLVz8DjVu8q1BKIWXpJrcpJOrSqUmtK48m+qHfbjYKpveElGOm+sducE+YBKIw2lpk
	c12hbRuz64Nd/gy8FQ==
X-Received: by 2002:a17:903:244a:b0:2ae:56f8:747b with SMTP id
 d9443c01a7336-2ae56f8786cmr37920855ad.57.1772505023451; Mon, 02 Mar 2026
 18:30:23 -0800 (PST)
MIME-Version: 1.0
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org> <20260302-iino-u64-v2-105-e5388800dae0@kernel.org>
In-Reply-To: <20260302-iino-u64-v2-105-e5388800dae0@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 2 Mar 2026 21:30:10 -0500
X-Gm-Features: AaiRm53tOqTCLn9NgvLgqwCOFo4xSyksjolr8ucn59RQ44Ck0r7mzGeRmSI5U0c
Message-ID: <CAHC9VhSHj7qc-tKxEN45bkfr+Dha59ihzOGiCO2WDYTYoB-LeA@mail.gmail.com>
Subject: Re: [PATCH v2 105/110] security: replace PRIino with %llu/%llx format strings
To: Jeff Layton <jlayton@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox <willy@infradead.org>, Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.org>, Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, Steve French <sfrench@samba.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, Alexander Aring <alex.aring@gmail.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Viacheslav Dubeyko <slava@dubeyko.com>, Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, David Sterba <dsterba@suse.com>, Marc Dionne <marc.dionne@auristor.com>, Ian Kent <raven@themaw.net>, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>, Amir Goldstein <amir73il@gmail.com>, Christoph Hellwig <hch@infradead.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li <frank.li@vivo.com>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Dave Kleikamp <shaggy@kernel.org>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Miklos Szeredi <miklos@szeredi.hu>, Anders Larsen <al@alarsen.net>, Zhihao Cheng <chengzhihao1@huawei.com>, Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, John Johansen <john.johansen@canonical.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Casey Schaufler <casey@schaufler-ca.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, "Darrick J. Wong" <djwong@kernel.org>, Martin Schiller <ms@dev.tdt.de>, Eric Paris <eparis@redhat.com>, Joerg Reuter <jreuter@yaina.de>, 
 Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Oliver Hartkopp <socketcan@hartkopp.net>, Marc Kleine-Budde <mkl@pengutronix.de>, David Ahern <dsahern@kernel.org>, Neal Cardwell <ncardwell@google.com>, Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, Remi Denis-Courmont <courmisch@gmail.com>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Xin Long <lucien.xin@gmail.com>, Magnus Karlsson <magnus.karlsson@intel.com>, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, nvdimm@lists.linux.dev, fsverity@lists.linux.dev, linux-mm@kvack.org, netfs@lists.linux.dev, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, linux-nilfs@vger.kernel.org, v9fs@lists.linux.dev, linux-afs@lists.infradead.org, autofs@vger.kernel.org, ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org, linux-mtd@lists.infradead.org, jfs-discussion@lists.sourceforge.net, ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, linux-unionfs@vger.kernel.org, apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, selinux@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, netdev@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-fscrypt@vger.kernel.org, linux-xfs@vger.kernel.org, linux-hams@vger.kernel.org, linux-x25@vger.kernel.org, audit@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-can@vger.kernel.org, linux-sctp@vger.kernel.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_183024_818682_FB83D721 
X-CRM114-Status: GOOD (  14.34  )
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

T24gTW9uLCBNYXIgMiwgMjAyNiBhdCAzOjUw4oCvUE0gSmVmZiBMYXl0b24gPGpsYXl0b25Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBOb3cgdGhhdCBpX2lubyBpcyB1NjQgYW5kIHRoZSBQUklpbm8g
Zm9ybWF0IG1hY3JvIGhhcyBiZWVuIHJlbW92ZWQsCj4gcmVwbGFjZSBhbGwgdXNlcyBpbiBzZWN1
cml0eSB3aXRoIHRoZSBjb25jcmV0ZSBmb3JtYXQgc3RyaW5ncy4KPgo+IFNpZ25lZC1vZmYtYnk6
IEplZmYgTGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIHNlY3VyaXR5L2FwcGFy
bW9yL2FwcGFybW9yZnMuYyAgICAgICB8ICA0ICsrLS0KPiAgc2VjdXJpdHkvaW50ZWdyaXR5L2lu
dGVncml0eV9hdWRpdC5jIHwgIDIgKy0KPiAgc2VjdXJpdHkvaXBlL2F1ZGl0LmMgICAgICAgICAg
ICAgICAgIHwgIDIgKy0KPiAgc2VjdXJpdHkvbHNtX2F1ZGl0LmMgICAgICAgICAgICAgICAgIHwg
MTAgKysrKystLS0tLQo+ICBzZWN1cml0eS9zZWxpbnV4L2hvb2tzLmMgICAgICAgICAgICAgfCAx
MCArKysrKy0tLS0tCj4gIHNlY3VyaXR5L3NtYWNrL3NtYWNrX2xzbS5jICAgICAgICAgICB8IDEy
ICsrKysrKy0tLS0tLQo+ICA2IGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDIwIGRl
bGV0aW9ucygtKQoKRm9yIHRoZSBMU00gZnJhbWV3b3JrIGFuZCBTRUxpbnV4IGNoYW5nZXMgLi4u
CgpBY2tlZC1ieTogUGF1bCBNb29yZSA8cGF1bEBwYXVsLW1vb3JlLmNvbT4gKExTTS9TRUxpbnV4
KQoKLS0gCnBhdWwtbW9vcmUuY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
