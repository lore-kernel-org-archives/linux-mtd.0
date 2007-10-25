Received: from an-out-0708.google.com ([209.85.132.250])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Il3MB-00029j-Ht
	for linux-mtd@lists.infradead.org; Thu, 25 Oct 2007 15:06:45 +0100
Received: by an-out-0708.google.com with SMTP id d40so87604and
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Oct 2007 07:06:31 -0700 (PDT)
Message-ID: <79ac09b60710250706p22034159v3b1c644b3a07e7ab@mail.gmail.com>
Date: Thu, 25 Oct 2007 09:06:29 -0500
From: Duke <ezbonites@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: jffs2: too few erase blocks
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

Hi All,
What's the deal with "too few erase blocks" message?
Is one block too few for a jffs2 partition?
My block size if 256K and I created a small jffs2 256K partition for
read/writing.
Is this really too small for jffs2? If so, is there anything I can do for this?

Thanks
D.
