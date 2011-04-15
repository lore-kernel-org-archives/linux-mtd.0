Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QAfjw-0005du-0D
	for linux-mtd@lists.infradead.org; Fri, 15 Apr 2011 09:55:00 +0000
Received: by pzk5 with SMTP id 5so1074736pzk.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Apr 2011 02:54:58 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 15 Apr 2011 02:54:58 -0700
Message-ID: <BANLkTim4GaV501ULwa9C3Yacm4HVbNOGGw@mail.gmail.com>
Subject: mtdoops: find_next_position() explained?
From: Rick Ramstetter <rick.ramstetter@gmail.com>
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

Hello,

Can anyone explain the logic behind the following block of code from
mtdoops' find_next_position()?

+	for (page = 0; page < cxt->oops_pages; page++) {
+		mtd->read(mtd, page * OOPS_PAGE_SIZE, 4, &retlen, (u_char *) &count);
+		if (count == 0xffffffff)
+			continue;
+		if (maxcount == 0xffffffff) {
+			maxcount = count;
+			maxpos = page;
+		} else if ((count < 0x40000000) && (maxcount > 0xc0000000)) {
+			maxcount = count;
+			maxpos = page;
+		} else if ((count > maxcount) && (count < 0xc0000000)) {
+			maxcount = count;
+			maxpos = page;
+		} else if ((count > maxcount) && (count > 0xc0000000)
+					&& (maxcount > 0x80000000)) {
+			maxcount = count;
+			maxpos = page;
+		}


I expected to see something along the lines of the following:
+		if (maxcount == 0xffffffff || count > maxcount) {
+			maxcount = count;
+			maxpos = page;
+		}


Thank you,
-Rick
