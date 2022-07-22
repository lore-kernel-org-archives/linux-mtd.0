Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A563C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jul 2022 04:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7EJofV+B6x1m7+uZp2HnaYnBGTyYiiYBZX0P3SQaN34=; b=Sp4kn7/4HmTds/
	Y3XpYMSihgaZw7h8iTqvgj0ugnHoRFU9Rxx952mhH3VgbQgsER4IV7wNyztELCzyp5XgG4RnCCIoL
	7c3O8T8RpIeVYbXTtaU5Yrkv//U5C+KdeydlGclamsS+QGPjb6R56Er7dgsHUX3vG7tJgtpjqS67p
	vADHOKt0J5Z9ZWSsW+RDZ0Dirrqyhc5v/4yNPjq3hJucJraAVWnZCAzIzxNzzxqUr+QNjn3iusnYn
	JU9Jdj6QSXRBwzEq9Zi4TAh6zcg/JYw2UemM3tQqNlCU2seEl8UI79T9BeG8lc3duXoxQ2MCSDoV2
	gxJN5K0tx6gZffznYyuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEkK5-00HUmb-1C; Fri, 22 Jul 2022 04:31:33 +0000
Received: from mail-bn1nam07olkn2070.outbound.protection.outlook.com ([40.92.15.70] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEkK1-00HUlD-LM
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2022 04:31:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2c0gXcRWLVlA87O/4e1w+xnP2iVH8qWsq0htB7mAKVROQGDD9PeyjQ+E62Te2Yg1cKurfIuLq3UHA81UEP0/A2sMNDyNzXFErklC5YlEShWJl9SGINJLkbpOoa5t51v65QYrpDGM95H/sLhhi0B6pzFYoTjCjatcr25tlbqmfzRBi0N3oMTL3mctE0wp4hpDlxu/aERw+5Ka5aoXzkCsS34ScT0KViYAq/1fAOMCee7GmlCvJYYZCzmjzQEbpETPsVth+IIxnAbbn4riMAKZftNd6KYGY/rLPqPVRiZJZyT3zpknw2Wo/gowF6bE0QtQPHuVi64Cfy37xLUF8N+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xc5UqedNFU/kCTDzCWRu3Uu3UMaIMc/u2tWeomQCNE=;
 b=Z8PJTC/mufFqjq6mv4K02tiTpmtpQNaWIiD6FolZtFbzhuQ9ig+3AGFC6e5xLpL3PILwoczb2LAlPyWenNynASreEb0hfYS1Xx7mvZqPvVeiQgVpc4/4bBWNBBq15qJKzuoSsyc+WpUL37TQP8KTe3hO1Lk62UVa+WkTeTRSm5BaDIXVNiVOeNUqUSYOyran+kHooQRKPKnKqVtMwMX0xl06k6CwkNs4KkjqctbEk6PF8GzY+p61exoX+wrW9pSdcsJQzR8xAWMdsfYUSh7QBO+sbEIX+NkTZhYvF3vek49rwL6BZTi5bowiD3N7XBeSg41png+cCAVdU2Q1GuA/qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xc5UqedNFU/kCTDzCWRu3Uu3UMaIMc/u2tWeomQCNE=;
 b=pxZUmR28+pGPDukB4KrY8iES8yLzfVOSuayvKLPGRABWDN427KHheENswIFw/7+/4FxRLwYZfbj3UpYYOLE/h0mVfXrD/KJi5zKjx856rfU5WB5zFFNUYRkOTRAtiJNIEuWr4gp4v+kClIV2SxTi23Gvpu9UR15SgAfxcNtSR1Cx7opuEo2uUPzVK9L7SR2Mffi9spHNNoeLAREcMoj0iQQB/yBBtIWBnS5nw7kVuldWmm6Hw2CJl5Xll8kBbMXDZeIM00FdLMCyB2i88mfjef++uWCGnEPG5ih28p+BHbGSLxMloDIEzQcBwoMr3rMp/K9YduGCVR848ruKTo50Pw==
Received: from MN2PR17MB3375.namprd17.prod.outlook.com (2603:10b6:208:13c::25)
 by CY4PR17MB1206.namprd17.prod.outlook.com (2603:10b6:903:97::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Fri, 22 Jul
 2022 04:31:27 +0000
Received: from MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::48d3:68bb:bdcb:4658]) by MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::48d3:68bb:bdcb:4658%6]) with mapi id 15.20.5438.024; Fri, 22 Jul 2022
 04:31:27 +0000
