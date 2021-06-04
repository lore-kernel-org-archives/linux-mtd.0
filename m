Return-Path: <SRS0=b8TW=K6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01325C4708F
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 13:23:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DCCA6141E
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 13:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DCCA6141E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=duagon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ng7el2HME8OjSkoZ6KVWtABpbScN6xv+STpna6xtUGE=; b=rHF0LhR4Sm8hGi
	v5XJTYn+/hDlxeX74QUZ1UgNeqvg3fyXAbJRGE5cQIG132D5Wn8djjC++J8BD3agnvm0HZBir/zje
	FwuTJOk1kBeTekRzRCyn06XtNP47HSEPl3hfnYYTUDBPFAAUzNTzIJzaBS3FQBmGsXXCugR4NXpJW
	e5m4D+VXbV+RQzPM/LeYfvD5eYDtnJWqRnIdUYC3FmuIV+8a6PiFlftLGrWN0g/o/hR8eSz1O5QKJ
	+m7EtUZCMzdJkcMHA3j+tRlD6ur61nl8s0wkmnyV8MCzP6yIEUUFXqQb2IO16pC2eFKLuw5QgzkdJ
	MiLNXVyWuqvfIpap56YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp9mT-00DjHV-TC; Fri, 04 Jun 2021 13:22:33 +0000
Received: from mail1.bemta26.messagelabs.com ([85.158.142.1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp9mN-00Dj3P-Jg
 for linux-mtd@lists.infradead.org; Fri, 04 Jun 2021 13:22:32 +0000
Received: from [100.113.3.92] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 75/FB-37841-3092AB06;
 Fri, 04 Jun 2021 13:22:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDKsWRWlGSWpSXmKPExsWi1/P8kC6z5q4
 Eg+9XZSx2Ny1jd2D02LykPoAxijUzLym/IoE14/eNj4wFy7Uqzq76zdzA2CXbxcjFISSwnFFi
 0cR3bF2MnEDOJkaJrTO0QGw2AR2JY52TGEFsEQFniXu9V5lAbGEBA4nTx05DxU0lTi65zgZh6
 0ms63rKAmKzCKhIzDm5G8zmFXCU+PFuDjuIzSggK9F34ghYPbOAuMSmZ99ZQWwJAQGJJXvOM0
 PYohIvH/8DinMA2RoSSy97QYQlJPbt7mWDsA0kti7dxwJhy0vMnnEDKs4p0f3vMdR4HYkFuz9
 B2doSyxa+ZoY4R1Di5MwnLBMYRWchuWIWkpZZSFpmIWlZwMiyitEyqSgzPaMkNzEzR9fQwEDX
 0NBY11jX0MxQL7FKN1EvtVQ3OTWvpCgRKKuXWF6sV1yZm5yTopeXWrKJERhNKYXMC3cw/nj9Q
 e8QoyQHk5Iob+j/nQlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHjlZHclCAkWpaanVqRl5gAjGy
 YtwcGjJMKrrA6U5i0uSMwtzkyHSJ1itOeY8HLuImaOg0fnAcnL10Hkg6v3VjELseTl56VKifO
 GgrQJgLRllObBDYUlokuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHk/qwFN4cnMK4Hb/Qro
 LCagswS8toGcVZKIkJJqYMpJftbg812oda+jUNGtvUpatelCShfna/DvKchZOz3yE8uRlimuW
 z8+jrqaslqKWeNDnliqePd011LrilqW1AdS/5P0Lty7/4B5434bzZo8jZUHf5frVHz8sVyq2T
 TgG8OG5rYMbufPyw+V/ed5XtWyK/Trvy9aD3c4Ch37++nc1+Rex9rezRbz74eIsJU9O5Pn4Gu
 qmNas/ePmZ/br7Ef3FgZ8afq/rmZJ0t9zFrkZTque/WZjsaipnud85PYHCZkK9fM34x03qAgx
 M7fsl7rLtJT99K2QlBNupW0L6pz5T+3dtesAb94N4/onZZ0qZpNdLgR+f+Tm+z//6+S5S5X9y
 ypenD7gZK9X28i3SomlOCPRUIu5qDgRAI/SVu2/AwAA
X-Env-Sender: Walter.Stoll@duagon.com
X-Msg-Ref: server-13.tower-233.messagelabs.com!1622812930!2216784!1
X-Originating-IP: [46.140.231.194]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11248 invoked from network); 4 Jun 2021 13:22:11 -0000
Received: from 46-140-231-194.static.upc.ch (HELO chdua14.duagon.ads)
 (46.140.231.194)
 by server-13.tower-233.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted
 SMTP; 4 Jun 2021 13:22:11 -0000
Received: from chdua14.duagon.ads (172.16.90.14) by chdua14.duagon.ads
 (172.16.90.14) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Jun
 2021 15:21:45 +0200
Received: from chdua14.duagon.ads ([fe80::4058:63e9:621d:cb5]) by
 chdua14.duagon.ads ([fe80::4058:63e9:621d:cb5%12]) with mapi id
 15.00.1497.015; Fri, 4 Jun 2021 15:21:45 +0200
From: Walter Stoll <Walter.Stoll@duagon.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: UBIFS volume is filled up by power cuts
Thread-Topic: UBIFS volume is filled up by power cuts
Thread-Index: AddZRDpr/q9aIkp2T8uNhIT6R4bzJQ==
Date: Fri, 4 Jun 2021 13:21:45 +0000
Message-ID: <b26bd72b6044435f919d0d5917326020@chdua14.duagon.ads>
Accept-Language: en-US, de-CH
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-codetwo-clientsignature-inserted: true
x-codetwoprocessed: true
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.17.0.41]
x-loop: 1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_062227_870731_2B425C60 
X-CRM114-Status: GOOD (  12.30  )
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

