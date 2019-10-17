Return-Path: <SRS0=Q04P=YK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7EF0ECE58D
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Oct 2019 17:38:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78F5F20820
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Oct 2019 17:38:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MWB7VEK6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cisco.com header.i=@cisco.com header.b="bamIFJ70";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cisco.onmicrosoft.com header.i=@cisco.onmicrosoft.com header.b="Wiss1Jz6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78F5F20820
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=cisco.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0ZP7MKbQVdPHiwq9BiQzTe3rsQFcEe2orHJT80EUQ/U=; b=MWB7VEK6Nf9SrQ
	KpN3wLJR6L+K4mkW9jRKmsySkTEiNQIdSVvJnJnLNPjJNu/uJPFyItezkxdYRsobdUN0PFVwXsOkX
	cfyE2/Bbh7h2HRiwjd5joniFbEHuQjJoDDESEOEPtbtPdKp7sMA+E4idnrd25w52Td9FDSGiLiMq6
	V9ReEV6CePU3GpxFwUxr7gduZxsmWlB7bg/qRByL8bqmk/87USniPEiBarmaW1inzCGdr4T2I0/pF
	MTvwofWS5C9a7OAiPstCPKSDDeR87ZaWyCdKdpBRrlj+qW+YEIfLdefEw3JEB5mjtIXbqQT8mVLd4
	T6fbJ0IhlqBSg9iGruew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iL9jU-0008Vy-MY; Thu, 17 Oct 2019 17:38:40 +0000
Received: from rcdn-iport-4.cisco.com ([173.37.86.75])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL9jA-00088E-LE
 for linux-mtd@lists.infradead.org; Thu, 17 Oct 2019 17:38:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=2475; q=dns/txt; s=iport;
 t=1571333900; x=1572543500;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=g+JKoqKEGA68pWeLBrH3HSGgDZzJ2kfwhN5ZQhgxcWE=;
 b=bamIFJ70xoBCQ0o1qt6v6u2AzEtSxm2cQ/cF3qCfvxz/8/18wJ7twQei
 kxJo/9j5vyoQWgnZ10uKfcfRkaLdsNw7ptj6K+jEmS0sG9P8N8isnPIfy
 8T9ojsMd9gUaPwasns+nR0fMPuGDy7LHeWgryYs2r25abKfjoOxpP+LKP 0=;
IronPort-PHdr: =?us-ascii?q?9a23=3Aijac4R+uHAY2nv9uRHGN82YQeigqvan1NQcJ65?=
 =?us-ascii?q?0hzqhDabmn44+8ZR7E/fs4iljPUM2b8P9Ch+fM+4HYEW0bqdfk0jgZdYBUER?=
 =?us-ascii?q?oMiMEYhQslVc2EA0T9I/fuRyc7B89FElRi+iLzPA=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AYAACOpqhd/5xdJa1lGwEBAQEBAQE?=
 =?us-ascii?q?FAQEBEQEBAwMBAQGBZwYBAQELAYFKUAWBQyAECyqHbAOEWIV4mluBLoEkA1Q?=
 =?us-ascii?q?JAQEBDAEBLQIBAYRAAoMGJDQJDgIDCQEBBAEBAQIBBQRthS0BC4VOFigGAQE?=
 =?us-ascii?q?3AREBPkImAQQODRqFRwMuAQKkcQKBOIhhgieCfQEBBYUIGIIXCYE0AYwNGIF?=
 =?us-ascii?q?/gRFGgh6FMoM+giyNBYhNghWVbgqCIgOVOYI6h1GELYsPjjCZPwIEAgQFAg4?=
 =?us-ascii?q?BAQWBUjmBWHAVgydQEBSBUAkDF4NQilN0gSmPWwEB?=
X-IronPort-AV: E=Sophos;i="5.67,308,1566864000"; d="scan'208";a="648497612"
Received: from rcdn-core-5.cisco.com ([173.37.93.156])
 by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 17 Oct 2019 17:38:18 +0000
Received: from XCH-RCD-005.cisco.com (xch-rcd-005.cisco.com [173.37.102.15])
 by rcdn-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id x9HHcIGb031957
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL)
 for <linux-mtd@lists.infradead.org>; Thu, 17 Oct 2019 17:38:18 GMT
