Return-Path: <SRS0=PdnT=UR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A964C31E51
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jun 2019 09:10:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2907206BA
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jun 2019 09:10:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZIaDhCfY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="2Tv9Xk4S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2907206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHAxcabDscZlmkluSam9xnfUqzpOFj84TjFoUtxjMfo=; b=ZIaDhCfY/3gUSc
	s9KUySUPnPprzwmDtWfTyyYsMnf2YxUwTE6eO/QD2iZTbgpivJ3hc0YWTvs2L8GxwwfAUdfvJsppp
	W3DHmD5SkYTlPQCJgD30kyGX5ETZ/OxIl5LBaNd3UpTufsmY8m1xU8QfVxZUskyP+NyjidInlcSI+
	jqVMW3GuumYCQk4X5cJBzrQBGzcVdPfZjAduP/iYOBTAJM5Q5cm1TGWK/Nx8lUlpoMEnXE0X9o2mE
	R85NjGKaUbRyJDEQq1O62qsn3WUtZ5UrgjjZ/IKRbtnmf9vP+Ghe5MFBcn8ShJ9P4xPo1BFUdedux
	XuuU+SoLWulb5O51nb2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdA8T-0004Iw-9I; Tue, 18 Jun 2019 09:10:37 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdA8O-0004I0-EG
 for linux-mtd@lists.infradead.org; Tue, 18 Jun 2019 09:10:35 +0000
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,388,1557212400"; d="scan'208";a="36289472"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Jun 2019 02:10:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 18 Jun 2019 02:10:26 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 18 Jun 2019 02:10:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCJ7UjcLdGTOJxl2Ic/6pe3UiUCoa+Tx0rGHCExjeyo=;
 b=2Tv9Xk4SkWto4IJEpdrrXDV18DTVJ5W4I1PAS+L81MdRwJ6EYjWOSUxhqPn9UBsB41AXyAt6hFwnKJ3v+OtEiCUmMPzXHNtYhVYqU3/yLDgGOMAhwY12Z6bfnlWYr91XWMMhivEhb+haBnTAlpiUm2QxwZgBn4I54FHNueoJt9Y=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB0019.namprd11.prod.outlook.com (10.161.155.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Tue, 18 Jun 2019 09:10:25 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36%9]) with mapi id 15.20.1987.014; Tue, 18 Jun 2019
 09:10:25 +0000
From: <Tudor.Ambarus@microchip.com>
To: <dinguyen@kernel.org>, <robh@kernel.org>
Subject: Re: [PATCHv6 1/2] dt-bindings: cadence-quadspi: add options reset
 property
Thread-Topic: [PATCHv6 1/2] dt-bindings: cadence-quadspi: add options reset
 property
Thread-Index: AQHVIdusqBYcLDcbq02njfD9Z3kc16ahJ4oA
Date: Tue, 18 Jun 2019 09:10:24 +0000
Message-ID: <40d77b71-efdd-08e6-3d66-743ab0623906@microchip.com>
References: <20190613113138.8280-1-dinguyen@kernel.org>
In-Reply-To: <20190613113138.8280-1-dinguyen@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0602CA0020.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::30) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80031b57-9825-42cf-990f-08d6f3cccc2f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR11MB0019; 
x-ms-traffictypediagnostic: BN6PR11MB0019:
x-microsoft-antispam-prvs: <BN6PR11MB0019D3F6A892EA381E5BA4BBF0EA0@BN6PR11MB0019.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(366004)(39860400002)(376002)(346002)(199004)(189003)(102836004)(14454004)(256004)(14444005)(305945005)(316002)(72206003)(478600001)(73956011)(386003)(66946007)(6506007)(76176011)(66476007)(66446008)(66556008)(7736002)(25786009)(4326008)(186003)(5660300002)(36756003)(26005)(64756008)(110136005)(54906003)(53546011)(31686004)(6512007)(86362001)(486006)(6246003)(8676002)(6116002)(446003)(11346002)(476003)(2501003)(2616005)(52116002)(8936002)(3846002)(81156014)(81166006)(71190400001)(71200400001)(66066001)(68736007)(229853002)(31696002)(2906002)(53936002)(6436002)(99286004)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB0019;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /2p8k4z2ke/Asrh0RW8F1om2H7H4t18CC89U4MYPG6jZFajhPGmvCA5iQUQA25N0DNhVzZvs6kD3tPhlyXkXjVamao7ha0yfAvnhIRHm7z/jJtMljDn7wWHsjHMXQUabfeFlZiSMOX8hR9/xl8N1QQKmJ4OQ9MdDA4xQkR5yD2u18I9MnhImcerbjg+7GS7+v9EyyAnpBKVX4KDQyVsDviDtkBVosLBzufDnkANZiFS9ZROp3N8Q90VpWWoWQOvjcmwcikBtHYTKBzh/JIUOjOu+WaPA4o8jKO2csoDeMrZAzRtT+N3JWArZH1G3u0N40q8+Dnyysu+d8OA+Pub2QJ6KRx+Bzq85FsuyyXbBJf3bi3SYiTg+uL1NXLVbZiColSiivZwdP8mfOVp08W8WBbwbv4VeTU9OjE75eD98nL8=
Content-ID: <1498D07C711E3A46BBAE89F1988EAF56@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 80031b57-9825-42cf-990f-08d6f3cccc2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 09:10:24.8496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190618_021032_639216_B4635F11 
X-CRM114-Status: GOOD (  14.43  )
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
Cc: marex@denx.de, devicetree@vger.kernel.org, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

+Rob, devicetree@vger.kernel.org

Hi, Rob,

Dinh forgot to send this to the device tree mailing list. Would you please
review it?

Thanks,
ta

On 06/13/2019 02:31 PM, Dinh Nguyen wrote:
> External E-Mail
> 
> 
> The QSPI module can have an optional reset signals that will hold the
> module in a reset state.
> 
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
> v6: no change
> v5: document reset-names
> v4: no change
> v3: created base on review comments
> v2: did not exist
> v1: did not exist
> ---
>  Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> index 4345c3a6f530..945be7d5b236 100644
> --- a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> +++ b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
> @@ -35,6 +35,9 @@ custom properties:
>  		  (qspi_n_ss_out).
>  - cdns,tslch-ns : Delay in nanoseconds between setting qspi_n_ss_out low
>                    and first bit transfer.
> +- resets	: Must contain an entry for each entry in reset-names.
> +		  See ../reset/reset.txt for details.
> +- reset-names	: Must include either "qspi" and/or "qspi-ocp".
>  
>  Example:
>  
> @@ -50,6 +53,8 @@ Example:
>  		cdns,fifo-depth = <128>;
>  		cdns,fifo-width = <4>;
>  		cdns,trigger-address = <0x00000000>;
> +		resets = <&rst QSPI_RESET>, <&rst QSPI_OCP_RESET>;
> +		reset-names = "qspi", "qspi-ocp";
>  
>  		flash0: n25q00@0 {
>  			...
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
