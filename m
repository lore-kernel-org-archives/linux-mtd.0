Received: from rezznor.smb.utfors.se ([195.58.112.22])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17PKcO-0003i2-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Jul 2002 11:10:44 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "John Hall" <John.Hall@optionexist.co.uk>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: [Fwd: cfi_cmdset_0001.c: do_write_buffer bug] 
Date: Tue, 2 Jul 2002 12:10:42 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLKEANFFAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <541025071C7AC24C84E9F82296BB9B950805E5@OPTEX1.optex.local>
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

Hi John

Has Intel responded yet? If yes, do they have a fix?

         Jocke
> 
> 
> On 20 June 2002 13:25 David Woodhouse <dwmw2@infradead.org> wrote:
> 
> > John.Hall@optionexist.co.uk said:
> > >  Not yet. We've spoken to Intel and they acknowledge there might be
> > >  a problem, but we're waiting for them to get back to us.
> 
> > OK, I suspect what we want to do is something like...
> > 
> >  Send WriteToBuffer command.
> >  Poll for a little while for chips to become ready.
> >  If neither chip is ready, repeat.
> >  If only one chip is ready, abort the WriteToBuffer. Send a
> >  zero-length (or one-byte) buffer and then something other than a
> >  WriteConfirm command, to abort the write. Clear the resulting
> >  'Invalid Command/ Sequence' error bits which will get set, and start
> >  again.
> 
> Possibly. We're going to wait and see what Intel say, and then submit a
> patch if needed.
> 
> Regards,
> John Hall
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
