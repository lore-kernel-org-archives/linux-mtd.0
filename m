Return-Path: <SRS0=lLyx=23=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C739C33C8C
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jan 2020 19:28:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EB29207FD
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jan 2020 19:28:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hl/1TdE+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EB29207FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arri.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=64UCgKmuSOygaH8gI3sP+AcI0NzzzUOPDr8flgAEfvY=; b=hl/
	1TdE+szB8ILCc/4Q8WDgBzwwS95n3IspXQQOk1bJowlJV4Dxr+swuXVFm0thNwNqToINy2J6VcScb
	4KgqZiMsZ3kR852zuigrIS6JV2fH9OdRIDsttPAiBAS2UJR6yVdMlYQQWf//SdjKiHCwfWuxkfSsl
	9URHUp1T9v1qiG/fZAxTPnH3Ro18IFL3LdGIk52xsDQKkNNfPOlWW2WQIWuwpSFqTZc819vzJG1M/
	y1+EyBt4C5/iDh9G9wD7KmPckPIXKYvR9OWp8AqhgYOxAi0d30tiHapA/k8JJxY9Red1q7GlzM6l/
	bzFjFc0qYlIz5dAlXaTZ7AdAUywv8dg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioY3N-0007fu-C9; Mon, 06 Jan 2020 19:28:41 +0000
Received: from mailout06.rmx.de ([94.199.90.92])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioY3J-0007fY-PX
 for linux-mtd@lists.infradead.org; Mon, 06 Jan 2020 19:28:39 +0000
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mailout06.rmx.de (Postfix) with ESMTPS id 47s5CL2Y9Jz9vH1
 for <linux-mtd@lists.infradead.org>; Mon,  6 Jan 2020 20:28:30 +0100 (CET)
Received: from ppmail.arri.de (unknown [217.111.95.7])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 by kdin02.retarus.com (Postfix) with ESMTPS id 47s5CK4lrFz2TRmK
 for <linux-mtd@lists.infradead.org>; Mon,  6 Jan 2020 20:28:29 +0100 (CET)
Received: from mta.arri.de ([192.168.100.141]) by ppmail.arri.de over TLS
 secured channel with Microsoft SMTPSVC(7.0.6002.18264); 
 Mon, 6 Jan 2020 20:28:29 +0100
Received: from N95HX1G2.wgnetz.xx (192.168.54.50) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Mon, 6 Jan
 2020 20:28:28 +0100
From: Christian Eggers <ceggers@arri.de>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mkfs.ubifs: Also encrypt multi linked files
Date: Mon, 6 Jan 2020 20:28:15 +0100
Message-ID: <20200106192815.8902-1-ceggers@arri.de>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
X-Originating-IP: [192.168.54.50]
X-OriginalArrivalTime: 06 Jan 2020 19:28:29.0101 (UTC)
 FILETIME=[795D95D0:01D5C4C7]
X-RMX-ID: 20200106-202829-47s5CK4lrFz2TRmK-0@kdin02
X-RMX-SOURCE: 217.111.95.7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200106_112838_142733_0E801A93 
X-CRM114-Status: GOOD (  13.73  )
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
Cc: Christian Eggers <ceggers@arri.de>
Content-Type: multipart/mixed; boundary="===============4211550519957222656=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4211550519957222656==
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Up to now, no fscrypt context has been passed when calling add_non_dir()
from add_multi_linked_files(). In consequence, files with multiple links
were not encrypted all.

The Linux ubifs file system detects this situation (file not encrypted,
but parent directory is) and refuses to open such files. Nevertheless,
these files are stored unencrypted in flash and could be accessed by
reading directly from the flash.

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/m=
kfs.ubifs.c
index 4247270..519c982 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -2228,7 +2228,7 @@ out_free:
 /**
  * add_multi_linked_files - write all the files for which we counted links=
.
  */
-static int add_multi_linked_files(void)
+static int add_multi_linked_files(struct fscrypt_context *fctx)
 {
        int i, err;

@@ -2237,11 +2237,16 @@ static int add_multi_linked_files(void)
                unsigned char type =3D 0;

                for (im =3D hash_table[i]; im; im =3D im->next) {
+                       struct fscrypt_context *new_fctx =3D inherit_fscryp=
t_context(fctx);
+
                        dbg_msg(2, "%s", im->path_name);
                        err =3D add_non_dir(im->path_name, &im->use_inum,
-                                         im->use_nlink, &type, &im->st, NU=
LL);
-                       if (err)
+                                         im->use_nlink, &type, &im->st, ne=
w_fctx);
+                       if (err) {
+                               free_fscrypt_context(new_fctx);
                                return err;
+                       }
+                       free_fscrypt_context(new_fctx);
                }
        }
        return 0;
@@ -2290,7 +2295,7 @@ static int write_data(void)
        err =3D add_directory(root, UBIFS_ROOT_INO, &root_st, !!root, root_=
fctx);
        if (err)
                return err;
-       err =3D add_multi_linked_files();
+       err =3D add_multi_linked_files(root_fctx);
        if (err)
                return err;
        return flush_nodes();
--
2.16.4

________________________________
 [http://assets.arri.com/media/sign/2019-12-13a-ARRI-E-mail-Signatur-Parkst=
adt.jpg] <https://www.google.com/maps/place/Herbert-Bayer-Stra%C3%9Fe+10,+8=
0807+M%C3%BCnchen/data=3D!4m2!3m1!1s0x479e74379489f045:0x4bbf0c7a9e893d66?s=
a=3DX&ved=3D2ahUKEwjjvdSlh8TmAhWIp4sKHe3vDlQQ8gEwAHoECAsQAQ>

Get all the latest information from www.arri.com<https://www.arri.com/>, Fa=
cebook<https://www.facebook.com/TeamARRI>, Twitter<https://twitter.com/ARRI=
Channel>, Instagram<https://instagram.com/arri> and YouTube<https://www.you=
tube.com/user/ARRIChannel>.

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: M=FCnchen - Registergericht: Amtsgericht M=FCnchen - Handelsregistern=
ummer: HRA 57918
Pers=F6nlich haftender Gesellschafter: Arnold & Richter Cine Technik GmbH
Sitz: M=FCnchen - Registergericht: Amtsgericht M=FCnchen - Handelsregistern=
ummer: HRB 54477
Gesch=E4ftsf=FChrer: Dr. Michael Neuh=E4user; Stephan Schenk; Walter Trauni=
nger; Markus Zeiler


--===============4211550519957222656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4211550519957222656==--
