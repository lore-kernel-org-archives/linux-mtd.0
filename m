Received: from mailhost.rdmcorp.com ([204.225.180.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17uciu-0006Fc-00
	for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2002 18:46:49 +0100
Received: from PARKER (10.1.2.1) by mailhost.rdmcorp.com (Worldmail 1.3.167) for linux-mtd@lists.infradead.org; 26 Sep 2002 13:51:57 -0400
From: "Jack Lu" <jlu@rdmcorp.com>
To: <linux-mtd@lists.infradead.org>
Subject: decompresion  error when using jffs2
Date: Thu, 26 Sep 2002 13:47:10 -0400
Message-ID: <DFEAJMIABOLKNEBOPGDHIEEECBAA.jlu@rdmcorp.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Hi
	I have mounted the jffs2 filesystem by:
	#mount /dev/mtdblock/1 /tmp

	Then I copied a file by:
	#cp /mnt/test.c /tmp/t.c

	one prompt displayed:
	inflate returned -3. -3 means Z_DATA_ERROR. 

	I checked the file fs/jffs2/compr_zlib.c
	jffs2_zlib_decompress(..){
		...
		while(ret=zlib_inflate(&strm,ZFINISH))==Z_OK);
		if(ret!=Z_STREAM_END){
			printk(KERN_NOTICE :inflate returned %d\n",ret);
			}
		....
		}

	but I compared the /tmp/t.c and /mnt/test.c, there was no difference.


	Why does this prompt occur?

Thanks.

	
