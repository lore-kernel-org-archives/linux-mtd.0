Received: from fastmail.fm ([209.61.183.86] helo=www.fastmail.fm)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 188yMo-0007oA-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Nov 2002 07:43:19 +0000
Received: from www.fastmail.fm (localhost [127.0.0.1])
	by localhost.localdomain (Postfix) with ESMTP id ABFA66DA63
	for <linux-mtd@lists.infradead.org>; Tue,  5 Nov 2002 02:13:33 -0600 (CST)
Received: from server4.fastmail.fm (server4.internal [10.202.2.135])
	by www.fastmail.fm (Postfix) with ESMTP id 5C6906D9D6
	for <linux-mtd@lists.infradead.org>; Tue,  5 Nov 2002 02:13:33 -0600 (CST)
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="ISO-8859-1"
MIME-Version: 1.0
Date: Tue, 5 Nov 2002 08:13:30 UT
From: "Jeffrey Lim" <jfsworld@fastmail.fm>
To: "linux-mtd list" <linux-mtd@lists.infradead.org>
Subject: MTD CVS: missing JFFS2?
Message-Id: <20021105081328.7AE732FD4D@server4.fastmail.fm>
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

Hi guys, i follow the instructions found at
sources.redhat.com/jffs2 and download the latest MTD source from CVS.

under the patches subdir, there is a patchin.sh, which i run.

However, after taking a look at patchin.sh, i realize that the jffs2 code
doesnt seem to get patched at all!, only jffs. Am i therefore to assume
that the MTD CVS does not contain any jffs2 code at all, and that i
should just use the jffs2 code from the stock kernel?

Any help/explanation would be appreciated. Thanks.

-jf

(according to sources.redhat.com/jffs2 -
"JFFS2 has been included in the official Linux kernel since the 2.4.10
release. The latest code is available from the Memory Technology Device
(MTD) CVS tree at cvs.infradead.org. To obtain an up to date copy, use
the following commands:...")

 
--
  "It's an extraordinary world!" - jfsworld <at> fastmail.fm
 
 
