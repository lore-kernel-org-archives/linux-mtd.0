Received: from mail.mediatrix.com ([66.129.134.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Aue9-0001HZ-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 May 2002 16:36:57 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D014ECF5C@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: "'ales.makarov@wolfhill.cz'" <ales.makarov@wolfhill.cz>,
	Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: RE: Kernel oops after sync command in jffs2
Date: Thu, 23 May 2002 11:36:53 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

Hi Ales,

I am currently testing the modifications I suggested in =
do_write_oneword and
do_erase_oneblock regarding polling.  If you want my sources to test it
and/or improve it yourself, just let me known.  Otherwise, when I will =
have
tested it throughfully, I will commit it into the CVS tree.

Regards,

Fr=E9d=E9ric Giasson =20

|-----Original Message-----
|From: Ales Makarov [mailto:ales.makarov@wolfhill.cz]
|Sent: Thursday, May 23, 2002 11:34 AM
|To: Frederic Giasson; Linux MTD mailing list
|Subject: Re: Kernel oops after sync command in jffs2
|
|
|Frederic Giasson wrote:
|>=20
|> However, I had a look at do_erase_oneword() function.  I=20
|seen that to verify
|
|I guess you mean do_write_oneword() function.
|
|> if write operation has completed, we simply read back the=20
|written value
|> until it matches or until we read back 10000 times or more. =20
|This works most
|> of the time, but in my opinion it is not the best way to do that.
|
|You are right. This could be my problem...
|=20
|> What I think we should do to determine if write operation=20
|has completed OK
|> is to poll DQ6 and DQ5, as we do for erase operation.  However, =
since
|> program operation takes *much* less time than erase=20
|operation ( 150 us max
|> accoring to my AMD spec ), we should not schedule.  We=20
|should simply poll
|> 150 times at most, inserting a "udelay(1);" in each loop. =20
|If DQ5 rises, we
|> must threat it the same way we do in do_erase_oneblock().
|
|I agree. I would also prefer the DQ6 and DQ5 testing.
|
|>=20
|> Also, speaking of do_erase_oneblock(), it is said in my AMD=20
|spec that when
|> DQ5 rises, even if that happen while DQ6 still toggle, it is=20
|necessary to
|> read DQ0-DQ7 twice once again and compare both values to see=20
|if it still
|> toggles.  If it does not toggle, it means that erase=20
|operation has completed
|> correctly.  You can verify that my yourself by having a look=20
|at figure 6, p.
|> 29 in spec sheet "Am29DL322D/323D/324D, revD, May 8th, 2001".
|>=20
|> Frederic Giasson
|>=20
|
|I have read it also in the datasheet of the Fujitsu MBM29LV320 (p.32).
|These additional reads should be done, because the toggle bit may have
|stopped toggling just as DQ5 went high.
|
|Ales
|
