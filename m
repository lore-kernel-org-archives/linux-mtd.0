Received: from matrix2.enst.fr ([137.194.2.14] helo=smtp2.enst.fr)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17e9ra-0003Ou-00
	for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2002 08:43:42 +0100
Received: from email.enst.fr (muse.enst.fr [137.194.2.33])
	by smtp2.enst.fr (Postfix) with ESMTP id 04A181EF9A
	for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2002 09:43:41 +0200 (MEST)
Received: from enst.fr (IDENT:BbliHMewKENu5QJgBjEIjn+fqq5VI3oo@paris.enst.fr [137.194.161.13])
	by email.enst.fr (8.9.3/8.9.3) with ESMTP id JAA22314
	for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2002 09:43:41 +0200 (MET DST)
Message-ID: <3D57669A.142EC6F3@enst.fr>
Date: Mon, 12 Aug 2002 09:41:14 +0200
From: Sylvain Meunier <meunier@enst.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: tiny JFFS2 Reader
References: <20020810163019.19590.qmail@mailFA12.rediffmail.com> <20020812085533.A24857@gateway.bln.gelonet.local>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

> > On Sat, Aug 10, 2002 at 16:30:19 -0000, sriram  neelakandan wrote:
> > Hi group,
> > I am looking for a tiny jffs2 reader that can read a file from a
> > jffs2 partition..
> > the code in jffs2reader.c in the MTD utils tar
> > mtd-20000704.tar.gz (hope this is the latest)
> > does not have the logic to read beyond the first node of the
> > file.
...

Hi

Look for ppcboot sources, this is a bootloader that know about jffs2 (it
can acces any level of
directory and load a file).

Sylvain
