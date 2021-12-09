Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BA0C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 13:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YW1VlU1vEpKsJalnpOGuWrSauHz83aAjckxxXm1pyXQ=; b=oj45x291IoQMZN
	LBZBsmHwyN+XMZKRPX/lJtWle0rtat72nVda7DAqiEYb5t91pLLkeAHH/g9UB5wLfBdwE+sjQ7kZU
	NSK9d4wZVQPBsoV6SFCVX6O9kHDhgSd+S9dIFKz/+sg1vr+G03mdFA/emT8Y0szJttONQN24FIcKf
	85mJTtEdMDuBdGueyMlCD6+q4q5w20BKNNon58kdIqPqYlKDUoatwwR7cJOCFsPIBR5IxhLdHaC31
	T84cAJ6MHSCwNODbRlnsROH/kMPh5KYVIPxCiRB0iFdSCEKrK3WAwaR6aV5VN7rWanZBthDovyhyk
	nWLSAEtwwCnMUaE1thag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvJO1-00G5ZA-4k; Thu, 09 Dec 2021 13:23:01 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvJNj-00G5WE-JM
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 13:22:44 +0000
Received: by mail-lf1-x12a.google.com with SMTP id m6so139223lfu.1
 for <linux-mtd@lists.infradead.org>; Thu, 09 Dec 2021 05:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=VV2BSYPMZJfbzuW4/7R3NiQORSbxNkzpn4WYolxdFms=;
 b=HzPLBsyCCwmm9z294WqHqfI0/btspSS3pPCfNOKsj5SBvcag3XHjwzQLZL/CaHQ/Ws
 /J0Y5TjrcXHSqWK9naGWYXFeDrEARq1Gz/eiqMsnDyZCO57sx7Z281ylDPYDHgSULpB7
 Y67jB42Y0SK/8rI8hPrlpo6fCJkDpCjSBN8m7JGFymYPdR2TMx3lf4SHghJoPZR+MXA/
 cuYq/PprBWSoHL30gKfAzymEOSQJZjskcUV9kqnGQR+abMQ/ydBZL+2eVKWy4UW9DzAi
 xhOi9xhLX7v8AmZenSwEeMaKh1HpC/x5P0YuGXcUhwTN4JmhyIl/dVlTXVGKfmjtrAw2
 1sxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=VV2BSYPMZJfbzuW4/7R3NiQORSbxNkzpn4WYolxdFms=;
 b=PshDzE12uABE3nuTPfDzQlGrje7VCn8YFdCAU5GpmzMcOsLAmHr/rTnRuCI95h4wN2
 TrLeUVQkKgx7lRQ073cFCxjKk34WSI/0eD/JzRPQ3KC2K0G5i7KqIspUSQA2zHsBdAt0
 RGbQ7jLFpCZzDdiJTal8kN9gx2NiSEAVyZkMLmTcpG356h3B5zJoJavKXVmdpHBpA7c4
 JwnIMTTyKBq7Z99K+sCM6YH/evUXh3KWiOpNEVOcR6ZuVVbAEkGm6Ktat8tyX3hzeLCM
 toZmz50iErTtEzJ+Mwb7MHInFoxmmLpP5AGzcO3duoCYJytgs7aYzbXLOl4ls+T0SS/d
 zLvA==
X-Gm-Message-State: AOAM531UUhlO6+VVbWHDuNhv7v/XR6H0ME9AP6H65BHqzs6eJSqqr90C
 SG9UQBmZ6u2PfScAooKSHOi+7WFFvmXvM+gZM10Mxwprm4I=
X-Google-Smtp-Source: ABdhPJxvkOvmfD7SXl4Wko3DzApanA5Sw6OCyogvxIfe0Gy1zwYTM4x4S1eJE3jL2gHDW84qJX6AwKNkt0K+kbtcj2c=
X-Received: by 2002:a05:6512:3fa5:: with SMTP id
 x37mr6122358lfa.536.1639056161489; 
 Thu, 09 Dec 2021 05:22:41 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Thu, 9 Dec 2021 14:22:30 +0100
Message-ID: <CACna6rwRtP-_SoAZVV0ZjFAcWQucRWVoZ0bxSZrFtDFW2McyYw@mail.gmail.com>
Subject: Identifying UBI volume instance / storing UBI volume metadata
To: MTD Maling List <linux-mtd@lists.infradead.org>
Cc: OpenWrt Development List <openwrt-devel@lists.openwrt.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_052243_678261_8F93B229 
X-CRM114-Status: GOOD (  10.25  )
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

