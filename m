Received: from mail9.speakeasy.net ([216.254.0.209] helo=mail.speakeasy.net)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19k2tO-0002yP-5r
	for <linux-mtd@lists.infradead.org>; Tue, 05 Aug 2003 15:34:26 +0100
From: Roger <rogerxxmaillist@speakeasy.net>
To: Selwyn Tang <selwyn@hectrix.com>, linux-mtd@lists.infradead.org
In-Reply-To: <3F2E38FE.8030800@hectrix.com>
References: <3F2E3089.40904@hectrix.com>
	 <1059992609.7431.19.camel@localhost3.localdomain>
	 <3F2E38FE.8030800@hectrix.com>
Message-Id: <1060093933.3861.6.camel@localhost3.localdomain>
Mime-Version: 1.0
Date: 05 Aug 2003 07:32:14 -0700
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: Re: Problems with DOC 2000 on 2.4.21
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On both of my 440BX boards, Intel incorporated a shadow feature which
shadows the mtd devices (bios chip/DIP socket) from the normal mtd
drivers/modules.

I have to utilize the openbios/devbios module/code to unshadow the 440BX
DIP socket.

There are many other chipsets supported for unshadowing in that code.  I
believe the code only needs to be implemented into mtd somehow.

But basically, I get nothing found in dmesg when loading the DOC modules
and nothing showing in /proc/mtd* -- but mtdchar does show some info in
the /proc/mtd* files.

After unshadowing the 440BX DIP socket (using openbios/devbios -- i
hacked module to leave the DIP socket unshadowed after unloading;-), and
then loading the mtd/doc modules,  I get 'found DOC ...' in dmesg and I
get good info in the /proc/mtd* files. 


On Mon, 2003-08-04 at 03:44, Selwyn Tang wrote:
> Dear Roger,
> 
> Roger wrote:
> > I usually find after loading the mtd doc200x modules, doing:
> > # modprobe mtdchar
> > will usually produce the /dev/mtd* devices.
> 
> When I compiled those MTD stuffs as modules, and after modprobe, I still 
> didn't get any /dev/mtd* devices. But when I compiled those as builtin, 
> I can cat /proc/mtd and get "mtd0:..." but still no /dev/mtd*
> 
> Do you know why?
> 
> Selwyn
-- 

Roger
http://www.eskimo.com/~roger/index.html
