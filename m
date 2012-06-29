Received: from relay.medianet-world.de ([213.157.0.172])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SkX6q-0000k8-Ng
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 09:03:25 +0000
Content-Transfer-Encoding: 7bit
Content-Class: urn:content-classes:message
Date: Fri, 29 Jun 2012 11:03:10 +0200
Message-ID: <87fw9e8p81.wl%andreas.friesen@hbm.com>
From: "Andreas Friesen" <andreas.friesen@hbm.com>
To: <dedekind1@gmail.com>
Subject: Re: Loosed files after umount/mount
In-Reply-To: <1340794858.29342.55.camel@sauron.fi.intel.com>
References: <CAMU=cjyiX2KnntUFYYa-fwi0QAKX-Um1gE8tpNLwNiNsbj8O1Q@mail.gmail.com><1340794858.29342.55.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Cc: Andreas Friesen <ndrs.frsn@googlemail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

At Wed, 27 Jun 2012 14:00:58 +0300,
Artem Bityutskiy wrote:
> 
> [1  <text/plain; UTF-8 (quoted-printable)>]
> On Mon, 2012-06-18 at 22:29 +0200, Andreas Friesen wrote:
> > Hello,
> > 
> > I'm experiencing a strange problem with JFFS2 using Linux
> > 3.1.5, 3.4 from kernel.org.git on PowerPC. After unmounting and
> > remounting the filesystem,
> > directory is empty.
> 
> So is it 3.4 or 3.1.5?

The board is a MPC5200B board  with NOR Flash (like IceCube)
I have seen the problem in 3.1.5 and 3.4.


> > $ flash_erase /dev/mtd2
> > $ reboot
> > $ mount mtd:storage /storage -t jffs2
> > $ scp root@server:/tmp/settings/*.xml /storage
> If you add "sleep 20" here - does it help?

The tests with sleep() of 1s to 3min were unsuccessful.

> Is it NOR or NAND? My first guess is that the write-buffer is not
> synced. Or there are issues with the driver, try to run mtd tests.

mtd tests work fine.

> -- 
> Best Regards,
> Artem Bityutskiy
> [2 This is a digitally signed message part <application/pgp-signature (7bit)>]
> 

Hottinger Baldwin Messtechnik GmbH, Im Tiefen See 45, 64293 Darmstadt, Germany | www.hbm.com 

Registered as GmbH (German limited liability corporation) in the commercial register at the local court of Darmstadt, HRB 1147  
Company domiciled in Darmstadt | CEO: Andreas Huellhorst | Chairman of the board: James Charles Webster

Als Gesellschaft mit beschraenkter Haftung eingetragen im Handelsregister des Amtsgerichts Darmstadt unter HRB 1147 
Sitz der Gesellschaft: Darmstadt | Geschaeftsfuehrung: Andreas Huellhorst | Aufsichtsratsvorsitzender: James Charles Webster

The information in this email is confidential. It is intended solely for the addressee. If you are not the intended recipient, please let me know and delete this email.

Die in dieser E-Mail enthaltene Information ist vertraulich und lediglich fur den Empfaenger bestimmt. Sollten Sie nicht der eigentliche Empfaenger sein, informieren Sie mich bitte kurz und loeschen diese E-Mail.
