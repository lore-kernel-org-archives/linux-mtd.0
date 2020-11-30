Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6473C5519F
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:42:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47F1E20709
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:42:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V5ZNsoVD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47F1E20709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rfZhZql/6e9OJrgSGT/MrLE+ITtI8EC8kAykStZm2FU=; b=V5ZNsoVDkFygoJvtSmeS4tJN6
	QKfZQkKObMTVrfRo6yk6jrpjFlBEShNcP/0gfopRM810ealzbdcp9hmApgSrT/K4o2mqDIWg9q3UE
	tw3QfpekA+vitLVXJsFszNyb84WNLYXsPKpgqhVJua/trFeX/9LzW+5gSV1ll7PGAaieIZh9uTNRj
	wSxtOzUVyGz+IIqKD5SuyYfeJg5Y+id9n6k6Rey5ZXT6W5mQP/NED9R6/bJD+7oTGIG4JAYWM7w6J
	cakujj7FmVeoY5HgUvERXbDObAbj20xED7mgmEWxPTE7XgJIR5aEzO3uN+vyzFQoYOkITZBHf79wp
	F9B70hOEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjdot-0000AB-Lx; Mon, 30 Nov 2020 07:41:59 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjdoq-00008a-J0
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 07:41:57 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 62905AC6A;
 Mon, 30 Nov 2020 07:41:55 +0000 (UTC)
Subject: Re: [PATCH 33/45] block: move the partition_meta_info to struct
 block_device
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201128161510.347752-1-hch@lst.de>
 <20201128161510.347752-34-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <2bada2af-3311-2a2c-fbdd-519036fee70b@suse.de>
Date: Mon, 30 Nov 2020 08:41:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128161510.347752-34-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_024156_785418_E2D8A58F 
X-CRM114-Status: GOOD (  17.49  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTEvMjgvMjAgNToxNCBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gTW92ZSB0aGUg
cGFydGl0aW9uX21ldGFfaW5mbyB0byBzdHJ1Y3QgYmxvY2tfZGV2aWNlIGluIHByZXBhcmF0aW9u
IGZvcgo+IGtpbGxpbmcgc3RydWN0IGhkX3N0cnVjdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiBSZXZpZXdlZC1ieTogSmFuIEthcmEgPGphY2tA
c3VzZS5jej4KPiAtLS0KPiAgIGJsb2NrL2Jsay5oICAgICAgICAgICAgICAgfCAgMSAtCj4gICBi
bG9jay9nZW5oZC5jICAgICAgICAgICAgIHwgIDMgKystCj4gICBibG9jay9wYXJ0aXRpb25zL2Nv
cmUuYyAgIHwgMTggKysrKysrKy0tLS0tLS0tLS0tCj4gICBmcy9ibG9ja19kZXYuYyAgICAgICAg
ICAgIHwgIDEgKwo+ICAgaW5jbHVkZS9saW51eC9ibGtfdHlwZXMuaCB8ICAyICsrCj4gICBpbmNs
dWRlL2xpbnV4L2dlbmhkLmggICAgIHwgIDEgLQo+ICAgaW5pdC9kb19tb3VudHMuYyAgICAgICAg
ICB8ICA3ICsrKystLS0KPiAgIDcgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTcg
ZGVsZXRpb25zKC0pCj4gUmV2aWV3ZWQtYnk6IEhhbm5lcyBSZWluZWNrZSA8aGFyZUBzdXNlLmRl
PgoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAgICAgICAg
IEtlcm5lbCBTdG9yYWdlIEFyY2hpdGVjdApoYXJlQHN1c2UuZGUgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OApTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHbWJI
LCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5IChBRyBOw7xybmJlcmcp
LCBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
