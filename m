Received: from beta.dmz-eu.st.com ([164.129.1.35])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CErTk-0008Ue-7D
	for linux-mtd@lists.infradead.org; Tue, 05 Oct 2004 11:43:53 -0400
Date: Tue, 5 Oct 2004 14:18:48 +0200
From: Lorenzo PARISI <lorenzo.parisi@st.com>
To: MTD mailing list <linux-mtd@lists.infradead.org>,
	YAFFS mailing list <yaffs@stoneboat.aleph1.co.uk>
MIME-Version: 1.0
Message-Id: <35c66fec.8a805a46.81a3300@mail1.agr.st.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: 
Subject: /proc
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've a s3c2410 board with BAST architecture.
On board, I've a kernel 2.6.9-rc2-bk13.
I've compiled the kernel with CONFIG_PROC_FS = YES;
but the directory /proc is empty, why?
Thus, I don't see mtd information.

Thanks.
