Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CC4C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 23:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CaDRMdVo+47SZWWOQckQxbCfXl5S+zSrHaRwUoMjBdw=; b=d1aLuJ63It8GYH
	0gq0Bmu7HhkmWzhOFediHuXiAAOSt4iatBS1bErFvyAZt99r3pQy5tbbKkxsQ2TI4pbItOVd80064
	NPa3TK1AWCnMtf8PimYP1fwLnn3WdBP7oWcIDa63V9Ptknw9Iw4nCw+65PWCmrbu7z7SzaM0Tdgu4
	Jz82XHFEgoD99MjkMUxuPmQCYyjaE9dHpXroTa7NBDnhSJmy8dpj+WJj33ujWFZL9r/sCXlTG5E2h
	JxHb5jv7UPN9Wzmkd6pufQLS13GUIZCrTiT6AW+VotA2z7CZLgmKEkMO0sGhHt7Ha5mh4EwQ/5Iyv
	423Z3SMkrFJ395DN4JuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nN0hr-00GEU9-12; Wed, 23 Feb 2022 23:05:59 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nN0hn-00GETf-Rd
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 23:05:57 +0000
Received: by mail-oi1-f169.google.com with SMTP id p15so679465oip.3
 for <linux-mtd@lists.infradead.org>; Wed, 23 Feb 2022 15:05:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3r5t1BZ2p1mxeTLa/fA709uGdwqY7SoYynbbr5cNx44=;
 b=qaGJDatgvUewq1S/NNpPzPK4RA8YRNsAVDeolORZ0jjpk8IZug3xxb7XBTKQGhcdkq
 w51hx5dTCBaCVqWZMcRIHyJtwiLnSsHw6I2RAk1w18O8/iOWn96eD99hQHeOIlZQ8Jlj
 vsqO7zNsJUAAK3Cn5pfCU8gggVDdU1hETrWl/iMwKQs9KrN4uqIHWDxnrU80QV8lOfvu
 Lek5SE4nt/4+jGacMqXSDvPXMQF8RteOvWuNhIoF2vhjDq7qIsCM1Ht+FVmOnxEErhl3
 84BLKNSGlmvD04QNjxc/PgOqrjfZdGJ386O+Ajpv2lMr+Nvnci5VyuAfQK7OrIwPcXw1
 u7dQ==
X-Gm-Message-State: AOAM532rW9jEUvKCyiQ8cciBkzjAHGj8EsHst9GkWG7uQI6LD/ySmVLY
 bySN6jKquxAiQLM3ec2gow==
X-Google-Smtp-Source: ABdhPJxLVpH38lEVzYq6cC0hsmMPQVlqjq0E4ftOeyOe5iVq0usoT4WvFeiBoGd+DUNK9N8O+SYHnQ==
X-Received: by 2002:aca:5fd4:0:b0:2c9:f05e:4f75 with SMTP id
 t203-20020aca5fd4000000b002c9f05e4f75mr1101747oib.167.1645657554504; 
 Wed, 23 Feb 2022 15:05:54 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bg30sm577252oib.4.2022.02.23.15.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 15:05:53 -0800 (PST)
Received: (nullmailer pid 1703966 invoked by uid 1000);
 Wed, 23 Feb 2022 23:05:53 -0000
Date: Wed, 23 Feb 2022 17:05:53 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, devicetree@vger.kernel.org,
 Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [PATCH] dt-bindings: mtd: partitions: convert Broadcom's TRX to
 the json-schema
Message-ID: <Yha90XxGrRJZ/ANR@robh.at.kernel.org>
References: <20220216104126.31284-1-zajec5@gmail.com>
 <1645070363.930966.2266015.nullmailer@robh.at.kernel.org>
 <3be13bc2-f8b1-193b-9a36-92d4336d9d28@milecki.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3be13bc2-f8b1-193b-9a36-92d4336d9d28@milecki.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_150555_915853_D911A62D 
X-CRM114-Status: GOOD (  14.76  )
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

