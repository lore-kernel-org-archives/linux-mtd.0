Return-Path: <SRS0=DcMO=E7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DDD5C5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 06:43:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBC7920708
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 06:43:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DfEma0MQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBC7920708
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zSHGIf7caKiSZ9mlq96rCyyVjVfeYI0pnAzimWyhsGQ=; b=DfEma0MQu2SmGPeo106KBNozd
	hRY66USuNbf5t+7jXswoYsZ9/Cttlv4y/qexos8Vz1pjGVZ9TBCjs6ECniMx6DVNQ1Zf9WcJksMuU
	nAbpAtJk7fLh7jAffUmp478VDEPfWFMiot6qPZsUKLug6knzonlX8I+UHGIPz7Kl2EhUuNALfxfdm
	BBz4HzAo7yLioJBX7/oGdByp6QIxtUlIZS5+JHJ7AkGAT8jvun8sMroUONGKFtq0fdjufUB12GE9Z
	trKJXjaNsU8V58CkZAGnfVaJcsrfwM1yeHsuOgVObshNpg6IkG/vMOcZspFc+2hWIDSLz9sE9j7zj
	zA5EUK+qw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khoVM-0002uy-QA; Wed, 25 Nov 2020 06:42:16 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khoVK-0002u5-GW
 for linux-mtd@lists.infradead.org; Wed, 25 Nov 2020 06:42:15 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6CE03ABDE;
 Wed, 25 Nov 2020 06:42:13 +0000 (UTC)
Subject: Re: [PATCH 03/45] fs: remove get_super_thawed and
 get_super_exclusive_thawed
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-4-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <bc32a2ff-8021-a47f-0543-955c9178d0f5@suse.de>
Date: Wed, 25 Nov 2020 07:42:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124132751.3747337-4-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_014214_667076_133C7FD7 
X-CRM114-Status: GOOD (  17.27  )
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
 linux-fsdevel@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>,
 xen-devel@lists.xenproject.org, linux-mm@kvack.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTEvMjQvMjAgMjoyNyBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gSnVzdCBvcGVu
IGNvZGUgdGhlIHdhaXQgaW4gdGhlIG9ubHkgY2FsbGVyIG9mIGJvdGggZnVuY3Rpb25zLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+ICAg
ZnMvaW50ZXJuYWwuaCAgICAgIHwgIDIgKysKPiAgIGZzL3F1b3RhL3F1b3RhLmMgICB8IDMxICsr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0KPiAgIGZzL3N1cGVyLmMgICAgICAgICB8IDUxICsr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIGluY2x1ZGUv
bGludXgvZnMuaCB8ICA0ICstLS0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygr
KSwgNTkgZGVsZXRpb25zKC0pCj4gClJldmlld2VkLWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVA
c3VzZS5kZT4KCkNoZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAg
ICAgICAgICBLZXJuZWwgU3RvcmFnZSBBcmNoaXRlY3QKaGFyZUBzdXNlLmRlICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgKzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR21iSCwgTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8
cm5iZXJnKSwgR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
