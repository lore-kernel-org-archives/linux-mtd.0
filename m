Received: from [207.152.29.75] (helo=server3.toshibatv.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15hzFL-0004aO-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Sep 2001 21:07:31 +0100
Message-ID: <7DF7BFDC95ECD411B4010090278A44CA1B72DE@ATVX>
From: "Siders, Keith" <keith_siders@toshibatv.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: RE: (no subject) 
Date: Fri, 14 Sep 2001 15:11:17 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="windows-1252"
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

-> Why do you want to write the compressed version to the 
-> filesystem? Just so 
-> that you can use gzip -9 and get better compression?
-> 
-> --
-> dwmw2
-> 

In my application I will receive the image already zlib compressed. I was
hoping to skip having to take up memory with both compressed and
uncompressed images prior to writing to JFFS2. But alas, since it's
necessary, I shall malloc(new_space), uncompress(new_space, old_space) ,
free(old_space), fwrite(new_space), and finally free(new_space).

ks
