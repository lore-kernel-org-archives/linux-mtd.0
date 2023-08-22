Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4206EE4996
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Aug 2023 08:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:From:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hhn7CTtetpLo3V0/ESFCRcxYf6Rrds268W19hQF/rNk=; b=wl9BOHm9QxlfDm
	30MHe1/G57tuYVzuexLSIRrLVDQD/hp2ajt0CgqEd+5zqplkl/wx/15xJYFu7dGfaE5x5NezcbEss
	K7rOgbB2trm+5p8mb7Ip6rPW0+A6SL1R3Aelu4YLgz1J7PPSgrP6y45OWatKZJ51m3dillqTzt6z2
	EJpKv3GL7tsIo6n9jmWvRKXFZao37cZr+ALjCLd8v9lrmxcfYNHH5sEWzFeTw1lg3twUauOy5cBEm
	WFw/1V44rplbFS0Xmnh3zVcLsA2AwNZTmAyclOWBW0prMKcqWHVBD7IKQzjTDajKwkc46u7m1i9wx
	JtWOkg8S1B/eJws9nBiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYMRq-00FQWu-0G;
	Tue, 22 Aug 2023 08:09:10 +0000
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.216])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYMRm-00FQW7-2u
	for linux-mtd@lists.infradead.org;
	Tue, 22 Aug 2023 08:09:08 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1692691741; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=nIQpETQPcapaASquVIWzCy0cxWU/o/SlGUhfilQPy6vzr5FP1S3o8bqWMGGNVeX1Og
    iYDV3QNxL0HT7nsW4uEZoWnAocSXPBUX74esTJdcFsZsaRXCx3nT6FtuDgUpDcE6mE5R
    Y0kwQ/I6ViUj9GPRotDFchbV/v0xiYvJ5rrkJ3h57mmQSFsNWojdrga0+/S4eIydoHxy
    7NnfUs6zPBSshYWY47Oru77F8n8Dweny6Jg4p5dlsmPNtyJZTfBs8/S9pCWRmETeALM/
    oVxthQWEhaOvJrubsMCQojGhLOqMwz42P3hYy1FYfASWR6APPy6mX0NbVyCOVAx3ACiZ
    ahuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1692691741;
    s=strato-dkim-0002; d=strato.com;
    h=To:Subject:From:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=HVW80giOZSBBoNCtIVtoTESynwOPGm2fF3QlTpLi+6A=;
    b=mqlEFU1V8p6h2Jgucv+78Pg5egjO4d3ToXlqab3+tAG8u6aWZgT31+3lNV4qoBjWx1
    MH6EveGjo0azJQlqpd5MJTg/jw2ayEhv0EBwSgemN+b5Jn+CXQOrYXWyFWb6YiTIi8/V
    tocYWf9PK8vc04yINoXIgLUEFlTRfocrAVL+bvFmKjRLoTBZJiyJK/F+JESwjEFR4GEG
    chgpVc1RlxG4KSIruVM3NStrX3Mo3hklmqXJTIQ0RAeDSrfUHUVuVqyHvSJ6t/OfNFLR
    gAvOdEZm3BmpRoigxuxnMFuSeJUXwd4nSkK75oQbGOnCLf+wmMNJNZ9aJUmp4/3Lff/t
    1rrg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1692691741;
    s=strato-dkim-0002; d=brainaid.de;
    h=To:Subject:From:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=HVW80giOZSBBoNCtIVtoTESynwOPGm2fF3QlTpLi+6A=;
    b=C7cbsWQSCl+h0Fg/s/xGoUWzk6/ms/zccYVNhrwIa5BiZtyp0f5MRNxeZrCou2cG3+
    buvIb97DJL/TWdPGQglZgw5eHjwkrQcUth6U8t9WcElZBQqkifBE1/d9Wd5Mn1xj22tj
    WW0opxdZGhTjNsToblX1fBjQF5lwGFsiangI3eebGclVX6JHmEXIaYOMQLMUuUDEI66v
    SqkvQ6WLZNqnkTLxqgdwcsCTeWyZriJpNxjbuTxrsXHOMsWIGQAujVS5E2zLKrEjgukh
    f0FSOFa4xkxtaEmg037FPnLgqI3dAi5HCoyOXsFXgy+Y/DvN+n0FZ+7tN7oPjPSwxeOR
    i3Rg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1692691741;
    s=strato-dkim-0003; d=brainaid.de;
    h=To:Subject:From:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=HVW80giOZSBBoNCtIVtoTESynwOPGm2fF3QlTpLi+6A=;
    b=E8yy+dG0Lu6LRu2EkL7OZcVc78ZWYfSo5unBx2puZBbZ2Uo/L40EF3jHmx1trMhURx
    +llRZVOsXevkPTYrW5Bg==
