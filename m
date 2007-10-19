Received: from hs-out-0708.google.com ([64.233.178.243]
	helo=hs-out-2021.google.com)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IiqSZ-0005Hj-4v
	for linux-mtd@lists.infradead.org; Fri, 19 Oct 2007 12:56:13 +0100
Received: by hs-out-2021.google.com with SMTP id 23so618265hsn
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Oct 2007 04:55:08 -0700 (PDT)
Message-ID: <c384c5ea0710190455h195aa8eeub0bc775da3377183@mail.gmail.com>
Date: Fri, 19 Oct 2007 13:55:08 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC] root=/dev/mtdblock@name
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

Hello,

we have a small patch for 2.6.19 that allows us to specify a root
filesystem on MTD using named partitions, i.e. such as RedBoot fis
partitions.

root=/dev/mtdblock@name

Is this something that would be accepted upstream? If so, I'll forward
the patch to the current MTD GIT tree.

Regards,
-- 
Leon
