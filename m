Received: from smtp17.singnet.com.sg ([165.21.6.27])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FEzpK-0000Ak-MT
	for linux-mtd@lists.infradead.org; Thu, 02 Mar 2006 21:15:40 -0500
Received: from [167.116.151.204] ([63.150.136.42])
	by smtp17.singnet.com.sg (8.13.5/8.13.4) with ESMTP id k231bot9025307
	for <linux-mtd@lists.infradead.org>; Fri, 3 Mar 2006 09:37:52 +0800
Message-ID: <44079DE4.3070804@singnet.com.sg>
Date: Fri, 03 Mar 2006 09:37:40 +0800
From: Terence Soh <gopher@singnet.com.sg>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <E1FErAE-00004u-2M@canuck.infradead.org>
In-Reply-To: <E1FErAE-00004u-2M@canuck.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Cramfs on NAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi again,

I hear that cramfs on NAND flash is not a good idea because of the bad 
blocks. Is this still true? There was talks some time  ago about making 
cramfs work on top on NAND. 
<http://lists.infradead.org/pipermail/linux-mtd/2004-May/009784.html>

If this is true, are there any recommendations of what other fs to use. 
I already have one partition of jffs2 to store read-write files.

Thanks again,
Terence.
