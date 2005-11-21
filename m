Received: from zproxy.gmail.com ([64.233.162.203])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EeJzv-0002um-G5
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2005 17:18:53 -0500
Received: by zproxy.gmail.com with SMTP id m22so829042nzf
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Nov 2005 14:18:35 -0800 (PST)
Message-ID: <6934efce0511211418s5317b7a6tee5b391e28eb8491@mail.gmail.com>
Date: Mon, 21 Nov 2005 14:18:35 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: Bernhard Priewasser <priewasser@gmail.com>
In-Reply-To: <437D9F6F.80102@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <4379B814.3010407@gmail.com>
	<6934efce0511170958j9df6e3cu6329cf51088416f@mail.gmail.com>
	<437D9F6F.80102@gmail.com>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Strange NOR read/write throughput behaviour
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/18/05, Bernhard Priewasser <priewasser@gmail.com> wrote:
>  > Could you please explain the experiment a little more?
> Sure!
>
>  > How are you measuring read and write throughput?
> C-Program, gettimeofday(). Very clean conditions: Empty flash, mount
> JFFS2, fopen one file. Measure duration of fwrite(filesize). Throughput
> =3D 1/duration.
>
>  > Which StrataFlash are you using?
> E28F128J3, 128 Mbit. 128KiB erase block size.
>
>  > What board are you connecting the flash to?
> Hynix HMS30C7202 evaluation board.
>
>  > What kernel and MTD are you using?
> Kernel 2.6.11-hnx3
> MTD/JFFS2 of kernel 2.6.11. (I know, I should try newest CVS...)
>
> --
> Bernhard
>


What about the read test.
