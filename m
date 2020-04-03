Return-Path: <SRS0=2QCa=5T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AED3C43331
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2020 20:10:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8CE9206F5
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Apr 2020 20:10:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iv99y96v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASF7KC/r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8CE9206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2Q044JURfRuYMjJfVpo7zF3pwCWNY+bVadBsm//fa28=; b=iv99y96v/n8x4Q9rCs1JvkI2Af
	ONFhG6trhjGhVjJNCR8WL4sKQ3aqWwau472dn6ra4RSj25CLPpFd4wIuVeEjlykRdaZ98vmUWgt/I
	bw/Hp6amUVdDNIYLv2iryPYgqGeDzqFfetXsdRFiiC+fFCfJKe8syE179sFFRXBTlHSo6DqPCHWOP
	FKLnC26L8egh93Y803BXYombmqT0UHMiDTjxilp2/PcwoLSOtlXE7is7tdFpQ52AlZ+Hc2Xhhzwl2
	oOgwVla9LrmOA6wyvr0q6iLZKerjLALqXCB0NOEJ5xwVTS+Dzj1sQ4r+W9iAKZ6NSHLDwCe6gP7fD
	uWk3cY+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKSdV-0000EX-Uv; Fri, 03 Apr 2020 20:09:53 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKSdT-0000E4-5z
 for linux-mtd@lists.infradead.org; Fri, 03 Apr 2020 20:09:52 +0000
Received: by mail-il1-x130.google.com with SMTP id g15so8538739ilj.10
 for <linux-mtd@lists.infradead.org>; Fri, 03 Apr 2020 13:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=kySAFGHZPWTs54aqn9MZUGuXJv64Anzh6grmDrxHTD0=;
 b=ASF7KC/ryQGbNAOL/dP+Tzm51Pry6ZnBU5opVFJd3FKUBQFhuVd4IE1htu5LoOIz8q
 WaeJw84s+MuXfZIP9lWCeGTWv7kjewXDD5W3+IzCOdpotsUhoqI8j9NidLBKQPcNBbEc
 gSdOKxSOJABPQyswJyhGXLfzWK33nAGAbXF3ZEIcwOvOqZkFIDxV9NwWGIoPa6zaE1+6
 tT6SEo8nrPdxJb5tj1bgaogxUb6kZiLsx4QIDYPYx1vgZCfM+sxlEdz4GbW/S+EZPKMJ
 0rJq/1K74nWdsajcjsq+CeIKcrJosNg1XPbTamx3NYHZBCaZ0u8YENBVlDbfS/wfGgLe
 oeKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=kySAFGHZPWTs54aqn9MZUGuXJv64Anzh6grmDrxHTD0=;
 b=iWLDwF2lg+WBq2hMEEJhBHnbvYM+9mG1sOXcckbchjZd76UUKja2qXcu+O9l/4V9cI
 epPJckVQmRgRIw9NW/ssD0XcMMPDRpv1GbCXj/s2oOTICWbR1Mp2/cBqd4o62v5UWlH/
 Pmw1h7xjKe72BjCchrG1MorFPN0gCgx6u6VoEYPtxmmD5TWW0/HPpf/vbe2WXEKtiHhu
 Jf9xJUSqvW3kaGSh6iOqUgVevyTn2Jy/942Jq+uHzZqEOgpB8LM0WsSh2T9qQkxjHRSQ
 GXrosz+uKTZje6TaqOBpOLB1hD/OruTW/hEhKpuAuTzaH3hiEHjtW23MTrFumYAwxp63
 41cw==
X-Gm-Message-State: AGi0PuanDF/i6G2gGIvbQy9eDsLO/v+5Qq+LJUJ3saIGH+dgm4Kd31Vd
 2l2dgxrmbTf5FHJA+gNJCDpSpaY5OF0K8SPoV8IwPe82oR0=
