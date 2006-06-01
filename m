Received: from host29.root-name-server.net ([67.19.46.165])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FlsaE-0003uo-7D
	for linux-mtd@lists.infradead.org; Thu, 01 Jun 2006 15:11:58 -0400
Message-ID: <447F117A.7070708@realmsys.com>
Date: Thu, 01 Jun 2006 10:10:34 -0600
From: Kevin Vigor <kevin@realmsys.com>
MIME-Version: 1.0
To: ghannon@cspi.com
Subject: Re: [PATCH] avoid unnnecessary mtd read when read can be	 satisfied
	by	write buffer
References: <85257180.00537972.00@pine.cspi.com>
In-Reply-To: <85257180.00537972.00@pine.cspi.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ghannon@cspi.com wrote:

>However when programming a flash device and then reading back
>to verify that it was programmed correctly,  I think this write
>cache would defeat the purpose.
>
>  
>
This problem already exists with the wbuf code since a call to 
jffs2_flash_read will return the write buffer contents regardless of the 
actual contents of the media (unless you call  jffs2_flush_wbuf_pad() 
between the write and the read).

So the semantics could remain the same in that an explicit flush would 
be necessary in order to validate the data on flash.
