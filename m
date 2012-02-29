Received: from gw1.transmode.se ([195.58.98.146])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S2t3Y-0000ER-4Z
 for linux-mtd@lists.infradead.org; Wed, 29 Feb 2012 23:35:36 +0000
In-Reply-To: <1330536159.1477.YahooMailClassic@web29014.mail.ird.yahoo.com>
References: <OFB4D94431.92097836-ONC12579B3.002C764D-C12579B3.00314167@transmode.se>
 <1330536159.1477.YahooMailClassic@web29014.mail.ird.yahoo.com>
Subject: Re: [PATCH] mtd: cfi: Wait for Block Erase operation to finish
To: Paul Parsons <lost.distance@yahoo.com>
Message-ID: <OF3A221559.E83A6FE6-ONC12579B3.0080422F-C12579B3.008197D4@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 1 Mar 2012 00:35:30 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, philipp.zabel@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Paul Parsons <lost.distance@yahoo.com> wrote on 2012/02/29 18:22:39:
>
> --- On Wed, 29/2/12, Joakim Tjernlund <joakim.tjernlund@transmode.se> wrote:
> > If erase is suspended, chip->state is changed which will
> > keep the function in
> > the for(;;) loop. Once erase has been resumed again
> > chip->state will change back.
> > It seems to me that chip->state and SR.6 are mutally
> > exclusive? I can not see how
> > you can get to
> >     status = map_read(map, cmd_adr);
> >     if (map_word_andequal(map, status,
> > status_OK, status_OK))
> > if the the erase has been suspended.
>
> OK, I understand. Let me demonstrate.
>
> I Added the following debug to the original linux-3.3-rc5
> drivers/mtd/chips/cfi_cmdset_0001.c file (i.e. without my patch):

This looks like a erase resume problem, cfi driver issues a resume command but the
chip fails or is slow to respond. I remember someone having a similar problem
some time ago. Don't think we got to bottom of it though, look for subject:
  Numonyx NOR and chip->mutex bug?

Try adding extra read status cmds around resume, check if SR.6 is cleared too.
Enable all driver debug code and look for the first sign of trouble.

That said, there seems to be something fishy going on with UBI as it is
erasing the same failing block over and over again.
Also, it would probably be good to add test of SR.6 in some places, just
to make sure the flash does what the driver wants it to do.

 Jocke
