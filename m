Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43C2C38A2D
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Oct 2022 22:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GcO0e7Swpz0DKofu2YF+HyCQiCtQnEyNkdD0UbIpRKU=; b=huw178a0BkX7VS
	XfBZumE0UO6l/WeGNk1Fzfbg8uf9Xv9tPkgfXQsASumG4f+3m35LLE3oDtsJoqGIkCznML/r2js5I
	ciuc3YwA3mY8je7Fct0xFWkYI434ltC9X+uCGLobSY/ZxtbPz4eQqvUlR82/UIoYd6yF/3YrLTC25
	0YFg5dq5Szogpl9iWrhVZJsMq3RoXVAn3gAoemOLlRlz75SKpXXI29ounnSiwvR7PSS7koJdfFtW6
	axgLJQxwnHG9pWiesofYje0BTTXq1oNQs4RiopO/1/QmdlqCiPsLMBWtvytysOe37BO63G4W7/p1X
	TF26Fgo/HBbmCc37jlFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onS0T-007Kgk-BK; Tue, 25 Oct 2022 22:02:45 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onS0Q-007KfG-Fl
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2022 22:02:44 +0000
Received: by mail-pf1-x432.google.com with SMTP id e4so9377704pfl.2
        for <linux-mtd@lists.infradead.org>; Tue, 25 Oct 2022 15:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GULGi86qMTyl7yyM+IR6+fSHJnsFKzqqvsOZYIrPIEA=;
        b=yMkIBo+9K/7j4XtPEWCALFJ8qi8nKrlDbujqGihobWEAHVxMGYkVwLm7Xfadbxez36
         psK4XmcMcprxBRL4C27mDuTG84I1wwIRlc5CZiyiIeRl0DCFYnTjPHStOXafDZCni6hP
         9eujcK8XhH0cphTjmjHMrOAKHkHXtpwLd0fDuQ96z7SpJhHYSpzY8ntxwm9h3OXVwtKD
         Rk8wzYlwFR984r0sfnCVx+crp7EtQ6i2KDKMeF77bJLNWXeWuRP7zRq12ls9iE5qDsXm
         hddOC7/vI4iUJz1CZNRXkfyK5QrrZBei2DNnWarihFtLyA/Z9KsjzBwn8h20ifUPZ0sl
         d0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GULGi86qMTyl7yyM+IR6+fSHJnsFKzqqvsOZYIrPIEA=;
        b=2l3EALoOROif4VJKsDUqxIQ71yWb2z0gFPsfGR8ut6ZGjyT05eehiBm1ZDM1Z9uip3
         tNc2Vv4tHF9+jMk3lDillcjh23BTc0woEmQ1LQryNAC+aQc7V1zfgR1Qx2At7OMm3zI0
         fxM375S/dkbDXmmELIzR8c5ik5/c6zlQAqlF85Kik1nbCLcgQ4WrsuNrTo03GWFf8o7Z
         pYTRnShhUu2CJhRq1csSfsgicxA7eNHdqXEmOEfsBqJik5q8LMGchTAn4h6Ux93hegi+
         hGWMnwfxKoT3torAqJzGyAkwn84KUgPObdfadakv+j2svDj7KQSVweJhytyX1KEet6rb
         4pWQ==
X-Gm-Message-State: ACrzQf31Z9evHHUAkJpOoWx6EdC0t438rnLpuPChLSFmCk8QXfEZZq4O
	qnP7hXJvJkwRg38BPyMul4vCaF0O2+qIbhPInb2cDA==
X-Google-Smtp-Source: AMsMyM5uOo4rfSRMj6gzeQ037m7SbQEtvITCCr8NDm7Z6h1PJvuafoJ8AQingLCjrWnrTvAh/HXbnqt/o4mbJThtvHU=
X-Received: by 2002:a05:6a00:851:b0:563:6c6a:2b7b with SMTP id
 q17-20020a056a00085100b005636c6a2b7bmr40763296pfk.45.1666735359645; Tue, 25
 Oct 2022 15:02:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220701110341.3094023-1-s.hauer@pengutronix.de>
 <c2d545d1f5478e66c0dac47f4bc4c04256ff44aa.camel@camlingroup.com>
 <fd830c7e94de6b4a0b532dfcf46cf1edd22b42fb.camel@camlingroup.com>
 <YtD/9KJZwlVj+6hS@kroah.com> <20220715074631.GA7333@pengutronix.de>
 <YtEdIujszEKSprbF@kroah.com> <770744970.283550.1657871950910.JavaMail.zimbra@nod.at>
 <20220902090252.75285234@xps-13> <CAJ+vNU0r3Enkwn+WzvEJYc_O4NurRyCssx2S-_ZS_cYCpk2-cA@mail.gmail.com>
 <20221024100114.627f87bd@xps-13>
