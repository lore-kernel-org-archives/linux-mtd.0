Received: from tidos.tid.es ([193.145.240.2] helo=tid.tid.es)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15tHEh-0006Nf-00
	for <linux-mtd@lists.infradead.org>; Tue, 16 Oct 2001 00:33:31 +0100
Received: from tid.es ([1.0.22.18]) by tid.tid.es (Netscape
          Messaging Server 4.15) with ESMTP id GL937W00.RIA for
          <linux-mtd@lists.infradead.org>; Mon, 15 Oct 2001 16:07:08 +0200
Message-ID: <3BCAED35.3000309@tid.es>
Date: Mon, 15 Oct 2001 16:05:41 +0200
From: Jose =?ISO-8859-1?Q?Rodr=EDguez?= Argente <jradc@tid.es>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Read Only FS
Content-Type: text/plain; charset=us-ascii; format=flowed
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

   I am working on an Assabet platform. My application will have a 
significant part of the root filesystem mounted as read-only. I am 
thinking about installing it as romfs, which I think should be faster 
than JFFS2. Am I right?

Another question is wether romfs runs over MTD or it has its own access 
layer.

Thank you very much
