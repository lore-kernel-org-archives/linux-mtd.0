Received: from [200.73.64.66] (helo=apolo.virtuabyte.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BnM4o-0007Pj-JY
	for linux-mtd@lists.infradead.org; Wed, 21 Jul 2004 14:44:29 -0400
Received: from [192.168.128.11] ([200.104.148.69])
	by apolo.virtuabyte.com (Merak 7.4.4) with ASMTP id CQA74038
	for <linux-mtd@lists.infradead.org>; Wed, 21 Jul 2004 14:44:21 -0400
From: Carlos Manuel Duclos Vergara <carlos@embedded.cl>
To: linux-mtd@lists.infradead.org
Date: Wed, 21 Jul 2004 14:52:02 +0200
References: <I17SEM$1DC26B36820863BFFC1F5CC60A6B7223@libero.it>
In-Reply-To: <I17SEM$1DC26B36820863BFFC1F5CC60A6B7223@libero.it>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <200407211452.02227.carlos@embedded.cl>
Subject: Re: mmap on jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

El Mi=E9rcoles, 21 de Julio de 2004 20:23, dibacco@inwind.it escribi=F3:
> Hi,
>

Hi,

> I have a problem mapping a file opened with flag O_RDWR. This file is
> housed on a jffs2 file system that currently lives on simple ram. Could y=
ou
> give me an hint where to search for a possible solution? If I open the fi=
le
> in O_RDONLY mode the mapping is done, instead with O_RDWR mmap returns
> -EINVAL.
>

i'm not sure, but it could be because of the 'j' (Journaling). A journaling=
=20
filesystem is different from another kind of filesystem, and i'm not sure=20
about what it could mean mmap for a file in a journal filesystem.
A journal filesystem uses two stages for writing, the journal and the real=
=20
data. So when you try to mmap a file for writing in  a journal filesystem i=
t=20
can be very tricky to implement, but for reading there is no problem becaus=
e=20
when you read a file you get the file from the data, not from the journal.

My $1

=2D-=20
Carlos Manuel Duclos Vergara
carlos@embedded.cl
