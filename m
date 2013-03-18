Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHceJ-0008SG-Gt
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 16:11:00 +0000
Message-ID: <51473C88.4000105@parrot.com>
Date: Mon, 18 Mar 2013 17:10:48 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: David Mosberger-Tang <dmosberger@gmail.com>
Subject: Re: RE : ONFI patch
References: <CACwUX0OGZivc3pui7Kgo=Y+Tp+dP7UszR_DNN3-pzovo0L7LAg@mail.gmail.com>	<C429A122CB68254FACED4BEF16AA357A538A5392AA@OPALE.xi-lite.lan>
 <CACwUX0P4NeuuFy7q5OgE21m-J9reoXRFO-QL7z76+XVaxure3A@mail.gmail.com>
In-Reply-To: <CACwUX0P4NeuuFy7q5OgE21m-J9reoXRFO-QL7z76+XVaxure3A@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Mosberger-Tang a écrit :
> Matthieu,
> 
> On Sat, Mar 16, 2013 at 12:21 PM, Matthieu Castet
> <matthieu.castet@parrot.com <mailto:matthieu.castet@parrot.com>> wrote:

>  
> 
>     > I see that the linux-mtd tree has a NAND_BUSWIDTH_AUTO features, but
>     > I don't see how that's supposed to help for, say,
>     Did you look at the omap example ?
> 
> 
> I don't see any users of NAND_BUSWIDTH_AUTO in the linux-mtd GIT tree.
>  Am I missing something?


Yes the patch was pending. You can find it here :
http://article.gmane.org/gmane.linux.ports.arm.omap/93502/match=
>  
> 
>     > nand_onfi-set_features() or nand_onfi_get_features() as
>     > nand_set_defaults() will eventually set the 16-bit transfer routines
>     > for 16-bit devices.
>     If that's a problem of nand_onfi_get/set_features why don't you fix
>     them to use only 8 bits transfert ?
> 
> 
> That's what my patch does.
>  
> 
>     Isn't there a patch already submitted for doing that ?
> 
> 
> I don't know.  I joined the mailing list only recently.  Can you point
> me to such a patch?
> 
http://thread.gmane.org/gmane.linux.drivers.mtd/45578/focus=45610

But it only fix the nand_onfi_get_features and I don't think it fix the column
shift.

BTW you can't use nand_write_buf/nand_read_buf in common code. Some controller
overide chip->read_buf/chip->write_buf with their version and don't expect
nand_write_buf/nand_read_buf to be called.


Matthieu
