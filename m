Return-Path: <SRS0=cI5g=QH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E651C169C4
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 14:39:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A895218AF
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Jan 2019 14:39:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UnVJ+yUv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BUOuHYic";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=prevas.se header.i=@prevas.se header.b="VDMLWlBr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A895218AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=prevas.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=05lwmvYq/xEUhTsvNym7PksI0CNsLrHiY5tw2zX2GBg=; b=UnVJ+yUvwphcYQ
	WJZVdcq5Yv0ldnGxBAU2w/8fttF94zuHMePkTjCV4tjWJ4EECjf1l1nIB9jgsf3miTj1AGcBAeW26
	qCMGKU6bo15VaA/EnAUq1agoQYFL6QQQrSNGJC/0qAKdZBYK2+2AClbdgD5AfE4VSTNyaMPCqDwkk
	++oRZD1wMguEjDsthGWCET074xa1UhTsWapTVe3FzSHpdDj/E0rbl9Zd+xF7y7EA8OrkXBEq/YOWC
	D+yZJJjCXOdPXezCJZykXyaXLIV/PQjpmTucjARze5KjeU8W6HZwl7hzUkn21iKq7s1GO8JvS4J8Q
	jEbTPcBBXca/jxcsRFDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpDUy-00064w-CL; Thu, 31 Jan 2019 14:39:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpDUw-000603-QF
 for linux-mtd@bombadil.infradead.org; Thu, 31 Jan 2019 14:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Transfer-Encoding:
 Content-ID:Content-Type:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dhpAvMz00DfsuHQ7qwhJ4oQ6d8nQKvLV8McYsKdWqLU=; b=BUOuHYicmaP+/lvmkE6/CDIupK
 O1HzH48SwrfmhzCwy7eJ8clBRVwLAxg/otbM3ge/6m2ovIkt45vt2/nciX3oTlDYiZkvPoGJF9LAQ
 vTMAO37adtf4G/sjX20YqA3Bip0Fg36CyDHfTl/tZN4pOxhVa75ZzKC9AhaZn0BPUhUugRCxMFe7z
 r4D6LDptnTME1Zu2baCG1Sh5VlEbwu1fTdZ1DS/raMjOKfaPgWDgBTTsRjq0rZQE5C2Rdb0bATEuI
 PxoMkLZDBnEAAVdTLIdASv4vq/a0XyqJeqNYGHsf2m44OJAf301w+9C0KlIaXUubF/C+RcgRAlOqO
 +LGvs5RQ==;
Received: from mail-db5eur03on0713.outbound.protection.outlook.com
 ([2a01:111:f400:fe0a::713]
 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpDGY-0006yo-7Z
 for linux-mtd@lists.infradead.org; Thu, 31 Jan 2019 14:24:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhpAvMz00DfsuHQ7qwhJ4oQ6d8nQKvLV8McYsKdWqLU=;
 b=VDMLWlBrO+1SXCJN4OS0thh9z8H8HUKBEvNQja6w5auUJ8TSM5vF4dApRfr+ndxJLZb2ZNwn7tr8rcP3QsOggwVrhKKOW04htA24hrzckuQrzMFav5Uypp4s0EGiC92Dm9cyNYjzAUaHgpjoAynpXnD9WmDsQB4PES0VxYKkEXM=
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM (20.178.126.212) by
 VI1PR10MB2381.EURPRD10.PROD.OUTLOOK.COM (20.177.62.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.21; Thu, 31 Jan 2019 14:24:15 +0000
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d49:d85b:58bf:cd5b]) by VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d49:d85b:58bf:cd5b%6]) with mapi id 15.20.1580.019; Thu, 31 Jan 2019
 14:24:15 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: subpage reads/writes with fsl_elbc_nand driver
