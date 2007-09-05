Received: from smtpout04-01.prod.mesa1.secureserver.net ([64.202.165.196])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1ISxe6-0002oL-MJ
	for linux-mtd@lists.infradead.org; Wed, 05 Sep 2007 12:22:30 -0400
Message-ID: <46DED80E.5000802@techmoninc.com>
Date: Wed, 05 Sep 2007 11:23:42 -0500
From: Andy Kennedy <akennedy@techmoninc.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: backtrace.S & printk()
References: <46DED5D3.7080502@techmoninc.com>
	<20070905111743.0313e6b1@weaponx.rchland.ibm.com>
In-Reply-To: <20070905111743.0313e6b1@weaponx.rchland.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
> On Wed, 05 Sep 2007 11:14:11 -0500
> Andy Kennedy <akennedy@techmoninc.com> wrote:
>
>   
>> Russel:
>>
>> While attempting to build a kernel without printk in it, I ran across an 
>> error in your backtrace.S file.  It appears that you are assuming that 
>> all arm kernels will be built with printk().  What is your reason for 
>> this?  What are the ramifications of me taking out those three sections 
>> of code?
>>     
>
> Erm... wrong list?  This is the MTD list, not the ARM list...
>
> josh
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
>   
Oh please. . . Linux-ARM Linux-MTD. . . it's all the same.

Bummer man. . . been a loooong week.

Andy
