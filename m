Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D96C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jul 2022 04:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+K7g6S0p0OdyAK9+ZxjnjJhtqizCgRt6XdoAas49ZLs=; b=VmWoRkUJaH5uVd
	CxAkb4mOBMLcMdAAhZMhvOYTMwVKxSXdjWggSroMauvaX7JUMRJpSabhs3TZ0Z6TlYk0G5Lxhr3CK
	lpi7C4J64sF7YpQ7cOpsBeyrhtqfqjlFqJs5gmR526RQONBhb9AB/FiHzFOG3rGV1GfR2Iriw2qTz
	a3hmJaMGD6IC+ak/zezrbTSGgMFxOzc1/JXVZF+44IQBO0UghoKniwN477vVC44f1mXlXJAMdjdIu
	Xj/yi9T29B73Lq7kfVxwNRG/HhMTeghWtXjUheLeEwUrG1yTBmZ6AJ+IannO/b6AvDJ8dSE7yV+gD
	hJ57biblmkmZoK5ELx+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEkJj-00HUff-Bs; Fri, 22 Jul 2022 04:31:11 +0000
Received: from mail-bn1nam07olkn2073.outbound.protection.outlook.com ([40.92.15.73] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEkJf-00HUdr-Lg
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2022 04:31:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FExb+u8B1ZrFNiAtW0DNO8SRzeAPan17fLfjyCv27s5tKVovCBCyMcs1jduhaSDa5RsvwM+YtCCv85Pnrkj5pYJCPQXORlwv7TTFAxIG3+HAJbPO9kUQOfVfDwcucxDMH1HPgs5oIr+Rs4TN3V5WGqig6hSEy+4kpXyfuwmx5vi3HeCima48Tq/KDeLdt1uqKrwikpEydnxW/wAxWklWzyvX25tvVMcq82/TSuI9h3B+L7HGJwxQfOjJhk7Fu6PEDk9Knj0Zit9H0PEQ6567ZnGompfH2nu7imIy0X7rcuAXCDy9dqipsQOXE6BVdy37GS9LZCPfSP4wOQk4psojEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+0/OlY9f7PxUtFaGDbfg0EcPCIDbCVP3ZkT5vWN7bY=;
 b=dlGtTRb8LsE4qKfz3OzeTtNFLPupYrHqUYFu28BRB0s4HYrH+IknwAGWwA87HNoVjZ8IoMkWwK89vgE8gcWg0TrjUO4R5BneYRiy/5TtmDkw7aqc2JO4Ck1ulyIbHqvVzXFHwwVHIlRi35CnLWp8WnCT6U0sm1TWs/kC2LigQWASEPz0KsW/oNViFcOpoSgqNHLeCWVaN124mHvscP+FyfFB/IljgI/FINcZgoiOL1hzFzWXNnrscAEyqwtUB/xYeTCqG841BuRWpxsNXBYFCeqhiwE+9bxwNm5URpFOOndiiPo+OIkk1OfumvwQt/JOmWl0l/LtXDnz/inEeZpDPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+0/OlY9f7PxUtFaGDbfg0EcPCIDbCVP3ZkT5vWN7bY=;
 b=Cuj9ElmwOMf6FPsxJcKbtFTcvDyfy37DjqGyOJZICO5k7z3uoF+VeJw+Xb5M8YBZW3FsPwp1emURFcq1eKL7uvzX8rCPpVa1cGaiYJFwGhHE53ixLp2SHi9PvBUjZLyA6WwQs7MBLrIAvsSEGHpKlV2pvtfkeo1pK+dEuao0YzTBrguRDUc/bwm+CqAW9RysFPdXoaDt3z1YPlGCu9ZP/VCZEzxpTo3XYo+SaSH5lYuJhqX6Ff4Kzx2yce7/AU6tNNby0+UolInyQpDAjtVZhQRgBYSspaiHzrMOhYwsmmbe5nFPLo0KCVKTyxPV42ZZOEJ4QkM3XXYly5rCcmQUcg==
Received: from MN2PR17MB3375.namprd17.prod.outlook.com (2603:10b6:208:13c::25)
 by CY4PR17MB1206.namprd17.prod.outlook.com (2603:10b6:903:97::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 04:31:02 +0000
Received: from MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::48d3:68bb:bdcb:4658]) by MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::48d3:68bb:bdcb:4658%6]) with mapi id 15.20.5438.024; Fri, 22 Jul 2022
 04:31:02 +0000
