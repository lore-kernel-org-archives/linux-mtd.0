Received: from mailer.cse.iitd.ac.in ([202.141.68.3]
	helo=desh.cse.iitd.ernet.in)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D3SE5-0003aW-UA
	for linux-mtd@lists.infradead.org; Tue, 22 Feb 2005 00:04:56 -0500
Message-ID: <421ABD09.2010006@kritikalsolutions.com>
Date: Tue, 22 Feb 2005 10:33:05 +0530
From: Narinder Kumar <narinder@kritikalsolutions.com>
MIME-Version: 1.0
To: dedekind@infradead.org, linux-mtd@lists.infradead.org
References: <4219E20F.80908@kritikalsolutions.com>	
	<1108994730.13420.52.camel@sauron.oktetlabs.ru>	
	<4219EF6B.8040208@kritikalsolutions.com>
	<1108996545.13420.55.camel@sauron.oktetlabs.ru>
In-Reply-To: <1108996545.13420.55.camel@sauron.oktetlabs.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: mkfs.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityuckiy wrote:

>Could you please look at JFFS2 output during mount - it should inform
>what Virtual block size it gonna use. This should appear before error
>messages.
>
>  
>
This is what is being shown when i mount the mtd block, can this help 
out in someway ?

$mount -t jffs2 /dev/mtdblock/1 /tmp/mmm/
Node at 0x00000048 with length 0x000006d2 would run over the end of the 
erase block
Perhaps the file system was created with the wrong erase size?
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000004c: 
0x06d2 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000050: 
0x39d7 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000054: 
0x0002 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000058: 
0x0002 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000005c: 
0x81a4 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000060: 
0x022f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000064: 
0x13fb instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000068: 
0xa791 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000006c: 
0xa791 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000070: 
0xa791 instead
Further such events for this erase block will not be printed
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000420: 
0xad8f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000424: 
0xcfd9 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000428: 
0x4e0b instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000042c: 
0x2792 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000430: 
0xfa51 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000434: 
0xf7bd instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000438: 
0xe348 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000043c: 
0xb366 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000440: 
0xe86b instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000444: 
0x10f2 instead
Further such events for this erase block will not be 
printed                   
Node at 0x0000071c with length 0x000003d7 would run over the end of the 
erase block
Perhaps the file system was created with the wrong erase 
size?                 
JFFS2: Erase block at 0x00000420 is not formatted. It will be 
erased           
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000840: 
0xf42b instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000844: 
0x68c7 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000848: 
0x0184 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000084c: 
0xfb02 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000850: 
0x6d29 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000854: 
0x5cbd instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000858: 
0x23a3 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000085c: 
0xe231 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000860: 
0xb762 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000864: 
0x3c62 instead
Further such events for this erase block will not be 
printed                   
Node at 0x00000af4 with length 0x000005a6 would run over the end of the 
erase block
Perhaps the file system was created with the wrong erase 
size?                 
JFFS2: Erase block at 0x00000840 is not formatted. It will be 
erased           
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000c60: 
0x6df1 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000c64: 
0x1283 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000c68: 
0x1cd8 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000c6c: 
0x86dd instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000c70: 
0x8594 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000c74; 
0xb3c8 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000c78: 
0x8922 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000c7c: 
0x8d8c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000c80: 
0x01f8 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000c84: 
0x9726 instead
Further such events for this erase block will not be 
printed                   
JFFS2: Erase block at 0x00000c60 is not formatted. It will be 
erased           
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00001080: 
0x8c70 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00001084: 
0x8f13 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00001088: 
0x01fc instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000108c: 
0xbf8e instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00001090: 
0x7b72 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00001094: 
0x00c0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00001098: 
0x4ae2 instead
Node at 0x0000109c with length 0x0000055c would run over the end of the 
erase block
Perhaps the file system was created with the wrong erase 
size?                 
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000010a0: 
0x055c instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000010a4: 
0x4686 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000010a8: 
0x0002 instead
Further such events for this erase block will not be 
printed                   
JFFS2: Erase block at 0x00001080 is not formatted. It will be 
erased           
[............................................................]

Best Regards,
Narinder Kumar,
New Delhi, India.
