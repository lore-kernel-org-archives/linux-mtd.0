Received: from mail.mediatrix.com ([66.129.134.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15WhMM-0002jB-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Aug 2001 17:48:06 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4DD0DAD9@webmail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: 'Vipin Malik' <vipin@embeddedlinuxworks.com>, David Woodhouse
	 <dwmw2@infradead.org>
Cc: "MTD mailing list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: RE: JFFS2 is broken 
Date: Tue, 14 Aug 2001 12:46:15 -0400
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C124E0.A1FBC2F0"
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

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C124E0.A1FBC2F0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

It guess it is.  But is it possible (and not too time-consuming) for =
you to
take that new one I just created with ssh-keygen and put in
/root/.ssh/identity.pub along with /root/.ssh/identity and the config =
file
you ask me to create?  Here it is, should you decide to use it....

Fr=E9d=E9ric Giasson





-----Original Message-----
From: Vipin Malik [mailto:vipin@embeddedlinuxworks.com]
Sent: Monday, August 13, 2001 10:40 PM
To: David Woodhouse
Cc: Frederic Giasson; MTD mailing list (E-mail)
Subject: Re: JFFS2 is broken=20


At 01:00 AM 8/14/2001 +0100, David Woodhouse wrote:

>vipin@embeddedlinuxworks.com said:
> > David once mentioned that there are some obvious optimizations that
> > can be carried out in the JFFS2 code. Maybe he could list out his
> > favorite ones  and maybe someone could volunteer to tackle them one =
by
> > one.
>
>I committed the cleanup to jffs2_remove_node_refs_from_ino_list()

Great! Frederic, since you just setup your system to do the jitter =
tests,=20
could you pl run them again (with the new code from CVS) and see what=20
difference it made (my own system is busy running the mird db power =
fail=20
tests).

  Also enable profiling and see what else is on the  "CPU hog" list.

The LTT (Linux Trace Toolkit) seems to be an excellent tool to get more =

fine grained performance stats out of the system and
a new version was just released for 2.4.5 (though it may provide us =
with=20
more info that we need/can handle :)

Vipin


------_=_NextPart_000_01C124E0.A1FBC2F0
Content-Type: application/octet-stream;
	name="identity.pub"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="identity.pub"

1024 35 =
164358453018075670455790203200706540984393749504204243836036681422744008=
324009655150232134223034277415336613711914311755267437950808937418173965=
122857400339606006019692108436584787607289775427783920015394610085223007=
334556116082199981839573028213537755795029530359907389853830876722709464=
615820281008293377021 root@samlinux=0A=

------_=_NextPart_000_01C124E0.A1FBC2F0--
