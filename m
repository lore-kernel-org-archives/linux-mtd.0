Received: from tidos.tid.es ([193.145.240.2] helo=tid.tid.es)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15jiIW-0002ty-00
	for <linux-mtd@lists.infradead.org>; Wed, 19 Sep 2001 15:26:01 +0100
Received: from tid.es ([1.0.22.18]) by tid.tid.es (Netscape
          Messaging Server 4.15) with ESMTP id GJWZ0I00.51K for
          <linux-mtd@lists.infradead.org>; Wed, 19 Sep 2001 16:31:30 +0200
Message-ID: <3BA8ABDE.6020208@tid.es>
Date: Wed, 19 Sep 2001 16:29:50 +0200
From: Jose =?ISO-8859-1?Q?Rodr=EDguez?= Argente <jradc@tid.es>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [Fwd: JFFS2 compresses?]
Content-Type: multipart/mixed;
 boundary="------------010203000500000809000103"
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

This is a multi-part message in MIME format.
--------------010203000500000809000103
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



--------------010203000500000809000103
Content-Type: message/rfc822;
 name="JFFS2 compresses?"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="JFFS2 compresses?"


>From - Wed Sep 19 14:44:48 2001
X-Mozilla-Status2: 00000000
Message-ID: <3BA89339.50407@tid.es>
Date: Wed, 19 Sep 2001 14:44:41 +0200
From: Jose =?ISO-8859-1?Q?Rodr=EDguez?= Argente <jradc@tid.es>
User-Agent: Mozilla/5.0 (X11; U; Linux 2.4.4-4GB i686; en-US; 0.8.1) Gecko/20010515
X-Accept-Language: en
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: JFFS2 compresses?
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Does JFFS2 compress data in flash?

When I check the available space in Flash

df

Filesystem                    1k-blocks        Used    Available    Use% 
   Mounted on
/dev/mtdblock1            32000                5772    26228            
18%        /

But when I erase a file that is 702k big I get:

df

Filesystem                    1k-blocks        Used    Available    Use% 
   Mounted on
/dev/mtdblock1            32000                5648    26352            
18%        /

Which means that 124k have been freed.
I think there is a compression algorythm involved...?

Thanks a lot



--------------010203000500000809000103--
