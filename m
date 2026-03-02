Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB664EB3640
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2026 23:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ggsMPPUtxRYlxpp4v7MOeYbb+wfYRxNnyYVNjGMqR4=; b=UOtXPPKCb7l+9P
	3WFDZAVHpWR3e8O5bfxLHuDDLOodF+7auCE+tUW3WokgwbVNmZwIWkbjZ3AiiMSxNKM2dIbA+Z6vo
	kpPcJvOk2JDFoJEQIvGV0GEQBB78gLSA+q6plr29FOCfOxpXfYRC84hvZCTS3imWa0H8+iCx4vJmv
	ZJ0/LQzCjItylotqftiiiAui+wiq0oImoLcfFX8kl5G+EbPVx/7TGJyjZWppFEi91M+xDty8Pr4LS
	N5W8iAqDoCvBtfwk97IXRZYTOZCgg5iw61BBBQy5reuxeZQSuPd4wo/KWh6zdn2qY6OFfwe+09pZp
	48PC/yzVi6zTbClHkpgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCwl-0000000EDox-3eGy;
	Mon, 02 Mar 2026 23:45:07 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCwi-0000000EDo6-1Zbh
	for linux-mtd@lists.infradead.org;
	Mon, 02 Mar 2026 23:45:06 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-359863611faso746720a91.3
        for <linux-mtd@lists.infradead.org>; Mon, 02 Mar 2026 15:45:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772495103; cv=none;
        d=google.com; s=arc-20240605;
        b=CwNmuaa+rqzkftJkKs7K5ij/izzd6lA6GPn15cE4jPWEJQ6HggoCdQDo6USNRJyMSG
         mBq+JoFm5mnlOWN5Rb3whXaYSiaXiq6kHC+QSVPM9qoyAM1xZR//POH0jRdQzdIT0JI0
         nzdg13ZGkBj0STzF9UummXPlYpxV1k3cmb7VXgpxwz0K5hsUgz8SXyFzht2HOwVmNy6u
         SBbYeouwIXFXhGPWLP2FxdPSWZxkOAiUS5INtIuH0mq8m83D3EmwPSoO5W/IQiXw5CVQ
         F5Ted3ow/Rfk7dAF3DdgEYtvxto0P1kqBmMfM2jhLwThTURP9wLx7Xr3bBvdNgbhb70U
         WCjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u082M2vpZx7MrZkmV/F7ZdAH+CJQSjxHglDjea1+awA=;
        fh=9pFI4dS/dpbMZcxV6nBILluGD9ROkwdBY5aZ+oUlTTk=;
        b=L9reMfsqDZtic1DXMlIlf1+WAMJTx1QD2h7o0thB2rDVy0h5OcRPStXLMlyk3SyEP1
         czh+SKgnLOpnnLPfEU/TyckrVgvXo+t/WutcjMQvjU6TqexCUen1ICI76OpXd/4OlOe/
         IzbDQvl3e+L36eXta/Nf1d7qyzVx3e9XgbU/w6JvwF+EPQZ1P0Gn2b2VDcRSLZLvqvp8
         Z+s2i4T+Ay5Z45lxt63QbRSh7jzOImG5wcnPssxWVfjU+sfbbWmiY9Z7gfb4oRxRqXwr
         g0QDqmriDxKgT+HCWl/1d84rSL4YhxnE7J7uLdgKIXy2i0h2uSkVO3NwmEfprcGAOOXH
         RVTg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1772495103; x=1773099903; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u082M2vpZx7MrZkmV/F7ZdAH+CJQSjxHglDjea1+awA=;
        b=E+Ts4y9IQslM6O7EQetDqY0VFhNqiHwEaujlwtngP1st/aQGRzOl03QocQm0W/hTJq
         2/YVaj2PLZNIFUHe1n3XTcpVKaTLvDwCrkf1KtD+V8xf9mqemtUr88F55luf8ggtzMHp
         qOEaFRCGLBKCTh9R+EtUgfHd9x/Qt+QSw7cowBqmsDLftnM2cUl1bqcfRR6K2Aro4WzC
         Wg5VQXTCusdef0NJHOfHe20H0GkoSZ2VmCUyfbJrHen3Pkkj1zzsoUxkRXWkP5VGBgLz
         LOGzEJ02Szcmq6NpzBkh515uC476vLf20YaqaHcar+Z+xMxdpox1HLaHywzJU6AaoLS2
         fGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772495103; x=1773099903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u082M2vpZx7MrZkmV/F7ZdAH+CJQSjxHglDjea1+awA=;
        b=t3fJlbI1ufjujPIgi6n2MNMvJ5KHQyhd8JYEJ0Pg6cJ/ARyPrFWekC17gKHnQkUaFB
         73BkkizSH30GRm0nKDPksnjjGe6SpCbwBJPwYodkOLceUtSPWSMa541zTzEKdUzNKh3C
         ep/MniMTb3f8XII1aq4PijHUWxySu2M3Q8Ox/F+Df5Hzljg8nrR4wQc/cGGEMU/KLiru
         PSuMXA7UzNYhat5FLJ6w7YIkboXX1Cf8chl82YGUrSzh9DgdqPUcVmgQ9FLrpBwrwrI5
         NEOtbW6Fef5A3b9HqzSMDsrSHxcLwO1adu1pPiH2BofzzG0eyu4GRuGB2ksoIY6EDzV8
         CEpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeKcpCBdv/dufLCdlxOjZgBf2Q8X2Lg/AAVIWdzSM2smg9XM5B4joSt22TwS03bNiNk8I23e8Vh1I=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1f53WtMRbSTmzfSeYNabYHcEeGCZZdx9uMn7+zH50BWfkgXBv
	9yp2gR7IDynMA7kmz/c5/jZH+3/R1lBOUCgKL1314ynhCsXa8h1z3z7Ip5uYzLArIfQZe0TPbTV
	ZS0JWdVx76LSAUZXHoAZDM15dTnXi0niJ1PmlebSR