X-RZG-AUTH: ":O2kGeEG7b/pS1BjuEyjk3CsOFCFu9/cqpJ3cRgJT0Ux2ESGZjBX033JkHTIUp9ccd0BET/7sdkrmRiIjmEiYStnYjVZPew=="
Received: from b.brainaid.de
    by smtp.strato.com (RZmta 49.8.1 AUTH)
    with ESMTPSA id V68849z7M8916Wm
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate)
    for <linux-mtd@lists.infradead.org>;
    Tue, 22 Aug 2023 10:09:01 +0200 (CEST)
Received: from [10.252.32.21] (unknown [89.249.13.66])
	by b.brainaid.de (Postfix) with ESMTPSA id F3D2AAC17E7
	for <linux-mtd@lists.infradead.org>; Tue, 22 Aug 2023 08:09:00 +0000 (UTC)
Message-ID: <bc09bc68-ca99-d69e-9da8-cd9fa89fd127@brainaid.de>
Date: Tue, 22 Aug 2023 10:09:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
From: Christian Wendt he/him <cw@brainaid.de>
Subject: [PATCH] mtd-utils: nandtest: handle large nand devices
Content-Language: en-US, da
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_010907_253590_04379D8E 
X-CRM114-Status: GOOD (  15.40  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Running nandtest on devices with sizes of 4Gb or more does not work, as
the size returned in mtd_info_user is reported as 0 for 4Gb devices for
example.

The patch uses sysfs to figure out the size of the nand device (as
recommended in a comment in include/mtd/mtd-abi.h) and changes sizes
and offsets to 64 bit values.

[From: Christian Wendt <cw@brainaid.de>]
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
  nand-utils/nandtest.c | 47 +++++++++++++++++++++++++++++++++----------
  1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/nand-utils/nandtest.c b/nand-utils/nandtest.c
index 06dec25..98217ba 100644
--- a/nand-utils/nandtest.c
+++ b/nand-utils/nandtest.c
@@ -8,6 +8,7 @@
  #include <string.h>
  #include <time.h>
  #include <unistd.h>
+#include <limits.h>
  #include <sys/stat.h>
  #include <sys/ioctl.h>
  #include <sys/types.h>
@@ -145,6 +146,27 @@ static int erase_and_write(loff_t ofs, unsigned 
char *data, unsigned char *rbuf,
  }
   +static uint64_t get_mem_size(const char* device)
+{
+	const char* p = strrchr(device, '/');
+	char path[PATH_MAX];
+	int fd;
+
+	snprintf(path, sizeof(path), "/sys/class/mtd/%s/size", p);
+	fd = open(path, O_RDONLY);
+	if (fd >= 0) {
+		char buffer[32];
+		ssize_t n = read(fd, buffer, sizeof(buffer));
+		close(fd);
+		if (n > 0) {
+			return strtoull(buffer, NULL, 0);
+		}
+	}
+
+	fprintf(stderr, "Can't read size from %s\n", path);
+	exit(1);
+}
+
  /*
   * Main program
   */
@@ -156,8 +178,9 @@ int main(int argc, char **argv)
  	int nr_passes = 1;
  	int nr_reads = 4;
  	int keep_contents = 0;
-	uint32_t offset = 0;
-	uint32_t length = -1;
+	uint64_t offset = 0;
+	uint64_t length = -1;
+	uint64_t mem_size = 0;
  	int error = 0;
   	seed = time(NULL);
@@ -212,11 +235,11 @@ int main(int argc, char **argv)
  			break;
   		case 'o':
-			offset = simple_strtoul(optarg, &error);
+			offset = simple_strtoull(optarg, &error);
  			break;
   		case 'l':
-			length = simple_strtoul(optarg, &error);
+			length = simple_strtoull(optarg, &error);
  			break;
   		}
@@ -238,29 +261,31 @@ int main(int argc, char **argv)
  		exit(1);
  	}
  +	mem_size = get_mem_size(argv[optind]);
+
  	if (length == -1)
-		length = meminfo.size;
+		length = mem_size;
   	if (offset % meminfo.erasesize) {
-		fprintf(stderr, "Offset %x not multiple of erase size %x\n",
+		fprintf(stderr, "Offset %llx not multiple of erase size %x\n",
  			offset, meminfo.erasesize);
  		exit(1);
  	}
  	if (length % meminfo.erasesize) {
-		fprintf(stderr, "Length %x not multiple of erase size %x\n",
+		fprintf(stderr, "Length %llx not multiple of erase size %x\n",
  			length, meminfo.erasesize);
  		exit(1);
  	}
-	if (length + offset > meminfo.size) {
-		fprintf(stderr, "Length %x + offset %x exceeds device size %x\n",
-			length, offset, meminfo.size);
+	if (length + offset > mem_size) {
+		fprintf(stderr, "Length %llx + offset %llx exceeds device size %llx\n",
+			length, offset, mem_size);
  		exit(1);
  	}
   	wbuf = malloc(meminfo.erasesize * 3);
  	if (!wbuf) {
  		fprintf(stderr, "Could not allocate %d bytes for buffer\n",
-			meminfo.erasesize * 2);
+			meminfo.erasesize * 3);
  		exit(1);
  	}
  	rbuf = wbuf + meminfo.erasesize;
-- 
2.39.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