From: Vanessa Page <Vebpe@outlook.com>
To: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>
CC: "tkuw584924@gmail.com" <tkuw584924@gmail.com>, "michael@walle.cc"
	<michael@walle.cc>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "miquel.raynal@bootlin.com"
	<miquel.raynal@bootlin.com>, "richard@nod.at" <richard@nod.at>,
	"vigneshr@ti.com" <vigneshr@ti.com>, "p.yadav@ti.com" <p.yadav@ti.com>,
	"Bacem.Daassi@infineon.com" <Bacem.Daassi@infineon.com>,
	"Takahiro.Kuwano@infineon.com" <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Thread-Topic: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Thread-Index: AQHYnRvdTEt+bD16DUaYd/6imLQaP62JxPiAgAAFeoCAAAMIUg==
Date: Fri, 22 Jul 2022 04:31:02 +0000
Message-ID:  <MN2PR17MB3375EFA04B3CD8D6F4ED8733B8909@MN2PR17MB3375.namprd17.prod.outlook.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <dac51af409be97ab316a9de5c0297359df7d2e2d.1652063152.git.Takahiro.Kuwano@infineon.com>
 <99cf396f9210279e28dc1656a652efb4@walle.cc>
 <93de6975-c734-06d4-7865-bbe7f90cba4a@gmail.com>
 <0eea594f72858ec0ee099d45da71bc96@walle.cc>
 <57fd05cd-e0a7-b41a-53f0-c419ddc53a1a@gmail.com>
 <4d8146ceecf1f8a89c6a43fa1ac8d81e@walle.cc>
 <c42d5930-73cd-6dbe-f650-db72f35188a5@microchip.com>
 <a035a1a3-0d82-48ab-5d09-1d5164999890@gmail.com>
 <98fa98f2-055c-2338-6790-de99670e20ff@microchip.com>