X-Gm-Gg: ATEYQzxHAkQC+jmiwdl6IkWxmtk2n/I58Xl6vYcyKxsBhlQc6UUiB4hGU3XvfPg6Omb
	NHecdiqycUj53DnQ+y0mwGvSUUebZ3Vw3m7WQSTWav2l90PVyAXYNdebhP02fDm8ldmCnRfSPZB
	E/IHlM/XLRDy5PkmBVOPgwjwjNnrdlQrLqMXHNAbLfOzMUzb1DMBSO13wOwpt6dcRoU9tvJhbIg
	nAhCfu3SlqWDTTMHQ1ueKEWInUkvKZHlP/Ej72hg8ukxYIYCF62zV9qruMUr4hryEle7K3sIFs8
	pWgXmls=
X-Received: by 2002:a17:90b:578e:b0:356:2eff:df05 with SMTP id
 98e67ed59e1d1-35965c9d15dmr12730172a91.16.1772495102745; Mon, 02 Mar 2026
 15:45:02 -0800 (PST)
MIME-Version: 1.0
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org> <20260302-iino-u64-v2-3-e5388800dae0@kernel.org>
In-Reply-To: <20260302-iino-u64-v2-3-e5388800dae0@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 2 Mar 2026 18:44:51 -0500
X-Gm-Features: AaiRm51Sffi2V1GbWbKQK3xjBHaGrjaqO3h4_HvI_INFaL56ZEFyr07E1_3tePs
Message-ID: <CAHC9VhRnmBuXEKkUPQhJ_LDzcksjoAJL-ne6mFoJdR1hnDdzsg@mail.gmail.com>
Subject: Re: [PATCH v2 003/110] audit: widen ino fields to u64
To: Jeff Layton <jlayton@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox <willy@infradead.org>, Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.org>, Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, Steve French <sfrench@samba.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, Bharath SM <bharathsm@microsoft.com>, Alexander Aring <alex.aring@gmail.com>, Ryusuke Konishi <konishi.ryusuke@gmail.com>, Viacheslav Dubeyko <slava@dubeyko.com>, Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, David Sterba <dsterba@suse.com>, Marc Dionne <marc.dionne@auristor.com>, Ian Kent <raven@themaw.net>, Luis de Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>, "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>, Amir Goldstein <amir73il@gmail.com>, Christoph Hellwig <hch@infradead.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yangtao Li <frank.li@vivo.com>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Dave Kleikamp <shaggy@kernel.org>, Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Miklos Szeredi <miklos@szeredi.hu>, Anders Larsen <al@alarsen.net>, Zhihao Cheng <chengzhihao1@huawei.com>, Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, John Johansen <john.johansen@canonical.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Casey Schaufler <casey@schaufler-ca.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, "Darrick J. Wong" <djwong@kernel.org>, Martin Schiller <ms@dev.tdt.de>, Eric Paris <eparis@redhat.com>, Joerg Reuter <jreuter@yaina.de>, 
 Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Oliver Hartkopp <socketcan@hartkopp.net>, Marc Kleine-Budde <mkl@pengutronix.de>, David Ahern <dsahern@kernel.org>, Neal Cardwell <ncardwell@google.com>, Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, Remi Denis-Courmont <courmisch@gmail.com>, Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Xin Long <lucien.xin@gmail.com>, Magnus Karlsson <magnus.karlsson@intel.com>, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, nvdimm@lists.linux.dev, fsverity@lists.linux.dev, linux-mm@kvack.org, netfs@lists.linux.dev, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, linux-nilfs@vger.kernel.org, v9fs@lists.linux.dev, linux-afs@lists.infradead.org, autofs@vger.kernel.org, ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org, linux-mtd@lists.infradead.org, jfs-discussion@lists.sourceforge.net, ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, linux-unionfs@vger.kernel.org, apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, selinux@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, netdev@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-fscrypt@vger.kernel.org, linux-xfs@vger.kernel.org, linux-hams@vger.kernel.org, linux-x25@vger.kernel.org, audit@vger.kernel.org, linux-bluetooth@vger.kernel.org, linux-can@vger.kernel.org, linux-sctp@vger.kernel.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_154504_784180_96E853DD 
