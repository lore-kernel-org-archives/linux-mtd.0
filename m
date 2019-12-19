Return-Path: <SRS0=zmh0=2J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88EFEC43603
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2019 03:00:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55384222C2
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2019 03:00:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ALeBN8GQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=precisionconcrete.biz header.i=@precisionconcrete.biz header.b="Im0oaiE0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55384222C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=precisionconcrete.biz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=568YXcu92Lqg/Acb4goViiOH+l4pbC7W03bRst2pyj8=; b=ALeBN8GQx8Pw8F
	LGAv21SGoawUqwKAu3VmVpJ6SsggfzWaByQ03W8ChVp928LfsfqdG48sPFMKiQPrtv9F0lM1Wd4wQ
	UfNU4fS0vs6rzFNOiqdm/mhDmOF52oPMkh1Ktdh7Rw3KBQUsiv6xz8FNwKyHEsh9LI1kSa7kZK+Fi
	SHVgFwkVtlnU3WzBjYUPu+Mg+WxXyMaoAQ2xV5XOtkhI/rup9jp27HTfgqSx2E/Dy5cXSdo6Lvm0A
	d14+4Hkrp/r6l9g+UXuQxCrRqtG38rlp/yuVBSrCgKdS+Uvvwp6cH9A+EfdhtNS3sWT6A0Bhw2URK
	QHUQKwldufXdfmz8JlWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihm3F-0002UP-9h; Thu, 19 Dec 2019 03:00:33 +0000
Received: from host6.yournethost.com ([67.225.168.34])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihm3C-0002Ta-Aa
 for linux-mtd@lists.infradead.org; Thu, 19 Dec 2019 03:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=precisionconcrete.biz; s=default; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zP1lZfpfKVDRVijXdW2B1hIsTOfhFG1BHE3tw7yylnc=; b=Im0oaiE0S7eHna8MBFziWb/OSP
 QlMovkg4ijLY3JMLvOfmZNTm/IXPPw9ju1lM5Dhz9/7FMiWRvLGMnjzPhXE4Chi9UK/L9fKpPmpo6
 6psIziSHumQsaio2ABaH44Z1HUg29wZhER4mT0rjJraKU22F7Dx8h+pVozFfO3/XPiJfBfXZSqBYN
 7tO7DONve1qvX7opDnJdyWag7Ctx9hkWQ0Y1eMRw/chTZYBOLWNEcbV2trjQSpZ7ubuSIttRI2Ybj
 jVg1vxYfdWHvuPk6kH7Se41004REz7hu8bXUgqtQtwc+wrFDYlUfC4NDEYAZ5JmeylZIe+IEOs8ew
 eOraHa+w==;
Received: from [91.235.136.197] (port=56932 helo=precisionconcrete.biz)
 by host6.yournethost.com with esmtpa (Exim 4.92)
 (envelope-from <dean@precisionconcrete.biz>)
 id 1ihm37-00066z-If; Wed, 18 Dec 2019 22:00:25 -0500
To: "linux mtd" <linux-mtd@lists.infradead.org>,
 "joern" <joern@wohnheim.fh-wedel.de>
From: massiblue <dean@precisionconcrete.biz>
Subject: =?UTF-8?Q?Fw=3ASpero_infinitamente_che_la_tua_?=
 =?UTF-8?Q?giornata_di_lavoro_sia_incredibile?=
Message-ID: <0c88b508-86a5-43e5-b885-7b454c268791@precisionconcrete.biz>
Date: Wed, 18 Dec 2019 20:03:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - host6.yournethost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - precisionconcrete.biz
X-Get-Message-Sender-Via: host6.yournethost.com: authenticated_id:
 dean@precisionconcrete.biz
X-Authenticated-Sender: host6.yournethost.com: dean@precisionconcrete.biz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_190030_495587_966BFEC3 
X-CRM114-Status: UNSURE (  -1.18  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

w4ggc2VtcGxpY2VtZW50ZSBmYW50YXN0aWNvIGh0dHBzOi8vd2F0YWhpY2tlaTE5ODcuYmxvZ3Nw
b3QuaHUvCgoKCgpQYWNlLAptYXNzaWJsdWVAbGliZXJvLml0CgoKCgoKCgoKCgoKCk5ld3M6Cgon
VG9uaWdodCBhIGRvb3Igd2FzIG9wZW5lZCwnIHNheXMgbmV3IE1pc3MgVW5pdmVyc2UKVGhlIDI2
LXllYXItb2xkIGZyb20gU291dGggQWZyaWNhIGhhcyBiZWVuIGRlc2NyaWJlZCBhcyBiZWluZyAi
YSBwcm91ZCBhZHZvY2F0ZSBmb3IgbmF0dXJhbCBiZWF1dHkiLgpNb3JlIHRoYW4gMjAwLDAwMCBh
Y2NvdW50cyBzaWduZWQgdXAgZm9yIGZyYWN0aW9uYWwgc3RvY2sgdHJhZGluZyBvbiBkYXkgb25l
LCBSb2Jpbmhvb2QgY28tQ0VPIHNheXMKIldlIHNlZSBjdXN0b21lcnMnIGV5ZXMgbGlnaHQgdXAg
d2hlbiB0aGV5IGRlcG9zaXQgJDEwIG9yICQxMDAgYW5kIHRoZSBlbnRpcmUgdW5pdmVyc2Ugb2Yg
c3RvY2tzIHRoYXQgdGhleSB3b3VsZCBsaWtlIHRvIGludmVzdCBpbiAuLi4gaXMgYXZhaWxhYmxl
IHRvIHRoZW0sIiBSb2Jpbmhvb2QgY28tQ0VPIFZsYWRpbWlyIFRlbmV2IHNheXMuClNvdXRoIEFm
cmljYSdzICdib3hpbmcgZ3Jhbm5pZXMnIGp1a2UgYW5kIGphYiB0aGVpciB3YXkgdG8gaGVhbHRo
aWVyIGxpdmVzIApUaGUgd29tZW4gcmFuZ2UgaW4gYWdlIGZyb20gdGhlIG1pZC02MHMgdG8gdGhl
IGVhcmx5IDgwcy4gVGhleSBsb3ZlIHRvIGRhbmNlIGFuZCBzaW5nLiBBbmQgdHdpY2UgYSB3ZWVr
LCB0aGV5IGNvbWUgdG8gYSBneW0gaW4gQ29zbW8gQ2l0eSwgb24gdGhlIG91dHNraXJ0cyBvZiBK
b2hhbm5lc2J1cmcsIHRvIGJveC4gVGhleSBhcmUgYWZmZWN0aW9uYXRlbHkga25vd24gYXMgU291
dGggQWZyaWNhJ3MgImJveGluZyBncmFubmllcywiIGFuZCB0aGVzZSB3b21lbiBhcmUganVraW5n
IGFuZCBqYWJiaW5nIHRoZWlyIHdheSB0byBoZWFsdGhpZXIgbGl2ZXMuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