In-Reply-To: <98fa98f2-055c-2338-6790-de99670e20ff@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [d4ODGscbj1GyFXEfH2VjD+yOgAo63WkzH5iUgHhbSdUGmP4zVSCm9xlvTJxXPJpt]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58f2ce66-de51-4be7-c29c-08da6b9afc14
x-ms-traffictypediagnostic: CY4PR17MB1206:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  n0RV4wnerzkhl223QCLwJHfbNsWMSpC6vbSzhDSut98A8NeMkk/8XFNoJJqFTJOn/b/oIy+h1rjB1ZNuJV5DzVghKsANDRZzqcIC6mJUEws6NPN0ue1cU+Q5AJ6VahNmhw2TT+0ACbI1IXiYg8Ko+qcJ5EyRrL5IMGxNDYJGsDfVEZ7bR4j7u9pmQNZZK2rlQzYbDFYrXyUt65dYggojFFWbHTbRnP/6ek7LtQqLtKxW8fWwC4DCkIMUb+JEQq6Gb1rRjWTyQ/Pzf+9vL1kWLlwtHDs8aoymNNSom/lu+b095MR6tk3KzPJ9MpIOJl/ujujRm+90+pFTiroNb9I5KYDrKtQBtPfufsAagbDhVWDr029MD8Yqm/KEbTM+Ntx5ipfAoOai1QskhE1ZtWAllsW0DbcLzsL2O47lWzmc9dBInne1FT1pBblNcRiu8RbAeAYO5tsYny1xOwp+Qk863oBs6knMmiSGIrSzrvEbJtxTnP09GV7pshTEawAwObDlV8VbU+yRcRWZLTWmeozsMBNMX10HQjaRz9JT8ik8Qf9FACftOe+Iw+Tc0ffhTqauz3ilIK1mmyDrK3jTZnuTpY6KOLWU1vqNMlVqz/U3hZ40xP2Hy+4T51YfuTmJrroSl9DSbllyHwZD5WgQ+Ls+rv1/kWoCWzEzHhDkVigakODzGsP55yH7UTCahCNelhbw
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?SkNLcDdXaWlQRzFrQ3FBelBIdXVHcVREcUNtcEZteWhUUmFKY0NCRXNhZkZk?=
 =?utf-8?B?YU9CTDJCZ09rNlp5TE5sMmlQR3JIL2ErWVRVbVZNVU9xdzFuTXBZMkJRLzZi?=
 =?utf-8?B?RVoyNDlQcUtCaXAxV3ZOaU1FSVhFWFl5Z0E4VEpWN0ZrYWRBaTRGT0ZmTWZ6?=
 =?utf-8?B?Rmc3UndFYUlYZU5hS1lqc1dWZ1NHK0RqeU9hL3RHTFlGcmtrUVEzdy8yT1Ix?=
 =?utf-8?B?U1Z1Qk50K0JkZXdSRE8rMlMyZStHYkdzVE95cU1LNVVCYkE2RjlhM251SWFC?=
 =?utf-8?B?YjR5cUhnQm12MitQL25ZWElmekU0U0dkQVg5SU5DcHhVWms5aVV4YlFvUDlB?=
 =?utf-8?B?eE5OdzNyVS9nNldRMy90aFRRU2g0a0NJWGpKWk1uc1RPK1dscnhBSWpQTkRw?=
 =?utf-8?B?RytXNlFpYVNrWXhOY0RZYnJrTlVIV0ttK25IWTZKeXlVRzBCRUpkUXNtbUpZ?=
 =?utf-8?B?ZkR1ZWVYWVBOV0VISndiRi9qM0FDSHRNRERyWUE5ZkNuVStTV3Brc3R1OWsr?=
 =?utf-8?B?ZEU1aVRicnNBMTFWMms5RDJzc01IeWpUalVidzRqUEoyUytXVmZyRHp4bW16?=
 =?utf-8?B?azQvWjJHS2Vmekp2bUFZL21PeHJIbkYwVUx4YStIa2lOSXBzNWFYNXdBMVMw?=
 =?utf-8?B?WndsUXVrbW9rSjhaSU4rbi9jaFFWdnBQa01Cam12YlFlQUJBMU01WXBqcU5w?=
 =?utf-8?B?ZnU5cUh4NWhENTFsc1JZcmVqaXRTeDUyVGRvdEZXbEpacEpYaWFwYnN5bENU?=
 =?utf-8?B?VDNGUkpCcEZqYjZkQXVaUkhMSHM5bW1oOVB3aDNKSlpCb2tTWTluLzd2bjlN?=
 =?utf-8?B?azdFdkZQQTE0STdZWWc5allJV0w3N3lzZlE2NlhTNDBDLy9FZUVCckpWcDhx?=
 =?utf-8?B?RTlKdUhkV3o0YS9SZ3lDaUtLRklUUllHV0pteVZBUU1FZzMyV2MxZHpMOGtq?=
 =?utf-8?B?dkswWkJuQTVkQTdwVGI4cXpXSzcxMGpqWUt6VWNYNGs0VW5sL0k1dEttZmdn?=
 =?utf-8?B?VUFBeFdqckp0M1pGdzdjMW8rVzVTRTBoMlRpTTNpRndESFkzM05BK1dFWGQw?=
 =?utf-8?B?R2xZbkVTNHJSVlVZTUNhQm1sR3lzMERhNlZZcmxkVVBacTA4eDBsMXZPdjdm?=
 =?utf-8?B?WVRnek1QV1JPZURIc0NhZWlucm5NZUdqMms2bXFHNGhxY2J2YjJaeUdLbkUy?=
 =?utf-8?B?UVQvLzRrUVhYM0FxRm9aYThXZ29vemNQZ2gvTEVqZEJtak84dDl6YUZZUGlU?=
 =?utf-8?B?ZWpIYTJweTF3UGRGc0NDVS9FR2pZbEpVRDBjUnlRWUhDUzFIbVpNcmoxb25m?=
 =?utf-8?B?cWJNRERETElhZG5rL1l5S1U4VitaeklZazkvdkV4MURTUHR6K0Z5WW9OVGZu?=
 =?utf-8?B?N0UyUmZLaXZGNW5nUmtWS1ZWV0huazhld2owQUppMDQ3WmVoL3hjcEkxTllL?=
 =?utf-8?B?T3lKcW1hZ1prcjhMMVpSSDY1N3R6TjlCdmI0dE5pRWM2cDQrWVFiU3IrbnRQ?=
 =?utf-8?B?aWZBNTRLRzc0eDRTcFdDMVAyUU1PV0Q3b0huanErV0xGVkdyRTRJWHBPMExF?=
 =?utf-8?B?ZkZDSzBzVkh6Q1RvMWpSK2lpQnRzRlcwNnlFbnlGODVBY1E4cldmZzd2M0ZJ?=
 =?utf-8?B?eURGck1PdHZUNGZ6MExjVUxYejE0TlJGVGZ1YytacWRrSUFkYVh3eG5rSEY3?=
 =?utf-8?B?Vi9aT25xOFVPWVF6R00vaWxqcVFsTjRKeVRUK0tmdUlWbUYxWFpYa2Z6Njhs?=
 =?utf-8?B?N0RUOE9naDRFVWNkTWlmSXFVaGpCVS9IUzZpZUtiWDg3VXZBdE82OGR2aG1Z?=
 =?utf-8?B?U0NwalhKMGdMSFR1TlpjUT09?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR17MB3375.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f2ce66-de51-4be7-c29c-08da6b9afc14
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2022 04:31:02.4388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR17MB1206
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_213107_825558_335EC06E 
X-CRM114-Status: GOOD (  29.87  )
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