T24gVGh1LCBGZWIgMTcsIDIwMjIgYXQgMDg6NDM6MjNBTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IEhpIFJvYiwKPiAKPiBPbiAxNy4wMi4yMDIyIDA0OjU5LCBSb2IgSGVycmluZyB3
cm90ZToKPiA+IE9uIFdlZCwgMTYgRmViIDIwMjIgMTE6NDE6MjYgKzAxMDAsIFJhZmHFgiBNacWC
ZWNraSB3cm90ZToKPiA+ID4gRnJvbTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBs
Pgo+ID4gPiAKPiA+ID4gVGhpcyBoZWxwcyB2YWxpZGF0aW5nIERUUyBmaWxlcy4KPiA+ID4gCj4g
PiA+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiA+
ID4gLS0tCj4gPiA+ICAgLi4uL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2JyY20sdHJ4LnR4dCAg
ICAgIHwgNDIgLS0tLS0tLS0tLS0tLS0tCj4gPiA+ICAgLi4uL2JpbmRpbmdzL210ZC9wYXJ0aXRp
b25zL2JyY20sdHJ4LnlhbWwgICAgIHwgNTEgKysrKysrKysrKysrKysrKysrKwo+ID4gPiAgIDIg
ZmlsZXMgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pCj4gPiA+ICAg
ZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
cGFydGl0aW9ucy9icmNtLHRyeC50eHQKPiA+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25zL2JyY20sdHJ4LnlhbWwK
PiA+ID4gCj4gPiAKPiA+IE15IGJvdCBmb3VuZCBlcnJvcnMgcnVubmluZyAnbWFrZSBEVF9DSEVD
S0VSX0ZMQUdTPS1tIGR0X2JpbmRpbmdfY2hlY2snCj4gPiBvbiB5b3VyIHBhdGNoIChEVF9DSEVD
S0VSX0ZMQUdTIGlzIG5ldyBpbiB2NS4xMyk6Cj4gPiAKPiA+IHlhbWxsaW50IHdhcm5pbmdzL2Vy
cm9yczoKPiA+IAo+ID4gZHRzY2hlbWEvZHRjIHdhcm5pbmdzL2Vycm9yczoKPiA+IC9idWlsZHMv
cm9iaGVycmluZy9saW51eC1kdC1yZXZpZXcvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL210ZC9wYXJ0aXRpb25zL2xpbmtzeXMsbnMtcGFydGl0aW9ucy5leGFtcGxlLmR0LnlhbWw6
IHBhcnRpdGlvbkAyMDAwMDA6IGNvbXBhdGlibGU6MDogJ2JyY20sdHJ4JyB3YXMgZXhwZWN0ZWQK
PiA+IAlGcm9tIHNjaGVtYTogL2J1aWxkcy9yb2JoZXJyaW5nL2xpbnV4LWR0LXJldmlldy9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYnJjbSx0cngueWFt
bAo+ID4gL2J1aWxkcy9yb2JoZXJyaW5nL2xpbnV4LWR0LXJldmlldy9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvbGlua3N5cyxucy1wYXJ0aXRpb25zLmV4
YW1wbGUuZHQueWFtbDogcGFydGl0aW9uQDIwMDAwMDogY29tcGF0aWJsZTogWydsaW5rc3lzLG5z
LWZpcm13YXJlJywgJ2JyY20sdHJ4J10gaXMgdG9vIGxvbmcKPiA+IAlGcm9tIHNjaGVtYTogL2J1
aWxkcy9yb2JoZXJyaW5nL2xpbnV4LWR0LXJldmlldy9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvYnJjbSx0cngueWFtbAo+IAo+IGNvdWxkIHlvdSBhZHZp
c2UgdGhlIGJlc3Qgd2F5IHRvIHNvbHZlIHRoYXQ/CgpZb3Ugc2hvdWxkIG1vdmUgbGlua3N5cyxu
cy1maXJtd2FyZSBmcm9tIGxpbmtzeXMsbnMtcGFydGl0aW9ucy55YW1sIHRvIAp0aGlzIHNjaGVt
YS4gVGhlbiBsaW5rc3lzLG5zLXBhcnRpdGlvbnMueWFtbCBqdXN0IGhhczoKCiAgIl5wYXJ0aXRp
b25AWzAtOWEtZl0rJCI6CiAgICAkcmVmOiAicGFydGl0aW9uLnlhbWwjIgogICAgYWRkaXRpb25h
bFByb3BlcnRpZXM6IHRydWUKClRoYXQncyBub3QgY29tcGxldGVseSBpZGVhbCBiZWNhdXNlIHRo
ZW4gdW5kb2N1bWVudGVkIHByb3BlcnRpZXMgYXJlIAphbGxvd2VkLiBUbyBmaXggdGhhdCwgeW91
J2QgbmVlZDoKCiAgIl5wYXJ0aXRpb25AWzAtOWEtZl0rJCI6CiAgICBvbmVPZjoKICAgICAgLSAk
cmVmOiAicGFydGl0aW9uLnlhbWwjIgogICAgICAtICRyZWY6ICJicmNtLHRyeC55YW1sIyIKICAg
IHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKCkknbSBub3QgMTAwJSBzdXJlIHRoYXQgd2ls
bCB3b3JrLgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
