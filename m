Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta02.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178bhF-00050X-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 07:58:37 +0100
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Thu, 16 May 2002 23:58:33 -0700 (PDT)
From: Jim Zeus <zeusj@firstlinux.net>
To: David Woodhouse <dwmw2@infradead.org>
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: Quesion on copying to mtdblock0
Reply-To: zeusj@firstlinux.net
Message-Id: <20020517065835.4FB6B36F9@sitemail.everyone.net>
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


--- David Woodhouse <dwmw2@infradead.org> wrote:
>Are you sure the JFFS2 image was created correctly? 

Yes, I create it with mkfs.jffs2 :
mkfs.jffs2 --root=/some/place/ --eraseblock=8192KiB --output=jffs2.img
Is there anything I missed?should I change pagesize from default 4KiB?

>Is your target bigendian? 

Yes, its dragonball.
But after I change the endianness of jffs.img/jffs2.img (exactly,I change the .b file), the problem is still there, just like what it shows before changing.Changing seems no use.


Thanks 

Jim Zeus



_____________________________________________________________
Want a new web-based email account ? ---> http://www.firstlinux.net

_____________________________________________________________
Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
