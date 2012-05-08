Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SRkDx-0002uU-FL
 for linux-mtd@lists.infradead.org; Tue, 08 May 2012 13:13:06 +0000
Received: by laap9 with SMTP id p9so1751436laa.36
 for <linux-mtd@lists.infradead.org>; Tue, 08 May 2012 06:13:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADZ6=asqEUUe3zbZY+NE-Ew2e4Cymfnq+UqgmF2VHesBek3-XQ@mail.gmail.com>
References: <CADZ6=asqEUUe3zbZY+NE-Ew2e4Cymfnq+UqgmF2VHesBek3-XQ@mail.gmail.com>
Date: Tue, 8 May 2012 15:13:02 +0200
Message-ID: <CADZ6=as0KQwGmvLJdy1P3fx=hjkJrMJf+Mqud+PMSiEyVjjbQg@mail.gmail.com>
Subject: Re: Why kernel tasks for each MTD partition?
From: Thilo Fromm <fromm@dresearch-fe.de>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello me,

just in case anyone else is ever riddled about this (like I was);
here's what I found out.

> while playing around with mtdblock and blockrom (see my other mail[1])
> I noticed that a separate kernel process is active for each "mtdblock"
> partition (e.g. ps shows "[mtdblock0]", "[mtdblock1]" kernel processes
> if you have two MTD partitions and you use mtdblock). These also exist
> for my blockrom device nodes. Since I see comparable processes for all
> storage on my Linux workstation I suppose the Linux storage stack runs
> these. Can somebody please fill me in on what they are?

It turns out the generic mtd block device subsystem starts one kernel
process for each mtd block device added. Each kernel process is an
endpoint for the corresponding mtd block device's I/O queue. The
kernel process will call the mtd block device readsect / writesect
implementation on incoming requests.

The process is implemented in drivers/mtd/mtd_blkdevs.c; the function
is "static int mtd_blktrans_thread(void *arg)". It is started directly
by add_mtd_blktrans_dev().

> Also, more importantly, I notice accesses on all my device nodes (the
> "blockrom" ones) upon system start originating from the corresponding
> kernel process. However, the "mtdblock" nodes are not touched by their
> kernel processes. How come?

This is UDEV doing some generic block dev initialisation. udev already
has default rules for mtd* (amongst lots of other things), so MTD
devices are not handled like other persistent storage devices
(actually they're just skipped for udev). The corresponding udev rules
file is "rules/60-persistent-storage.rules" and is part of the udev
sources (see e.g.
<http://git.kernel.org/?p=3Dlinux/hotplug/udev.git;a=3Dblob;f=3Drules/60-pe=
rsistent-storage.rules;h=3Db74821edd4764d4a353b67f5365b9c783b32c5c4;hb=3DHE=
AD>).

The mtd* exception does of course not cover my newly introduced
blockrom* device nodes. However, changing the corresponding line in
60-persistent-storage.rules

-KERNEL=3D=3D"fd*|mtd*|nbd*|gnbd*|btibm*|dm-*|md*", GOTO=3D"persistent_stor=
age_end"
+KERNEL=3D=3D"fd*|blockrom*|mtd*|nbd*|gnbd*|btibm*|dm-*|md*",
GOTO=3D"persistent_storage_end"

does the trick.

Regards,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228 =C2=A0 mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle
