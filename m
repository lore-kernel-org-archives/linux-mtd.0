Return-Path: <SRS0=DZ8H=ML=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2CF7C12002
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 09:29:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8389F6108B
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jul 2021 09:29:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8389F6108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZOe0rke2UA4OEDxEJuEUVb3mDd2D8QrlUetnGNyQ2NM=; b=uYAc7GKhNSgzqS/Yol62wVkkQN
	0iSdOcXHSjY7rJ1QoOFtC2HXDVOz7teTtljWB6ipMiVWHwXdzteo1CZXLUFKTGKMhVFY/Ju8nBK1Q
	8zLGbDN4Ed+Vfhb/tFxoYlw+QDhuEarNcf3oNuw1UCmvyZJRyc2babtCGshmCOlgM9otqPWMNHN7a
	6RFj93LI5k+YUkYobNiDCPfgZ52UTB2/ROi3fJ0U8MmfnkcZmL8cV1aHa3UWAzc4kpEqm+1pjayt3
	zv+CmLHf0IKGxa+qr7KAw5UAYpMimI8/CJ2xgoxATzin4zFUI80d5dr6zeX7ZUUkvW+NOTnk7o6Bk
	tk9jlpRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5PZg-0095mC-PB; Mon, 19 Jul 2021 09:28:32 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5PZc-0095hb-LO
 for linux-mtd@lists.infradead.org; Mon, 19 Jul 2021 09:28:30 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8799C6074005;
 Mon, 19 Jul 2021 11:28:15 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id mOx5PEkD266R; Mon, 19 Jul 2021 11:28:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 0CBD06169BCD;
 Mon, 19 Jul 2021 11:28:15 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id SIFyXQH69MuA; Mon, 19 Jul 2021 11:28:14 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id CCEAA6074005;
 Mon, 19 Jul 2021 11:28:14 +0200 (CEST)
Date: Mon, 19 Jul 2021 11:28:14 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Pintu Agarwal <pintu.ping@gmail.com>
Cc: Greg KH <greg@kroah.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
 Phillip Lougher <phillip@squashfs.org.uk>, 
 Sean Nyekjaer <sean@geanix.com>, 
 Kernelnewbies <kernelnewbies@kernelnewbies.org>
Message-ID: <1458549943.44607.1626686894648.JavaMail.zimbra@nod.at>
In-Reply-To: <CAOuPNLj1YC7gjuhyvunqnB_4JveGRyHcL9hcqKFSNKmfxVSWRA@mail.gmail.com>
References: <CAOuPNLjzyG_2wGDYmwgeoQuuQ7cykJ11THf8jMrOFXZ7vXheJQ@mail.gmail.com>
 <YPGojf7hX//Wn5su@kroah.com>
 <568938486.33366.1626452816917.JavaMail.zimbra@nod.at>
 <CAOuPNLj1YC7gjuhyvunqnB_4JveGRyHcL9hcqKFSNKmfxVSWRA@mail.gmail.com>
Subject: Re: MTD: How to get actual image size from MTD partition
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF78 (Linux)/8.8.12_GA_3809)
Thread-Topic: How to get actual image size from MTD partition
Thread-Index: HGpmZleyphvaG4K0/EnAjW05MlN5eA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_022828_877145_5E903D66 
X-CRM114-Status: GOOD (  10.90  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlBpbnR1IEFnYXJ3YWwiIDxw
aW50dS5waW5nQGdtYWlsLmNvbT4KPiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4KPiBD
QzogIkdyZWcgS0giIDxncmVnQGtyb2FoLmNvbT4sICJsaW51eC1rZXJuZWwiIDxsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnPiwgImxpbnV4LW10ZCIKPiA8bGludXgtbXRkQGxpc3RzLmluZnJh
ZGVhZC5vcmc+LCAibGludXgtZnNkZXZlbCIgPGxpbnV4LWZzZGV2ZWxAdmdlci5rZXJuZWwub3Jn
PiwgIlBoaWxsaXAgTG91Z2hlciIKPiA8cGhpbGxpcEBzcXVhc2hmcy5vcmcudWs+LCAiU2VhbiBO
eWVramFlciIgPHNlYW5AZ2Vhbml4LmNvbT4sICJLZXJuZWxuZXdiaWVzIiA8a2VybmVsbmV3Ymll
c0BrZXJuZWxuZXdiaWVzLm9yZz4KPiBHZXNlbmRldDogTW9udGFnLCAxOS4gSnVsaSAyMDIxIDEx
OjA5OjQ2Cj4gQmV0cmVmZjogUmU6IE1URDogSG93IHRvIGdldCBhY3R1YWwgaW1hZ2Ugc2l6ZSBm
cm9tIE1URCBwYXJ0aXRpb24KCj4gT24gRnJpLCAxNiBKdWwgMjAyMSBhdCAyMTo1NiwgUmljaGFy
ZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4gd3JvdGU6Cj4gCj4+ID4+IE15IHJlcXVpcmVt
ZW50Ogo+PiA+PiBUbyBmaW5kIHRoZSBjaGVja3N1bSBvZiBhIHJlYWwgaW1hZ2UgaW4gcnVudGlt
ZSB3aGljaCBpcyBmbGFzaGVkIGluIGFuCj4+ID4+IE1URCBwYXJ0aXRpb24uCj4+ID4KPj4gPiBU
cnkgdXNpbmcgdGhlIGRtLXZlcml0eSBtb2R1bGUgZm9yIGVuc3VyaW5nIHRoYXQgYSBibG9jayBk
ZXZpY2UgcmVhbGx5Cj4+ID4gaXMgcHJvcGVybHkgc2lnbmVkIGJlZm9yZSBtb3VudGluZyBpdC4g
IFRoYXQncyB3aGF0IGl0IHdhcyBkZXNpZ25lZCBmb3IKPj4gPiBhbmQgaXMgaW5kZXBlbmRlbnQg
b2YgdGhlIGJsb2NrIGRldmljZSB0eXBlLgo+Pgo+PiBNVERzIGFyZSBub3QgYmxvY2sgZGV2aWNl
cy4gOi0pCj4+Cj4gSXMgaXQgcG9zc2libGUgdG8gdXNlIGRtLXZlcml0eSB3aXRoIHNxdWFzaGZz
ID8KPiBXZSBhcmUgdXNpbmcgc3F1YXNoZnMgZm9yIG91ciByb290ZnMgd2hpY2ggaXMgYW4gTVRE
IGJsb2NrIC9kZXYvbXRkYmxvY2s0NAoKV2VsbCwgaWYgeW91IGVtdWxhdGUgYSBibG9jayBkZXZp
Y2UgdXNpbmcgbXRkYmxvY2ssIHlvdSBjYW4gdXNlIGRtLXZlcml0eSBhbmQgZnJpZW5kcy4KQWxz
byBjb25zaWRlciB1c2luZyB1YmlibG9jay4gSXQgb2ZmZXJzIGJldHRlciBwZXJmb3JtYW5jZSBh
bmQgd2VhciBsZXZlbGluZyBzdXBwb3J0LgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
