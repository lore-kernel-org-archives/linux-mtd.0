Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C20DC001DB
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Aug 2023 08:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:To:MIME-Version:Date:Message-ID:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B7r3Q1NNCFsO6L3/4oZaqTfSvkfiol8eh4HR7CXZ+zw=; b=lboyrOyZKDeGvn
	CupZkY493jOB52t45cpIqdg2PzIp9IOv3ptUv7BJQkmAXSVowskRTvGF2sYhAR7trChYtvvunQX5/
	GT8l3d3SAj1eNOFPmo7l2ICGF/B1XVVwDol714oCGbyTe+eUGKpCsFFjgoTha1GWxF4/JUuOAZki4
	oGYPiD1IOjyseS8LfB++NUOBP115hPlPxQ09yMcVE+X1znJBdHoFp7I7oStsvllah0cZFSZ66PJ8e
	RkvpFzEkei4em0YOJWC5H5jcnolMrkc6e36r+XznVmlrmUFn9ff71cmxhpYLHeQqArNJ8uSEI/9DT
	rxYjGQ7qCbwTbMzPb/Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0ub-006re0-1E;
	Thu, 10 Aug 2023 08:20:53 +0000
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0uY-006rct-0R
	for linux-mtd@lists.infradead.org;
	Thu, 10 Aug 2023 08:20:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1691655647; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ny7ywmBB9uDbWIJeWIjmtHQ+AeEjiKEiN3gGlgRy733stUHygn4hVHsTOQTOI9ymfg
    vo+4NcNLXedEW7R2uxeGLaJNC9yfINX2/3LQBtZ6xGKczg9XpI9HJWfSMvEeeu05KUpb
    tmXweVhMlbEpQmbOG2T92ObA7neHtXavtsQjWm4SelSqJTCL1gcMT2P2PUR5ZLIKXSMw
    yaAndm+uG08gcHsGVfytIHG3ErmRZN0cp0P48RAu1zLAPNo9NJMl5/ec51em3K6grcEp
    56ffcbrz3IdyvanGMWyLUyxwhe0gZ4zsoXeBp0B8mrvS3p1hHCSz6iheQh+nMftcx8/h
    J+RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1691655647;
    s=strato-dkim-0002; d=strato.com;
    h=Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=o9VfjkXSvikASlFk8uTPXnnZdW2TzF0Fb1ySnqi2or8=;
    b=R3T/f/jpbZhqi8CgF+ormWcXvkiK+492LiPv49X21HwCS9h28jnZljubX4H/Jnyk/J
    JzeYIamUlNIzoAYUU7GPsx7YsuFs7PfQvyinawNZ0OEeHlqMW23Ys+9ufFVmBXgboxBS
    enpHwh3Uqj50YE+oTBqH7x9JhOC4Js35eNMEh+dpSRWVk9Qs8kEAXRTt/oyKLoXf0SVs
    sItoc7r/ZfwgE30fJRu9YBfoSvuHpwDL9vawcdNyi1PDUsbqcI4iXtJ8yixqTcFNzC1f
    LJz4pNxklAtOM6AwpoyO8em4oM5DUXIKkhNhsZ8Gh1pfIn7TPyuuwo2A/95uTx90zHwJ
    nwWw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1691655647;
    s=strato-dkim-0002; d=brainaid.de;
    h=Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=o9VfjkXSvikASlFk8uTPXnnZdW2TzF0Fb1ySnqi2or8=;
    b=nf7raSQ30AjHkosYGjW/juu12c8vO7NthX7wgKyXSZwtgkRljrNirUl7vSgTiwjU4V
    UiivdcufhqxpnVDYtxwDxY+TX6ePlEbbwySz2U2sUwmfFeBGS5p4BDI8HGGJp97NRVLz
    ng4T8ooG+pYpUF4SPvT8s+l1xWj8WqzYQorTj8lnuxm5eli4J6m6X3V8DLluuX2X3L7F
    0EdI0X326dGinPup8gV0mLeMS5z7E6KKhEIoIsjYnxunxxiYt273vwKuk8XhCeQhNbZQ
    e8kpjHCQs0H3R34Dp5iDvJJbS6nksRZm5TQEHplBmYZS95ydrXp1bANP9EuDVqjQ/c2J
    czDQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1691655647;
    s=strato-dkim-0003; d=brainaid.de;
    h=Subject:From:To:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=o9VfjkXSvikASlFk8uTPXnnZdW2TzF0Fb1ySnqi2or8=;
    b=e+H1n7Mp5TdYj7VCyfdwp8oq1bNBLRLADIpxPGCFkj5jeDz2/2uN6NftYGBMI2Isb9
    8MLPgjopHE55EC9933AA==
