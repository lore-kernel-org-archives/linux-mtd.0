Received: from rproxy.gmail.com ([64.233.170.204])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CTuLE-0006Bz-My
	for linux-mtd@lists.infradead.org; Mon, 15 Nov 2004 22:49:18 -0500
Received: by rproxy.gmail.com with SMTP id i8so786601rne
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Nov 2004 19:49:15 -0800 (PST)
Message-ID: <7f89a3ea04111519228bb1765@mail.gmail.com>
Date: Tue, 16 Nov 2004 11:22:34 +0800
From: Midnight Xiong <midnight.xiong@gmail.com>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <41889B50.9050608@avantwave.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <41889B50.9050608@avantwave.com>
Subject: Re: Can i use vfat as the mtd fs
Reply-To: Midnight Xiong <midnight.xiong@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm also interesting in this question. Could any body reply this? Thanks.


On Wed, 03 Nov 2004 16:48:16 +0800, mike <mikelee@avantwave.com> wrote:
> Dear all
> 
>    I need to do a flash disk for my board. It should be used by windows
> system. So vfat or msdosfs should be use.
>    I have try to use mkdosfs to format the mtdblock device, but it is
> unable to get the drive geometry. And i have browsed the source code of
> mtdblock(with linux-2.4.18), there isn't ioctl for check geometry.
> 
>    If i want to use vfat with mtdblock , do i need to upgrade the
> latest mtd version? Is this portable to linux-2.4.18 ? Or any portable
> version of mtd i can use?
> 
> Best Regard
> Mike,Lee
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
