Received: from mail.mediatrix.com ([66.129.134.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Wegq-0002Xq-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Aug 2001 14:57:04 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D9955F8@webmail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: 'David Woodhouse' <dwmw2@infradead.org>, Vipin Malik
	 <vipin@embeddedlinuxworks.com>
Cc: Frederic Giasson <fgiasson@mediatrix.com>, "MTD mailing list (E-mail)"
	 <linux-mtd@lists.infradead.org>
Subject: Erase.c in CVS tree, 08-13-2001 version does not compile
Date: Tue, 14 Aug 2001 09:55:15 -0400
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

Erase.c in CVS tree does not compile.  This line have to be put this =
line at
the beggining of the D2 block:
        struct jffs2_raw_node_ref *this;

Fr=E9d=E9ric Giasson





-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Monday, August 13, 2001 8:00 PM
To: Vipin Malik
Cc: Frederic Giasson; MTD mailing list (E-mail)
Subject: Re: JFFS2 is broken=20



vipin@embeddedlinuxworks.com said:
> David once mentioned that there are some obvious optimizations that
> can be carried out in the JFFS2 code. Maybe he could list out his
> favorite ones  and maybe someone could volunteer to tackle them one =
by
> one.=20

I committed the cleanup to jffs2_remove_node_refs_from_ino_list() =
(Christ,=20
did I name that function?), which showed up near the top of the =
profiles=20
you did. What's next? ISTR we got strange data from the profiling.=20

--
dwmw2
