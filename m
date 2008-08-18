Received: from rv-out-0708.google.com ([209.85.198.241])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KV3HQ-00025r-Dv
	for linux-mtd@lists.infradead.org; Mon, 18 Aug 2008 11:52:13 +0000
Received: by rv-out-0708.google.com with SMTP id b17so1818909rvf.42
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Aug 2008 04:52:11 -0700 (PDT)
Message-ID: <627b7eea0808180452i35bc99ecyc99fca8b997cd346@mail.gmail.com>
Date: Mon, 18 Aug 2008 17:22:11 +0530
From: "Hemagiri C" <hemagiric@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: jffs2 on MTD-Onenand driver - LTP test fails for ftest
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am new to JFFS2 and now I am running the LTP FS Tests for
MTD-Onenand driver on JFFS2.

Kernel version is linux-2.6.25.
The following tests are failing while running the  LTP FS test for
MTD-Onenand driver on JFFS2.

ftest01                        FAIL       1
ftest02                        PASS       0
ftest03                        FAIL       1
ftest04                        FAIL       1
ftest05                        FAIL       1
ftest06                        PASS       0
ftest07                        FAIL       1
ftest08                        FAIL       1

But with linux-2.6.22 version, except ftest03 all other test cases are passing.

Does any one know the reason for failure/possible cause.

Please help me out......


--
Thanks and Regards
Hemagiri C
