Received: from albatross-ext.wise.edt.ericsson.se ([193.180.251.49] helo=albatross.wise.edt.ericsson.se)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17nHvP-0006cd-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Sep 2002 13:09:23 +0100
Subject: Re: writing to jffs2 is so slow?
From: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>
To: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
Cc: Mtd <linux-mtd@lists.infradead.org>
In-Reply-To: <3D77C812.3080108@redswitch.com>
References: <3D77C812.3080108@redswitch.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 06 Sep 2002 14:08:58 +0200
Message-Id: <1031314138.28700.167.camel@spawn>
Mime-Version: 1.0
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

On Thu, 2002-09-05 at 23:09, Xiaogeng (Shawn) Jin wrote:
> Hi,
> 
> I have an empty mtd partition (capacity is 16 MB) where a jffs2 fs is 
> mounted. The strange observation is that making a first directory on 
> that partition takes almost 2 minutes. So far I observed this behaviour 
> just when making the first directory and just on that particular 
> partition. Can anyone help me to explain this? Is there anything wrong 
> with flash memory (hardware) or MTD device driver or JFFS2? Thanks.
> 

The thing is that jffs2 seems to mark the whole disk dirty and has to re
erase the whole disk before you can store anything on it. This happens
only the first time. If you wait a few minutes after you do the mount
you should see no delay in creating directories and files.

Maybe it's possible to do a format command that creates a disk that is
empty and prevents the jffs2 code to reformat every block.


-- 
Kenneth Johansson	
Ericsson AB                       Tel: +46 8 404 71 83
Borgafjordsgatan 9                Fax: +46 8 404 72 72
164 80 Stockholm                  kenneth.johansson@etx.ericsson.se