Thread-Topic: subpage reads/writes with fsl_elbc_nand driver
Thread-Index: AQHUuXCkCs8x79xs0UmK2tWFgzSp/w==
Date: Thu, 31 Jan 2019 14:24:15 +0000
Message-ID: <add8754e-e044-a6d7-2ead-067777afbde4@prevas.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0501CA0028.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::38) To VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e3::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.216.59.226]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR10MB2381;
 6:d6yGihtr5HKwVPy0UN5F4eM+39Q6LHsh5WYqTDM5LK764hD4yMnqeLxATo8OeREEY2HN8wfNcgf5eaCo+hGtMKAzTo/Hffhs1Fox7/Js8xrEdXm02Kx0Gr9+Men5o/Oxt0J7IQTgcFFUlyF23gxEHnWxJL1JMSWnzgimOtoqbIvCHRUmfIEG4u/N3/t+rFtlpsKZxGvv3uee+nY/2zrjhYGONdeMPSvHr75/plXpVMfJLhuYYxebj2O4r+PjnRppekj6zPbCjmYG78/7IlouMWUydzVPwN9uwYlynr+R96+kWYY8HLlJWXPe/wXLF/y85AfEU092xa6kz3KL2JZgiVULz3We2Sv+HgqGRV4WJXa8jvQt4MUGOwTeeFZaRiDfK6CqsSTxtWtG78mJKcYlbMFBQiPjN5cPkFCM4aHh1q3QSKpiloDPSkUL8ZVjbe5aBf5IKFzmea+UTDLB7/sm5A==;
 5:n5DH64HIQ6t4TmRlgiSMwHx6VyFDIzgfdlaJEFuq74p6Bd4/rXQiH30AUeAV3CpcPdwU26UbB4bLBaC9FSldSMpfpwtxDRNQuJEkGvX8vQKgMrHpwISTjwp3GYDgoLeZ3O+ajVpHy2otv8l5g05D36ibyOg8LnfVBLwjV8srByGkg6Po97JPH/xV5Z+EKr4s1kwitAl+k4tv4+R3/x2X+Q==;
 7:qh6st17P/apXyb8s7dM66NFiVXysIITPGLubZQ9C5N0Q4UTtyd/snNpD60IySw74pZtBt/NxjqidOTCsQH8FSVwt282hZjbRD92cnFe3cRkAUKnxcbi2EHZmSHvWEke24RvozP/KQa6sx2q/FoFfQQ==
