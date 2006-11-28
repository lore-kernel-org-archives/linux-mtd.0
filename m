Received: from mail.valcom.com ([151.199.82.35])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Gp3eY-0002PT-Lb
	for linux-mtd@lists.infradead.org; Tue, 28 Nov 2006 14:09:45 +0000
Message-ID: <456C4306.8070205@valcom.com>
Date: Tue, 28 Nov 2006 09:09:10 -0500
From: Glen Johnson <gjohnson@valcom.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Upgrading mtd-utils in uClinux.
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linux-mtd,
I am attempting to compile the latest mtd-utils into uClinux's distribution dated 2006-08-03.  After some unsuccessful attempts I found the new mtd-utils needed an updated zlib.  I successfully upgraded to zlib version 1.2.3 inside uClinux-dist/lib/zlib.  I now have that compiling and still am not getting anywhere with compiling the mtd-utils.  
I dropped the latest mtd-utils code into the directory uClinux-dist/user/mtd-utils.  I have observed the Makefiles between the new updated mtd-utils and the old uClinux-dist/user/mtd-utils/Makefile are VERY different.  I tried to use the old Makefile as a template to build the new code and it still is not compiling.
What is the correct method of upgrading mtd-utils?  It shouldn't be as difficult to upgrade some code in user space as I am making it.  I feel like I must be going about this the wrong way.  Are there any pointers, tips, or recommendations to get me going in the right direction?

Thanks,
Glen Johnson
