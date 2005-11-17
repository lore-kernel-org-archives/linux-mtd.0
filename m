Received: from zproxy.gmail.com ([64.233.162.206])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eco1i-0003jt-8D
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2005 12:58:30 -0500
Received: by zproxy.gmail.com with SMTP id m22so2017377nzf
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 Nov 2005 09:58:24 -0800 (PST)
Message-ID: <6934efce0511170958j9df6e3cu6329cf51088416f@mail.gmail.com>
Date: Thu, 17 Nov 2005 09:58:24 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: Bernhard Priewasser <priewasser@gmail.com>
In-Reply-To: <4379B814.3010407@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <4379B814.3010407@gmail.com>
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

On 11/15/05, Bernhard Priewasser <priewasser@gmail.com> wrote:
> Hi all,
>
> can anybody help me explaining this diagram of NOR read throughput?
>
>         http://files.lamark.de/nor_read.png
>
> As soon as a file, read from a StrataFlash containing only this file,
> exceeds erase block size (128KiB), file reading lasts a portion of time
> longer and read throughput stagnates...
>
> Write throughput seems to be constant around erase block size:
>
>         http://files.lamark.de/nor_write.png
>
> Best regards,
> Bernhard
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>


Could you please explain the experiment a little more?

How are you measuring read and write throughput?

Which StrataFlash are you using?  What board are you connecting the
flash to?  What kernel and MTD are you using?