x-ms-office365-filtering-correlation-id: 65ee31dc-e4e4-44f0-6f4e-08d68787c614
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:VI1PR10MB2381; 
x-ms-traffictypediagnostic: VI1PR10MB2381:
x-microsoft-antispam-prvs: <VI1PR10MB2381BE199B04F77844F0B40A8A910@VI1PR10MB2381.EURPRD10.PROD.OUTLOOK.COM>
x-forefront-prvs: 09347618C4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39850400004)(346002)(136003)(366004)(396003)(376002)(189003)(199004)(36756003)(8676002)(8976002)(8936002)(4326008)(6512007)(106356001)(71200400001)(478600001)(53936002)(81166006)(31686004)(14444005)(99286004)(71190400001)(72206003)(52116002)(6916009)(81156014)(14454004)(2906002)(5024004)(256004)(2501003)(486006)(44832011)(476003)(2616005)(5640700003)(42882007)(3846002)(25786009)(7736002)(31696002)(316002)(305945005)(102836004)(26005)(6486002)(186003)(74482002)(97736004)(6506007)(54906003)(68736007)(6116002)(2351001)(105586002)(386003)(66066001)(6436002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB2381;
 H:VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CjTJkBIWHQUqdJb2V0Kcb349u+FaAxHsgNRfW7VF2rYzzxd9OMDQLuwTVfCryoqz14TJ0Hl/AIQ+HZxizYlbdAbFnj6Zeulu6Zs1Jxuir77Anx9kkJ55Zg/OvbVO6WcD/CQ4dRQNT2YMfs/3mGdd5iTNpNsTHbv6LgxSy5zwcwrmwXV/ZVuADAUx5VFwoEFfU0hkI+JZipbFdqx9X8RWD+MJDYQaorvYhvd/s0xlxH+ilcByREeadMuUv+tcB7i6bnJrRr+TIH5AcyoHjAFf1lz4+ENBuNU5DNlIQbceRb6IOLd7CRzF/6tdp5kRRrAQPeSjKxvJk0QpkkZanB48VUCrD6LA63N3DUeXo87D2DY7a2GMX1aTqVATXonpG/t8c7ZASQX4vGnlvAs7SA69m1msMBsMAC3Tu6Rhc42XnFY=
Content-ID: <2F70FB223CBDDA4E9DF8E9B0F7A3F39F@EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ee31dc-e4e4-44f0-6f4e-08d68787c614
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2019 14:24:12.9744 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2381
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190131_142430_347272_B01EDF37 
X-CRM114-Status: GOOD (  15.45  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Esben Haabendal <eha@deif.com>, "Per N. Christensen" <pnc@deif.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

I'm in the process of upgrading a board from an old 3.14-based kernel
with quite a few out-of-tree patches to one based on 4.19, hopefully
with much fewer such patches.

In order to even get the new kernel to mount the existing root
filesystem, I've had to apply the hacks below:

--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -6657,6 +6657,11 @@ static int nand_scan_tail(struct mtd_info *mtd)
                pr_warn("WARNING: %s: the ECC used on your system is too
weak compared to the one required by the NAND chip\n",
                        mtd->name);

+       if (IS_ENABLED(CONFIG_ML300PCM31)) {
+               pr_warn("setting NAND_NO_SUBPAGE_WRITE bit\n");
+               chip->ecc.write_subpage = NULL;
+               chip->options |= NAND_NO_SUBPAGE_WRITE;
+       }
        /* Allow subpage writes up to ecc.steps. Not possible for MLC
flash */
        if (!(chip->options & NAND_NO_SUBPAGE_WRITE) && nand_is_slc(chip)) {
                switch (ecc->steps) {
@@ -6681,8 +6686,12 @@ static int nand_scan_tail(struct mtd_info *mtd)
        /* Large page NAND with SOFT_ECC should support subpage reads */
        switch (ecc->mode) {
        case NAND_ECC_SOFT:
-               if (chip->page_shift > 9)
-                       chip->options |= NAND_SUBPAGE_READ;
+               if (chip->page_shift > 9) {
+                       if (IS_ENABLED(CONFIG_ML300PCM31))
+                               pr_warn("setting of NAND_SUBPAGE_READ
bit has been patched out\n");
+                       else
+                               chip->options |= NAND_SUBPAGE_READ;
+               }
                break;

Without the latter, I get

    [    0.833134] fsl,elbc-fcm-nand fff00000.nand: fsl_elbc_cmdfunc:
error, unsupported command 0x5.
    [    0.841822] fsl,elbc-fcm-nand fff00000.nand: read_buf beyond end
of buffer (14 requested, 0 available)

and then an endless loop of errors. With that hunk, I get a little
longer, but without the former the boot stops at

    [    0.918927] ubi0 error: validate_ec_hdr: bad VID header offset
2048, expected 512
    [    0.926549] ubi0 error: validate_ec_hdr: bad EC header
    [    0.931745] Erase counter header dump:
    [    0.935547]        magic          0x55424923
    [    0.939344]        version        1
    [    0.942359]        ec             9
    [    0.945373]        vid_hdr_offset 2048
    [    0.948610]        data_offset    4096
    [    0.951879]        image_seq      1882958541
    [    0.955678]        hdr_crc        0x1a47f3d3
    ...
    [    1.059976] ubi0 error: ubi_io_read_ec_hdr: validation failed for
PEB 0
    [    1.066669] ubi0 error: ubi_attach_mtd_dev: failed to attach
mtd0, error -22
    [    1.073824] UBI error: cannot attach mtd0
    [    1.083983] VFS: Cannot open root device "ubi0:rootfs" or
unknown-block(0,0): error -19

I have

       nand-ecc-mode = "soft";
       nand-ecc-algo = "bch";
       nand-ecc-strength = <4>;
       nand-ecc-step-size = <512>;

in .dts. Is there some device-tree setting/quirk I can use to avoid the
above hacks? Alternatively, can someone provide some hints on how a
mainlinable patch achieving the above would look?

Thanks,
Rasmus
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