X-CRM114-Status: GOOD (  17.42  )
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

T24gTW9uLCBNYXIgMiwgMjAyNiBhdCAzOjI14oCvUE0gSmVmZiBMYXl0b24gPGpsYXl0b25Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBpbm9kZS0+aV9pbm8gaXMgYmVpbmcgd2lkZW5lZCBmcm9tIHVu
c2lnbmVkIGxvbmcgdG8gdTY0LiBUaGUgYXVkaXQKPiBzdWJzeXN0ZW0gdXNlcyB1bnNpZ25lZCBs
b25nIGlubyBpbiBzdHJ1Y3QgZmllbGRzLCBmdW5jdGlvbiBwYXJhbWV0ZXJzLAo+IGFuZCBsb2Nh
bCB2YXJpYWJsZXMgdGhhdCBzdG9yZSBpbm9kZSBudW1iZXJzIGZyb20gYXJiaXRyYXJ5IGZpbGVz
eXN0ZW1zLgo+IE9uIDMyLWJpdCBwbGF0Zm9ybXMgdGhpcyB0cnVuY2F0ZXMgaW5vZGUgbnVtYmVy
cyB0aGF0IGV4Y2VlZCAzMiBiaXRzLAo+IHdoaWNoIHdpbGwgY2F1c2UgaW5jb3JyZWN0IGF1ZGl0
IGxvZyBlbnRyaWVzIGFuZCBicm9rZW4gd2F0Y2gvbWFyawo+IGNvbXBhcmlzb25zLgo+Cj4gV2lk
ZW4gYWxsIGF1ZGl0IGlubyBmaWVsZHMsIHBhcmFtZXRlcnMsIGFuZCBsb2NhbHMgdG8gdTY0LCBh
bmQgdXBkYXRlCj4gdGhlIGlub2RlIGZvcm1hdCBzdHJpbmcgZnJvbSAlbHUgdG8gJWxsdSB0byBt
YXRjaC4KPgo+IFNpZ25lZC1vZmYtYnk6IEplZmYgTGF5dG9uIDxqbGF5dG9uQGtlcm5lbC5vcmc+
Cj4gLS0tCj4gIGluY2x1ZGUvbGludXgvYXVkaXQuaCAgIHwgMiArLQo+ICBrZXJuZWwvYXVkaXQu
aCAgICAgICAgICB8IDkgKysrKy0tLS0tCj4gIGtlcm5lbC9hdWRpdF9mc25vdGlmeS5jIHwgNCAr
Ky0tCj4gIGtlcm5lbC9hdWRpdF93YXRjaC5jICAgIHwgOCArKysrLS0tLQo+ICBrZXJuZWwvYXVk
aXRzYy5jICAgICAgICB8IDIgKy0KPiAgNSBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
LCAxMyBkZWxldGlvbnMoLSkKCldlIHNob3VsZCBhbHNvIHVwZGF0ZSBhdWRpdF9oYXNoX2lubygp
IGluIGtlcm5lbC9hdWRpdC5oLiAgSXQgaXMgYQoqdmVyeSogYmFzaWMgaGFzaCBmdW5jdGlvbiwg
c28gSSB0aGluayBsZWF2aW5nIHRoZSBmdW5jdGlvbiBhcy1pcyBhbmQKanVzdCBjaGFuZ2luZyB0
aGUgaW5vZGUgcGFyYW1ldGVyIGZyb20gdTMyIHRvIHU2NCBzaG91bGQgYmUgZmluZS4KCi0tIApw
YXVsLW1vb3JlLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
