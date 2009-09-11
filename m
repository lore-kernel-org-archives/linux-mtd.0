Received: from mail-iw0-f198.google.com ([209.85.223.198])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mm2Vf-0008H4-C8
	for linux-mtd@lists.infradead.org; Fri, 11 Sep 2009 09:33:44 +0000
Received: by iwn36 with SMTP id 36so625708iwn.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Sep 2009 02:33:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1252597344.5060.99.camel@localhost>
References: <2df346410909020235v5258eba3l30ff731841acc71@mail.gmail.com>
	<1252390936.5060.47.camel@localhost>
	<2df346410909090245v5995842asf3a94ae40da5fa72@mail.gmail.com>
	<1252597344.5060.99.camel@localhost>
Date: Fri, 11 Sep 2009 17:33:38 +0800
Message-ID: <2df346410909110233n6b434567qb2bbbb380417adf7@mail.gmail.com>
Subject: Re: UBIFS power cut issues
From: JiSheng Zhang <jszhang3@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,


2009/9/10 Artem Bityutskiy <dedekind1@gmail.com>:
>
> =A0 =A0 =A0* User creates an empty file f.dat. The file is synchronous, o=
r
> =A0 =A0 =A0 =A0UBIFS is mounted in synchronous mode. User calls the write=
()
> =A0 =A0 =A0 =A0function with a 10MiB buffer.
> =A0 =A0 =A0* The kernel first copies all 10MiB of the data to the page ca=
che.
> =A0 =A0 =A0 =A0Inode size is changed to 10MiB as well and the inode is ma=
rked
> =A0 =A0 =A0 =A0as dirty. Nothing has been written to the flash media so f=
ar. If
> =A0 =A0 =A0 =A0a power cut happens at this point, the user will end up wi=
th an
> =A0 =A0 =A0 =A0empty f.dat file.
> =A0 =A0 =A0* UBIFS sees that the I/O has to be synchronous, and starts
> =A0 =A0 =A0 =A0synchronizing the inode. First of all, it writes the inode=
 node
> =A0 =A0 =A0 =A0to the flash media. If a power cut happens at this moment,=
 the
> =A0 =A0 =A0 =A0user will end up with a 10MiB file which contains no data
> =A0 =A0 =A0 =A0(hole), and if he read this file, he will get 10MiB of zer=
oes.
> =A0 =A0 =A0* UBIFS starts writing the data. If a power cut happens at thi=
s
> =A0 =A0 =A0 =A0point, the user will end up with a 10MiB file containing a=
 hole
> =A0 =A0 =A0 =A0at the end.
>
> Note, if the I/O was not synchronous, UBIFS would skip the last step and
> would just return. And the actual write-back would then happen in
> back-ground. But power cuts during write-back could anyway lead to files
> with holes at the end.

Thanks very much for this document, excellent document, I like it very much=
.
>
> Thus, synchronous I/O in UBIFS provides less guarantees than JFFS2 I/O -
> UBIFS has an effect of holes at the end of files. In ideal world
> applications should not assume anything about the contents of files
> which were not synchronized before a power-cut has happened. And
> "mainstream" file-systems like ext3 do not provide JFSS2-like
> guarantees.
>
> However, UBIFS is sometimes used as a JFFS2 replacement and people may
> want it to behave the same way as JFFS2 if it is mounted synchronously.
> This is doable, but needs some non-trivial development, so this was not
> implemented so far. On the other hand, there was no strong demand. You
> may implement this as an excercise, or you may try to convince UBIFS
> authors to do this.

Hmmm, this style(there's hole at the end of file) can be accepted.

Thanks again,
Jisheng
