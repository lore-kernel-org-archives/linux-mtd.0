Received: from zproxy.gmail.com ([64.233.162.201])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eif3K-00089e-2c
	for linux-mtd@lists.infradead.org; Sat, 03 Dec 2005 16:36:21 -0500
Received: by zproxy.gmail.com with SMTP id m22so732850nzf
	for <linux-mtd@lists.infradead.org>;
	Sat, 03 Dec 2005 13:36:12 -0800 (PST)
Message-ID: <6934efce0512031336p292fd27fjbfbf6fbabd750023@mail.gmail.com>
Date: Sat, 3 Dec 2005 13:36:12 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: Bernhard Priewasser <priewasser@gmail.com>
In-Reply-To: <4382EF68.3010204@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <4379B814.3010407@gmail.com>
	<6934efce0511170958j9df6e3cu6329cf51088416f@mail.gmail.com>
	<437D9F6F.80102@gmail.com>
	<6934efce0511211418s5317b7a6tee5b391e28eb8491@mail.gmail.com>
	<4382EF68.3010204@gmail.com>
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

On 11/22/05, Bernhard Priewasser <priewasser@gmail.com> wrote:
> > What about the read test.
>
> As simple as you can imagine. Write a file (fopen, fwrite, fclose), wait
> some time, read the file (fopen, fread, fclose).
> Do you think there are caching mechanism responsible for it?
>
> --
> Bernhard
>

Sorry for the long wait.

Yes, It sure looks like a caching effect.  What is happening at
128KiBs?  Let me ask around a little more.  This is an arm7 processor,
no L1 or L2 caches?