In-Reply-To: <20221024100114.627f87bd@xps-13>
From: Tim Harvey <tharvey@gateworks.com>
Date: Tue, 25 Oct 2022 15:02:27 -0700
Message-ID: <CAJ+vNU2R=FVSpRVWh8RBJ7XZmRRjkqHce1WTGXDKrjeHRbuzSw@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: Set WAIT_FOR_READY timeout based on
 program/erase times
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?Q?Tomasz_Mo=C5=84?= <tomasz.mon@camlingroup.com>, 
	Richard Weinberger <richard@nod.at>, linux-mtd <linux-mtd@lists.infradead.org>, 
	Sasha Levin <sashal@kernel.org>, torvalds <torvalds@linux-foundation.org>, 
	Han Xu <han.xu@nxp.com>, kernel <kernel@pengutronix.de>, stable <stable@vger.kernel.org>, 
	k drobinski <k.drobinski@camlintechnologies.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_150242_558378_793FDD5A 
X-CRM114-Status: GOOD (  29.16  )
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

T24gTW9uLCBPY3QgMjQsIDIwMjIgYXQgMTowMSBBTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIFRpbSwKPgo+IHRoYXJ2ZXlAZ2F0ZXdvcmtz
LmNvbSB3cm90ZSBvbiBGcmksIDIxIE9jdCAyMDIyIDE0OjU1OjE1IC0wNzAwOgo+Cj4gPiBPbiBG
cmksIFNlcCAyLCAyMDIyIGF0IDEyOjAzIEFNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBIZXkgZm9sa3MsCj4gPiA+Cj4gPiA+IHJp
Y2hhcmRAbm9kLmF0IHdyb3RlIG9uIEZyaSwgMTUgSnVsIDIwMjIgMDk6NTk6MTAgKzAyMDAgKENF
U1QpOgo+ID4gPgo+ID4gPiA+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0KPiA+ID4g
PiA+PiBNeSBJUkMgaGlzdG9yeSBkb2Vzbid0IGdvIGJhY2sgZmFyIGVub3VnaCwgYnV0IGlmIEkg
cmVjYWxsIGNvcnJlY3RseQo+ID4gPiA+ID4+IE1pcXVlbCBpcyBvbiB2YWNhdGlvbiwgaGUgd291
bGQgaGF2ZSBwaWNrZWQgdXAgdGhpcyBwYXRjaCBmb3IgbGludXgtbmV4dAo+ID4gPiA+ID4+IG90
aGVyd2lzZS4KPiA+ID4gPgo+ID4gPiA+IEV4YWN0bHkuCj4gPiA+Cj4gPiA+IEluZGVlZCwgSSB3
YXMgb2ZmIGZvciBhbiBleHRlbmRlZCBwZXJpb2Qgb2YgdGltZSwgSSdtICh2ZXJ5KSBzbG93bHkK
PiA+ID4gY2F0Y2hpbmcgdXAgbm93Lgo+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gPiBPaywgbGV0IG1l
IGRvIGEgcm91bmQgb2Ygc3RhYmxlIHJlbGVhc2VzIHNvIHRoYXQgcGVvcGxlIGRvbid0IGdldCBo
aXQgYnkKPiA+ID4gPiA+IHRoaXMgbm93Li4uCj4gPiA+ID4KPiA+ID4gPiBUaGFua3MgYSBsb3Qg
Zm9yIGRvaW5nIHNvLgo+ID4gPiA+Cj4gPiA+ID4gPiBIb3BlZnVsbHkgdGhpcyBnZXRzIGZpeGVk
IHVwIGJ5IDUuMTktZmluYWwuCj4gPiA+ID4KPiA+ID4gPiBTdXJlLCBJJ2xsIHBpY2t1cCB0aGlz
IHBhdGNoLgo+ID4gPgo+ID4gPiBUaGFua3MgR3JlZyAmIFJpY2hhcmQgZm9yIHRoZSBoYW5kbGlu
ZyBvZiB0aGlzIGlzc3VlLgo+ID4gPgo+ID4gPiBDaGVlcnMsCj4gPiA+IE1pcXXDqGwKPiA+ID4K
PiA+Cj4gPiBIZWxsbyBBbGwsCj4gPgo+ID4gQXMgVG9tYXN6IHN0YXRlZCBwcmV2aW91c2x5IDA2
NzgxYTUwMjYzNTAgd2FzIG1lcmdlZCBpbiB2NS4xOS1yYzQgYW5kCj4gPiB0aGVuIHdhcyBwaWNr
ZWQgdXAgYnkgc2V2ZXJhbCBzdGFibGUga2VybmVscy4gV2hpbGUgdGhpcyBtYWRlIGl0IGludG8K
PiA+IHRoZSA1LjE1IGFuZCA1LjE4IHN0YWJsZSBicmFuY2hlcyBpdCBkaWQgbm90IG1ha2UgaXQg
aW50byB0aGUKPiA+IGZvbGxvd2luZyB3aGljaCBhcmUgdGh1cyB0aGUgYXJlIGN1cnJlbnRseSBi
cm9rZW46Cj4gPiA1LjEwLnkKPiA+IDUuMTcueQo+ID4KPiA+IEhvdyBkbyB3ZSBnZXQgdGhpcyBw
YXRjaCBhcHBsaWVkIHRvIHRob3NlIHN0YWJsZSBicmFuY2hlcyBhcyB3ZWxsIHRvCj4gPiByZXNv
bHZlIHRoaXM/Cj4KPiBJdCBpcyBsaWtlbHkgdGhhdCB0aGUgb3JpZ2luYWwgcGF0Y2ggKHRhcmdl
dGluZyBhIG1haW5saW5lIGtlcm5lbCkgZGlkCj4gbm90IGFwcGx5IHRvIHRob3NlIGJyYW5jaGVz
LiBJbiB0aGlzIGNhc2UgeW91IGNhbiBhZGFwdCB0aGUgZml4IHRvIHRoZQo+IGNvbmNlcm5lZCBr
ZXJuZWxzIGFuZCBzZW5kIGl0IHRvIHN0YWJsZUAgKGZvbGxvd2luZyB0aGUgRG9jdW1lbnRhdGlv
bgo+IGd1aWRlbGluZXMgZm9yIGJhY2twb3J0cykuCj4KPiBUaGFua3MsCj4gTWlxdcOobAoKTWlx
dcOobCwKClRoYW5rcyBmb3IgdGhlIHBvaW50ZXIuIFlvdSBhcmUgY29ycmVjdCB0aGF0IHRoaXMg
cGF0Y2ggd2hpY2ggcmVzb2x2ZXMKdGhlIHJlZ3Jlc3Npb24gZG9lcyBub3QgYXBwbHkgZGlyZWN0
bHkgdG8gNS40LzUuMTAvNS4xNyBzdGFibGUgdHJlZXMuCkknbSBsb29raW5nIG92ZXIKaHR0cHM6
Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC92NC4xMC9wcm9jZXNzL3N0YWJsZS1rZXJuZWwtcnVs
ZXMuaHRtbAphbmQgSSdtIG5vdCBjbGVhciB3aGF0IEkgbmVlZCB0byBwdXQgaW4gdGhlIGNvbW1p
dCB0byBtYWtlIGl0IGNsZWFyCnRoYXQgaXQgb25seSBhcHBsaWVzIHRvIHRob3NlIHNwZWNpZmlj
IHRyZWVzLiBEbyBJIHNpbXBseSBhZGp1c3QgdGhlCidGaXhlcycgdGFnIHRvIGFkZHJlc3MgdGhl
IGNvbW1pdCBmcm9tIHRoYXQgc3BlY2lmaWMgc3RhYmxlIGJyYW5jaCBhbmQKc2VuZCBvbmUgZm9y
IGVhY2ggc3RhYmxlIGJyYW5jaCAodGh1cyBlYWNoIHdvdWxkIGhhdmUgYSBkaWZmZXJlbnQgc2hh
CmluIHRoZSBGaXhlcyB0YWcpIHdoaWxlIGFsc28gYWRkaW5nIHRoZSAnY29tbWl0IDxzaGE+IHVw
c3RyZWFtJyB0byB0aGUKdG9wPwoKQmVzdCBSZWdhcmRzLgoKVGltCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
