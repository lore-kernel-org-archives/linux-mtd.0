Received: from anchor-post-35.mail.demon.net ([194.217.242.85])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Hj6N-0001r8-00
	for <linux-mtd@lists.infradead.org>; Fri, 29 Nov 2002 11:14:31 +0000
From: "" <simon@baydel.com>
To: "Damien GERANTON" <dgeranton@alpha3i.com>
Date: Fri, 29 Nov 2002 11:28:16 -0000
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: Re: JFFS/MTD and Raw access
CC: "MTD mailing list" <linux-mtd@lists.infradead.org>
Message-ID: <3DE74F50.30675.396F40@localhost>
In-reply-to: <BNEJIGKFJNJLELKBCMDAMEFGCEAA.dgeranton@alpha3i.com>
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

I have hit exactly the same problem using JFFS2. I am no authority 
on this but, I thought the problem might be caused by the write 
generating different OOB data for input blocks, which are erased or 
only partially written. So I guess what needs to be done is to read 
and copy the DATA and OOB. I think you can do this with the 
nanddump and nandwrite utilities. I guess I will have to try it 
sometime. 

Cheers

Simon.
On 28 Nov 2002, at 17:21, Damien GERANTON wrote:

> Hello,
> 
> I face a strange problem, i use MTD with JFFS and i want to clone my
> systeme from one card to another. I thought that some think like : dd
> if=/dev/mtd0 of=/master.img
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


__________________________

Simon Haynes - Baydel 
Phone : 44 (0) 1372 378811
Email : simon@baydel.com
__________________________