X-RZG-AUTH: ":O2kGeEG7b/pS1BjuEyjk3CsOFCFu9/cqpJ3cRgJT0Ux2ESGZjBX033JkHTIUp9ccd0BET/7sdkrmRiIjmEiYStnYjVZPew=="
Received: from b.brainaid.de
    by smtp.strato.com (RZmta 49.6.6 AUTH)
    with ESMTPSA id 661ed3z7A8Kl03r
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate)
    for <linux-mtd@lists.infradead.org>;
    Thu, 10 Aug 2023 10:20:47 +0200 (CEST)
Received: from [10.252.32.21] (unknown [89.249.13.66])
	by b.brainaid.de (Postfix) with ESMTPSA id 4F815AC1911
	for <linux-mtd@lists.infradead.org>; Thu, 10 Aug 2023 08:20:47 +0000 (UTC)
Message-ID: <7c089577-710f-3310-305e-f05f1d125652@brainaid.de>
Date: Thu, 10 Aug 2023 10:20:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: linux-mtd@lists.infradead.org
From: Christian Wendt he/him <cw@brainaid.de>
Subject: [PATCH] mtd-utils: nandtest: handle large nand devices
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_012050_596471_27BD4C79 
X-CRM114-Status: GOOD (  12.92  )
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

[PATCH] mtd-utils: nandtest: handle large nand devices

Running nandtest on devices with sizes of 4Gb or more does not work, as
the size returned in mtd_info_user is reported as 0 for 4Gb devices for
example.

The patch uses sysfs to figure out the size of the nand device (as
recommended in a comment in include/mtd/mtd-abi.h) and changes sizes
and offsets to 64 bit values.

[From: Christian Wendt <cw@brainaid.de>]
diff --git a/nand-utils/nandtest.c b/nand-utils/nandtest.c
index 06dec25..e60428f 100644
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
@@ -145,6 +146,26 @@ static int erase_and_write(loff_t ofs, unsigned 
char *data, unsigned char *rbuf,
  }


+static uint64_t get_mem_size(const char* device)
+{
+       const char* p = strrchr(device, '/');
+       char path[PATH_MAX];
+       int fd;
+
+       snprintf(path, sizeof(path), "/sys/class/mtd/%s/size", p);
+       fd = open(path, O_RDONLY);
+       if (fd) {
+               char buffer[32];
+               ssize_t n = read(fd, buffer, sizeof(buffer));
+               close(fd);
+               if (n > 0) {
+                       return strtoull(buffer, NULL, 0);
+               }
+       }
+
+       return 0;
+}
+
  /*
   * Main program
   */
@@ -156,8 +177,9 @@ int main(int argc, char **argv)
         int nr_passes = 1;
         int nr_reads = 4;
         int keep_contents = 0;
-       uint32_t offset = 0;
-       uint32_t length = -1;
+       uint64_t offset = 0;
+       uint64_t length = -1;
+       uint64_t mem_size = 0;
         int error = 0;

         seed = time(NULL);
@@ -238,29 +260,31 @@ int main(int argc, char **argv)
                 exit(1);
         }

+       mem_size = get_mem_size(argv[optind]);
+
         if (length == -1)
-               length = meminfo.size;
+               length = mem_size;

         if (offset % meminfo.erasesize) {
-               fprintf(stderr, "Offset %x not multiple of erase size %x\n",
+               fprintf(stderr, "Offset %llx not multiple of erase size 
%x\n",
                         offset, meminfo.erasesize);
                 exit(1);
         }
         if (length % meminfo.erasesize) {
-               fprintf(stderr, "Length %x not multiple of erase size %x\n",
+               fprintf(stderr, "Length %llx not multiple of erase size 
%x\n",
                         length, meminfo.erasesize);
                 exit(1);
         }
-       if (length + offset > meminfo.size) {
-               fprintf(stderr, "Length %x + offset %x exceeds device 
size %x\n",
-                       length, offset, meminfo.size);
+       if (length + offset > mem_size) {
+               fprintf(stderr, "Length %llx + offset %llx exceeds 
device size %llx\n",
+                       length, offset, mem_size);
                 exit(1);
         }

         wbuf = malloc(meminfo.erasesize * 3);
         if (!wbuf) {
                 fprintf(stderr, "Could not allocate %d bytes for buffer\n",
-                       meminfo.erasesize * 2);
+                       meminfo.erasesize * 3);
                 exit(1);
         }
         rbuf = wbuf + meminfo.erasesize;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
