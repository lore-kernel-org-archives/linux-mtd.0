Received: from dsl-64-129-133-253.telocity.com ([64.129.133.253] helo=skylab.outpostsentinel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17LPGv-0001Cy-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2002 15:20:21 +0100
Subject: Re: X Windows Performance with DOC 2000
From: cfowler <cfowler@outpostsentinel.com>
To: David Woodhouse <dwmw2@infradead.org>, andyw@linkmargin.com
Cc: Ilguiz Latypov <ilatypov@superbt.com>,
   David Cooper
	 <david@forcedpotato.com>,
   Linux MTD <linux-mtd@lists.infradead.org>
In-Reply-To: <6377.1024668725@redhat.com>
References: <1024668584.7968.9.camel@moses.outpostsentinel.com>
	<Pine.LNX.4.44.0206210952070.9587-100000@server.superbt.com>  
	<6377.1024668725@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 21 Jun 2002 10:28:17 -0400
Message-Id: <1024669698.7895.19.camel@moses.outpostsentinel.com>
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

#1) What the hell is msys/fla process?  I do not have my DOC mounted and
    the load averages are around 1.99 when the module is loaded.  M-SYS 
    for some reason can not seem to tell me what is going on here. If 
    this is a garbage collector then it is using too much resources. TO
    fix this I issue rmmod doc.  Now if I can remove the module then why
    is GC doing this?  I have interfaces that insert and remove the
    module for each operation on flash.  This takes time and is a 
    hack.

#2) Grub destroyed my first DOC.  I use doc-lilo.  Everytime I flash a  
    new kernel on the DOC I have to re-run doc-lilo.

#3) DOC is single source

#4) My contractor and I have not been too pleased with their support.

#5) I have to use putimage.exe and getimage.exe in DOS to 
    flash other units.  This means in development I have to 
    maintain a dos envrionment.  We are strictly linux in development

#6) I have to load the driver as a module to obey the GPL of the 
    kernel.  I prefer to have it built in.  This makes upgrades easier.

#7) Writing to the thing is slooooowwww.  


#8) CF is so much easier using in devel and production.  DOM to me
    seems better

On Fri, 2002-06-21 at 10:12, David Woodhouse wrote:
> 
> cfowler@outpostsentinel.com said:
> > I'm actually tired of using M-SYS's driver.  Their tech-support sucks
> > and I hate using putimage in DOS.  I'm switching to DOM and  Compact
> > Flash.  I'll guess some other company will get my order for 10,000
> > units.
> 
> What problems did you have with the real Linux driver?
> 
> --
> dwmw2
> 
> 
> 
> 
