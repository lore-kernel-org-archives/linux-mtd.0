Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TEi4e-0001qe-G0
 for linux-mtd@lists.infradead.org; Thu, 20 Sep 2012 14:49:53 +0000
Received: by weyr3 with SMTP id r3so1336256wey.36
 for <linux-mtd@lists.infradead.org>; Thu, 20 Sep 2012 07:49:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHODtZT6UP4BCHuugpSr6q2=KoTDiGuW_hG_fqjWG7cXcTE35A@mail.gmail.com>
References: <CAHODtZT6UP4BCHuugpSr6q2=KoTDiGuW_hG_fqjWG7cXcTE35A@mail.gmail.com>
Date: Thu, 20 Sep 2012 16:49:50 +0200
Message-ID: <CAHODtZQEbc8d-U+MWY=dkZUfAJ-z0xOXMUXSWgg8Zotmicz0Ww@mail.gmail.com>
Subject: [PATCH] [MTD] slram: Invalid checking of absolute end address
From: Jiri Engelthaler <engycz@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fixed parsing end absolute address
Signed-off-by: Jiri Engelthaler <engycz@gmail.com>
---
--- linux-3.2.28/drivers/mtd/devices/slram.c	2012-08-19 19:15:38.000000000 +0200
+++ linux-3.2.28.mod/drivers/mtd/devices/slram.c	2012-09-19
18:29:28.012740703 +0200
@@ -266,7 +266,7 @@ static int parse_cmdline(char *devname,

 	if (*(szlength) != '+') {
 		devlength = simple_strtoul(szlength, &buffer, 0);
-		devlength = handle_unit(devlength, buffer) - devstart;
+		devlength = handle_unit(devlength, buffer);
 		if (devlength < devstart)
 			goto err_out;
