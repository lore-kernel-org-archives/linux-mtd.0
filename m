Return-Path: <SRS0=gcnc=BS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976F2C433DF
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Aug 2020 03:27:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 587D42086A
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Aug 2020 03:27:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pe0rwfAY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 587D42086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h5nOIVN2fnDGKb3/CYACOZUAZ1gaXnQjldiJl9a2ms0=; b=Pe0rwfAYl7WjKKc1GcSB4tA4j
	7FyauL4OBYVxTd0QRAjogbqYhz9+PWyu5p0PxV8VpQ0DMvQCuehCC3O8viBKKB8IwbEY4d6oKUq2T
	X3UlwZvQBXtMEdBSIqazawPsCc3jkOkBiJ0smUQ7HEBycGQoo1nmGAet1BcN6WoQnG1DnBgkLtale
	F/TVK6GES6JE2EL+V2gQsbdb4yCGmYfl77G0LaCP3Il2OqQOmYMCsM6NRTpYiYBunWZbHSuSwGtry
	L8NOFFN+Zhswn8fFCNJxAVIT4Pm13AMT2D5adq3rgzMCFvtjnQZcOQzI18U4QqEfADMEEQt+n+mWV
	H3XGtbiYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4FV2-0001b7-9z; Sat, 08 Aug 2020 03:26:24 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4FUw-0001aW-Fz
 for linux-mtd@lists.infradead.org; Sat, 08 Aug 2020 03:26:19 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 4E1FA45E9A62030277B8;
 Sat,  8 Aug 2020 11:26:14 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.214) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0;
 Sat, 8 Aug 2020 11:26:05 +0800
Subject: Re: [PATCH] ubi: check kthread_should_stop() after the setting of
 task state
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <20200601091231.3794350-1-chengzhihao1@huawei.com>
 <CAFLxGvwLSvYsQ+OPi85VS8aQ2uge_JqQRD2C8h=XMORvCej3Sw@mail.gmail.com>
 <211afcd0-d5b3-5ac0-1fd1-dc789634a858@huawei.com>
 <CAFLxGvwRDfB4mqxJhOLwWvoZ3yzpVY-kuAiovYLf8T7WwJqaTg@mail.gmail.com>
 <9caa4860-975c-70bb-c8b9-737d1db9ead4@huawei.com>
 <CAFLxGvycs7DNu5o5QY1WwTPfS6cTTykTh-91n9TQZ7yP_ADr4A@mail.gmail.com>
 <2086f822-e67a-43e4-76d8-5339eaccd3ac@huawei.com>
 <CAFLxGvzwoC1GcjJOfwpc8V5LD79=8XiJaNV2HjOm8EdQcCbp+w@mail.gmail.com>
 <5f7ae548-350b-cedf-3c8e-25fea06a8377@huawei.com>
 <CAFLxGvy-RRksDvPcB6z8GQUoMFZ_NRGxk9aM2FuTZ22UWU6Knw@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <56435b1e-ffdf-9d4a-5865-f2ce3b36644f@huawei.com>
Date: Sat, 8 Aug 2020 11:26:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFLxGvy-RRksDvPcB6z8GQUoMFZ_NRGxk9aM2FuTZ22UWU6Knw@mail.gmail.com>
X-Originating-IP: [10.174.179.214]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200807_232618_803318_77B1FBC8 
X-CRM114-Status: UNSURE (   6.79  )
X-CRM114-Notice: Please train this message.
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>, "zhangyi \(F\)" <yi.zhang@huawei.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjAvOC84IDM6MjksIFJpY2hhcmQgV2VpbmJlcmdlciDlhpnpgZM6Cj4gT24gRnJpLCBB
dWcgNywgMjAyMCBhdCA0OjE4IEFNIFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5j
b20+IHdyb3RlOgoKPiBNYXliZSBpdCdzIGp1c3QgbWUgYmVpbmcgZGVuc2UgYW5kIGluIG5lZWQg
Zm9yIGEgdmFjYXRpb24uIDstKQo+IApJIGhhdmUgcXVpdGUgYSBmZXcgdWJpL3ViaWZzIHBhdGNo
ZXMgaW4gcGVuZGluZyBsaXN0LCBtYXkgeW91IApjb21tZW50L2NoZWNrIHRoZW0gYmVmb3JlIDUu
OSBlbmRpbmcgcGxlYXNlPyB0aGFua3MuIO+8vCjvv6Pilr3vv6MpCgpGb3IgZXhhbXBsZToKCmh0
dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1tdGQvcGF0Y2gvMjAyMDA2
MDEwOTEwMzcuMzc5NDE3Mi0yLWNoZW5nemhpaGFvMUBodWF3ZWkuY29tLwoKaHR0cHM6Ly9wYXRj
aHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LW10ZC9wYXRjaC8yMDIwMDYwMjExMjQxMC42
NjA3ODUtMS1jaGVuZ3poaWhhbzFAaHVhd2VpLmNvbS8KCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFi
cy5vcmcvcHJvamVjdC9saW51eC1tdGQvY292ZXIvMjAyMDA2MTYwNzExNDYuMjYwNzA2MS0xLWNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tLwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
