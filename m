Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EA3FB5E87
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2026 22:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZC8/NSjbSbSF10eALmw9ZBswaNvN6S45Y9cm0OQcJmA=; b=yewrt6FcsSlbLt
	byDBwMHLUwTPwZsY5YHayYScODu8r35lrRtKqfZIE477rATBha1mawLoidjuo7YY8hDk6haZwpwaD
	q0SKxNxd2dPamlkV2zSAchWPvvkXr4PNRZcCHVWgsZ9OYLwT2BlbwP9tT35LInhQdj46DZkfiF7r+
	PmMRQ7WuuBGKtvKSWRnFuMm4dmY1OF/xdr/99nxQRA7ziOx70vj/gF/XXNPRGJc6Gp6r7xYRF3fSR
	R599uYplhVs9jwCturMsWWZHgFjLYqEFgZusGxzKZwn3uQ2vxwpMyOEN5eH6mHpIO7PMrNnj1GjFY
	LGih9BfVt+FqoLgKk4zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2GuV-000000052a2-3gTs;
	Mon, 16 Mar 2026 22:59:43 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2GuS-000000052Yq-0LaL
	for linux-mtd@lists.infradead.org;
	Mon, 16 Mar 2026 22:59:42 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-5091ed02c54so96271cf.1
        for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2026 15:59:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773701978; cv=none;
        d=google.com; s=arc-20240605;
        b=ZF8qUDhkKR+w50iP6DvOl6OLzEbkevBCMPy/65Lhhm11FUra2BpCFOs7lheLIRkLcM
         nQPl6vb6BOELzOgXsAPzwrinSyv0UzadoXov3Ak+MF7KiXylFW4+P2erpr9KIVvQi0mt
         yTIENVfiIB5mKjHB0t884WeFbSRIpYA8ZvglmLRXWmI/iZaUksUz6pa0l3zHroqdRvxB
         qqg/TE0OGVoqLb4jKz83L2Ph4opjjZ/+tleLtpQNQoNmbu+tiiorwop3o0Bq1nbhZqHR
         eJpmx7N5VWChPss5J7NTaGl1rWzUnGGFpLkCwVOltbwoGLZDQ95x5wf40EjkSQ/hKiWy
         Izlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q4cJcFtf4hpm0T0e+VviEvUx2ruLtbnKyeEs5ldKrcs=;
        fh=LGiD5VOHICZ53/fnlrkru6f1cTULU7+ovUEE5z2nMPw=;
        b=RPZxFY3LJm/9gLN5dkawQ3+qNdLTvERuJBmRKUf0TN5vMO8p9TzW8YGJQkxJoM/ptW
         ojE5LTcvrnBkiPtdzEsJJaKJJplX8VpMI2EvvkFH3gVDCk5x9gxuc8s9E2lRzfdZ3IZx
         MrsPfamXILf0BZvUAxtRqzVx4GBMZCwFUUt3XUmXx2AUVtNHGB0AlF9cewxqa+yBsc9W
         oG+kb3u+WmcGvLdEIRzR6RUemLgjHeiNq3lzfWB6vU8ftrivCnPZ3UmpZve4zVl0nnfb
         FLjt4FEFZZXMfE+0JkB4qv4jdK0oauy1i67cxVZHhbAWY30zYQOosBtmLxGgu3k+dfT9
         Ajhw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773701978; x=1774306778; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4cJcFtf4hpm0T0e+VviEvUx2ruLtbnKyeEs5ldKrcs=;
        b=vjAvtFCGkaKr7obLoh7qGoNeI3vO7Yrfe40ep2KuF1yw3wBQh42Mmhc2HmBgXIORaA
         9UyFmBaLSlsAlZqI0MBCAq9BEFd8Ffdy97LK+YHxr9DSPcnz9SGdmWfRp9tI3hh+L6ln
         rq1bMH7j/vqNcUFXEz/rUUUjEFnEeImgnHpMhQvnkfzg5JyPGOSvwmsFdl5zMYk/6rTi
         0xQVSeJih/D2GQepR2o1uangl+9m7neRRPYUvj7rd3wsp6ixWdYcd/NZ7jezT9TAX5XF
         lO3adSfX+ypGWCnpfIGq5/7opt3gWb2L8hp/9f5txABVMZpkFF5BSDIj+We7WnxqKUyN
         kcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773701978; x=1774306778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q4cJcFtf4hpm0T0e+VviEvUx2ruLtbnKyeEs5ldKrcs=;
        b=eDjZ8xkIRwqs5n7fRFzpOzenm2NBeoHs4npYrZLSmLlqyWscSniUebI8re0b8QiMau
         89KqCQxu8jKPM8lJ6gQYQ2fJpTqrFVG1VtLJ/7IKK0RqICWRcBw8F+XstpS2VUH0CULL
         y6v74nuo9+myCL3g8a6CGD2wJIS0B0feIJfP8pRhvmwR7rYzwDBt4H1y8ygh3s24Oj/d
         K6hbnybReaFcCyCUXbF3Op0oKQIMIhSYQz2vPxqgvVIxsrtQCC2V9kJEjVg4rmAjA7rm
         nIz/zkQWcpxob2hCZGOldA6oDOD7xjWzqk78+aNTGlFeaoqFFcfpVp+uR1fsA2a7fR74
         3snw==