From: Vanessa Page <Vebpe@outlook.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
CC: Christian Marangi <ansuelsmth@gmail.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Subject: Re: [syzbot] linux-next boot error: general protection fault in
 add_mtd_device
Thread-Topic: [syzbot] linux-next boot error: general protection fault in
 add_mtd_device
Thread-Index: AQHYnXP5vGIq5gfacEG8CYI0obLFX62JzOjL
Date: Fri, 22 Jul 2022 04:31:27 +0000
Message-ID:  <MN2PR17MB33752C13C614800D55B6279AB8909@MN2PR17MB3375.namprd17.prod.outlook.com>
References: <00000000000040624a05e2a6f2db@google.com>
 <18701775-c174-96ce-31ce-478d8783b575@I-love.SAKURA.ne.jp>
In-Reply-To: <18701775-c174-96ce-31ce-478d8783b575@I-love.SAKURA.ne.jp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn:  [eV2NwuQD9qZSdmj7R4HQzUy240Q8p94NFlIUt9oghfLx+M0d32FnTTCxgFUElLPsi9BfobW7+Z4=]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20c41572-9f4d-41db-9134-08da6b9b0ade
x-ms-traffictypediagnostic: CY4PR17MB1206:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  pgKsyCHg5wlm+wSfLCgTgrPA+1a/EXdmP+RUooHR+OtYEsU8lzoVpvapA/hCMm4eYBVQcXruZUcQfYgnUVBxn3Net6wYRiLifesimYBCW5QePTzWOW8lZXgNtUFLpwagbhg09GX7FbnLU+B3qcNmMRI/W2z0tDhTKdn2dElqPkj6RMecj2cjf/tmGclv0vebr0BRzQ3NJfjLlDGM/3m1jSecExvQAmJXIMiaze/K58Qv+9MQam6JU2HMUK1zAaCcJ60nfW7syO5d7ABKop/GHQb7Q8HYmBjnhCMg4eu7nomHrYweDceu7uYgVCNxeY0G+nRCk0zyHIQmbLq/k49q+kn2Plara4TVERlvxE2kacvpO9DmUrGB2bbJGs+kG3RnbBgCnPyDGCP9yI6X5gwWBtQlWxkRan4JfW3KZ0leU++t/iUGlc5Aal8zng21TQWVG99KEP0AOlTnm29oOsenhjwWev//vbk3/6yd3fs6A+rAb8ARtEEjlrBwkaACDU3uJs5/pYVUE5Mvns3UQpy86ee64lkDNZrR+3i1t1IAWVBAHuBlbEpdhXr+lLKFx0jlYj7XfpGdbVqvJgHvQE5J1ojzIkIK7k/UwQii4roiC30qO9bHjlbWnf1cJGBsjlvubIzNapqgw4lPYXkkDi73z/DRewOM4TkUQ0ojzcJqmx1wITFiobHhd3Qr90JYMlHT
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dFQvcXoxeS8ybWJ3SnhIeUFkM3JZekV1RHZyRCtKOVNzRVRzY3hwQlRjdFlD?=
 =?utf-8?B?am5FWjlmODRyZ2NDdmZvSVRlQ3VlaU9sZjdoM0dpakZTL2xLQnF2U3FYTi9m?=
 =?utf-8?B?UGhPYVlLODBpSnoyV3Vnbk5TZm53YVM2endHQUsxQzFOMlhWZ2JtSmVpQ2Nz?=
 =?utf-8?B?N1lkSmd6d3o1T2dyN2dPSzBkRUhEK3R6M1h0ZWhCV2dsZFIxKzdxRlRWb2p4?=
 =?utf-8?B?djc0YVJpa0RvUVZ1MldzejZzdUxyN1RqSWc5bkgyMzBNS0YyWnpHWnRQZDhS?=
 =?utf-8?B?cDJSOWMxc1NpZGVVdHVOTndiSzdmM0RuNDlFaFN3R2hRaHlJZThvM2MwaVhN?=
 =?utf-8?B?OUxJOHVwNkJyajdoVWZUeWlFbDQ5M3cxVmw4WmxyVWtEVGZxZFpuU2kwZk91?=
 =?utf-8?B?NmJWUjdBendNUjJ5MEF3akk0dldwNFNTd3B2VFFZUkhURGtPM0ZmSUk5WE1j?=
 =?utf-8?B?UjhVb0FhcVJXKzZQRnZ4WjhWSldlOFF2ZzVUVFczTUxVYXNaT2lBS0tFYnJ6?=
 =?utf-8?B?KzZLMkhQeGF5VWFPb25pZW1JL1JkZ01uUmpnTzYzRlhac2FPY0FuS0t0WG5P?=
 =?utf-8?B?WW1DY0hNVWE2aDgrZjRqUG5PM2Q0NWs5TkQzeWlpKzZoeElBcytXc2hSNVdi?=
 =?utf-8?B?M3kxd3MxdTZtekhtUEJicTE5ZzdLNTVkSmVJNjZuZ0J1UXpPVUM3YnFnWjRv?=
 =?utf-8?B?eVJibkcxTkVNM202NjJVR0JaN1ZJa0FGWUdHMjJBY0FrYkRDL1R2aEZ6bXV4?=
 =?utf-8?B?aUlnc2pBQW4yNEZjbWxoQ1AvN1RyelZJVTZrRGRIWWU1aSsxTW1kekQ1ZjhZ?=
 =?utf-8?B?Z2FUY0FWK0ZhcFlmUWRXbm85dENKdWZsajRtZm1saWJPQnMyUmRZRFpyUmdj?=
 =?utf-8?B?K0FieGRjMC9VS0Q4aDYreTM0MzRpZGV1dkF6b1dNcUtNRWoyZDFSV0dtd0RM?=
 =?utf-8?B?UUxqYVFWaUlZNGJyb2poZlREYXEvQ3dHenM0WXJFTDFNc2tNR1EzbjdyUTFx?=
 =?utf-8?B?Mk1BYURJbzFSVUtHY1JCSVhEUFF6bWdJVUxLeG9nWGRVczBsbVh6VFZFRXV5?=
 =?utf-8?B?dE9CcFVDQkY1UUFRSXVOQVozZVlLWEQxSzBUekprUTUxRkRlOUFuWGZRNnpj?=
 =?utf-8?B?cS91enNnMkM4c2hTQXYxeUhVRVE3eTVFdVVUTEZwcGpSbEwwSUJ3L3luQ0x5?=
 =?utf-8?B?aVNtelNlZWUzMlpHa2dPeUdCUGJhYnRES2N0YmVsNEh0Tm91RTFKQlFtYWpv?=
 =?utf-8?B?RUt3RHpZRjhSb1dncGF0TzNRSXdCTGhZeGVtTTNBOG9pZHVkVEx2T25UZFBF?=
 =?utf-8?B?dUk3dW8rNGltekNBeng2b3lmMGFZZFZ4MG00ZnRYYjdiS1ZKVG5HVHEvYzUz?=
 =?utf-8?B?RzRCOHpoTVVFWjltUWw0Z1pnUjQ1dWhvUmpabGNzK1FZMXNTUmY3ZzI2L1Rv?=
 =?utf-8?B?ZVFuc3ZYRDdXL0pXdlRrbEJocEhxNGYrbzFuVm9SQmZTV1NrNDRicGd4YjlW?=
 =?utf-8?B?Z1RIWHY2aVNNL214NXVVVjhvVVFqckdTc2wxN28wcUpkVlhuN0xwSlQxT2l0?=
 =?utf-8?B?cVZ1M2F3K291T2lDZjNSNzZ3ZzZ0TkhpR1N3Sy9rNm1nejRSVXlLc1pUTGwv?=
 =?utf-8?B?MzJwS0liaXRNY3BhNnJxK3VNeTV6WGwvOWZmY0pJSktETUtLa2V3aDV0U2pl?=
 =?utf-8?B?NzlteGJzZngzRWZDMktXWktFaUd2RHNORzB3VnlhTXB5aENVc3pUZUFITlZx?=
 =?utf-8?B?QTJqandwRXBPL3VUM1FlNnhKc0JKbE1tSjJiTjhsTURXenJVVHM0eTlLY2dI?=
 =?utf-8?B?ZndrMXF1Y1l3blVwaTBRZz09?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR17MB3375.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c41572-9f4d-41db-9134-08da6b9b0ade
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2022 04:31:27.2495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR17MB1206
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_213129_722246_5C267832 
X-CRM114-Status: GOOD (  12.57  )
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

