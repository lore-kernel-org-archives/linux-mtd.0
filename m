Received: from rezznor.smb.utfors.se ([195.58.112.22])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Kcsy-00066P-00
	for <linux-mtd@lists.infradead.org>; Wed, 19 Jun 2002 11:40:24 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "John Hall" <John.Hall@optionexist.co.uk>,
	<linux-mtd@lists.infradead.org>
Cc: "Andrey Filippov" <andrey@elphel.com>
Subject: RE: [Fwd: cfi_cmdset_0001.c: do_write_buffer bug]
Date: Wed, 19 Jun 2002 12:40:23 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLIEMBFEAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1251"
Content-Transfer-Encoding: 7bit
In-Reply-To: <541025071C7AC24C84E9F82296BB9B952D10@OPTEX1.optex.local>
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

Have made any progress on this? I too have 2 Strata Flash in 16-bit mode to form a 32-bit
interface. I have yet to encounter this problem though.

  Jocke
> 
> On Sun 16/06/2002, Andrey Filippov <andrey@elphel.com> wrote:
> 
> > Working with Intel TE28F640J3A and Axis ETRAX100LX processor I ran
> > over a bug in cfi_cmdset_0001.c: do_write_buffer. It checks ready
> > state 20 times but does not resend Write-to-Buffer command (E8) before
> > new checks. So if it was not ready first time it will never be ready
> > later.
> 
> I was going to report exactly the same problem this morning. We have an
> additional problem however. We currently have two Intel Strata Flash
> parts in 16 bit mode to form a single 32 bit interface to a StrongARM
> SA1110. We have found that sometimes, one chip returns ready, but the
> second does not. You are then in a Catch-22 since you're supposed to
> re-issue the write command to the one that's not ready but cannot to the
> one that is ready.
> 
> Has anyone else come across this problem?
> 
> Regards,
> John Hall
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