Received: from xhs-rcd-002.cisco.com (173.37.227.247) by XCH-RCD-005.cisco.com
 (173.37.102.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 17 Oct 2019 12:38:17 -0500
Received: from xhs-aln-003.cisco.com (173.37.135.120) by xhs-rcd-002.cisco.com
 (173.37.227.247) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 17 Oct 2019 12:38:17 -0500
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (173.37.151.57)
 by xhs-aln-003.cisco.com (173.37.135.120) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 17 Oct 2019 12:38:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HS598ktbP8tmT+a3xroIob3QqF0FQ+Wo1jxjg21fqsIHTlTwS5V5SPsD7tJlKbQwZA4NGb1bhdl9y/k3wL/JXFVKNqY4Bv4Qk+EjCMux7/JluQQlabgsxv0+TJ3N5T4KUcDQIOCJ4WtVt8qJW/IicxrLV/yNJgefvLoDoMI6JGuoaFvfxBYz57+CDJjJnT3Wlo5sFTldN3Ab+IlIE/hi5ePb+v2KiKP2tTU7M4ApVvUdNzlHnHwCQqzvuKeXAseL8Ko7JSvEyudB9STAFx+C5b14vqgUHoAAR7iBaOu9I8DEzPL/7GSh7vV+QC3dUEoNXK2PtBizTdLoEGTH+lMnOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lkxx6wlLvRJB0Phd/m/Rjukb6+RO9gUoDzcz3vUtHM4=;
 b=KU3K9o8GJlylfAiJmfCzaVy+E1uvHpsvGnRKiyysWBd2pkYcKcKx2cK43KJdsKYhdvftvBUtYkBXjFCtwU5F+JtpkibAXFiPPAVz8kmiMm9KbKrFEZXyVIU2MyAttqkUv6Ws0sboG1Z/TNOKTMbiVw8kDII2ejLOOjbp3Az/3z0PXz8lXbDPHOwWtp/OuaW12yDKGcRwvljKyBhsxArgWM+AMJ2xUas3d1pEQNrQYVnXlnjrABBLZvmJHcDgLe4LocGmh8lVYd3c2VVF0/HitxPr/0Ivg3ZIUESWLBZCn0wbEll4/G/Wl5lqtlyEaFDDcHCh1lfUuHzHyGfJ1mG46g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com; 
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lkxx6wlLvRJB0Phd/m/Rjukb6+RO9gUoDzcz3vUtHM4=;
 b=Wiss1Jz6T/SSmMNSQDo9eT8x8fKCX+QRpje+T6b/fS1awwXggpk/MNfyIS0NkSUJ8GnDCIl0hvGOXgBI5LrWVZonjWapnRiB0NbmExS+H6V6ShTdykL3mdb4ip8Dfzgro1k9MdeA/q368+ST/AADM2wHgS4TbCM5v0BW/4el73g=
Received: from BYAPR11MB2566.namprd11.prod.outlook.com (52.135.223.29) by
 BYAPR11MB2775.namprd11.prod.outlook.com (52.135.222.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.19; Thu, 17 Oct 2019 17:38:16 +0000
Received: from BYAPR11MB2566.namprd11.prod.outlook.com
 ([fe80::acac:b16a:8b7b:76b0]) by BYAPR11MB2566.namprd11.prod.outlook.com
 ([fe80::acac:b16a:8b7b:76b0%6]) with mapi id 15.20.2347.023; Thu, 17 Oct 2019
 17:38:16 +0000
From: "Kiran Bangalore Sathyanarayana (kibangal)" <kibangal@cisco.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Seeing ubifs unmap LEB error with linux 2.6.35 kernel
Thread-Topic: Seeing ubifs unmap LEB error with linux 2.6.35 kernel
Thread-Index: AdWFDmSe+VFVbYeoQoW3Nhk42jFBOA==
Date: Thu, 17 Oct 2019 17:38:15 +0000
Message-ID: <BYAPR11MB2566C2E89585B6F7AD7F083DC56D0@BYAPR11MB2566.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=kibangal@cisco.com; 
x-originating-ip: [2001:420:c0e0:1008::3bb]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38296d5a-24a3-4cae-d2df-08d75328cab9
x-ms-traffictypediagnostic: BYAPR11MB2775:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB277546F1AE8ED7DFD3115CF4C56D0@BYAPR11MB2775.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(189003)(199004)(305945005)(7736002)(6116002)(476003)(25786009)(33656002)(74316002)(7696005)(46003)(81166006)(99286004)(5660300002)(186003)(52536014)(102836004)(4326008)(2351001)(256004)(81156014)(486006)(6506007)(14444005)(14454004)(478600001)(8676002)(8936002)(6916009)(86362001)(5640700003)(6436002)(55016002)(66946007)(2501003)(76116006)(66446008)(316002)(2906002)(71190400001)(66476007)(64756008)(66556008)(9686003)(107886003)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR11MB2775;
 H:BYAPR11MB2566.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: cisco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SfD0gnRldXBhLI4yneAMuL2BsofJgjc9cDAZKkntfMgmQtijbxhcBCUytXVOxJFyvT3zEf42rMSWxV0XI9wGK+Ni+u4akbK5LZ11ISD7aoJD2adS/tQ0nVfoaEgdWV+rjDiT1c3pfYzpzaSLATbGU1SiLC6Gt3V/mERArG00Xwsb7xexf4PdTqIA9598ps9RJi9qPnnPcqrQzJlhazHNXAPzuwnpiW9mAiIr2/407EID7z7/HB1TDrSSKgzOrIZoCnGmRSzjTajqcTcGPMkuCuAG4kxdP0ftWUd2K+XoRlsoTC85WLe9DohFADDpxopsLjy+TkiDTT1/DmjkJ3JBQcJcC14h5mhqqx3gZTBu3LiRswi+oOHaeIMvwqm1z+1hS6NVnhICGxp7RP3duD0crur4gB+EnjUOHukdzavaB9Q=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 38296d5a-24a3-4cae-d2df-08d75328cab9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 17:38:15.9678 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M/BWchadYqrpA8OIP5gnrRLhnd0SYIS7HiW7/heAkFhcFRAeaxT36wJUYrq3bXaN7avK+ACFyXQLo4v70ZZ/4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2775
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.15, xch-rcd-005.cisco.com
X-Outbound-Node: rcdn-core-5.cisco.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_103820_996857_898D65F4 
X-CRM114-Status: UNSURE (   5.32  )
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
Cc: "Sriranjan Bose \(srbose\)" <srbose@cisco.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,
We are seeing the below ubifs errors with linux 2.6.35 Kernel:

3:2019 Jul 21 13:13:03 UTC:4.0(2h):kernel:-:<3>UBIFS error (pid 24831): ubifs_leb_unmap: unmap LEB -1 failed, error -22
4:2019 Jul 21 13:13:03 UTC:4.0(2h):kernel:-:<4>UBIFS warning (pid 24831): ubifs_ro_mode: switched to read-only mode, error -22
3:2019 Jul 21 13:13:03 UTC:4.0(2h):kernel:-:<3>UBIFS error (pid 24831): make_reservation: cannot reserve 4144 bytes in jhead 2, error -22
3:2019 Jul 21 13:13:03 UTC:4.0(2h):kernel:-:<3>UBIFS error (pid 24831): do_writepage: cannot write page 98 of inode 67, error -22
3:2019 Jul 21 13:13:03 UTC:4.0(2h):kernel:-:<3>UBIFS error (pid 24581): make_reservation: cannot reserve 4144 bytes in jhead 2, error -30
3:2019 Jul 21 13:13:03 UTC:4.0(2h):kernel:-:<3>UBIFS error (pid 24581): do_writepage: cannot write page 99 of inode 67, error -30
3:2019 Jul 21 13:13:03 UTC:4.0(2h):kernel:-:<3>Buffer I/O error on device loop2, logical block 1

The system has a NAND flash with ubifs filesystem installed. The above errors happened randomly at runtime and ubifs switched to read-only mode.
The NAND flash itself is fine and there are no badblocks detected.
"ubinfo -a" output is as below:
UBI version:                    1
Count of UBI devices:           1
UBI control device major/minor: 10:63
Present UBI devices:            ubi0

ubi0:
Volumes count:                           1
Logical eraseblock size:                 126976
Total amount of logical eraseblocks:     1024 (130023424 bytes, 124.0 MiB)
Amount of available logical eraseblocks: 0 (0 bytes)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       0
Count of reserved physical eraseblocks:  10
Current maximum erase counter value:     536
Minimum input/output unit size:          2048 bytes
Character device major/minor:            235:0
Cisco UBI Flash Worn:                    No
Present volumes:                         0

Volume ID:   0 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        1010 LEBs (128245760 bytes, 122.3 MiB)
State:       OK
Name:        data
Character device major/minor: 235:1

This has occurred on multiple systems now.
Can you please provide me more info on this error? Is this any known issue with linux 2.6.35 Kernel?
Please let me know how to proceed with fixing this(any specific patch that needs to be specifically applied on 2.6.35 kernel).

Regards,
Kiran.



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