X-Forwarded-Encrypted: i=1; AJvYcCUOt8vpjUXO+eBcUHyqJoLC9WNxby0Fyz3syyrhWfr6V0rRoEBfSejz3TUJnf7RWp1crBarPqvmlg8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5aOnCkyv2W1MsQh4CgaV65uf8+dHOCXn2xMa5C0ZeCXqs582u
	7EqyGi7StepIcs3FEmaJ/C6AUjhpDyw/m65KmRXvD6Z4PcBCJoweaEPZLa+B9Bld2KdwzuUpHAC
	4oPlCBJd7eo3kBl5EVnsiyt9fKr862AM96G2EAjhw
X-Gm-Gg: ATEYQzyztJ3ziGGzJQJdTaSMugCBJPS9LtEBvOH0A34vijWGhlRYHIURnYgPbmPpz6v
	qyI1kP7bUVN5FYkPOQ7+NqCPUGlIHFvJLZkuN+8DlXGM5nbSAClwP/d/OWLoOmrwRTq+YnQ6rvH
	JLnd4aDQrQoplwxmRpl/WH59pQ//jmy/BEFpKi/TgIB20ZoR2Sbt7sSRi/rUrQ2tnLKgf7MVYnb
	QopRMz0vcYtsvFBTjqDAFOxNEN5pQ8Jdrtb/qsUv1T6ZEoTZVIVWudKndcOWqM+DMHUdFNDUnRu
	HbnYiVEBPneE4/OT
X-Received: by 2002:ac8:5e12:0:b0:4f3:54eb:f26e with SMTP id
 d75a77b69052e-5099ac78738mr2798501cf.1.1773701977490; Mon, 16 Mar 2026
 15:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773346620.git.ljs@kernel.org> <c5bb61cf789df1ecb32facc29df9749987c7ddfc.1773346620.git.ljs@kernel.org>
 <CAJuCfpGd702=Xop3X5Aop9rrScdiAOQEEooTu1gcJqR9pmO5GA@mail.gmail.com> <6a0e73a5-519e-49ca-9f76-2f6cc5a1577c@lucifer.local>
In-Reply-To: <6a0e73a5-519e-49ca-9f76-2f6cc5a1577c@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Mar 2026 15:59:26 -0700
X-Gm-Features: AaiRm5118TD3MF16DHCGoLHkzYMnffHjhVhwrz0uUgfCnERLy0ui_OLbleubf-w
Message-ID: <CAJuCfpEjTw1nQik_HWXHg2su2DwzPrn5NPGpeAVPrjJK0tOSkg@mail.gmail.com>
Subject: Re: [PATCH 02/15] mm: add documentation for the mmap_prepare file
 operation callback
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Bodo Stroesser <bostroesser@gmail.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, David Howells <dhowells@redhat.com>, 
	Marc Dionne <marc.dionne@auristor.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, David Hildenbrand <david@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	Ryan Roberts <ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_155940_148636_178162D3 
X-CRM114-Status: GOOD (  56.58  )
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

