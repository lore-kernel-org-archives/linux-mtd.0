Received: from tiger.actrix.co.nz ([203.96.16.160] helo=blood.actrix.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 197htQ-000400-Cs
	for <linux-mtd@lists.infradead.org>; Mon, 21 Apr 2003 21:28:00 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: "Paul Wong" <paul.wong@digitalview.com>,
	<linux-mtd@lists.infradead.org>
Date: Tue, 22 Apr 2003 08:28:57 +1200
References: <007001c30639$6d034820$9000010a@paulwong>
In-Reply-To: <007001c30639$6d034820$9000010a@paulwong>
MIME-Version: 1.0
Message-Id: <20030421202804.C9527414B@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: compare JFFS2 vs YAFFS
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 19 April 2003 18:03, Paul Wong wrote:
> Hi All,
>     could u tell me the JFFS2 and YAFFS comparsion? speed, save, reliable,
> and future
>
> Thanks
>
> Paul

Paul

This is a tricky one. Both YAFFS and JFFS2 have their pros and cons.

I have not used JFFS2 myself, but I have studied it a bit. Herewith my 
impressions.
* YAFFS is likely faster than JFFS2 in many situations. YAFFS does not do 
compression (which takes time). YAFFS has a simpler garbage collection 
mechanism that is likely to be faster.
* YAFFS uses smaller management structures (and therefore uses less RAM).
* JFFS2 provides compression. Nice if you have a small NAND. Some people 
achieve almost the same thing (for read) by loop mounting compressed file 
systems (eg. cramfs)  on a YAFFS file.
* You might already have JFFS2 for NOR, therefore you get an image footprint 
saving if you use it for NAND too.
* YAFFS is very reliable. I think JFFS2 is also.
* Both file systems are widely used and will continue to be supported. 

As a hunch, I'd say it is better to use JFFS2 on smaller NAND arrays where 
you gain from the compression and YAFFS on larger sizes.

My suggestion to you is that you try both and go with the one that is the 
best fit for your needs.

-- Charles
