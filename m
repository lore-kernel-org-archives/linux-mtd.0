Received: from matrix2.enst.fr ([137.194.2.14] helo=smtp2.enst.fr)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17bdhK-00035H-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Aug 2002 09:58:42 +0100
Received: from email.enst.fr (muse.enst.fr [137.194.2.33])
	by smtp2.enst.fr (Postfix) with ESMTP id DFEC51EEC7
	for <linux-mtd@lists.infradead.org>; Mon,  5 Aug 2002 10:58:40 +0200 (MEST)
Received: from enst.fr (IDENT:WKrZz2YrcIhN0eIK9XQZod5D4x2XUfnu@paris.enst.fr [137.194.161.13])
	by email.enst.fr (8.9.3/8.9.3) with ESMTP id KAA14821
	for <linux-mtd@lists.infradead.org>; Mon, 5 Aug 2002 10:58:41 +0200 (MET DST)
Message-ID: <3D4E3DBC.4F73955D@enst.fr>
Date: Mon, 05 Aug 2002 10:56:28 +0200
From: Sylvain Meunier <meunier@enst.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Mix flash sector size and JFFS2
Content-Type: text/plain; charset=us-ascii
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

Hello,

Does a single filesystem JFFS2 need that all sectors of flash partition
are same size or
could we use different sector size (as for some flash that mix small and
big sector). ?

Thanks

Sylvain
