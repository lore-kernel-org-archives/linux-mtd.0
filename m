Received: from mailc.telia.com ([194.22.190.4])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17a0jV-0007sT-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 22:10:13 +0100
Received: from d1o899.telia.com (d1o899.telia.com [213.67.176.241])
	by mailc.telia.com (8.12.5/8.12.5) with ESMTP id g6VLACco000220
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 23:10:12 +0200 (CEST)
Received: from jocke (h163n2fls32o899.telia.com [217.209.73.163])
	by d1o899.telia.com (8.10.2/8.10.1) with SMTP id g6VLABV23444
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 23:10:11 +0200 (CEST)
Message-ID: <000b01c238d7$002d7b60$0200a8c0@telia.com>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: <linux-mtd@lists.infradead.org>
References: <20020731121648.GA18892@wohnheim.fh-wedel.de>  <20020731115703.GB28984@wohnheim.fh-wedel.de> <20020731103419.GA23749@wohnheim.fh-wedel.de> <FA06AA2C99BCD511951200005A99441001E3ECBE@irvexch1.sextantifs.com> <14572.1028067711@redhat.com> <2881.1028115952@redhat.com> <4164.1028116749@redhat.com>  <6102.1028117866@redhat.com>
Subject: Problems with full FS
Date: Wed, 31 Jul 2002 23:12:39 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi all

We have run into a problem with JFFS2(stable branch) lately. I don't have much detalis 
rigth now since I am on vacation(start to work on Monday). We have this directory
which contains a lot of log files and the FS is full.

When I cd to that dir and do a ls, it hangs in getdents64(0x3, 0x10024c30, 0x1000) forever(not 
always but 50% of the time) .
But if do a ls with the absolute path instead(that is, ls /var/log/lumentis) it works just fine.

Any ideas?

         Jocke
