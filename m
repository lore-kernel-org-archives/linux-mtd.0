Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15hvnf-0004Iq-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Sep 2001 17:26:43 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <7DF7BFDC95ECD411B4010090278A44CA1B72DD@ATVX> 
References: <7DF7BFDC95ECD411B4010090278A44CA1B72DD@ATVX> 
To: "Siders, Keith" <keith_siders@toshibatv.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: (no subject) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 14 Sep 2001 17:32:31 +0100
Message-ID: <27351.1000485151@redhat.com>
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

keith_siders@toshibatv.com said:
> I have a requirement to store compressed binary images with the intent
> that they will be uncompressed when loaded into memory. Can JFFS2
> store data without compression, in this case previously compressed
> data, and still automatically uncompress it when retrieved from the
> filesystem?

No, if you want JFFS2 to decompress it, you have to let JFFS2 compress it - 
by putting the uncompressed version into the filesystem instead of the 
compressed version.

Why do you want to write the compressed version to the filesystem? Just so 
that you can use gzip -9 and get better compression?

--
dwmw2
