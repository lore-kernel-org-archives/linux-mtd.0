Received: from zproxy.gmail.com ([64.233.162.196])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ElpkE-0000q3-7A
	for linux-mtd@lists.infradead.org; Mon, 12 Dec 2005 10:37:44 -0500
Received: by zproxy.gmail.com with SMTP id i11so1474455nzi
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Dec 2005 07:37:40 -0800 (PST)
Message-ID: <625fc13d0512120737w40d2ecf9o5c5145b119a93927@mail.gmail.com>
Date: Mon, 12 Dec 2005 09:37:40 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: Bernhard Priewasser <priewasser@gmail.com>
In-Reply-To: <439D8BAD.3000105@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <438C7B0C.5040001@gmail.com> <438C94BD.8020300@inf.u-szeged.hu>
	<438C98EA.70105@gmail.com> <439D8BAD.3000105@gmail.com>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: NAND write buffering
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/12/05, Bernhard Priewasser <priewasser@gmail.com> wrote:
>
> When is NAND wbuf flushed?
> sync()

Yes.

> fsync()

Yes.

> fflush()?

Not necessarily.  From the fflush man page:

"Note that fflush() only flushes the user space buffers provided by
the C library.  To ensure that the data is physically stored on disk
the kernel buffers must be flushed too, e.g. with sync(2) or
fsync(2)."

> fclose()?

Not necessarily.  See the man page in the NOTES section.  It says the
same as fflush.

josh
