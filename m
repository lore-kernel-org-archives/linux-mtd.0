Received: from penguin-ext.wise.edt.ericsson.se ([193.180.251.47] helo=penguin.wise.edt.ericsson.se)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Hju3-0001uW-00
	for <linux-mtd@lists.infradead.org>; Fri, 29 Nov 2002 12:05:51 +0000
Subject: Re: JFFS/MTD and Raw access
From: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>
To: Damien GERANTON <dgeranton@alpha3i.com>
Cc: MTD mailing liste <linux-mtd@lists.infradead.org>
In-Reply-To: <BNEJIGKFJNJLELKBCMDAMEFGCEAA.dgeranton@alpha3i.com>
References: <BNEJIGKFJNJLELKBCMDAMEFGCEAA.dgeranton@alpha3i.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 29 Nov 2002 13:36:21 +0100
Message-Id: <1038573382.6005.15.camel@spawn>
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

If you have not started jffs2 on the image then they should be the same.
What is the real difference of the files? Convert to ascii first

od -Ax -tx1z /dev/mtd0 >master.txt



On Thu, 2002-11-28 at 17:21, Damien GERANTON wrote:
> Hello,
> 
> I face a strange problem, i use MTD with JFFS and i want to clone my systeme
> from one card
> to another.
> I thought that some think like :
> dd if=/dev/mtd0 of=/master.img
> 
> and
> 
> dd if=/master.img of=/dev/mtd0
> 
> But it does not work, if after i do
> 
> dd if=/dev/mtd0 of=/test.img
> diff test.img master.img
> i says they are different.
> 
> Is it normal.
> 
> Is RAW acces really RAW ?
> 
> Do i miss some think ?
> 
> Thanks
> 
> PS : I use MTD on 2.2.17 kernel
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
