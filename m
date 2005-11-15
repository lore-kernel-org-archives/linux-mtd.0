Received: from zproxy.gmail.com ([64.233.162.205])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ec15V-0004ZP-Jo
	for linux-mtd@lists.infradead.org; Tue, 15 Nov 2005 08:43:11 -0500
Received: by zproxy.gmail.com with SMTP id i11so1595487nzi
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Nov 2005 05:43:02 -0800 (PST)
Message-ID: <625fc13d0511150543y34f0841bj5eef02d96a9c20a1@mail.gmail.com>
Date: Tue, 15 Nov 2005 07:43:02 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: Achin Gupta <achin.gupta@conexant.com>
In-Reply-To: <4D6E93075B31154298572E6B73CA849D02DBC3A5@noida-mail.bbnet.ad>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <4D6E93075B31154298572E6B73CA849D02DBC3A5@noida-mail.bbnet.ad>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: MTD build broken
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/15/05, Achin Gupta <achin.gupta@conexant.com> wrote:
> Hi,
> I am trying to add support for an Intel NOR Flash device on an ARM
> 1026-EJS platform. As mentioned in the "mtd-jffs-HOWTO.txt" I checked
> out the latest code from CVS. However, the build breaks while trying to
> compile the file "fs/jffs2/background.c" as follows :-
>
> >>>>>
> fs/jffs2/background.c:95:22: macro "try_to_freeze" passed 1 arguments,
> but takes just 0
> fs/jffs2/background.c: In function `jffs2_garbage_collect_thread':
> fs/jffs2/background.c:95: warning: the address of `try_to_freeze', will
> always evaluate as `true'
> make[2]: *** [fs/jffs2/background.o] Error 1
> make[1]: *** [fs/jffs2] Error 2
> make: *** [fs] Error 2
> >>>>>
>
> After diffing "background.c" with a previous version I found that the
> problem lies in a call to "try_to_freeze". While it was
> "try_to_freeze(0)" earlier, its become "try_to_freeze()" now.
> I suppose this is a typo. If so kindly fix it at the earliest.

What version do you have and what version did you diff against?  The
latest MTD CVS does not have this problem.  How did you do your
checkout?

Version 1.59 of background.c has this at line 99:

if (try_to_freeze())
        continue;

josh
