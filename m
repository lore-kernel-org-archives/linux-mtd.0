Received: from [209.178.208.101] (helo=lserver.ddiworldwide.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19RwgO-0000u2-Ob
	for <linux-mtd@lists.infradead.org>; Mon, 16 Jun 2003 17:18:12 +0100
Received: from 127.0.0.1 (lserver.ddiworldwide.com [127.0.0.1])
	by dummy.domain.name (Postfix) with SMTP id 9B6DF6D00AF
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 Jun 2003 12:14:45 -0400 (EDT)
Received: from plinux (plinux.ddiworldwide.com [192.168.1.128])
	by lserver.ddiworldwide.com (Postfix) with ESMTP id 830A56D00AE
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 Jun 2003 16:14:45 +0000 (UTC)
From: Frank R Callaghan <f.callaghan@ieee.org>
To: linux-mtd@lists.infradead.org
Date: Mon, 16 Jun 2003 12:06:06 -0400
References: <OOEOKBMECIFAEPIMFOGIMEPICBAA.sgluckman@omnitech.com>
	<200306140052.38541.tglx@linutronix.de>
	<200306131854.00636.f.callaghan@ieee.org>
In-Reply-To: <200306131854.00636.f.callaghan@ieee.org>
MIME-Version: 1.0
Message-Id: <200306161206.06488.f.callaghan@ieee.org>
Content-Type: text/plain;
  charset="iso-8859-15"
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

Hi All,

I methodically removed code from my usrland programs until I'm left with

int main()
{
    while(1) {
    //  sleep(1);
    }
}

With no RTAI modules loaded, the gc thread still stalls.
With the sleep(1) works fine !

Does this mean that the gc thread has such a low priority that it never r=
uns ?

I'm sorry if this is a stupid question, but it doesn't seem right that a =
mount
should suspend if a fg process is in a while loop !!!

What should I do/try next ?

TIA,
        Frank.
 =20

> attempting to mount the jffs2 filesystem stops. When I killed the two
> processes the mount resumed and all works perfectly (killing the proces=
ses
> forces the unload of the shared memory & forces the closing of the rtf'=
s)
> Starting them backup after mounting sees to work fine !
>
> I guess I can try to isolate it futher by not starting the
>  fifo's / shared memory,  unless anyone can suggest a better way to loc=
ate
> the problem.
>
