Received: from tidos.tid.es ([193.145.240.2] helo=tid.tid.es)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15jrFb-0003ha-00
	for <linux-mtd@lists.infradead.org>; Thu, 20 Sep 2001 01:00:04 +0100
Received: from tid.es ([1.0.22.18]) by tid.tid.es (Netscape
          Messaging Server 4.15) with ESMTP id GJWU5G02.I0K for
          <linux-mtd@lists.infradead.org>; Wed, 19 Sep 2001 14:46:28 +0200
Message-ID: <3BA89339.50407@tid.es>
Date: Wed, 19 Sep 2001 14:44:41 +0200
From: Jose =?ISO-8859-1?Q?Rodr=EDguez?= Argente <jradc@tid.es>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: JFFS2 compresses?
Content-Type: text/plain; charset=us-ascii; format=flowed
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