T24gTW9uLCBNYXIgMTYsIDIwMjYgYXQgMTI6MTfigK9QTSBMb3JlbnpvIFN0b2FrZXMgKE9yYWNs
ZSkKPGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFN1biwgTWFyIDE1LCAyMDI2IGF0IDA0
OjIzOjE0UE0gLTA3MDAsIFN1cmVuIEJhZ2hkYXNhcnlhbiB3cm90ZToKPiA+IE9uIFRodSwgTWFy
IDEyLCAyMDI2IGF0IDE6MjfigK9QTSBMb3JlbnpvIFN0b2FrZXMgKE9yYWNsZSkgPGxqc0BrZXJu
ZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gVGhpcyBkb2N1bWVudGF0aW9uIG1ha2VzIGl0IGVh
c2llciBmb3IgYSBkcml2ZXIvZmlsZSBzeXN0ZW0gaW1wbGVtZW50ZXIgdG8KPiA+ID4gY29ycmVj
dGx5IHVzZSB0aGlzIGNhbGxiYWNrLgo+ID4gPgo+ID4gPiBJdCBjb3ZlcnMgdGhlIGZ1bmRhbWVu
dGFscywgd2hpbHN0IGludGVudGlvbmFsbHkgbGVhdmluZyB0aGUgbGVzcyBsb3ZlbHkKPiA+ID4g
cG9zc2libGUgYWN0aW9ucyBvbmUgbWlnaHQgdGFrZSB1bmRvY3VtZW50ZWQgKGZvciBpbnN0YW5j
ZSAtIHRoZQo+ID4gPiBzdWNjZXNzX2hvb2ssIGVycm9yX2hvb2sgZmllbGRzIGluIG1tYXBfYWN0
aW9uKS4KPiA+ID4KPiA+ID4gVGhlIGRvY3VtZW50IGFsc28gY292ZXJzIHRoZSBuZXcgVk1BIGZs
YWdzIGltcGxlbWVudGF0aW9uIHdoaWNoIGlzIHRoZSBvbmx5Cj4gPiA+IG9uZSB3aGljaCB3aWxs
IHdvcmsgY29ycmVjdGx5IHdpdGggbW1hcF9wcmVwYXJlLgo+ID4gPgo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBMb3JlbnpvIFN0b2FrZXMgKE9yYWNsZSkgPGxqc0BrZXJuZWwub3JnPgo+ID4gPiAtLS0K
PiA+ID4gIERvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvbW1hcF9wcmVwYXJlLnJzdCB8IDEzMSAr
KysrKysrKysrKysrKysrKysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMzEgaW5zZXJ0aW9u
cygrKQo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMv
bW1hcF9wcmVwYXJlLnJzdAo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9m
aWxlc3lzdGVtcy9tbWFwX3ByZXBhcmUucnN0IGIvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9t
bWFwX3ByZXBhcmUucnN0Cj4gPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiA+IGluZGV4IDAw
MDAwMDAwMDAwMC4uNzY5MDgyMDBmM2ExCj4gPiA+IC0tLSAvZGV2L251bGwKPiA+ID4gKysrIGIv
RG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9tbWFwX3ByZXBhcmUucnN0Cj4gPiA+IEBAIC0wLDAg
KzEsMTMxIEBACj4gPiA+ICsuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ID4g
PiArCj4gPiA+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+ID4gK21tYXBfcHJlcGFy
ZSBjYWxsYmFjayBIT1dUTwo+ID4gPiArPT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gPiA+
ICsKPiA+ID4gK0ludHJvZHVjdGlvbgo+ID4gPiArIyMjIyMjIyMjIyMjCj4gPiA+ICsKPiA+ID4g
K1RoZSBgc3RydWN0IGZpbGUtPmZfb3AtPm1tYXAoKWAgY2FsbGJhY2sgaGFzIGJlZW4gZGVwcmVj
YXRlZCBhcyBpdCBpcyBib3RoIGEKPiA+ID4gK3N0YWJpbGl0eSBhbmQgc2VjdXJpdHkgcmlzaywg
YW5kIGRvZXNuJ3QgYWx3YXlzIHBlcm1pdCB0aGUgbWVyZ2luZyBvZiBhZGphY2VudAo+ID4gPiAr
bWFwcGluZ3MgcmVzdWx0aW5nIGluIHVubmVjZXNzYXJ5IG1lbW9yeSBmcmFnbWVudGF0aW9uLgo+
ID4gPiArCj4gPiA+ICtJdCBoYXMgYmVlbiByZXBsYWNlZCB3aXRoIHRoZSBgZmlsZS0+Zl9vcC0+
bW1hcF9wcmVwYXJlKClgIGNhbGxiYWNrIHdoaWNoIHNvbHZlcwo+ID4gPiArdGhlc2UgcHJvYmxl
bXMuCj4gPiA+ICsKPiA+ID4gKyMjIEhvdyBUbyBVc2UKPiA+ID4gKwo+ID4gPiArSW4geW91ciBk
cml2ZXIncyBgc3RydWN0IGZpbGVfb3BlcmF0aW9uc2Agc3RydWN0LCBzcGVjaWZ5IGFuIGBtbWFw
X3ByZXBhcmVgCj4gPiA+ICtjYWxsYmFjayByYXRoZXIgdGhhbiBhbiBgbW1hcGAgb25lLCBlLmcu
IGZvciBleHQ0Ogo+ID4gPiArCj4gPiA+ICsKPiA+ID4gKy4uIGNvZGUtYmxvY2s6OiBDCj4gPiA+
ICsKPiA+ID4gKyAgICBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGV4dDRfZmlsZV9vcGVy
YXRpb25zID0gewo+ID4gPiArICAgICAgICAuLi4KPiA+ID4gKyAgICAgICAgLm1tYXBfcHJlcGFy
ZSAgICA9IGV4dDRfZmlsZV9tbWFwX3ByZXBhcmUsCj4gPiA+ICsgICAgfTsKPiA+ID4gKwo+ID4g
PiArVGhpcyBoYXMgYSBzaWduYXR1cmUgb2YgYGludCAoKm1tYXBfcHJlcGFyZSkoc3RydWN0IHZt
X2FyZWFfZGVzYyAqKWAuCj4gPiA+ICsKPiA+ID4gK0V4YW1pbmluZyB0aGUgYHN0cnVjdCB2bV9h
cmVhX2Rlc2NgIHR5cGU6Cj4gPiA+ICsKPiA+ID4gKy4uIGNvZGUtYmxvY2s6OiBDCj4gPiA+ICsK
PiA+ID4gKyAgICBzdHJ1Y3Qgdm1fYXJlYV9kZXNjIHsKPiA+ID4gKyAgICAgICAgLyogSW1tdXRh
YmxlIHN0YXRlLiAqLwo+ID4gPiArICAgICAgICBjb25zdCBzdHJ1Y3QgbW1fc3RydWN0ICpjb25z
dCBtbTsKPiA+ID4gKyAgICAgICAgc3RydWN0IGZpbGUgKmNvbnN0IGZpbGU7IC8qIE1heSB2YXJ5
IGZyb20gdm1fZmlsZSBpbiBzdGFja2VkIGNhbGxlcnMuICovCj4gPiA+ICsgICAgICAgIHVuc2ln
bmVkIGxvbmcgc3RhcnQ7Cj4gPiA+ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgZW5kOwo+ID4gPiAr
Cj4gPiA+ICsgICAgICAgIC8qIE11dGFibGUgZmllbGRzLiBQb3B1bGF0ZWQgd2l0aCBpbml0aWFs
IHN0YXRlLiAqLwo+ID4gPiArICAgICAgICBwZ29mZl90IHBnb2ZmOwo+ID4gPiArICAgICAgICBz
dHJ1Y3QgZmlsZSAqdm1fZmlsZTsKPiA+ID4gKyAgICAgICAgdm1hX2ZsYWdzX3Qgdm1hX2ZsYWdz
Owo+ID4gPiArICAgICAgICBwZ3Byb3RfdCBwYWdlX3Byb3Q7Cj4gPiA+ICsKPiA+ID4gKyAgICAg
ICAgLyogV3JpdGUtb25seSBmaWVsZHMuICovCj4gPiA+ICsgICAgICAgIGNvbnN0IHN0cnVjdCB2
bV9vcGVyYXRpb25zX3N0cnVjdCAqdm1fb3BzOwo+ID4gPiArICAgICAgICB2b2lkICpwcml2YXRl
X2RhdGE7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgLyogVGFrZSBmdXJ0aGVyIGFjdGlvbj8gKi8K
PiA+ID4gKyAgICAgICAgc3RydWN0IG1tYXBfYWN0aW9uIGFjdGlvbjsKPiA+Cj4gPiBTbywgYWN0
aW9uIHN0aWxsIGJlbG9uZ3MgdG8gLyogV3JpdGUtb25seSBmaWVsZHMuICovIHNlY3Rpb24/IFRo
aXMgaXMKPiA+IG5pdHBpY2t5LCBidXQgaXQgbWlnaHQgYmUgYmV0dGVyIHRvIGhhdmUgdGhpcyBh
czoKPiA+Cj4gPiAgICAgICAgIC8qIFdyaXRlLW9ubHkgZmllbGRzLiAqLwo+ID4gICAgICAgICBj
b25zdCBzdHJ1Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3QgKnZtX29wczsKPiA+ICAgICAgICAgdm9p
ZCAqcHJpdmF0ZV9kYXRhOwo+ID4gICAgICAgICBzdHJ1Y3QgbW1hcF9hY3Rpb24gYWN0aW9uOyAv
KiBUYWtlIGZ1cnRoZXIgYWN0aW9uPyAqLwo+Cj4gQWJzb2x1dGVseSBub3QuIFRoaXMgZmllbGQg
aXMgbm90IHRvIGJlIHdyaXR0ZW4gdG8gYnkgdGhlIHVzZXIuCj4KPiBXZSBzYWRseSBoYXZlIHRv
IGFsbG93IGh1Z2V0bGIgdG8gZG8gc29tZSBoYWNrcywgYnV0IHRoZXNlIGFyZSB0aGluZ3Mgd2Ug
ZG9uJ3QKPiB3YW50IHRvIHBvaW50IG91dC4KCkFjay4KCj4KPiBVc2VycyBzaG91bGQgdXNlIG1t
YXBfYWN0aW9uX3h4eCgpIGZ1bmN0aW9ucy4KPgo+ID4KPiA+ID4gKyAgICB9Owo+ID4gPiArCj4g
PiA+ICtUaGlzIGlzIHN0cmFpZ2h0Zm9yd2FyZCAtIHlvdSBoYXZlIGFsbCB0aGUgZmllbGRzIHlv
dSBuZWVkIHRvIHNldCB1cCB0aGUKPiA+ID4gK21hcHBpbmcsIGFuZCB5b3UgY2FuIHVwZGF0ZSB0
aGUgbXV0YWJsZSBhbmQgd3JpdGFibGUgZmllbGRzLCBmb3IgaW5zdGFuY2U6Cj4gPiA+ICsKPiA+
ID4gKy4uIGNvZGUtYmxvY2s6OiBDdwo+ID4gPiArCj4gPiA+ICsgICAgc3RhdGljIGludCBleHQ0
X2ZpbGVfbW1hcF9wcmVwYXJlKHN0cnVjdCB2bV9hcmVhX2Rlc2MgKmRlc2MpCj4gPiA+ICsgICAg
ewo+ID4gPiArICAgICAgICBpbnQgcmV0Owo+ID4gPiArICAgICAgICBzdHJ1Y3QgZmlsZSAqZmls
ZSA9IGRlc2MtPmZpbGU7Cj4gPiA+ICsgICAgICAgIHN0cnVjdCBpbm9kZSAqaW5vZGUgPSBmaWxl
LT5mX21hcHBpbmctPmhvc3Q7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgLi4uCj4gPiA+ICsKPiA+
ID4gKyAgICAgICAgZmlsZV9hY2Nlc3NlZChmaWxlKTsKPiA+ID4gKyAgICAgICAgaWYgKElTX0RB
WChmaWxlX2lub2RlKGZpbGUpKSkgewo+ID4gPiArICAgICAgICAgICAgZGVzYy0+dm1fb3BzID0g
JmV4dDRfZGF4X3ZtX29wczsKPiA+ID4gKyAgICAgICAgICAgIHZtYV9kZXNjX3NldF9mbGFncyhk
ZXNjLCBWTUFfSFVHRVBBR0VfQklUKTsKPiA+ID4gKyAgICAgICAgfSBlbHNlIHsKPiA+ID4gKyAg
ICAgICAgICAgIGRlc2MtPnZtX29wcyA9ICZleHQ0X2ZpbGVfdm1fb3BzOwo+ID4gPiArICAgICAg
ICB9Cj4gPiA+ICsgICAgICAgIHJldHVybiAwOwo+ID4gPiArICAgIH0KPiA+ID4gKwo+ID4gPiAr
SW1wb3J0YW50bHksIHlvdSBubyBsb25nZXIgaGF2ZSB0byBkYW5jZSBhcm91bmQgd2l0aCByZWZl
cmVuY2UgY291bnRzIG9yIGxvY2tzCj4gPiA+ICt3aGVuIHVwZGF0aW5nIHRoZXNlIGZpZWxkcyAt
IF9feW91IGNhbiBzaW1wbHkgZ28gYWhlYWQgYW5kIGNoYW5nZSB0aGVtX18uCj4gPiA+ICsKPiA+
ID4gK0V2ZXJ5dGhpbmcgaXMgdGFrZW4gY2FyZSBvZiBieSB0aGUgbWFwcGluZyBjb2RlLgo+ID4g
PiArCj4gPiA+ICtWTUEgRmxhZ3MKPiA+ID4gKz09PT09PT09PQo+ID4gPiArCj4gPiA+ICtBbG9u
ZyB3aXRoIGBtbWFwX3ByZXBhcmVgLCBWTUEgZmxhZ3MgaGF2ZSB1bmRlcmdvbmUgYW4gb3Zlcmhh
dWwuIFdoZXJlIGJlZm9yZQo+ID4gPiAreW91IHdvdWxkIGludm9rZSBvbmUgb2YgYHZtX2ZsYWdz
X2luaXQoKWAsIGB2bV9mbGFnc19yZXNldCgpYCwgYHZtX2ZsYWdzX3NldCgpYCwKPiA+ID4gK2B2
bV9mbGFnc19jbGVhcigpYCwgYW5kIGB2bV9mbGFnc19tb2QoKWAgdG8gbW9kaWZ5IGZsYWdzIChh
bmQgdG8gaGF2ZSB0aGUKPiA+ID4gK2xvY2tpbmcgZG9uZSBjb3JyZWN0bHkgZm9yIHlvdSwgdGhp
cyBpcyBubyBsb25nZXIgbmVjZXNzYXJ5Lgo+ID4gPiArCj4gPiA+ICtBbHNvLCB0aGUgbGVnYWN5
IGFwcHJvYWNoIG9mIHNwZWNpZnlpbmcgVk1BIGZsYWdzIHZpYSBgVk1fUkVBRGAsIGBWTV9XUklU
RWAsCj4gPiA+ICtldGMuIC0gaS5lLiB1c2luZyBhIGBWTV94eHhgIG1hY3JvIGhhcyBjaGFuZ2Vk
IHRvby4KPiA+ID4gKwo+ID4gPiArV2hlbiBpbXBsZW1lbnRpbmcgYG1tYXBfcHJlcGFyZSgpYCwg
cmVmZXJlbmNlIGZsYWdzIGJ5IHRoZWlyIGJpdCBudW1iZXIsIGRlZmluZWQKPiA+ID4gK2FzIGEg
YFZNQV94eHhfQklUYCBtYWNybywgZS5nLiBgVk1BX1JFQURfQklUYCwgYFZNQV9XUklURV9CSVRg
IGV0Yy4sIGFuZCB1c2Ugb25lCj4gPiA+ICtvZiAod2hlcmUgYGRlc2NgIGlzIGEgcG9pbnRlciB0
byBgc3RydWN0IHZtYV9hcmVhX2Rlc2NgKToKPiA+ID4gKwo+ID4gPiArKiBgdm1hX2Rlc2NfdGVz
dF9mbGFncyhkZXNjLCAuLi4pYCAtIFNwZWNpZnkgYSBjb21tYS1zZXBhcmF0ZWQgbGlzdCBvZiBm
bGFncyB5b3UKPiA+ID4gKyAgd2lzaCB0byB0ZXN0IGZvciAod2hldGhlciBfYW55XyBhcmUgc2V0
KSwgZS5nLiAtIGB2bWFfZGVzY190ZXN0X2ZsYWdzKGRlc2MsCj4gPiA+ICsgIFZNQV9XUklURV9C
SVQsIFZNQV9NQVlXUklURV9CSVQpYCAtIHJldHVybnMgYHRydWVgIGlmIGVpdGhlciBhcmUgc2V0
LAo+ID4gPiArICBvdGhlcndpc2UgYGZhbHNlYC4KPiA+ID4gKyogYHZtYV9kZXNjX3NldF9mbGFn
cyhkZXNjLCAuLi4pYCAtIFVwZGF0ZSB0aGUgVk1BIGRlc2NyaXB0b3IgZmxhZ3MgdG8gc2V0Cj4g
PiA+ICsgIGFkZGl0aW9uYWwgZmxhZ3Mgc3BlY2lmaWVkIGJ5IGEgY29tbWEtc2VwYXJhdGVkIGxp
c3QsCj4gPiA+ICsgIGUuZy4gLSBgdm1hX2Rlc2Nfc2V0X2ZsYWdzKGRlc2MsIFZNQV9QRk5NQVBf
QklULCBWTUFfSU9fQklUKWAuCj4gPiA+ICsqIGB2bWFfZGVzY19jbGVhcl9mbGFncyhkZXNjLCAu
Li4pYCAtIFVwZGF0ZSB0aGUgVk1BIGRlc2NyaXB0b3IgZmxhZ3MgdG8gY2xlYXIKPiA+ID4gKyAg
ZmxhZ3Mgc3BlY2lmaWVkIGJ5IGEgY29tbWEtc2VwYXJhdGVkIGxpc3QsIGUuZy4gLSBgdm1hX2Rl
c2NfY2xlYXJfZmxhZ3MoZGVzYywKPiA+ID4gKyAgVk1BX1dSSVRFX0JJVCwgVk1BX01BWVdSSVRF
X0JJVClgLgo+ID4gPiArCj4gPiA+ICtBY3Rpb25zCj4gPiA+ICs9PT09PT09Cj4gPiA+ICsKPiA+
ID4gK1lvdSBjYW4gbm93IHZlcnkgZWFzaWx5IGhhdmUgYWN0aW9ucyBiZSBwZXJmb3JtZWQgdXBv
biBhIG1hcHBpbmcgb25jZSBzZXQgdXAgYnkKPiA+ID4gK3V0aWxpc2luZyBzaW1wbGUgaGVscGVy
IGZ1bmN0aW9ucyBpbnZva2VkIHVwb24gdGhlIGBzdHJ1Y3Qgdm1fYXJlYV9kZXNjYAo+ID4gPiAr
cG9pbnRlci4gVGhlc2UgYXJlOgo+ID4gPiArCj4gPiA+ICsqIGBtbWFwX2FjdGlvbl9yZW1hcCgp
YCAtIFJlbWFwcyBhIHJhbmdlIGNvbnNpc3Rpbmcgb25seSBvZiBQRk5zIGZvciBhIHNwZWNpZmlj
Cj4gPiA+ICsgIHJhbmdlIHN0YXJ0aW5nIGEgdmlydHVhbCBhZGRyZXNzIGFuZCBQRk4gbnVtYmVy
IG9mIGEgc2V0IHNpemUuCj4gPiA+ICsKPiA+ID4gKyogYG1tYXBfYWN0aW9uX3JlbWFwX2Z1bGwo
KWAgLSBTYW1lIGFzIGBtbWFwX2FjdGlvbl9yZW1hcCgpYCwgb25seSByZW1hcHMgdGhlCj4gPiA+
ICsgIGVudGlyZSBtYXBwaW5nIGZyb20gYHN0YXJ0X3BmbmAgb253YXJkLgo+ID4gPiArCj4gPiA+
ICsqIGBtbWFwX2FjdGlvbl9pb3JlbWFwKClgIC0gU2FtZSBhcyBgbW1hcF9hY3Rpb25fcmVtYXAo
KWAsIG9ubHkgcGVyZm9ybXMgYW4gSS9PCj4gPiA+ICsgIHJlbWFwLgo+ID4gPiArCj4gPiA+ICsq
IGBtbWFwX2FjdGlvbl9pb3JlbWFwX2Z1bGwoKWAgLSBTYW1lIGFzIGBtbWFwX2FjdGlvbl9pb3Jl
bWFwKClgLCBvbmx5IHJlbWFwcwo+ID4gPiArICB0aGUgZW50aXJlIG1hcHBpbmcgZnJvbSBgc3Rh
cnRfcGZuYCBvbndhcmQuCj4gPiA+ICsKPiA+ID4gKyoqTk9URToqKiBUaGUgJ2FjdGlvbicgZmll
bGQgc2hvdWxkIG5ldmVyIG5vcm1hbGx5IGJlIG1hbmlwdWxhdGVkIGRpcmVjdGx5LAo+ID4gPiAr
cmF0aGVyIHlvdSBvdWdodCB0byB1c2Ugb25lIG9mIHRoZXNlIGhlbHBlcnMuCj4gPgo+ID4gSSdt
IGd1ZXNzaW5nIHRoZSBzdGFydCBhbmQgc2l6ZSBwYXJhbWV0ZXJzIHBhc3NlZCB0bwo+ID4gbW1h
cF9hY3Rpb25fcmVtYXAoKSBhbmQgc3VjaCBhcmUgcmVzdHJpY3RlZCBieSB2bV9hcmVhX2Rlc2Mu
c3RhcnQKPiA+IHZtX2FyZWFfZGVzYy5lbmQuIElmIHNvLCBzaG91bGQgd2UgZG9jdW1lbnQgdGhv
c2UgcmVzdHJpY3Rpb25zIGFuZAo+ID4gZW5mb3JjZSB0aGVtIGluIHRoZSBjb2RlPwo+Cj4gSSBt
ZWFuIGl0J3MgdGhlIHNhbWUgcmVzdHJpY3Rpb25zIGFzIGFsbCBvZiB0aGUgZnVuY3Rpb25zIGFs
cmVhZHkgYXBwbHkgaWYgeW91Cj4gd2VyZSB0byB1c2UgdGhlbSB3aXRoIGEgVk1BIGRlc2NyaXB0
b3IuCj4KPiBJIHRoaW5rIGltcGxpY2l0bHkgYSByZW1hcCB3aWxsIGZhaWwgaWYgeW91IHRyeSBp
dCBvdXQgb2YgdGhlIFZNQSByYW5nZSBhdCB0aGUKPiBwb2ludCBvZiBhcHBseWluZyB0aGUgY2hh
bmdlLgo+Cj4gQnV0IGl0IG1pZ2h0IGJlIHdvcnRoIGFkZGluZyByYW5nZV9pbl92bWFfZGVzYygp
IGNoZWNrcyBhdCBwcmVwYXJlIHRpbWUsIHdpbGwKPiBzZWUgaWYgSSBjYW4gZG8gdGhhdCBmb3Ig
dGhlIHJlc3Bpbi4KPgo+IEkgdGhpbmsgaXQncyBwcmV0dHkgb2J2aW91cyB0aGF0IHlvdSBzaG91
bGRuJ3QgYmUgdHJ5aW5nIHRvIHJlbWFwIHRvdGFsbHkKPiB1bnJlbGF0ZWQgbWVtb3J5LCBzbyBJ
J20gbm90IHN1cmUgdGhhdCdzIGF0IGEgbGV2ZWwgb2YgZ3JhbnVsYXJpdHkgdGhhdCdzIHN1aXRl
ZAo+IHRvIHRoaXMgZG9jdW1lbnQgdGhvdWdoLgoKSSBqdXN0IHNhdyB5b3UgYWxyZWFkeSBoYXZl
IFdBUk5fT05fT05DRSgpIGluc2lkZSBtbWFwX2FjdGlvbl9yZW1hcCgpCnRvIGNoZWNrIGZvciB0
aGVzZSBsaW1pdHMsIHNvIGNvZGV3aXNlIEkgdGhpbmsgd2UgYXJlIGFscmVhZHkgZ29vZC4KCkZv
ciBkb2N1bWVudGF0aW9uIEknbGwgcmVseSBvbiB5b3VyIGp1ZGdlbWVudCB3aGV0aGVyIHRvIG1l
bnRpb24gdGhpcyBvciBub3QuCgo+Cj4gPgo+ID4gPiArICAgIHN0cnVjdCB2bV9hcmVhX2Rlc2Mg
ewo+ID4gPiArICAgICAgICAvKiBJbW11dGFibGUgc3RhdGUuICovCj4gPiA+ICsgICAgICAgIGNv
bnN0IHN0cnVjdCBtbV9zdHJ1Y3QgKmNvbnN0IG1tOwo+ID4gPiArICAgICAgICBzdHJ1Y3QgZmls
ZSAqY29uc3QgZmlsZTsgLyogTWF5IHZhcnkgZnJvbSB2bV9maWxlIGluIHN0YWNrZWQgY2FsbGVy
cy4gKi8KPiA+ID4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBzdGFydDsKPiA+ID4gKyAgICAgICAg
dW5zaWduZWQgbG9uZyBlbmQ7Cj4gPgo+ID4KPiA+ID4gLS0KPiA+ID4gMi41My4wCj4gPiA+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