Hi all

During stress tests we observe NAND flashes being filled up by power cuts
without effectively holding according data. We were able to reproduce the
effect with a simplified test procedure as follows:

1) Switch on the device
2) Run the following script (with no parameters)

    #!/bin/bash
    size=${1:-4000000}
    loops=${2:-20}
    df | grep ubi0
    for i in $(seq 1 ${loops}); do
        head -c ${size} /dev/urandom > rnd.bin
        rm rnd.bin
    done

3) Switch off the device


Please note that the number of loops and the file size in the script above are
crucial. We had to play around with these parameters until the effect was
clearly visible.


Effect description
------------------

When we execute the test 10 times, we see the following script output:

ubi0:rootfs             439340     27760    411580   6% /
ubi0:rootfs             439340     31508    407832   7% /
ubi0:rootfs             439340     35248    404092   8% /
ubi0:rootfs             439340     39228    400112   9% /
ubi0:rootfs             439340     42968    396372  10% /
ubi0:rootfs             439340     46700    392640  11% /
ubi0:rootfs             439340     50680    388660  12% /
ubi0:rootfs             439340     54420    384920  12% /
ubi0:rootfs             439340     58160    381180  13% /
ubi0:rootfs             439340     62144    377196  14% /

=> We loose about 3800 1k-blocks per power-cut. As a result, the flash is left
    unusable after about 100 test executions.


Environment description
-----------------------

Our devices run with a vanialla v5.4.69-rt39 kernel on a TI AM335x (Sitara)
based SoC (ARM aarch32 architecture). We run a very basic Linux system with the
following user space processes:  

  127 root      2784 S    /sbin/udevd -d
  331 root      2480 S    /usr/sbin/dropbear -r /etc/dropbear/dropbear_rsa_hos
  341 ntp       7568 S    /usr/sbin/ntpd -u ntp:ntp -p /var/run/ntpd.pid -g
  348 root      2304 S    /sbin/syslogd -n -O /var/log/messages -s 1000 -b 3
  351 root      2304 S    /sbin/klogd -n
  356 root      5232 S    /usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf
  362 root      2904 S    {start_getty} /bin/sh /bin/start_getty 115200 ttyO0
  363 root      2304 S    /sbin/getty 38400 tty1
  377 root      3128 S    -sh

We use mtd-utils version 2.1.2 commit 7b986779342021bda87c04da3bf729718736d8ab
from git://git.infradead.org/mtd-utils.git.

We use a Micron MT29F8G08ADAFAWP NAND flash (256k block size).
mtdinfo:
    Name:                           rootfs1
    Type:                           nand
    Eraseblock size:                262144 bytes, 256.0 KiB
    Amount of eraseblocks:          1984 (520093696 bytes, 496.0 MiB)
    Minimum input/output unit size: 4096 bytes
    Sub-page size:                  1024 bytes
    OOB size:                       256 bytes
    Character device major/minor:   90:12
    Bad blocks are allowed:         true
    Device is writable:             true

UBI/UBIFS relate kernel configuration:

    CONFIG_UBIFS_FS=y
    # CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
    CONFIG_UBIFS_FS_LZO=y
    CONFIG_UBIFS_FS_ZLIB=y
    CONFIG_UBIFS_FS_ZSTD=y
    # CONFIG_UBIFS_ATIME_SUPPORT is not set
    CONFIG_UBIFS_FS_XATTR=y
    CONFIG_UBIFS_FS_SECURITY=y
    # CONFIG_UBIFS_FS_AUTHENTICATION is not set

    CONFIG_MTD_UBI=y
    CONFIG_MTD_UBI_WL_THRESHOLD=4096
    CONFIG_MTD_UBI_BEB_LIMIT=20
    # CONFIG_MTD_UBI_FASTMAP is not set
    # CONFIG_MTD_UBI_GLUEBI is not set
    # CONFIG_MTD_UBI_BLOCK is not set


Further information
-------------------

We executed the following further tests:

* Run mtd tests:
    - nandbiterrs
    - flash_stress
    - flash_readtest
    - nandpagetest
    - nandsubpagetest
    
    All tests pass except flash_readtest. This test returns us one error per
    block:

        libmtd: error!: Cannot write 256 OOB bytes to address 1024 (OOB \
        offset 1024) - mtd6 OOB size is only 256 bytes
        Error reading OOB in block 0, page 1
        ...
        libmtd: error!: Cannot write 256 OOB bytes to address 519832576 (OOB \
        offset 1024) - mtd6 OOB size is only 256 bytes
        Error reading OOB in block 1983, page 1

    We have no clue how to interprete this error. OOB starts at address 4096
    not 1024.

* Run test with a non realtime v5.4.69 vanialla kernel.
    => same results
    
* Run test with a Micron MT29F8G08ABABAWP NAND flash (512k block size)
    mtdinfo:
        Name:                           rootfs1
        Type:                           nand
        Eraseblock size:                524288 bytes, 512.0 KiB
        Amount of eraseblocks:          992 (520093696 bytes, 496.0 MiB)
        Minimum input/output unit size: 4096 bytes
        Sub-page size:                  1024 bytes
        OOB size:                       224 bytes
        Character device major/minor:   90:12
        Bad blocks are allowed:         true
        Device is writable:             true
    => same results

* Run modified script with sync instruction in the loop:

        #!/bin/bash
        size=${1:-4000000}
        loops=${2:-20}
        df | grep ubi0
        for i in $(seq 1 ${loops}); do
            head -c ${size} /dev/urandom > rnd.bin
            rm rnd.bin
            sync
        done

    => The effect disappears. The same is true if we mount the partition
        synchronously.



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
