Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 132zUQ-0004RF-00
	for mtd-list@infradead.org; Fri, 16 Jun 2000 18:01:06 +0100
Received: from tammy.cendio.se
	([193.180.23.67] helo=tammy.signum.se ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 132zUO-0004R9-00
	for mtd@infradead.org; Fri, 16 Jun 2000 18:01:05 +0100
Date: Fri, 16 Jun 2000 19:01:34 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: jffs-dev@axis.com
cc: =?iso-8859-1?Q?S=E9bastien_C=F4t=E9?= <scote1@matrox.com>,
        mtd@infradead.org
Subject: Re: Bug in JFFS
In-Reply-To: <394A4B0F.3E966791@matrox.com>
Message-ID: <Pine.LNX.4.10.10006161855460.32348-100000@tammy.signum.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 16 Jun 2000, S=E9bastien C=F4t=E9 wrote:

> I have just found a bug in my port of JFFS (2.2).
> If I mount a filesystem, do 'echo "Test" >> file' (file is an existing
> text file), the file gets appended correctly.  However, once I open the
> file (cat file), the append I do next will not appear on the screen but
> the file size changes correctly.

Ok. Here's how this should be fixed:
We should use generic_file_write in jffs_file_operations instead of
jffs_write_file. Then we should implement writepage, prepare_write and=20
commit_write in address_space_operations. These should look quite like
jffs_write_file, so this wouldn't be hard.

There is one problem here though. For each write the page of the file tha=
t
is modified is read in, modified and written out in its entierty. This
means several small writes to a file will become several 4Kb writes to th=
e
log.

Another doubt i have here is the log semantics given the page cache. I
don't know if the page cache immediately does the writes or if it delays
them (for better performance or something). That could possibly disturb
the integrity of the log.

/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