QW5kIHlldCB5b3Ugc3RpbGwga2VlcCBzZW5kaW5nIHRoZW0uDQoNCj4gT24gSnVsIDIxLCAyMDIy
LCBhdCAxMDozNyBQTSwgVGV0c3VvIEhhbmRhIDxwZW5ndWluLWtlcm5lbEBpLWxvdmUuc2FrdXJh
Lm5lLmpwPiB3cm90ZToNCj4gDQo+IO+7v210ZF9jaGVja19vZl9ub2RlKCkgd2FzIGFkZGVkIGJ5
IGNvbW1pdCBhZDliMTBkMWVhYWRhMTY5ICgibXRkOiBjb3JlOg0KPiBpbnRyb2R1Y2Ugb2Ygc3Vw
cG9ydCBmb3IgZHluYW1pYyBwYXJ0aXRpb25zIikuDQo+IA0KPiBJIGd1ZXNzIHRoYXQgc29tZXRp
bWVzIChkZXBlbmRpbmcgb24gcHJvYmUgdGltaW5nKSBtdGQtPnBhcmVudCBpcyBOVUxMLg0KPiBQ
bGVhc2UgY2hlY2sgd2hhdCBtdGQtPnBhcmVudCA9PSBOVUxMIG1lYW5zLg0KPiANCj4gKyAgICAv
KiBDaGVjayBpZiBhIHBhcnRpdGlvbnMgbm9kZSBleGlzdCAqLw0KPiArICAgICAgIHBhcmVudCA9
IG10ZC0+cGFyZW50Ow0KPiArICAgICAgIHBhcmVudF9kbiA9IGRldl9vZl9ub2RlKCZwYXJlbnQt
PmRldik7DQo+IA0KPj4gT24gMjAyMi8wNi8zMCAxODozMiwgc3l6Ym90IHdyb3RlOg0KPj4gSGVs
bG8sDQo+PiANCj4+IHN5emJvdCBmb3VuZCB0aGUgZm9sbG93aW5nIGlzc3VlIG9uOg0KPj4gDQo+
PiBIRUFEIGNvbW1pdDogICAgNmNjMTFkMmExNzU5IEFkZCBsaW51eC1uZXh0IHNwZWNpZmljIGZp
bGVzIGZvciAyMDIyMDYzMA0KPj4gZ2l0IHRyZWU6ICAgICAgIGxpbnV4LW5leHQNCj4+IGNvbnNv
bGUgb3V0cHV0OiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L2xvZy50eHQ/eD0xNjQw
Zjg1MDA4MDAwMA0KPj4ga2VybmVsIGNvbmZpZzogIGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3Qu
Y29tL3gvLmNvbmZpZz94PTU0Zjc1YjYyMGUzODQ1ZGQNCj4+IGRhc2hib2FyZCBsaW5rOiBodHRw
czovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0aWQ9ZmUwMTNmNTVhMjgxNGE5ZThjZmQN
Cj4+IGNvbXBpbGVyOiAgICAgICBnY2MgKERlYmlhbiAxMC4yLjEtNikgMTAuMi4xIDIwMjEwMTEw
LCBHTlUgbGQgKEdOVSBCaW51dGlscyBmb3IgRGViaWFuKSAyLjM1LjINCj4+IA0KPj4gSU1QT1JU
QU5UOiBpZiB5b3UgZml4IHRoZSBpc3N1ZSwgcGxlYXNlIGFkZCB0aGUgZm9sbG93aW5nIHRhZyB0
byB0aGUgY29tbWl0Og0KPj4gUmVwb3J0ZWQtYnk6IHN5emJvdCtmZTAxM2Y1NWEyODE0YTllOGNm
ZEBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0DQo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
