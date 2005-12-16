Received: from zproxy.gmail.com ([64.233.162.197])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EnIZw-0007cD-TP
	for linux-mtd@lists.infradead.org; Fri, 16 Dec 2005 11:37:10 -0500
Received: by zproxy.gmail.com with SMTP id i11so730472nzi
	for <linux-mtd@lists.infradead.org>;
	Fri, 16 Dec 2005 08:37:07 -0800 (PST)
Message-ID: <29f916510512160836q21a0b585h9894990b0fc0d7f3@mail.gmail.com>
Date: Sat, 17 Dec 2005 00:36:53 +0800
From: alfred hitch <alfred.hitch@gmail.com>
To: Peter Menzebach <pm-mtd@mw-itcon.de>
In-Reply-To: <43A2849E.8000907@mw-itcon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <43A1418F.3060701@imc-berlin.de>
	<20051215102607.GA20431@angel.research.nokia.com>
	<43A1609C.80705@imc-berlin.de> <43A166C6.5060803@mw-itcon.de>
	<29f916510512151816v59b1f584h346a415b3888728@mail.gmail.com>
	<43A2849E.8000907@mw-itcon.de>
Cc: Steven Scholz <steven.scholz@imc-berlin.de>, linux-mtd@lists.infradead.org
Subject: Re: Do I have to umount JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Peter,

We happened to have our system in rw mode (dont ask me why,I will be
embarassed).
Now, we have made it ro.
Files in question happened to be "sh"  or libc.so. etc.. basically one
which appeared to be in memory at that time before kernel oops or
sudden resets etc. So, to answer your question, yes they were from
start there. After making ro as ofnow we havent seen any corruptions.
But, my head has been looking for a reason as to why would it be
executables be ever written back to flash ??

Well jffs2 version we are using happened to be from snapgear 3.0 from
net. so I am kinda biased and hoping we arent with a such a broken
one.
(How to update to latest btw ? 2.4 backwards compatible ?)

Didnt get this comment of ur's :
1. Single files can be still corrupted, when you write them and press reset=
.

Regards,
Alfred

On 12/16/05, Peter Menzebach <pm-mtd@mw-itcon.de> wrote:
> alfred hitch wrote:
> > Hi Steven, Peter,
> >
> > I would like to put in some problems we are also facing. I had
> > reported it sometime back here also.
> >
> > On our system, we are observing that files on flash (jffs2 intel cfi na=
nd)
> > are getting corrupted, after  a number of resets and say 3 months of us=
age)
> >
> > Anyone seen anything like this ? any clues on how one can look into thi=
s.
> >
>
> Hi Alfred,
> I have had no non recoverable error here up to now, but I am not
> representative, since I do not need many permanent writes: I have all
> permanently changeable informations like configuration files in one rw
> partition, and all temporary information like log, lock, pidfiles... in
> the ramdisk. My rootfs stays ro. In my case, I can simply erase the
> "config-partition", and the board definitely is clean.
>
> I have 2 ideas to your problems:
> 1. Single files can be still corrupted, when you write them and press res=
et.
> 2. Your jffs2 version is from a let's say "not so good time"
>
> What I do not understand (from one of your previous posts): You said, a
> command file was damaged. Was this file written at generation time of
> the fs, and then not written any more?
>
> Best regards
> Peter
>
> --
> Peter Menzebach
> Menzebach und Wolff IT-Consulting GbR
> Phone +49 751 355 387 1
>
