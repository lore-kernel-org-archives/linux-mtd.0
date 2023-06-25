Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E1FEB64DC
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Jun 2023 09:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HNkfMVQ+zcTGW8UzMZeSnNTn90FVzfZGJcR0CG6Mtto=; b=WLl5jRBu7Rc9I1
	b3vTKM3+Ii38HL2BdsUf6wIzQrY1EEbWCPMqYJy3PaDtFH0bQUvT+jyilFq4OTkpAffNE0lh9m0O0
	b4AmKYmKbHYknNTcNGqBM3xOLhF0ky6bWxmk1SHkyeIlFjNsZpMtN581+86Ogz18A7DM84nWV1tU9
	QRbXghycIz5zb4oJAPbVmoyidezsMbQ8wb6+xhI+Ri+HxjdAqBT7Lt8iBtGYMZBB6UKDFyTBbV09j
	zxMpXbbWd2aMgtbWDdwhGDEJGLmZeGRcJI/8kaJtyVhfe7yEHNl8sLYT4nSNZ0PV1Lud5O8+Fi2Cg
	0Rgso72TPqywz1/rH1Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDLnB-007Y1i-0y;
	Sun, 25 Jun 2023 09:12:21 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDLn8-007Y0A-0x
	for linux-mtd@lists.infradead.org;
	Sun, 25 Jun 2023 09:12:19 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b69f71a7easo1031551fa.1
        for <linux-mtd@lists.infradead.org>; Sun, 25 Jun 2023 02:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687684324; x=1690276324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kppE/1aeZz73sSj584qwbxqHiJbo+GK5PP0QhEK9lPs=;
        b=X6vjvdRUWOoDKNEOxsMIRf0LlUv2MBVLMiSIW4+HZKxaqplikdZhdeN1+shXxkde5Z
         Ujq007RKCoQ0ymqc4k8vsmxUIZqcJE05gKc+liQ/yq5ZumMSRFUssjex5UyeywmKAN7A
         ytYKIJzJULiPZ02f0y/IpWFZqimrfAihXc8u1TTPEAt53rncVHtPedj6+Ymuw6CYx9JM
         pDtK4JitaiBEpvU5Z1WH3lC5H6/H8/B3Xsfu6aJdow1hgBU+I/P95WFDagMHmgp/4YyH
         wHoW49IeM2ZdKHxHqqTuZl5adFvFcfFtBAe4t0kbM0b37TPlYrq2CkZiEjfbRue9C/kT
         zqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687684324; x=1690276324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kppE/1aeZz73sSj584qwbxqHiJbo+GK5PP0QhEK9lPs=;
        b=PMYhs7A6qgykU5gUD+Nqk9QJNp4glWn1CmgHAatRd87rwQlbrZtmII7x8HfyDLG0zQ
         hiK5BIbvH33HTFpJ7k0zLqI+OTx8Sq2Abq4XXiL0WjmmjkKJhm1MnrGZxiv95xnd8BZs
         zWS5G3ZMO57RZ1qz4vbfVanukuGbJX7b6nl7SaVRNf+ena30mNRp7jwo6KBx0Kwt84u2
         kQgKVep+pki8JJikgdS/bo/o6lYt+hfldtVbfViGf78LRei07U55VtrZTarCG2cTWbAz
         nOUshVTuzMG1QnYH5OZqjoeNHGFtHZhrIhXC/1ITX38BV9SaAOa2Rq15//9Mrtyb1bAW
         pbfA==
X-Gm-Message-State: AC+VfDxbluISMw44M1LR37JbmZAeYIauDH69YCgTdsOr3eNOjrSujlzA
	obbFDC1C+75QUSDgFH89OFbYrXBwxgXnN6Fg710=
X-Google-Smtp-Source: ACHHUZ7NeeVbEhQyhlAtClXP+KKnObAPnXzqWhDhWldSrMLAqtfVqaCSEqzKkFTdgtshoznsAnZxVQzmh9h0D1uGQhs=
X-Received: by 2002:a2e:95d7:0:b0:2b4:65bf:d7b with SMTP id
 y23-20020a2e95d7000000b002b465bf0d7bmr13715273ljh.2.1687684324041; Sun, 25
 Jun 2023 02:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAMeyCbi16i4mdkOnqYhbW1tnqNwPwg2FVYqbdyhXt1fT10EaUw@mail.gmail.com>
 <20230621152556.qcjarclgbagkygdt@umbrella> <CAMeyCbgmiNTpV5_sbP3dq0TNJBBxcW8j0SRM+dxbjQXWAShDBg@mail.gmail.com>
 <CAMeyCbhb2wV8-kmjaihjT3vQsFs-zzix77ztG7Z9E4VdEZOHOQ@mail.gmail.com>
