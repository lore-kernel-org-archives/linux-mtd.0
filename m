Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2825ACDB47E
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Oct 2023 14:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U+7wv0hA5FZP9/seoW+s8mZOxvn4e9cSIxvbcRQ9VoU=; b=Qbg0TJPz/X6kWd
	GWL4lLXGQJ7mSH7x5DYe1Zn4f2RACfb9rwe81kWiN+N7vV5SSg3MQJf5EN0iaLJAyGciOIhUfbW2o
	RedW70Dw4WraAa6OTHrsMZZrK8Guu7vkjYIfz3JVA0IrTFq03DIddldBnUU8+B0hIB2tny1ABga1j
	gRT+cGtZTSDMHLk0CESBf5pPv8nlINEDaS5BGU6ON30bVwLgYDNprft6+Dpz9IgA5j+TzySNL+7cs
	3AqW+zpctPN57NIW/UcMG1anMoNorPOyQA358cWvtdr/WG0sIIELVqzXBkdbIBA4X8tMPBzJWdJ5W
	teeIiV+PvQyhAvXnSNZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt7Gl-00ErDH-2J;
	Wed, 18 Oct 2023 14:11:31 +0000
Received: from mail-vi1eur02on20614.outbound.protection.outlook.com ([2a01:111:f400:fe16::614] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt7Gh-00ErCh-0L
	for linux-mtd@lists.infradead.org;
	Wed, 18 Oct 2023 14:11:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ezRlaRDSZyaC5rfYalOqeDWMhGGKxiIVhro+AaDV58S6vYiQgaLGsNmmwZKn/QFtt8DW0MUl9qZES1ssFMHMUIndwTQoL1U6MNuR1+pvVEPrE8n5UHiA3nZsTCgrQwNeys1kGh2aATF3UfgoFkXVbgBmIVSAjdDFBBxrw88yRnURKpnIuF4t6rhAyYxsqGXUNVqROVtA1ZtwC4KV3eXDOlPMZWh43ihBrTQ+BBSq8BntD/bv4BgY6U3BQKFOYkx7CJKcUnF2xUHmAd15UPD+bpdA4rTHyNKOxbGtTgYSnpxQkKjDaRgcWnrHI2qvj36IfYzILwtH8FCkjgt5XUXtjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UE1Bo/hm3xyyagv3MYHglTPU2pTpQ1ld6Gy1DxjTDo=;
 b=L1o41tovkHHnKt2JAPgvCH9eoJ0SC3nlcq6HuQtrZSgrgeO5hrVxibZX5Aeg4+WBcnQwNA+2o0BardQF10KOiefbIFN6/uUFq221qnMIx/hKvslpgEDRiYDdPnqCQr4lPwLLJLl0O2qc3w7M/yqVdR6jlrE2wiD9tKREKpqKmOhQ3BH2wiGJY1uqN8+up2v1OPKmNRVW1G7qE6L/Vu957eKamWIQ2tLZyNLVeqUZ74YLeyHDFbYmSjEVgifPHLqt0VA857rcrX6xfLcRr9Y8OUDyZknLQguNMqot1qE2op1Rjt6QsgZ8J+6Mjok8dBIr6f3jLNBcob7OYU66HbwW5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=andasis.com; dmarc=pass action=none header.from=andasis.com;
 dkim=pass header.d=andasis.com; arc=none
Received: from VI1P192MB0285.EURP192.PROD.OUTLOOK.COM (2603:10a6:803:36::14)
 by AS8P192MB1208.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3c0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.22; Wed, 18 Oct
 2023 14:11:18 +0000
Received: from VI1P192MB0285.EURP192.PROD.OUTLOOK.COM
 ([fe80::6ce0:d71b:f240:a1c6]) by VI1P192MB0285.EURP192.PROD.OUTLOOK.COM
 ([fe80::6ce0:d71b:f240:a1c6%3]) with mapi id 15.20.6886.034; Wed, 18 Oct 2023
 14:11:17 +0000
From: yusuf.kaya andasis.com <yusuf.kaya@andasis.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Ubifs mounting error causes kernel panic
Thread-Topic: Ubifs mounting error causes kernel panic
Thread-Index: AQHaAcRxw0ybq0NgZ0GHGRjpBRGinA==
Date: Wed, 18 Oct 2023 14:11:17 +0000
Message-ID: <VI1P192MB028586F7A85B66350BA9977886D5A@VI1P192MB0285.EURP192.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=andasis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P192MB0285:EE_|AS8P192MB1208:EE_
x-ms-office365-filtering-correlation-id: 61449b6c-5964-417b-9054-08dbcfe418ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hky223/0E6/Lx3HuJutto4q9nAXvb81RurweBqct3+aByNdzqSfHS4mV21b1mQ50PQw9z+FbsujhkcUDfyr/Ksc0PRKZX6GaGfKopIEkDAztiz4TzvoGrx4spM83PYERT8xOAmbwnaYLMFNzkr5aIfH8l+HsnjOu+GWw2m/x53IFnYPwMZ5LdNgmWBAOagPUbWJ9/w7ZUKXjChDJPJjg9n5yYx2WM505x06ukf0yX26sbJpWOj01tgVH3CB6XIYK8ilmTziuYB1hOWlnxm820NNxla3t627HJLRiLxNlzw6kjWlCG4noIivaSYqwDty2G5wIcF3pt5400v1S5oHJgFUdyWETAr9a/pn5X41WDw11S5pWkxm8bdXsNuCajr5ZjoSJ+EtwMbpmR9ZxYjVybQGqOpj2Hx4nfDPNdMNJkbE2Yr9gr4y08LgJpMBIUTkghrPartpl6NOkcElOg0SpBVzeGcXbh056r82YIrX0OtiLS6QdBzfeHXkLqR90vJ11CbBOYviFRV+yqhmL06s+2BeQZALKflJekmqdQ7n6WDucclt8maxRMsei/vjqsdbPliED3YS9AAMJZitZMNCfYssRKVVuH90XXmVwH7KSS3R0YZO6N2iy0rQWl63+9ZFGwnibTA/3edlaV5T9VkWEyg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P192MB0285.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(136003)(396003)(346002)(376002)(366004)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(71200400001)(26005)(9686003)(6506007)(478600001)(83380400001)(7696005)(30864003)(2906002)(64756008)(8676002)(66556008)(66946007)(66476007)(76116006)(66446008)(8936002)(52536014)(316002)(6916009)(41300700001)(5660300002)(86362001)(122000001)(38070700005)(38100700002)(55016003)(33656002)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?AONXs8LbHoswek3fm6OarHEU0ea0Iw9jccsMk1jFPxOXwqY43aJP0au7dm?=
 =?iso-8859-1?Q?c27iqKhC91W3XR+zb+K6YCu2MXYNDcsBc0+D140MM40fvmvGnNwngSLASz?=
 =?iso-8859-1?Q?PDNd1GwzI6ab/aMpZdPXG9v82OTHjxd8HzqRq6jc9pXnitFC6PkSo06g+d?=
 =?iso-8859-1?Q?cnxhhUDmtfXFub6rpobg9zJx2MDcPcPLMciFB8OsdbgwJqTNc5Uhmh6rdd?=
 =?iso-8859-1?Q?igir8YL+JdQeDzpVMgyLh5pU2s4lI4rJ23S/gMOd7/Ylr/szMSdCIvgy9m?=
 =?iso-8859-1?Q?FR/z03lAGaD6/efp8xNeLEXeyN+yBw8HQeUtoTOKIYpd/7MpwpIf65JT/7?=
 =?iso-8859-1?Q?Mii91B75ir2dp+ZwlwpWM5qTPZ1lrfuUAhhKq4KfagZch4D97Ig9GtBefb?=
 =?iso-8859-1?Q?tdTGXpW5BNl0R4tK8TldX2IjjnOFdFYpX//SU0a4MP/fanweaUZ4YP8sQu?=
 =?iso-8859-1?Q?x5b+vgpUFVpuoXhYTj5p+TY7Qh6HLdJj1M/XQ6KqAfzb39/wvplZMxkMJT?=
 =?iso-8859-1?Q?7VBHISF0v6wPtrdGbDWltr/qTZbrdMny+1Dummexa1Rp+1hV/isetm9YQL?=
 =?iso-8859-1?Q?H/hutebpvNl/zuNviwdAuuullfkiCstE9JyTE6KTdWCLoDGe6BjgAT3clu?=
 =?iso-8859-1?Q?R/HcO4Jyy24QhI3bTG42Iv6d3lSjlc+BSrJSOSfttYwQHONUPvZ23c4LU0?=
 =?iso-8859-1?Q?05hukYMPVcAOjq/a3lLPk04lf7GLDC7Epz96pWYzCKPFbEU0J6GLXhDtvA?=
 =?iso-8859-1?Q?dzVJcoGnnEgjtHnUfbIZ4Gq4bbRkUxWfu94W1NnmLP39pFWqNZKRrKIK7s?=
 =?iso-8859-1?Q?xStUun83CzSCUlautnzxQ/QrKSz1zKQryLTxsXrLuNkqfOeOw5rHb8lXlW?=
 =?iso-8859-1?Q?ASY91W2RRs2aIGKvm6gQPH4Z1i5lkKwl37h+BO5/TFCi+gonNru+oXpxd3?=
 =?iso-8859-1?Q?BggZQhCcQSFMLqZJJ5tTj4T5RSEkVHHguTmqCNAbJ7Qsv1nqR3cZuxTU7R?=
 =?iso-8859-1?Q?c+a4Rz8MQqusmuHRVujAfg0zsuv043SG6WT41T9j98zaE9a92zrJkJda4t?=
 =?iso-8859-1?Q?5pTLMNrW13XOunJSGGiC7bPv761sH3HNIsJd7CqNQBRZTWXw4Epg+4lbzA?=
 =?iso-8859-1?Q?UGRjqD+2Co2if8gZwmGE8Cbsrvhc5Dwh1QsUDGivxl/No81il+3ggXWBug?=
 =?iso-8859-1?Q?xRU2RPJ+wCHb3FmwYxHGCt1AIE8DJsX6MQqtWpL33jrDhWEkaaAyou4HQi?=
 =?iso-8859-1?Q?NuMiV6GYcCQR2tLIsvXm5V+5F8QK11WYqwrj0vvK9KDgcaBDVStpq+o1IN?=
 =?iso-8859-1?Q?475mmvO59tsWg7XMx29Wc3MquPBqCfuRIXWbMwOH/thR04t07o2Vjkg5fT?=
 =?iso-8859-1?Q?E4hkih/gqaAijgzPsMju4UstvbY1PfXQ3ClGoiJ4BmlGyKtVD8zYekgrHz?=
 =?iso-8859-1?Q?os3rSzKpO/iv+E9wmWCiFNYIaWw4m0BxS0bzfJ01Kfnncc1KVpJG2rFPUz?=
 =?iso-8859-1?Q?JwwCP3aMcO8ZEA+tl6OwEGcMcw5IHxg4x/PNwSWhjvcdVEzPWgH0N3ytHt?=
 =?iso-8859-1?Q?J+nbpI8OIPj1d/SI8BMHSeAVEOA1fLW6uWLOZ66I/7TCJcZht7Uwx7xLK6?=
 =?iso-8859-1?Q?zMnJ3QjBifKM1L9v/0kLRbPRrjoPURRfbx?=
MIME-Version: 1.0
X-OriginatorOrg: andasis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P192MB0285.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 61449b6c-5964-417b-9054-08dbcfe418ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 14:11:17.8032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb78fb6a-1c86-49dc-ad03-faf7dff294ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AItYMMWKaxAuGFPpIpDtHu/fnIkb9oYmbEv85fNds4tX0ohWwBlcPaggnvT65QU5SXH76iCdBc/XFzIi6kSbWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P192MB1208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_071127_303481_B15C2268 
X-CRM114-Status: GOOD (  12.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,
I have MT29F4G08ABBDAH4-IT:D Micron NAND flash on my board. It is 512MiB size. I have LS1088A cpu on that board. I use Linux 5.4.3. I run u-boot, kernel, rootfs and several other partitions on the NAND. I created the partitions in device tree as follows:

/* DTS snippet begins */
&ifc {
	ranges = <0 0 0x5 0x30000000 0x00010000
		  2 0 0x5 0x20000000 0x00010000>;
	status = "okay";

	nand@0,0 {
		compatible = "fsl,ifc-nand";
		reg = <0x0 0x0 0x10000>;
		#address-cells = <1>;
		#size-cells = <1>;
		partition@0 {
			label = "NAND.kernel";
			reg = <0x00000000 0x02D00000>;
		};
		partition@1 {
			label = "NAND.file-system.config";
			reg = <0x02D00000 0x02000000>;
		};
		partition@2 {
			label = "NAND.file-system.backup";
			reg = <0x04D00000 0x0C800000>;
		};
		partition@3 {
			label = "NAND.file-system.log";
			reg = <0x11500000 0x01000000>;
		};
		partition@4 {
			label = "NAND.file-system";
			reg = <0x12500000 0x0DB00000>;
		};
	};
};
/* DTS snippet ends */

And my u-boot parameters as follows:

/* U-Boot snippet begins */
#define MTDIDS_DEFAULT		"nand0=nand.0"

#define MTDPARTS_DEFAULT		"mtdparts=nand.0:" \
					"45m(NAND.kernel)," \
					"32m(NAND.file-system.config)," \
					"200m(NAND.file-system.backup)," \
					"16m(NAND.file-system.log)," \
					"-(NAND.file-system)"

#define NANDARGS \
	"mtdids=" MTDIDS_DEFAULT "\0" \
	"mtdparts=" MTDPARTS_DEFAULT "\0" \
	"nandargs=setenv bootargs " \
		"console=${console} " \
		"fdtfile=${fdtfile} " \
		"nandsize=${nand_size} " \
		"mtdparts=${mtdparts} " \
		"ubi.mtd=NAND.file-system,2048 " \
		"root=${nandroot} " \
		"rootfstype=${nandrootfstype} " \
		"earlyprintk debug=3 rootwait\0" \
	"nandroot=ubi0:NAND.file-system rw rootflags=sync\0" \
	"nandrootfstype=ubifs\0" \
	"nandboot="\
		"run mtdparts; " \
		"run nandargs; " \
                "if ubi part NAND.kernel; then " \
			"if ubifsmount ubi0:NAND.kernel; then " \
				"echo Booting from NAND.kernel ...; " \
				"if ubifsload ${mc_addr_r} ${mc_file}; then " \
					"if ubifsload ${dpc_addr_r} ${dpc_file}; then " \
						"fsl_mc start mc ${mc_addr_r} ${dpc_addr_r};" \
					"fi;"\
				"fi;" \
				"if ubifsload ${dpl_addr_r} ${dpl_file}; then " \
					"fsl_mc lazyapply dpl ${dpl_addr_r};" \
				"fi;" \
				"if ubifsload ${kernel_addr_r} ${bootfile}; then " \
					"if ubifsload ${fdt_addr_r} ${fdtfile}; then " \
						"booti ${kernel_addr_r} - ${fdt_addr_r};"	\
/* U-Boot snippet ends */

And I created the ubi files one by one as follows:

/* Script snippet for rootfs ubi begins */
build_root_ubi() {
    pushd "$RELEASE_DIR" > /dev/null
    cat <<- EOF > ubinize.cfg
	[rootfs]
	# Volume mode (other option is static)
	mode=ubi
	# Source image
	image=root.ubifs
	# Volume ID in UBI image
	vol_id=0
	# Allow for dynamic resize
	vol_size=200MiB
	vol_type=dynamic
	# Volume name
	vol_name=NAND.file-system
	# Autoresize volume at first mount
	vol_flags=autoresize
EOF
    mkfs.ubifs -r filesystem_ubi/ -F -m 2048 -e 124KiB -c 4096 -o root.ubifs
    ubinize -o filesystem_ubi/root.ubi -m 2048 -p 128KiB -s 2048 -O 2048 ubinize.cfg
    cp filesystem_ubi/root.ubi "$RELEASE_DIR/update/"
    cp filesystem_ubi/root.ubi "$RELEASE_DIR/filesystem/"
    cp filesystem_ubi/root.ubi "$RELEASE_DIR/filesystem/usr/and/backup/"
    rm {ubinize.cfg,root.ubifs}
    popd > /dev/null
}
/* Script snippet for rootfs ubi ends */

And I writing the ubi files to NAND as follows:

/* Script snippet for rootfs ubi begins */
    # create flash-root.sh script
    sudo tee $RELEASE_DIR/filesystem/root/.local/bin/flash-root.sh > /dev/null <<- EOF
#!/bin/sh
set -e

ubidetach /dev/ubi_ctrl -m 4 || true
ubiformat /dev/mtd4 -f /root.ubi -s 2048
EOF
    sudo chmod u+x $RELEASE_DIR/filesystem/root/.local/bin/flash-root.sh
/* Script snippet for rootfs ubi ends */

So after that informations do you see anything wron in my configuration? After that section first I write the board code to an SD card and run the device from it. After opening kernel I write the ubi files to NAND as below and reboot the board and run it from NAND. At first mostly there is no error when kernel and rootfs is opening. There is ubifs logs for kernel and rootfs as follows:

/* Kernel and rootfs mounting logs begin*/
ubi0: attaching mtd1
ubi0: scanning is finished
ubi0: attached mtd1 (name "NAND.kernel", size 45 MiB)
ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
ubi0: good PEBs: 360, bad PEBs: 0, corrupted PEBs: 0
ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
ubi0: max/mean erase counter: 3/2, WL threshold: 4096, image sequence number: 419214874
ubi0: available PEBs: 0, total reserved PEBs: 360, PEBs reserved for bad PEB handling: 80

[    3.905750] ubi0: attaching mtd4
[    3.984291] random: fast init done
[    5.345916] ubi0: scanning is finished
[    5.362184] ubi0: attached mtd4 (name "NAND.file-system", size 219 MiB)
[    5.368824] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
[    5.375717] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[    5.382523] ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
[    5.389504] ubi0: good PEBs: 1748, bad PEBs: 4, corrupted PEBs: 0
[    5.395614] ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
[    5.402855] ubi0: max/mean erase counter: 2/0, WL threshold: 4096, image sequence number: 1086286734
[    5.412013] ubi0: available PEBs: 0, total reserved PEBs: 1748, PEBs reserved for bad PEB handling: 76
[    5.476431] UBIFS: parse sync
[    5.480400] UBIFS (ubi0:0): Mounting in unauthenticated mode
[    5.486182] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 241
[    5.536650] UBIFS (ubi0:0): recovery needed
[    5.666057] UBIFS (ubi0:0): recovery completed
[    5.670584] UBIFS (ubi0:0): UBIFS: mounted UBI device 0, volume 0, name "NAND.file-system"
[    5.678870] UBIFS (ubi0:0): LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048 bytes/2048 bytes
[    5.688811] UBIFS (ubi0:0): FS size: 210399232 bytes (200 MiB, 1657 LEBs), journal size 9023488 bytes (8 MiB, 72 LEBs)
[    5.699531] UBIFS (ubi0:0): reserved for root: 0 bytes (0 KiB)
[    5.705379] UBIFS (ubi0:0): media format: w4/r0 (latest is w5/r0), UUID A820488C-5A5A-496A-8898-D990B0325EDC, small LPT model
[    5.718319] VFS: Mounted root (ubifs filesystem) on device 0:20.
[    5.727175] devtmpfs: mounted
/* Kernel and rootfs mounting logs end*/

So as far as here I have one question: The rootfs partition says "Fixing free space" at the first time after I write it to NAND, it is normal. But after the first time it is always says "recovery needed" although I am soft reboot it or not. I cannot understand that. Lets continue, After that normally there is no error unless I install a openwrt ipk package that holds middleware level of my board. After the installation of package with "opkg install --force-reinstall xxx.ipk" I reboot the device and sometimes (sometimes at first, sometimes at 10th try of installation of ipk package) at the mounting of rootfs it says:

/* Rootfs mounting logs begin*/
[    3.905928] ubi0: attaching mtd4
[    3.982237] random: fast init done
[    5.277840] ubi0: scanning is finished
[    5.293738] ubi0: attached mtd4 (name "NAND.file-system", size 219 MiB)
[    5.300379] ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
[    5.307275] ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
[    5.314080] ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
[    5.321058] ubi0: good PEBs: 1748, bad PEBs: 4, corrupted PEBs: 0
[    5.327166] ubi0: user volume: 1, internal volumes: 1, max. volumes count: 128
[    5.334407] ubi0: max/mean erase counter: 2/0, WL threshold: 4096, image sequence number: 1086286734
[    5.343562] ubi0: available PEBs: 0, total reserved PEBs: 1748, PEBs reserved for bad PEB handling: 76
[    5.352926] printk: console [netcon0] enabled
[    5.352976] ubi0: background thread "ubi_bgt0d" started, PID 238
[    5.408066] UBIFS: parse sync
[    5.411946] UBIFS (ubi0:0): Mounting in unauthenticated mode
[    5.417697] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" started, PID 242
[    5.465889] UBIFS (ubi0:0): recovery needed
[    5.633511] UBIFS (ubi0:0): background thread "ubifs_bgt0_0" stops
[    5.639918] VFS: Cannot open root device "ubi0:NAND.file-system" or unknown-block(0,0): error -2
[    5.648732] Please append a correct "root=" boot option; here are the available partitions:
[    5.657108] 0100            4096 ram0 
[    5.657110]  (driver?)
[    5.663228] 0101            4096 ram1 
[    5.663229]  (driver?)
[    5.669347] 0102            4096 ram2 
[    5.669348]  (driver?)
[    5.675466] 0103            4096 ram3 
[    5.675467]  (driver?)
[    5.681584] 0104            4096 ram4 
[    5.681586]  (driver?)
[    5.687704] 0105            4096 ram5 
[    5.687705]  (driver?)
[    5.693823] 0106            4096 ram6 
[    5.693824]  (driver?)
[    5.699943] 0107            4096 ram7 
[    5.699944]  (driver?)
[    5.706062] 0108            4096 ram8 
[    5.706063]  (driver?)
[    5.712181] 0109            4096 ram9 
[    5.712182]  (driver?)
[    5.718300] 010a            4096 ram10 
[    5.718301]  (driver?)
[    5.724506] 010b            4096 ram11 
[    5.724507]  (driver?)
[    5.730713] 010c            4096 ram12 
[    5.730714]  (driver?)
[    5.736920] 010d            4096 ram13 
[    5.736921]  (driver?)
[    5.743126] 010e            4096 ram14 
[    5.743127]  (driver?)
[    5.749333] 010f            4096 ram15 
[    5.749334]  (driver?)
[    5.755545] 1f00           46080 mtdblock0 
[    5.755546]  (driver?)
[    5.762099] 1f01           32768 mtdblock1 
[    5.762100]  (driver?)
[    5.768655] 1f02          204800 mtdblock2 
[    5.768656]  (driver?)
[    5.775211] 1f03           16384 mtdblock3 
[    5.775212]  (driver?)
[    5.781766] 1f04          224256 mtdblock4 
[    5.781767]  (driver?)
[    5.788321] 1f05           65536 mtdblock5 
[    5.788322]  (driver?)
[    5.794876] b300        15558144 mmcblk0 
[    5.794878]  driver: mmcblk
[    5.801693]   b301          102400 mmcblk0p1 186fc0ac-01
[    5.801694] 
[    5.808508]   b302         1048576 mmcblk0p2 186fc0ac-02
[    5.808509] 
[    5.815323]   b303         6291456 mmcblk0p3 186fc0ac-03
[    5.815324] 
[    5.822137]   b304         8043008 mmcblk0p4 186fc0ac-04
[    5.822138] 
[    5.828954] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
[    5.837234] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.4.3 #4
[    5.843072] Hardware name: LS1088A RDB Board (DT)
[    5.847778] Call trace:
[    5.850229]  dump_backtrace+0x0/0x180
[    5.853893]  show_stack+0x14/0x20
[    5.857211]  dump_stack+0xbc/0x100
[    5.860614]  panic+0x15c/0x370
[    5.863670]  mount_block_root+0x1b0/0x2a8
[    5.867682]  prepare_namespace+0x98/0x1d0
[    5.871693]  kernel_init_freeable+0x264/0x2b0
[    5.876055]  kernel_init+0x10/0x108
[    5.879545]  ret_from_fork+0x10/0x18
[    5.883127] SMP: stopping secondary CPUs
[    5.887067] Kernel Offset: 0x257599200000 from 0xffff800010000000
[    5.893166] PHYS_OFFSET: 0xffffe54e00000000
[    5.897350] CPU features: 0x0002,2080200c
[    5.901360] Memory Limit: none
[    5.904419] ---[ end Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0) ]---
/* Rootfs mounting logs end*/

As you can see, after the recovery needed, the backgroung thread of ubifs stops due to error:-2, and because of this the rootfs partition cannot found and it cause a kernel panic of course. The only way to recover from that is rewrite the rootfs to NAND with ubiformat command. 

I trace it with printks and the error is from: ubifs_tnc_lookup() function that called in do_kill_orphans() function that called from kill_orphans() function that called from ubifs_mount_orphans() function that called from mount_ubifs() function. ubifs_tnc_lookup() returns -2 and then because of that the background process killed. What do you think about it? I have also several other openwrt packages and none of them causes this when installing the ipks. 

And worth mention that sometimes it is occuring after first writing of ubi to NAND with ubiformat. So it is possible that it is caused by openwrt package only.

Thank you for any support.
Best regards.

Jozephka99
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
