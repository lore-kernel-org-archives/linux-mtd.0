Received: from mail-ie0-x231.google.com ([2607:f8b0:4001:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XzeXR-00072J-Jf
 for linux-mtd@lists.infradead.org; Sat, 13 Dec 2014 04:42:42 +0000
Received: by mail-ie0-f177.google.com with SMTP id rd18so8113275iec.36
 for <linux-mtd@lists.infradead.org>; Fri, 12 Dec 2014 20:42:19 -0800 (PST)
Message-ID: <548BC3A9.1070504@gmail.com>
Date: Fri, 12 Dec 2014 23:42:17 -0500
From: nick <xerofoify@gmail.com>
MIME-Version: 1.0
To: dwmw2@infradead.org
Subject: Question about removing pad parameter from  jffs2_flush_wbuf?
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings David,
I am wondering why the parameter  pad needs to be removed from the function, jffs2_flush_wbuf as it's clearly used
in various parts of this function. If we need to re factor the code to remove it then the TODO would make sense  for
jffs2, otherwise I can send it a patch removing this item for the TODO file in the root of the jffs2 file system 
code.
Cheers Nick 