SGksCgpJJ20gTGludXggZGV2ZWxvcGVyIGludm9sdmVkIGluIE9wZW5XcnQgJiBidWlsZHJvb3Qg
cHJvamVjdHMuIEkgd29yawpvbiBidWlsZGluZyBmaXJtd2FyZSBpbWFnZXMgZm9yIGhvbWUgcm91
dGVycyBidXQgSSBuZWVkIHRvIHdvcmsgd2l0aApleGlzdGluZyBkZXNpZ25zLiBJIGRvbid0IHdv
cmsgZm9yIEJyb2FkY29tIChvciBhbnkgb3RoZXIKbWFudWZhY3R1cmVyKSBhbmQgc28gSSBjYW4n
dCBjaGFuZ2UgaG93IGZpcm13YXJlIGltYWdlcyBhcmUgaGFuZGxlZCBieQpvcmlnaW5hbCBzb2Z0
d2FyZS4KCkknbSBkZWFsaW5nIHJpZ2h0IG5vdyB3aXRoIEJDTTQ5MDggcGxhdGZvcm0gdGhhdCB1
c2VzIFVCSSBhbmQgSSBuZWVkIHNvbWUgaGVscC4KCkJ5IEJyb2FkY29tJ3MgZGVzaWduIEJDTTQ5
MDggdXNlcyB0d28gcmVsZXZhbnQgVUJJIHZvbHVtZXM6CjEuIGJvb3RmcwoyLiByb290ZnMKCkV2
ZXJ5IGZpcm13YXJlIGZpbGUgKGFjY2VwdGVkIGJ5IGJvb3Rsb2FkZXIgJiBvcmlnaW5hbCBmaXJt
d2FyZSBVSSkKY29udGFpbnMgdHdvIGltYWdlczogYm9vdGZzICh3aXRoIGtlcm5lbCAmIERUQnMp
IGFuZCByb290ZnMuIEZsYXNoaW5nCmZpcm13YXJlICh0aHJvdWdoIGJvb3Rsb2FkZXIgb2Ygb3Jp
Z2luYWwgVUkpIGlzIGEgcHJvY2VzcyBvZiBzaW1wbHkKd3JpdGluZyBmaXJtd2FyZS1jb250YWlu
ZWQgImJvb3RmcyIgYW5kICJyb290ZnMiIGltYWdlcyB0bwpjb3JyZXNwb25kaW5nIFVCSSB2b2x1
bWVzLgoKCk15IHByb2JsZW0gaXMgbWFraW5nIE9wZW5XcnQncyBkZXNpZ24gZml0IHRoYXQgQkNN
NDkwOCBjYXNlLiBPcGVuV3J0CnVzZXMgdHdvICpyb290ZnMqIHZvbHVtZXM6CjEuIHJvb3Rmczog
c3F1YXNoZnMgUk8KMi4gb3ZlcmxheTogdWJpZnMgb3ZlcmxheQoKQXMgeW91IGNhbiBzZWUgIm92
ZXJsYXkiIG5lZWRzIHRvIGJlIGNyZWF0ZWQgYnkgT3BlbldydCdzIHVzZXIgc3BhY2UuCkl0IGNh
bid0IGJlIHBhcnQgb2YgZmxhc2hlZCBmaXJtd2FyZSBmaWxlLgoKTXkgcHJvYmxlbSBpcyAvbGlu
a2luZy8gIm92ZXJsYXkiIHdpdGggY3VycmVudGx5IHJ1bm5pbmcgZmlybXdhcmUuIExldAptIGV4
cGxhaW46CldoZW5ldmVyIGEgbmV3IGZsYXNoaW5nIGhhcHBlbnMgdGhlIE9MRCAib3ZlcmxheSIg
bmVlZHMgdG8gYmUKcmVjb2duaXplZCBhbmQgd2lwZWQuCkl0J3MgcmVxdWlyZWQgdG8gbWFrZSBz
dXJlIG5ld2x5IGZsYXNoZWQgZmlybXdhcmUgZG9lc24ndCB1c2Ugbm9uLW93biBkYXRhLgoKCk15
IGlkZWFzIEkgaGF2ZSBmb3Igc29sdmluZyB0aGF0OgoKMS4gR2V0dGluZyAiYm9vdGZzIiAvICJy
b290ZnMiIHZvbHVtZSBwZXItZmxhc2hpbmcgdW5pcXVlIG51bWJlciBhbmQKd3JpdGluZyBpdCBp
biAib3ZlcmxheSIgdWJpZnMuIFRoZW4gd2lwZSAib3ZlcmxheSIgb24gbWlzbWF0Y2guClVuZm9y
dHVuYXRlbHkgSSBjYW4ndCBzZWUgYW55dGhpbmcgZmxhc2hpbmctc3BlY2lmaWMgbnVtYmVyIGlu
IFVCSQp2b2x1bWUgaGVhZGVyLgpJbWFnZSBzZXF1ZW5jZSBkb2VzIG5ldmVyIGNoYW5nZSBpbiBt
eSBjYXNlIGFzIFVCSSBkb2Vzbid0IGdldCByZWZvcm1hdHRlZC4KSSdtIG5vdCBzdXJlIGlmIHNx
bnVtIGlzIHVuaXF1ZSBidXQgaXQgc2VlbXMgaXQgY2FuIGNoYW5nZSBhbnl3YXkgd2hlbgpVQkkg
bmVlZHMgdG8gaGFuZGxlIHdpdGggZmxhc2ggd2VhcmluZy4KCjIuIEdlbmVyYXRpbmcgcmFuZG9t
IG51bWJlciBhbmQgd3JpdGluZyBpdCBpbiBzb21lIG1ldGFkYXRhIG9mIFJPCiJib290ZnMiIG9y
ICJyb290ZnMiIEFORCBpbiAib3ZlcmxheSIgdWJpZnMuIFRoZW4gd2lwZSAib3ZlcmxheSIgb24K
bWlzbWF0Y2guClRoYXQgSSB0aGluayB3b3VsZCByZXF1aXJlIGFkZGluZyBhIGN1c3RvbSBmaWVs
ZCBpbiB0aGUKInViaV92dGJsX3JlY29yZCIgc3RydWN0LiBJJ20gbm90IHN1cmUgaWYgdXBzdHJl
YW0gVUJJIGNhbiBiZSBleHRlbmRlZApsaWtlIHRoYXQgYW5kIEkgZG9uJ3Qgd2FudCBzdWNoIGhl
YXZ5IGRvd25zdHJlYW0gKE9wZW5XcnQpIGhhY2tzLgoKCkFueSBhZGl2Y2VzLCBwbGVhc2U/Cgot
LSAKUmFmYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
