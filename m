Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EF8u4-0005Ef-N5
	for linux-mtd@lists.infradead.org; Tue, 13 Sep 2005 07:24:47 -0400
Message-ID: <4326B6F4.1030709@inf.u-szeged.hu>
Date: Tue, 13 Sep 2005 13:24:36 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Simon Kallweit <simon.kallweit@intefo.ch>
References: <43258B3B.7060405@intefo.ch>
In-Reply-To: <43258B3B.7060405@intefo.ch>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Bugreport: JFFS2 + EBS
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Simon!

Let me explain what I see in your log.

The log of "with sumtooled image but without EBS kernel support" shows a 
lot of "unknow but compatible node". These nodes are the summary nodes. 
They are localated at the end of the used (and already closed) erase 
blocks. The first one is at 0x0001e864 (at the end of erase block 
0x00000000-0x0001FFFF), the last one is 0x0029eed8 (at the end of erase 
block 0x00280000-0x0029FFFF).

With EBS support the mounting process is modified. First the scanning 
process read the end of the erase block. If it is valid summary 
information it is no need to read the whole erase block, if not than the 
original (full) scanning process is applied for that erase block.

See the first error message:

 > jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 
0x002a0000: 0x00b0 instead

It means that the problem is with the first erase block which has no 
summary, so the full scanning method is applied. It try to find valid 
JFFS2 nodes, but it is not succesfull, every word is 0x00b0.

Something similar happened with Pete. The original JFFS2 worked at him, 
but summary did not. We was not able to find the problem, because his 
image worked at us. Finally he found the bug. It was not in the JFFS2 
but in his flash driver. Summary makes some "tricks": read from the end 
of the erase block, if there is no summary go back to the begining of 
it. If the flash driver buggy than it doesn't like it.

I suggest you should dump what is at 0x002a0000, and later (without 
mounting, for example with jffs2dump tool). I suppose it should not be 
0x00b0 - but your flash driver give it back, after tracking back. So my 
first tip is that there is a bug in your flash driver.

You also may send us (or make it downloadable for us) your image to 
analize (and try if it works at us).

I am also curious what happen with EBS support but without sumtool. I 
should mount without problem because it recognise it is not summarized 
image, so apply the original scanning method.

And finaly it may also be more informative to set the JFFS2 debug level 
1 to get more debug message (the summary debug messages is the most 
important for us)

Bye,
Ferenc
