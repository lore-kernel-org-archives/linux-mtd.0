Return-Path: <SRS0=l5Rv=EX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 653C2C5519F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 09:22:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D523924199
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 09:22:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G+Zu42Ij"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D523924199
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aWos/4JXk6zRsvkCYWohLN2ykOUWzrIM67HSK1Mu5mE=; b=G+Zu42IjW6EBF0mneWldG9MdM
	S+uw74JxdnZjCIFzRyVFDDSeOpoB5reiWBwqme/t3Jic3741gTo1k2qqeK3gYwBTQwWKq/e9LRhiO
	TbowbmEO8LGEBN/iXdQ58GVFnqr41lZ8Lthkg52YRdn2ONLRw1wB45Ev59k9qJ4dCPk5b8Ros/0xo
	+yj8e9um7Pd4injKWNfCKy0d2wKrKPhVyMNOP0adLkR+k8WMcrpUW1CmIuEEF1qsT8J7S238TTdOV
	WqMuOpjpgEll2lR4pcp+rxKSyWenZSe/YhVJ41dKHwWv7q0Hyw3VrB83radOBbtGmnidUPToFhRuZ
	Kzbu0/R1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kexB9-0007dH-MG; Tue, 17 Nov 2020 09:21:35 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kexB7-0007bg-D6
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2020 09:21:34 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cb0mk721kz15LrY;
 Tue, 17 Nov 2020 17:21:10 +0800 (CST)
Received: from [10.174.176.185] (10.174.176.185) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Tue, 17 Nov 2020 17:21:19 +0800
Subject: Re: [PATCH] ubifs: wbuf: Don't leak kernel memory to flash
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <20201116210530.26230-1-richard@nod.at>
 <bfea268f-b5c2-5467-7b17-5eef7b0269ce@huawei.com>
 <CAFLxGvy4_H0rn085j9=o2kW2X0rHcRJVMSAbp8OyYVVFhTcXpg@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <64125c57-6165-9501-ccb7-b87746b7fe04@huawei.com>
Date: Tue, 17 Nov 2020 17:21:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFLxGvy4_H0rn085j9=o2kW2X0rHcRJVMSAbp8OyYVVFhTcXpg@mail.gmail.com>
X-Originating-IP: [10.174.176.185]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_042133_687062_2E652BF8 
X-CRM114-Status: UNSURE (   8.26  )
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
 LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

5ZyoIDIwMjAvMTEvMTcgMTY6NDMsIFJpY2hhcmQgV2VpbmJlcmdlciDlhpnpgZM6Cj4gT24gVHVl
LCBOb3YgMTcsIDIwMjAgYXQgMjoyOCBBTSBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3
ZWkuY29tPiB3cm90ZToKPj4KPj4gUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGlo
YW8xQGh1YXdlaS5jb20+Cj4gCj4gVGhhbmtzIGZvciByZXZpZXdpbmcsIGhpZ2hseSBhcHByZWNp
YXRlZCEKPiAKWW91J3JlIHdlbGNvbWUuIEFjdHVhbGx5IEkndmUgYmVlbiBmb2xsb3dpbmcgdGhl
IGxpbnV4LW10ZC4gSXQncyBqdXN0IAp0aGF0IHRoaXMgcGF0Y2ggaXNuJ3QgY29tcGxpY2F0ZWQs
IHNvIEkgY2hlY2tlZCBpdC4gOi0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
