Received: from web30201.mail.mud.yahoo.com ([209.191.69.48])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GrlwH-00059c-Hq
	for linux-mtd@lists.infradead.org; Tue, 05 Dec 2006 20:51:18 -0500
Message-ID: <20061206014432.56808.qmail@web30201.mail.mud.yahoo.com>
Date: Tue, 5 Dec 2006 17:44:32 -0800 (PST)
From: Siddharth Choudhuri <siddh_c@yahoo.com>
Subject: Re: Finding flash type...
To: dedekind@infradead.org
In-Reply-To: <1164961351.576.84.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--- Artem Bityutskiy <dedekind@infradead.org> wrote:
> It would be ideal if somebody added sysfs support to
> MTD. Then you could
> just look at sysfs and find it out. Now you should
> use ioctl's.
> 
I could start adding the sysfs support to reflect
flash type.  I have the following questions though:

1. Should the information be exported in the
/sys/block/mtd* directory ? The other place would be
/sys/class/mtd*. 

2. Should any other information be also exported ? The
mtd_info_user structure [include/mtd-abi.h] has
additional fields that might be useful - size,
erasesize, oobblock(if present) ? 

Any suggestions, pointers would be great. 

thanks,
-siddharth



 
____________________________________________________________________________________
Yahoo! Music Unlimited
Access over 1 million songs.
http://music.yahoo.com/unlimited