In-Reply-To: <CAMeyCbhb2wV8-kmjaihjT3vQsFs-zzix77ztG7Z9E4VdEZOHOQ@mail.gmail.com>
From: Kegl Rohit <keglrohit@gmail.com>
Date: Sun, 25 Jun 2023 11:11:52 +0200
Message-ID: <CAMeyCbjWSJChDatzwTCKhW9iU=E_+=BLXAmpgR4DnFLJ7koh2Q@mail.gmail.com>
Subject: Re: mtd: raw: nand: gpmi-nand data corruption @ v5.10.184
To: "han.xu" <han.xu@nxp.com>
Cc: linux-mtd@lists.infradead.org, stable@vger.kernel.org, 
	s.hauer@pengutronix.de, miquel.raynal@bootlin.com, tomasz.mon@camlingroup.com, 
	gregkh@linuxfoundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_021218_358369_5317AA26 
X-CRM114-Status: GOOD (  27.95  )
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

SGVsbG8hCgpGb2xsb3dpbmcgdG8gdGhlIGluaXRpYWwgZGlzY3Vzc2lvbgpodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyMjA3MDExMTAzNDEuMzA5NDAyMy0xLXMuaGF1ZXJAcGVuZ3V0cm9u
aXguZGUKd2hpY2ggY2F1c2VkIHRoZSByZXZlcnQgY29tbWl0OgpBcmUgdGhlcmUgYW55IHBsYW5z
IHRvIGZpeCB0aGlzIGlzc3VlIGZvciA1LjEwLnkgKGFuZCBtYXliZSBvdGhlcgpzdGFibGUgYnJh
bmNoZXMpPwoKVGhhbmtzIGluIGFkdmFuY2UhCgpPbiBUaHUsIEp1biAyMiwgMjAyMyBhdCA2OjQ2
4oCvQU0gS2VnbCBSb2hpdCA8a2VnbHJvaGl0QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBZnRlciBy
ZXZlcnRpbmcgdGhlIHJldmVydCA6KSwgdGhlIGRhdGEgY29ycnVwdGlvbiBkaWQgbm90IGhhcHBl
biBhbnltb3JlIQo+Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvcnQvbGludXgtc3RhYmxlLXJ0LmdpdC9jb21taXQvZHJpdmVycy9tdGQvbmFuZC9yYXcv
Z3BtaS1uYW5kL2dwbWktbmFuZC5jP2g9djUuMTAuMTg0LXJ0OTAmaWQ9Y2M1ZWUwZTBlZWQwYmVj
MmI3Y2MxZDBmZWI5NDA1ZTg4NGVhY2U3ZAo+Cj4gT24gV2VkLCBKdW4gMjEsIDIwMjMgYXQgNzo1
NeKAr1BNIEtlZ2wgUm9oaXQgPGtlZ2xyb2hpdEBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IG9r
LCBsb29raW5nIGF0IHRoZSA1LjEwLjE4NCBncG1pLW5hbmQuYzoKPiA+Cj4gPiAjZGVmaW5lIEJG
X0dQTUlfVElNSU5HMV9CVVNZX1RJTUVPVVQodikgXAo+ID4gKCgodikgPDwgQlBfR1BNSV9USU1J
TkcxX0JVU1lfVElNRU9VVCkgJiBCTV9HUE1JX1RJTUlORzFfQlVTWV9USU1FT1VUKQo+ID4KPiA+
IGh3LT50aW1pbmcxID0gQkZfR1BNSV9USU1JTkcxX0JVU1lfVElNRU9VVChidXN5X3RpbWVvdXRf
Y3ljbGVzICogNDA5Nik7Cj4gPgo+ID4gYW5kIHRoZW4gNS4xOSAodXBzdHJlYW0gcGF0Y2ggc291
cmNlIDBmZGRmOWFkMDZmZDlmNDM5ZjEzNzEzOTg2MTU1NjY3MTY3M2UzMWMpCj4gPiBodHRwczov
L2dpdGh1Yi5jb20vZ3JlZ2toL2xpbnV4L2NvbW1pdC8wZmRkZjlhZDA2ZmQ5ZjQzOWYxMzcxMzk4
NjE1NTY2NzE2NzNlMzFjI2RpZmYtMGRlYzJmYTg2NDBlYTIwNjc3ODljNDA2YWIxZTQyYzk4MDVk
MGQwZmM5ZjcwYTNhMjlkMTdmOTMxMWUyM2NhMkw4OTMKPiA+Cj4gPiBody0+dGltaW5nMSA9IEJG
X0dQTUlfVElNSU5HMV9CVVNZX1RJTUVPVVQoRElWX1JPVU5EX1VQKGJ1c3lfdGltZW91dF9jeWNs
ZXMsCj4gPiA0MDk2KSk7Cj4gPgo+ID4gY291bGQgYmUgdGhlIGNhdXNlLiBESVZfUk9VTkRfVVAg
aXMgbW9zdCBsaWtlbHkgYSBkaXZpc2lvbiBhbmQKPiA+IGJ1c3lfdGltZW91dF9jeWNsZXMgKiA0
MDk2IGEgbXVsdGlwbGljYXRpb24hCj4gPgo+ID4gVGhlIGJhY2twb3J0IGlzIHdyb25nLCBiZWNh
dXNlIG9uIHRoZSA1LjEwIGtlcm5lbCB0cmVlIGNvbW1pdAo+ID4gY2M1ZWUwZTBlZWQwYmVjMmI3
Y2MxZDBmZWI5NDA1ZTg4NGVhY2U3ZCB3YXMgcmV2ZXJ0ZWQgYW5kIG9uIG1haW5saW5lCj4gPiBu
b3QuCj4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9y
dC9saW51eC1zdGFibGUtcnQuZ2l0L2NvbW1pdC9kcml2ZXJzL210ZC9uYW5kL3Jhdy9ncG1pLW5h
bmQvZ3BtaS1uYW5kLmM/aD12NS4xMC4xODQtcnQ5MCZpZD1jYzVlZTBlMGVlZDBiZWMyYjdjYzFk
MGZlYjk0MDVlODg0ZWFjZTdkCj4gPgo+ID4gPT4gbm93IGluIDUuMTAuMTg0IHRoaXMgbGluZSAi
aHctPnRpbWluZzEgLi4uIiBpcyB3cm9uZyEKPiA+Cj4gPiAgSSB3aWxsIHRlc3QgdGhpcyB0b21v
cnJvdy4KPiA+Cj4gPiBPbiBXZWQsIEp1biAyMSwgMjAyMyBhdCA1OjI24oCvUE0gaGFuLnh1IDxo
YW4ueHVAbnhwLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIDIzLzA2LzIxIDA0OjI3UE0sIEtl
Z2wgUm9oaXQgd3JvdGU6Cj4gPiA+ID4gSGVsbG8hCj4gPiA+ID4KPiA+ID4gPiBVc2luZyBpbXg3
ZCBhbmQgcnQgc3RhYmxlIGtlcm5lbCB0cmVlLgo+ID4gPiA+Cj4gPiA+ID4gQWZ0ZXIgdXBncmFk
aW5nIHRvIHY1LjEwLjE4NC1ydDkwIHRoZSByb290ZnMgdWJpZnMgbXRkIHBhcnRpdGlvbiBnb3Qg
Y29ycnVwdGVkLgo+ID4gPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3J0L2xpbnV4LXN0YWJsZS1ydC5naXQvdGFnLz9oPXY1LjEwLjE4NC1ydDkwCj4g
PiA+ID4KPiA+ID4gPiBBZnRlciByZXZlcnRpbmcgdGhlIGxhdGVzdCBwYXRjaAo+ID4gPiA+IChl
NGU0YjI0YjQyZTcxMGRiMDU4Y2MyYTc5YTdjZjE2YmYwMmI0OTE1KSwgdGhlIHJvb3RmcyBwYXJ0
aXRpb24gZGlkCj4gPiA+ID4gbm90IGdldCBjb3JydXB0ZWQuCj4gPiA+ID4gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcnQvbGludXgtc3RhYmxlLXJ0Lmdp
dC9jb21taXQvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbmFuZC5jP2g9djUu
MTAuMTg0LXJ0OTAmaWQ9ZTRlNGIyNGI0MmU3MTBkYjA1OGNjMmE3OWE3Y2YxNmJmMDJiNDkxNQo+
ID4gPiA+Cj4gPiA+ID4gVGhlIGNvbW1pdCBtZXNzYWdlIHN0YXRlcyB0aGUgdGltZW91dCBjYWxj
dWxhdGlvbiB3YXMgY2hhbmdlZC4KPiA+ID4gPiBIZXJlIGFyZSB0aGUgY2FsY3VsYXRlZCB0aW1l
b3V0cyBgYnVzeV90aW1lb3V0X2N5Y2xlc2AgYmVmb3JlIChfb2xkKQo+ID4gPiA+IGFuZCBhZnRl
ciB0aGUgcGF0Y2ggKF9uZXcpOgo+ID4gPiA+Cj4gPiA+ID4gWyAgICAwLjQ5MTUzNF0gYnVzeV90
aW1lb3V0X2N5Y2xlc19vbGQgNDM1Mwo+ID4gPiA+IFsgICAgMC40OTE2MDRdIGJ1c3lfdGltZW91
dF9jeWNsZXNfbmV3IDE0MjQ3MDUKPiA+ID4gPiBbICAgIDAuNDkyMzAwXSBuYW5kOiBkZXZpY2Ug
Zm91bmQsIE1hbnVmYWN0dXJlciBJRDogMHhjMiwgQ2hpcCBJRDogMHhkYwo+ID4gPiA+IFsgICAg
MC40OTIzMTBdIG5hbmQ6IE1hY3Jvbml4IE1YMzBMRjRHMjhBQwo+ID4gPiA+IFsgICAgMC40OTIz
MTZdIG5hbmQ6IDUxMiBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtpQiwgcGFnZSBzaXplOgo+
ID4gPiA+IDIwNDgsIE9PQiBzaXplOiAxMTIKPiA+ID4gPiBbICAgIDAuNDkyNDg4XSBidXN5X3Rp
bWVvdXRfY3ljbGVzX29sZCA0MzUzCj4gPiA+ID4gWyAgICAwLjQ5MjQ5M10gYnVzeV90aW1lb3V0
X2N5Y2xlc19uZXcgMTQyNDcwNQo+ID4gPiA+IFsgICAgMC40OTI4NjNdIGJ1c3lfdGltZW91dF9j
eWNsZXNfb2xkIDI1MTAKPiA+ID4gPiBbICAgIDAuNDkyODcyXSBidXN5X3RpbWVvdXRfY3ljbGVz
X25ldyAzNTAwMDAKPiA+ID4gPgo+ID4gPiA+IFRoZSBuZXcgdGltZW91dHMgYXJlIHNldCBhIGxv
dCBoaWdoZXIuIEhpZ2hlciB0aW1lb3V0cyBzaG91bGQgbm90IGJlCj4gPiA+ID4gYW4gaXNzdWUu
IExvd2VyIHRpbWVvdXRzIGNvdWxkIGJlIGFuIGlzc3VlLgo+ID4gPiA+IEJ1dCBiZWNhdXNlIG9m
IHRoaXMgaGlnaCB0aW1lb3V0cyBncG1pLW5hbmQgaXMgYnJva2VuIGZvciB1cy4KPiA+ID4gPgo+
ID4gPiA+IEZvciBub3cgd2Ugc2ltcGxlIHJldmVydGVkIHRoZSBjaGFuZ2UuCj4gPiA+ID4gVGhl
IG5ldyBjYWxjdWxhdGlvbnMgc2VlbSB0byBiZSBmbGFreSwgYSBwcmV2aW91cyAiZml4IGJhY2tw
b3J0IiB3YXMKPiA+ID4gPiBhbHJlYWR5IHJldmVydGVkIGJlY2F1c2Ugb2YgZGF0YSBjb3JydXB0
aW9uLgo+ID4gPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L3J0L2xpbnV4LXN0YWJsZS1ydC5naXQvY29tbWl0L2RyaXZlcnMvbXRkL25hbmQvcmF3L2dw
bWktbmFuZC9ncG1pLW5hbmQuYz9oPXY1LjEwLjE4NC1ydDkwJmlkPWNjNWVlMGUwZWVkMGJlYzJi
N2NjMWQwZmViOTQwNWU4ODRlYWNlN2QKPiA+ID4gPgo+ID4gPiA+IEFueSBndWVzc2VzIHdoeSB0
aGUgaGlnaCB0aW1lb3V0IGNhdXNlcyBpc3N1ZXM/Cj4gPiA+Cj4gPiA+IGhpZ2ggdGltZW91dCB3
aXRoIHdyb25nIGNhbGN1bGF0aW9uIG1heSBvdmVyZmxvdyBhbmQgY2F1c2VzIERFVklDRV9CVVNZ
X1RJTUVPVVQKPiA+ID4gcmVnaXN0ZXIgdHVybnMgdG8gYmUgMC4KPiA+ID4KPiA+ID4gPgo+ID4g
PiA+Cj4gPiA+ID4gVGhhbmtzIGluIGFkdmFuY2UhCj4gPiA+ID4KPiA+ID4gPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gPiBMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKPiA+ID4gPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