X-Google-Smtp-Source: APiQypLtvYKbWdq4D3bj49nSQv6Zl+Mlln45zUH+AikkL1gD46vMP2XBR8YUy7dp8PYLd93osc6JQCXIjTzgJYG9J4c=
X-Received: by 2002:a92:49da:: with SMTP id k87mr10095084ilg.149.1585944589946; 
 Fri, 03 Apr 2020 13:09:49 -0700 (PDT)
MIME-Version: 1.0
From: Mark Deneen <mdeneen@gmail.com>
Date: Fri, 3 Apr 2020 16:09:39 -0400
Message-ID: <CAP6JJ8-q4jC83C+mpfKRerEUcThgMd4KAi+durTrJNvrD6QsOA@mail.gmail.com>
Subject: [PATCH] mtd-www: fix hyperlink to UBI block device
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="000000000000eb53c305a2687f3f"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_130951_242802_6CEBE07B 
X-CRM114-Status: UNSURE (   8.68  )
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
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--000000000000eb53c305a2687f3f
Content-Type: text/plain; charset="UTF-8"

There is currently a link which is incorrect and results in a 404.
This trivial patch fixes that link.

Best Regards,
Mark Deneen

--000000000000eb53c305a2687f3f
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-Fix-hyperlink-to-UBI-block-device.patch"
Content-Disposition: attachment; 
	filename="0001-Fix-hyperlink-to-UBI-block-device.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k8kmfltk0>
X-Attachment-Id: f_k8kmfltk0

RnJvbSA0MzQ5YzcxNTZhNzM0MzI3OWM4YTFlNjZiMGE2NTEwNzFkYTRkZjg1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJrIERlbmVlbiA8bWRlbmVlbkBwcm90b25tYWlsLmNvbT4K
RGF0ZTogRnJpLCAzIEFwciAyMDIwIDE1OjU0OjA0IC0wNDAwClN1YmplY3Q6IFtQQVRDSF0gRml4
IGh5cGVybGluayB0byBVQkkgYmxvY2sgZGV2aWNlCgoKZGlmZiAtLWdpdCBhL2ZhcS91YmkueG1s
IGIvZmFxL3ViaS54bWwKaW5kZXggZjlhNzZiMy4uNTUxOTU5ZCAxMDA2NDQKLS0tIGEvZmFxL3Vi
aS54bWwKKysrIGIvZmFxL3ViaS54bWwKQEAgLTE2OCw3ICsxNjgsNyBAQCBtb3VudCByZWFkLW9u
bHkgZmlsZSBzeXN0ZW1zLjwvcD4KIAogPHA+WWVzLiBVQkkgYWxsb3dzIHRvIGNyZWF0ZSBhIHJl
YWQtb25seSBibG9jayBkZXZpY2Ugb24gdG9wIG9mIGEgVUJJIHZvbHVtZQogd2hpY2ggaXMgc3Vp
dGFibGUgZm9yIHJlYWQtb25seSwgYmxvY2stb3JpZW50ZWQgZmlsZSBzeXN0ZW1zLCBzdWNoIGFz
IHNxdWFzaGZzLgotU2VlIHRoZSA8YSBocmVmPSIuLmRvYy91YmkuaHRtbCNMX2Jsb2NrIj5VQkkg
YmxvY2sgZGV2aWNlPC9hPiBzZWN0aW9uIGZvciBtb3JlIGRldGFpbHMuPC9wPgorU2VlIHRoZSA8
YSBocmVmPSIuLi9kb2MvdWJpLmh0bWwjTF9ibG9jayI+VUJJIGJsb2NrIGRldmljZTwvYT4gc2Vj
dGlvbiBmb3IgbW9yZSBkZXRhaWxzLjwvcD4KIAogPGgyPjxhIG5hbWU9IkxfZm9ybWF0X210ZCI+
CiAJRG8gSSBoYXZlIHRvIGZvcm1hdCBteSBlbXB0eSBmbGFzaCBiZWZvcmUgcnVubmluZyBVQkkg
b24gdG9wIG9mIGl0PwotLSAKMi4yMC4xCgo=
--000000000000eb53c305a2687f3f
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--000000000000eb53c305a2687f3f--

