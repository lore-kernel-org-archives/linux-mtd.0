Received: from mail.artecdesign.ee ([62.65.32.9] helo=postikukk.artecdesign.ee)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HJ6Pm-0002wj-Vj
	for linux-mtd@lists.infradead.org; Mon, 19 Feb 2007 06:10:43 -0500
From: Indrek Kruusa <indrek.kruusa@artecdesign.ee>
To: Matthieu CASTET <matthieu.castet@parrot.fr>
Subject: Re: jffs2 Erase Block Summary overhead
Date: Mon, 19 Feb 2007 13:10:12 +0200
References: <45D47C92.8080908@parrot.fr>
In-Reply-To: <45D47C92.8080908@parrot.fr>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200702191310.12647.indrek.kruusa@artecdesign.ee>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=DChel kenal p=E4eval (neljap=E4ev 15 veebruar 2007 5:30 pm) kirjutas Matth=
ieu=20
CASTET:
> Hi,
>
> after doing some test on a 64MB nand flash, we see that only 50 MB can
> be stored on the filesystem [1]. The extra 10 MB are taken by jffs2
> summary. If we disable jffs2 sumary in the kernel, the 10MB become
> available.

This is interesting. I have a Puppy Linux build within 52MB (ps 512B/ebs 16=
KB)=20
and sumtool grows it to 57MB.
JFFS2/device with ps of 2048B/ebs 128KB has much much better compression le=
vel=20
and sum adds ca. 3-4% for this case.
You can play with "dry" mkfs.jffs2 and different page;block sizes/file=20
counts/file types to get the whole picture. Or read the code ;)
Somebody could put a nice summary table into FAQ with estimated results.

cheers,
Indrek



>
> Is there a way to reduce this overhead ?
> 20 % seems really big.
>
> May be Centralized Summary [3] give better result ?
> What is its status ?
>
> Matthieu
>
> [1]
> # time mount /dev/mtdblock3 -t jffs2 /tmp/mnt/ ; time cat
> /tmp/mnt/root/file.1 > /dev/null ; du -sh /tmp/mnt; df
> real    0m 3.05s
> user    0m 0.00s
> sys     0m 3.05s
> real    0m 0.34s
> user    0m 0.01s
> sys     0m 0.33s
> 50.6M   /tmp/mnt
> Filesystem                Size      Used Available Use% Mounted on
> /dev/mtdblock3           61.5M     60.7M    832.0k  99% /tmp/mnt
>
> [2]
> # time mount /dev/mtdblock3 -t jffs2 /tmp/mnt/ ; time cat
> /tmp/mnt/root/file.1 > /dev/null ; du -sh /tmp/mnt; df
> real    0m 11.30s
> user    0m 0.01s
> sys     0m 11.28s
> real    0m 0.35s
> user    0m 0.00s
> sys     0m 0.33s
> 50.6M   /tmp/mnt
> /dev/mtdblock3           61.5M     51.2M     10.3M  83% /tmp/mnt
>
> [3]
> http://www.inf.u-szeged.hu/jffs2/mount.php
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
