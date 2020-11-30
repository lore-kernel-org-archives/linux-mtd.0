Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 564C2C63777
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:40:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC90F20709
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:40:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0dZiSt/9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC90F20709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rcoGVZATnnTmqIUMuwzETN3BdFepIkPnnZ7/abaWwV0=; b=0dZiSt/9yatr3hAvgdbpkUo5h
	lGOOm5BeWGPY42lt1Oy6VIk9tQ5iyY5UlFAIp2xYgmNOL194TqMOzAH9raU+Ut34w0vnGjDxf2PyY
	6jKr6CFRmbF9brERKpW5opBXoJFSOIQGjMKY5i4S/w7bzSrnw7GjcCdw969KITiID8NojTpGG5Q77
	x9CenWYb6NmAh423pfNYX5QZAAOkDrUKIn8j6mV08UfReFw6al2M5p5Q5udLttsPmO2K+aVU4g2wx
	2sbdtxZ2GG00zMzOpBdj8Q/4dKbOFvmlontqNKT/vGso8Y4eJ6Oni9GJgk8yKdx5JjaLRjk+Kdd5P
	H6phSsXKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjdnN-000872-2F; Mon, 30 Nov 2020 07:40:25 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjdnL-000866-AI
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 07:40:24 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3E777AC6A;
 Mon, 30 Nov 2020 07:40:22 +0000 (UTC)
Subject: Re: [PATCH 31/45] block: move disk stat accounting to struct
 block_device
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201128161510.347752-1-hch@lst.de>
 <20201128161510.347752-32-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <eaea37b1-8e2d-218b-aa8a-e419c5f486a1@suse.de>
Date: Mon, 30 Nov 2020 08:40:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128161510.347752-32-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_024023_489627_0EB22311 
X-CRM114-Status: GOOD (  18.96  )
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
ZGtzdGF0cyBhbmQgc3RhbXAgZmllbGQgdG8gc3RydWN0IGJsb2NrX2RldmljZSBpbiBwcmVwYXJh
dGlvbgo+IG9mIGtpbGxpbmcgc3RydWN0IGhkX3N0cnVjdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiBSZXZpZXdlZC1ieTogSmFuIEthcmEgPGph
Y2tAc3VzZS5jej4KPiAtLS0KPiAgIGJsb2NrL2Jsay1jZ3JvdXAuYyAgICAgICAgfCAgMiArLQo+
ICAgYmxvY2svYmxrLWNvcmUuYyAgICAgICAgICB8ICA0ICsrLS0KPiAgIGJsb2NrL2Jsay5oICAg
ICAgICAgICAgICAgfCAgMSAtCj4gICBibG9jay9nZW5oZC5jICAgICAgICAgICAgIHwgMTQgKysr
Ky0tLS0tLS0tLS0KPiAgIGJsb2NrL3BhcnRpdGlvbnMvY29yZS5jICAgfCAgOSArLS0tLS0tLS0K
PiAgIGZzL2Jsb2NrX2Rldi5jICAgICAgICAgICAgfCAxMCArKysrKysrKysrCj4gICBpbmNsdWRl
L2xpbnV4L2Jsa190eXBlcy5oIHwgIDIgKysKPiAgIGluY2x1ZGUvbGludXgvZ2VuaGQuaCAgICAg
fCAgMiAtLQo+ICAgaW5jbHVkZS9saW51eC9wYXJ0X3N0YXQuaCB8IDM4ICsrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tCj4gICA5IGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlv
bnMoKyksIDQzIGRlbGV0aW9ucygtKQo+IApSZXZpZXdlZC1ieTogSGFubmVzIFJlaW5lY2tlIDxo
YXJlQHN1c2UuZGU+CgpDaGVlcnMsCgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2UgICAg
ICAgICAgICAgICAgS2VybmVsIFN0b3JhZ2UgQXJjaGl0ZWN0CmhhcmVAc3VzZS5kZSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFH
IE7DvHJuYmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
