Received: from pd953a1d1.dip.t-dialin.net ([217.83.161.209] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16qeJI-0003Sr-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2002 18:07:40 +0000
Message-Id: <200203281812.g2SIC9423613@thomas.tec.autronix.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: "John Hall" <John.Hall@optionexist.co.uk>
Subject: Re: JFFS2 NAND flash support
Date: Thu, 28 Mar 2002 19:12:09 +0100
Cc: <linux-mtd@lists.infradead.org>
References: <541025071C7AC24C84E9F82296BB9B950804CD@OPTEX1.optex.local>
In-Reply-To: <541025071C7AC24C84E9F82296BB9B950804CD@OPTEX1.optex.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi John,
I put this on the list again.

On Thursday, 28. March 2002 18:35, John Hall wrote:
> On 28 March 2002 15:53 Thomas Gleixner <gleixner@autronix.de> wrote:
> > OK, I had a short glance on your code. It's a pity, that you started a
> > nand.c rewrite instead of discussing that issue before hacking. Don't
> > missunderstand me. I don't have a problem if anybody is hacking around
> > in nand.c.
> >
> > It means: We try to integrate as much as possible in general purpose
> > files like nand.c so it's easier to maintain the hardware specific
> > stuff in small hw-driver files. General purpose files can be
> > maintained for neccecary changes in filesystems, mtd layers etc. so
> > they fit for all underlying hardware drivers without the need to
> > change all of them too. As Smartmedia is exactly the same as NAND it
> > should be one generic driver at all. Reenventing the wheel is not the
> > aim of open software development. You have a chosen a new layout for
> > he oob area. This will not fit into the current JFFS2 layout. So JFFS2
> > will not work that way. We discussed this problem in a long mailthread
> > a few month ago.
>
> Agreed. To be honest, I didn't really expect my stuff to be of interest
> to anyone else. 
It's not a problem if it's of interest for somebody, but it will be a problem 
for you and your customer, if you have a solution, which is hard to 
maintaing, because it is out of the mainstream. And maybe it gives some other 
people a nice idea, how to design their hardware the best way.

> It's bespoke development for our client, and has unusual
> hardware access. Looking back, I probably should have tried to work
> within the existing framework. I originally was hoping to read and write
> standard Smartmedia cards, which have a well defined layout for the oob
> data and use FAT12 as their filesystem. The client has since decided
> that FAT12 isn't robust enough in power loss situations (it's not robust
> in any situation... :). 
Same for me. It's ok for MP3 players :)

> This is the only reason I have put oob data where I have.
We have left the bad block marker where it is has to be on SmartMedia by spec 
and arranged the rest for our convenience :)
The layout scheme is flexible and can be changed easy for other filesystems 
like FAT12, if somebody does the neccecary hack :).

> > If you are interrested in a common solution for your target and the
> > community, I suggest, that we rework the existing nand.c together.
> > It's not a big deal to extend the nand structure with a pointer, which
> > gives you the control for a complete hardware specific command write
> > function. Also it's no problem to modify the wait, that you can choose
> > a timed wait or a interrupt driven one, which then resides in your
> > hardware driver. This would be a solution that ensures improvement of
> > the code, usability for everybody and prevent us from duplicated code.
> > We have already enough in the kernel.

> OK, I will take a look at the feasability of merging the two next week
> after the holidays.
I will check it in the next days too and will prepare the stuff, what's 
neccecary to support your hardware. This are only 3 things to do, IMHO
1. give the possibility to provide a hardware specific command write function
2. give the possibility to provide a hardware specific wait function,which 
can be interrupt driven, if the hardware has this feature.
3. rewrite the erase blocking
Have a look in CVS after your Easter weekend. 

> In your opinion, is the solution that I have chosen (an interrupt
> handler which schedules a tasklet) the best one for handling erases? It
> seems a little little untidy, because reads and writes are handled
> differently since they are synchronous. I haven't done much 2.4
> development, so I'm still feeling my way.
Yep, it's a nice feature at all. But we should keep the synchronous functions 
for read/write as the max. delay is less, than running through an interrupt 
handler.

-- 
Happy Easter
Thomas
_________________________________
Thomas Gleixner <gleixner@autronix.de>
autronix automation http://www.autronix.de
