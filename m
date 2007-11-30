Received: from wa-out-1112.google.com ([209.85.146.183])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Iy86S-0000Ob-52
	for linux-mtd@lists.infradead.org; Fri, 30 Nov 2007 15:48:38 +0000
Received: by wa-out-1112.google.com with SMTP id v33so2559823wah
	for <linux-mtd@lists.infradead.org>;
	Fri, 30 Nov 2007 07:48:29 -0800 (PST)
Message-ID: <8bf247760711300748q269a0d9i15b08461ef394525@mail.gmail.com>
Date: Fri, 30 Nov 2007 21:18:29 +0530
From: Ram <vshrirama@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: file system tests (fs-tests)
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
  I am trying to test my nand drivers using the fs-tests package found
on mtd utils git tree.

  My test area (JFFS2 partition size) is 8MB.

  Most of the tests have passed. However some of the tests take too much time
  to complete.
  The test "rndrm00" takes over 2 hours to complete.
  The test "stress00.sh" has taken 4 hours to complete.

  When i run stress00.sh - The system becomes too slow. commands like
  df -h and ps -l take too much time to execute.

  However, I have not seen any JFFS2 errors when i ran these tests.

  Is something wrong? Worried about the time taken by these tests.

  Is this normal?.

  Please advice.


Regards,
sriram
