Received: from [209.178.208.101] (helo=lserver.ddiworldwide.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19RynK-0001UP-76
	for <linux-mtd@lists.infradead.org>; Mon, 16 Jun 2003 19:33:30 +0100
Received: from 127.0.0.1 (lserver.ddiworldwide.com [127.0.0.1])
	by dummy.domain.name (Postfix) with SMTP id E22F16D00AF
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 Jun 2003 14:30:03 -0400 (EDT)
Received: from plinux (plinux.ddiworldwide.com [192.168.1.128])
	by lserver.ddiworldwide.com (Postfix) with ESMTP id C09566D00AE
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 Jun 2003 18:30:03 +0000 (UTC)
From: Frank R Callaghan <f.callaghan@ieee.org>
To: linux-mtd@lists.infradead.org
Date: Mon, 16 Jun 2003 14:21:23 -0400
References: <OOEOKBMECIFAEPIMFOGIMEPICBAA.sgluckman@omnitech.com>
	<200306161206.06488.f.callaghan@ieee.org>
	<1055780708.2233.18.camel@passion.cambridge.redhat.com>
In-Reply-To: <1055780708.2233.18.camel@passion.cambridge.redhat.com>
MIME-Version: 1.0
Message-Id: <200306161421.23307.f.callaghan@ieee.org>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Re: Please Help, problem mounting jffs2
Reply-To: f.callaghan@ieee.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Monday 16 June 2003 12:25 pm, David Woodhouse wrote:
> On Mon, 2003-06-16 at 17:06, Frank R Callaghan wrote:
> > Hi All,
> >
> > I methodically removed code from my usrland programs until I'm left w=
ith
> >
> > int main()
> > {
> >     while(1) {
> >     //  sleep(1);
> >     }
> > }
> >
> > With no RTAI modules loaded, the gc thread still stalls.
> > With the sleep(1) works fine !
> >
> > Does this mean that the gc thread has such a low priority that it nev=
er
> > runs ?
>
> No, it looks like your userspace program has such a _high_ priority
> that the GC thread never runs. A subtle difference :)
>

I have reniced the test program to +20 but the mount is still hung !

> > What should I do/try next ?
>
> This is an RTAI-specific issue. I suspect your test program above has
> its priority set such that when it's eating 100% CPU time in a tight
> loop, nothing else gets to run. Have you asked on the RTAI mailing
> lists?

yes - no response yet !

I'm not sure how rtai can be interfering if there are no-rtai modules
loaded - unless the kernel patches messed something up !
