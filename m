Received: from msr45.hinet.net ([168.95.4.145] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 181J3j-0006Sn-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2002 05:11:55 +0100
From: "Steve Tsai" <startec@ms11.hinet.net>
To: "'Russ Dill'" <Russ.Dill@asu.edu>
Cc: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: RE: Memory usage?
Date: Tue, 15 Oct 2002 12:11:27 +0800
Message-ID: <000e01c27400$f0766c30$80d1a8c0@synso.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1034613287.30080.19.camel@russ>
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

It does not include cache and buffer. I know the most memory becomes the
cache, but I am using uClinux and the lower MemFree will cause system
crash when I am loading program. I need to prevent the case.


Steve Tsai



> -----Original Message-----
> From: Russ Dill [mailto:Russ.Dill@asu.edu] 
> Sent: Tuesday, October 15, 2002 12:35 AM
> To: Steve Tsai
> Cc: Linux MTD mailing list
> Subject: Re: Memory usage?
> 
> 
> On Mon, 2002-10-14 at 01:13, Steve Tsai wrote:
> > Does JFFS2 will allocate large memory to read big file? I 
> have  a 128M 
> > bytes nand flash on my board and there is a large file about 12M 
> > bytes. After I use the  testing program to read the file, the free 
> > memory reduce to 312Kbytes (from 10660Kbytes). How can I reduce the 
> > memory usage of JFFS2? Thanks.
> 
> what do you mean by "free memory", are you including buffers 
> and cache?
> 
