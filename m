Received: from mail-px0-f183.google.com ([209.85.216.183])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MPMHc-0003fB-Ep
	for linux-mtd@lists.infradead.org; Fri, 10 Jul 2009 20:01:31 +0000
Received: by pxi13 with SMTP id 13so839185pxi.28
	for <linux-mtd@lists.infradead.org>;
	Fri, 10 Jul 2009 13:01:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <SNT121-W16B0221E87C4D7934D7910B2270@phx.gbl>
References: <SNT121-W16B0221E87C4D7934D7910B2270@phx.gbl>
Date: Fri, 10 Jul 2009 22:01:22 +0200
Message-ID: <71cd59b00907101301k7ae5a2b2j8b05d31eef1ae1fe@mail.gmail.com>
Subject: Re: UBIFS Question
From: Corentin Chary <corentin.chary@gmail.com>
To: "Laurent ." <sid6582@msn.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, artem.bityutski@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 10, 2009 at 8:43 PM, Laurent .<sid6582@msn.com> wrote:
>
> In /mnt/alphaflight I generate a small new.txt file with vi, which contai=
ns a few lines of characters.
> After saving, I immediately power-off brutally.
> I power-on again, mount, and the new.txt file is not there...
>
> I recreate the file, I wait 20 seconds or so and power-off brutally.
>
> I power-on again, mount and now I have:
>
> -rw-r--r-- =A0 =A01 1000 =A0 =A0 1000 =A0 =A0 =A0 =A0 =A0397 Dec 31 =A020=
02 indexOnline.html
> -rw-r--r-- =A0 =A01 root =A0 =A0 root =A0 =A0 =A0 =A0 =A0 =A00 Jan =A01 0=
0:00 new.txt
> -rw-r--r-- =A0 =A01 1000 =A0 =A0 1000 =A0 =A0 =A0 =A0 =A0104 Dec 31 =A020=
02 obfuscAFL.bat
>
> Size 0 ... I can understand that since I did not have time to sync.
>
> It=92s funny though that the file is present in the directory but the con=
tents are not there ?
>
> If I do this programmatically, I presume I can force a sync after I close=
 the file ?
> Is it safe to do so ? Would you know the C API to use to do a sync progra=
mmatically ?
>

Hi,
I think you should read
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_empty_file
An use fsync() on your file.
Quotting "close(2) manual"

       A  successful close does not guarantee that the data has been
successfully
       saved to disk, as the kernel defers writes.  It is not common
for a file system to flush the buffers
       when the stream is closed.  If you need to be sure that the
data is physically stored use fsync(2).
       (It will depend on the disk hardware at this point.)

--=20
Corentin Chary
http://xf.iksaif.net - http://uffs.org