SSBoYXZlIHJlcGVhdGVkbHkgdG9sZCB5b3UgdG8gc3RvcCBjb250YWN0aW5nIHRoaXMgZW1haWwu
DQoNCg0KPiBPbiBKdWwgMjIsIDIwMjIsIGF0IDEyOjIzIEFNLCBUdWRvci5BbWJhcnVzQG1pY3Jv
Y2hpcC5jb20gd3JvdGU6DQo+IA0KPiDvu79PbiA3LzIyLzIyIDA3OjAwLCBUYWthaGlybyBLdXdh
bm8gd3JvdGU6DQo+IA0KPiBHb29kIG1vcm5pbmcsIFRha2FoaXJvIQ0KPiANCj4+IEVYVEVSTkFM
IEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPj4gDQo+Pj4gT24gNy8yMi8yMDIyIDE6MDYgQU0s
IFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+PiBPbiA1LzIzLzIyIDEwOjQ5
LCBNaWNoYWVsIFdhbGxlIHdyb3RlOg0KPj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNr
IGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlz
IHNhZmUNCj4+Pj4gDQo+Pj4+IEFtIDIwMjItMDUtMTQgMDU6NTEsIHNjaHJpZWIgVGFrYWhpcm8g
S3V3YW5vOg0KPj4+Pj4gT24gNS8xMy8yMDIyIDY6NDAgUE0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6
DQo+Pj4+Pj4gW2J0dyB0aGUgc3ViamVjdCBzdGlsbCBoYXMgdGhlIG9sZCBuYW1lIG9mIHRoZSBh
ZGRyX3dpZHRoXQ0KPj4+Pj4+IA0KPj4+Pj4gWWVzLCBpdCBtdXN0IGJlIGZpeGVkIGluIG5leHQg
cmV2Lg0KPj4+Pj4gDQo+Pj4+Pj4gQW0gMjAyMi0wNS0xMyAwMzoyNiwgc2NocmllYiBUYWthaGly
byBLdXdhbm86DQo+Pj4+Pj4+IE9uIDUvMTMvMjAyMiA3OjE0IEFNLCBNaWNoYWVsIFdhbGxlIHdy
b3RlOg0KPj4+Pj4+Pj4gQW0gMjAyMi0wNS0xMCAwMDoxMCwgc2NocmllYiB0a3V3NTg0OTI0QGdt
YWlsLmNvbToNCj4+Pj4+Pj4+PiBGcm9tOiBUYWthaGlybyBLdXdhbm8gPFRha2FoaXJvLkt1d2Fu
b0BpbmZpbmVvbi5jb20+DQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gSW4gNEJBSVQgcGFyc2UsIGtl
ZXAgbm9yLT5wYXJhbXMtPmFkZHJfd2lkdGggYmVjYXVzZSBpdCBtYXkgYmUgdXNlZA0KPj4+Pj4+
Pj4+IGFzDQo+Pj4+Pj4+Pj4gY3VycmVudCBhZGRyZXNzIG1vZGUgaW4gU01QVCBwYXJzZSBsYXRl
ciBvbi4NCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gTWggSSdtIG5vdCBzdXJlIHRoaXMgaXMgbmVlZGVk
IGF0IGFsbC4NCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gU0ZEUCBzcGVjIHNheXMNCj4+Pj4+Pj4+ICBW
YXJpYWJsZSBhZGRyZXNzIGxlbmd0aCAodGhlIGN1cnJlbnQgc2V0dGluZyBvZiB0aGUgYWRkcmVz
cw0KPj4+Pj4+Pj4gIGxlbmd0aCBtb2RlIGRlZmluZXMgdGhlIGFkZHJlc3MgbGVuZ3RoKQ0KPj4+
Pj4+Pj4gDQo+Pj4+Pj4+PiBhbmQNCj4+Pj4+Pj4+ICBXaGVuIHRoZSBsZW5ndGggaXMgZGVmaW5l
ZCBhcyB2YXJpYWJsZSwgdGhlIHNvZnR3YXJlIG9yIGhhcmR3YXJlDQo+Pj4+Pj4+PiAgY29udHJv
bGxpbmcgdGhlIG1lbW9yeSBpcyBhd2FyZSBvZiB0aGUgYWRkcmVzcyBsZW5ndGggbW9kZSBsYXN0
DQo+Pj4+Pj4+PiAgc2V0IGluIHRoZSBtZW1vcnkgZGV2aWNlIGFuZCB0aGlzIHNhbWUgbGVuZ3Ro
IG9mIGFkZHJlc3MuDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IFdlIGRvbid0IHNldCBhbnkgYWRkcmVz
cyBtb2RlIHVudGlsIGFsbCB0aGUgU0ZEUCBwYXJzaW5nIGlzDQo+Pj4+Pj4+PiBvdmVyLiBUaGVy
ZWZvcmUgd2Ugc2hvdWxkIGFsd2F5cyBiZSBpbiAzIGJ5dGUgbW9kZSwgbm8/DQo+Pj4+Pj4+PiAN
Cj4+Pj4+Pj4gQWN0dWFsbHkgdGhlcmUgYXJlIHNvbWUgZGV2aWNlcyB0aGF0IGhhdmUgdmFyaWFi
bGUgYWRkcmVzcyBsZW5ndGggYnV0DQo+Pj4+Pj4+IDQgYnl0ZSBtb2RlIGJ5IGRlZmF1bHQgKEkg
d2lsbCB3b3JrIG9uIHRob3NlIGRldmljZXMgYWZ0ZXIgdGhpcw0KPj4+Pj4+PiBzZXJpZXMNCj4+
Pj4+Pj4gaXMgc2V0dGxlZCkuIFRvIHN1cHBvcnQgc3VjaCBjYXNlLCBJIHByZWZlciB0byB1c2UN
Cj4+Pj4+Pj4gcGFyYW1zLT5hZGRyX25ieXRlcw0KPj4+Pj4+PiBhcyBjdXJyZW50IGFkZHJlc3Mg
bW9kZSBzbyB0aGF0IEkgY2FuIGZpeCBpdCBpbiBwb3N0X2JmcHRfZml4dXAoKQ0KPj4+Pj4+PiBo
b29rLg0KPj4+Pj4+IA0KPj4+Pj4+IEFyZSB0aGVyZSBwdWJsaWMgZGF0YXNoZWV0cyBhdmFpbGFi
bGU/IFNvIHRoZXNlIGRldmljZXMgaGF2ZSBhIDMgYnl0ZQ0KPj4+Pj4gSSB3aWxsIHNlbmQgZGF0
YXNoZWV0cyB0byB5b3UgaW4gYW5vdGhlciBlbWFpbC4gQXQgdGhpcyBwb2ludCwgb25seQ0KPj4+
Pj4gc3VtbWFyeSBkYXRhc2hlZXQgaXMgYXZhaWxhYmxlIGluIHdlYnNpdGUuDQo+Pj4+PiANCj4+
Pj4+PiBhbmQgYSA0IGJ5dGUgbW9kZSwgYnV0IGFmdGVyIHJlc2V0LCB0aGV5IGFyZSBpbiB0aGUg
NCBieXRlIG1vZGU/IExvb2tzDQo+Pj4+PiBZZXMuDQo+Pj4+PiANCj4+Pj4+PiBsaWtlIGl0IHNo
b3VsZCBiZSBmaXhlZCBpbiBhIGRpZmZlcmVudCB3YXkuIEknbSBub3Qgc3VyZSB0aGUgImN1cnJl
bnQNCj4+Pj4+PiBtb2RlIiBoYW5kbGluZyBpcyBjb3JyZWN0Lg0KPj4+Pj4+IA0KPj4+Pj4gWWVz
LCB3ZSBtYXkgd2FudCB0byBpbnRyb2R1Y2UgYSBuZXcgZmxhZyBsaWtlIFNQSV9OT1JfNEJBTV9E
RUZBVUxUIGFuZA0KPj4+Pj4gY2hlY2sNCj4+Pj4+IHRoZSBmbGFnIGluIEJGUFQgcGFyc2UuIE9u
Y2UgSSBzZW5kIGFub3RoZXIgc2VyaWVzLCBwbGVhc2UgcmV2aWV3Lg0KPj4+Pj4gDQo+Pj4+Pj4g
V2UgbmVlZCB0byBkaWZmZXJlbnRpYXRlIGJldHdlZW4gdGhlIG1vZGUgdGhlIGZsYXNoIGN1cnJl
bnRseSBpcyB1c2luZw0KPj4+Pj4+IChub3ItPmFkZHJfbmJ5dGVzKSBhbmQgdGhlIG1vZGUgcGFy
c2VkIGJ5IFNGRFAgKHBhcmFtcy0+YWRkcl9uYnl0ZXMpLg0KPj4+Pj4+IA0KPj4+Pj4gVGhlIGZs
YXNoJ3MgYWRkcmVzcyBtb2RlIGFmZmVjdHMgdGhlIGFkZHJlc3MgbGVuZ3RoIG9mIE5vbi00QiBv
cGNvZGVzLA0KPj4+Pj4gaW5jbHVkaW5nIHJlYWQvd3JpdGUgYW55IHJlZ2lzdGVyIG9wcyB1c2Vk
IGluIFNNUFQgcGFyc2UgYW5kIEluZmluZW9uDQo+Pj4+PiAoc3BhbnNpb24pIHNwZWNpZmljIGhv
b2tzLg0KPj4+Pj4gDQo+Pj4+PiBUaGUgNEIgb3Bjb2RlcyBhbHdheXMgdGFrZSBhZGRyZXNzIGxl
bmd0aCBvZiA0IHJlZ2FyZGxlc3Mgb2YgZmxhc2gncw0KPj4+Pj4gYWRkcmVzcyBtb2RlLiBJbiB0
aGVzZSBJbmZpbmVvbiBjaGlwcywgNEIgb3Bjb2RlcyBmb3IgcmVhZC9wcm9ncmFtLw0KPj4+Pj4g
ZXJhc2UgYXJlIGF2YWlsYWJsZSBhbmQgNEJBSVQgYWR2ZXJ0aXNlcyB0aGVtLiBXZSBkb24ndCBo
YXZlIHRvIGVudGVyDQo+Pj4+PiA0IGJ5dGUgYWRkcmVzcyBtb2RlIGZvciByZWFkL3Byb2dyYW0v
ZXJhc2UuDQo+Pj4+IA0KPj4+PiBidHcuIHRoaXMgaXMgYSBwaXR5LiB5b3UgYXJlIHVzaW5nIHRo
ZSBzdGF0ZWxlc3MgNGIgb3Bjb2RlcyBidXQNCj4+Pj4gdGhlbiB5b3UgZG9uJ3QgcHJvdmlkZSBz
dGF0ZWxlc3Mgb3Bjb2RlcyBmb3IgdGhlIHJlYWQgYW55IHJlZ2lzdGVyDQo+Pj4+IG9wIDovDQo+
Pj4+IA0KPj4+Pj4gU28sIEkgdGhpbmsgd2UgbmVlZCB0byBkaWZmZXJlbnRpYXRlIGJldHdlZW4g
YWRkcmVzcyBsZW5ndGggZm9yDQo+Pj4+PiByZWFkL3Byb2dyYW0vZXJhc2UgYW5kIGZsYXNoJ3Mg
ZGVmYXVsdCBhZGRyZXNzIG1vZGUuDQo+Pj4+IA0KPj4+PiBPciB3ZSBrZWVwIHRoZW0gaW4gc3lu
Yy4gRS5nLiBzd2l0Y2ggdG8gNGJ5dGVzIG1vZGUgaWYgd2UgYXJlDQo+Pj4+IHVzaW5nIHRoZSA0
IGJ5dGUuIEdyYW50ZWQsIHRoYXQgc291bmRzIGxpa2UgYSBoYWNrIDopDQo+Pj4+IA0KPj4+Pj4g
T2J2aW91c2x5IHdlIGFyZSB1c2luZyBub3ItPmFkZHJfbmJ5dGVzIGFzIGFkZHJlc3MgbGVuZ3Ro
IGZvciByZWFkLw0KPj4+Pj4gcHJvZ3JhbS9lcmFzZSBhbmQgc2hvdWxkIGtlZXAgdGhpcyB1c2Fn
ZS4NCj4+Pj4gDQo+Pj4+IFllcywgSSB3YXNuJ3QgYXdhcmUgdGhhdCB3ZSBhY3R1YWxseSB0d28g
ZGlmZmVyZW50IHJ1bnRpbWUNCj4+Pj4gcGFyYW1ldGVyczoNCj4+Pj4gLSB0aGUgcmVhZC9wcm9n
cmFtL2VyYXNlIGFkZHJlc3Mgd2lkdGgsIGFsc28gdXNlZCB3aXRoIHRoZQ0KPj4+PiAgIDRiIG9w
Y29kZXMNCj4+Pj4gLSBpbnRlcm5hbCBtb2RlIDNiLzRiLiBVcCB1bnRpbCBub3csIHRoaXMgd2Fz
bid0IGFuIGlzc3VlDQo+Pj4+ICAgYmVjYXVzZSBlaXRoZXIgdGhlIG1vZGUgd2FzIHN3aXRjaGVk
IG9yIHRoZSA0YiBvcGNvZGVzDQo+Pj4+ICAgd2VyZSB1c2VkLiBTbyB0aGlzIHdhcyBtdXR1YWxs
eSBleGNsdXNpdmUuIE5vdyB3ZSBoYXZlDQo+Pj4+ICAgZmxhc2hlcyB3aGljaCB1c2VzIDRiIG9w
Y29kZXMgX2FuZF8gd2UgbmVlZCB0aGUgc3RhdGUNCj4+Pj4gICBvZiB0aGUgaW50ZXJuYWwgbW9k
ZS4NCj4+Pj4gDQo+Pj4+IEkgY2FuJ3QgdGhpbmsgb2YgYSBnb29kIHNvbHV0aW9uIGZvciBub3cu
IE5lZWQgdG8gdGhpbmsNCj4+Pj4gbW9yZSBhYm91dCB0aGlzLCBidXQgSSdtIHByZXR0eSBidXN5
IGF0IHRoZSBtb21lbnQuDQo+Pj4+IFdoYXQgSSB0aGluayBpcyBjbGVhciBpcyB0aGF0IHdlIG5l
ZWQgdHdvIGRpZmZlcmVudCBtb2Rlcw0KPj4+PiBoZXJlIGluIHRoZSBzcGlfbm9yIHN0cnVjdC4g
bm9yLT5hZGRyX25ieXRlcyBmb3IgdGhlDQo+Pj4+IHJlYWQvcHJvZ3JhbS9lcmFzZSBvcGNvZGVz
IGFuZCBub3ItPmFkZHJlc3NfbW9kZSBvciBzaW1pbGFyDQo+Pj4+IHdoaWNoIHRyYWNrcyB0aGUg
U1BJIGZsYXNoJ3MgaW50ZXJuYWwgYWRkcmVzcyBtb2RlLg0KPj4+IA0KPj4+IEhpLCBUYWthaGly
bywNCj4+PiANCj4+PiBDYW4gd2UgZGV0ZXJtaW5lIHRoZSBmbGFzaCdzIGludGVybmFsIGFkZHJl
c3MgbW9kZSBieSBxdWVyeWluZw0KPj4+IHRoZSBmbGFzaCBhdCBydW4tdGltZT8gSXMgdGhpcyBw
b3NzaWJsZSBvbiBTZW1wZXIgZmxhc2hlcz8NCj4+PiANCj4+IENGUjJWWzddIGhhcyBjdXJyZW50
IGFkZHJlc3MgbW9kZSwgYnV0IHRvIHJlYWQgdGhhdCwgd2UgbmVlZCB0bw0KPj4gaXNzdWUgUmVh
ZCBBbnkgUmVnaXN0ZXIgd2hpY2ggYWRkcmVzcyBsZW5ndGggcmVsaWVzIG9uIGN1cnJlbnQNCj4+
IGFkZHJlc3MgbW9kZS4gQ2hpY2tlbi1hbmQtZWdnLi4uDQo+PiANCj4gDQo+IEkgc2VlLiBXaGF0
IGhhcHBlbnMgaWYgd2UgaXNzdWUgdGhlIFJlYWQgQW55IFJlZ2lzdGVyIGNvbW1hbmQgd2l0aA0K
PiB0aGUgd3JvbmcgYWRkcmVzcyBpbnRlcm5hbCBtb2RlPyBXaWxsIEkgcmVhZCBqdXN0IDB4ZmY/
DQo+IEZvciBleGFtcGxlIHRyeSByZWFkaW5nIENGUjJWWzddIHVzaW5nIGFkZHJfbmJ5dGVzIG9m
IHZhbHVlIDMsIGFuZA0KPiBpZiBpdCBmYWlscywgdG8gcmVhZCBpdCBhZ2FpbiBidXQgdGhpcyB0
aW1lIHVzaW5nIGFkZHJfbmJ5dGVzIG9mDQo+IHZhbHVlIDQuDQo+IA0KPiBDaGVlcnMsDQo+IHRh
DQo+IA0KPiANCj4+PiBUbyBleHRlbmQgdGhlIGlkZWEsIHdoZW4gdGhlIGZsYXNoIHN1cHBvcnRz
IEJGUFQgYW5kIGRlZmluZXMNCj4+PiBCRlBUX0RXT1JEMV9BRERSRVNTX0JZVEVTXzNfT05MWSBv
ciBCRlBUX0RXT1JEMV9BRERSRVNTX0JZVEVTXzRfT05MWQ0KPj4+IHRoZSB0aGluZ3MgYXJlIGNs
ZWFyLCBhZGRyX25ieXRlcyBpcyBmaXhlZC4NCj4+PiBJZiB0aGUgZmxhc2ggZG9lcyBub3QgZGVm
aW5lIEJGUFQgb3IgdXNlcw0KPj4+IEJGUFRfRFdPUkQxX0FERFJFU1NfQllURVNfM19PUl80LCB0
aGVuIHdlIGNvdWxkIGRldGVybWluZSB0aGUgYWRkcg0KPj4+IG1vZGUgYnkgcXVlcnlpbmcgdGhl
IGZsYXNoLg0KPj4+IA0KPj4+PiANCj4+Pj4+IEZvciBmbGFzaCdzIGRlZmF1bHQgYWRkcmVzcyBt
b2RlLCBteSBwcmVmZXJlbmNlIGlzIHRvIHVzZQ0KPj4+Pj4gcGFyYW1zLT5hZGRyX25ieXRlcywg
YnV0IEkgc2hvdWxkIHJlbmFtZSBpdCB0byBzb21ldGhpbmcgbGlrZQ0KPj4+Pj4gcGFyYW1zLT5k
ZWZfYWRkcl9uYnl0ZXMgYW5kIHJld29yayBzcGlfbm9yX3NldF9hZGRyX25ieXRlcygpLg0KPj4+
PiANCj4+Pj4gSU1ITyBwYXJhbXMgc2hvdWxkIG9ubHkgYmUgdXNlZCB0byBzdG9yZSB0aGUgcGFy
c2VkIChvcg0KPj4+PiBoYXJkY29kZWQpIHBhcmFtZXRlcnMuDQo+Pj4gDQo+Pj4geWVwLCBJIHNo
YXJlIE1pY2hhZWwncyBvcGluaW9uLg0KPj4+IA0KPj4+IENoZWVycywNCj4+PiB0YQ0KPj4+IA0K
Pj4+PiANCj4+Pj4gLW1pY2hhZWwNCj4+Pj4gDQo+Pj4+PiBzdGF0aWMgaW50IHNwaV9ub3Jfc2V0
X2FkZHJfbmJ5dGVzKHN0cnVjdCBzcGlfbm9yICpub3IpDQo+Pj4+PiB7DQo+Pj4+PiAgICAgIGlm
IChub3ItPmZsYWdzICYgU05PUl9GX0hBU180QkFJVCkgew0KPj4+Pj4gICAgICAgICAgICAgIG5v
ci0+YWRkcl9uYnl0ZXMgPSA0Ow0KPj4+Pj4gICAgICB9IGVsc2UgaWYgKG5vci0+cGFyYW1zLT5k
ZWZfYWRkcl9uYnl0ZXMpIHsNCj4+Pj4+ICAgICAgICAgICAgICBub3ItPmFkZHJfbmJ5dGVzID0g
bm9yLT5wYXJhbXMtPmRlZl9hZGRyX25ieXRlczsNCj4+Pj4+IA0KPj4+Pj4+IEF0IHNvbWUgcG9p
bnQsIHRoZSBtb2RlIGlzIHN3aXRjaGVkIGFuZCBub3ItPmFkZHJfbmJ5dGVzIGJlY29tZXMNCj4+
Pj4+PiBwYXJhbXMtPmFkZHJfbmJ5dGVzLiBJdCBzZWVtcyBpbiB5b3VyIGNhc2Ugbm9yLT5hZGRy
X25ieXRlcyBzaG91bGQNCj4+Pj4+PiBiZSA0IHJpZ2h0IGZyb20gdGhlIGJlZ2lubmluZy4gV2hp
Y2ggYWxzbyBtZWFucyBub3ItPmFkZHJfbmJ5dGVzDQo+Pj4+Pj4gc2hvdWxkIGJlIDMgZm9yIHRo
ZSBvdGhlciBjYXNlcyAoYW5kIHByb2JhYmx5IG5vdCAwKS4NCj4+Pj4+PiANCj4+Pj4+IFdpdGgg
cGFyYW0tPmRlZl9hZGRyX25ieXRlcywgSSB0aGluayB3ZSBjYW4ga2VlcCBub3ItPmFkZHJfbmJ5
dGVzID0gMA0KPj4+Pj4gZHVyaW5nIFNGRFAgcGFyc2UuDQo+Pj4+PiANCj4+Pj4+IFRoYW5rcywN
Cj4+Pj4+IFRha2FoaXJvDQo+Pj4gDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0DQo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
