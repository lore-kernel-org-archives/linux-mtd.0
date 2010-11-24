Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PLGMr-0004KK-Uw
	for linux-mtd@lists.infradead.org; Wed, 24 Nov 2010 14:30:42 +0000
Received: by iwn8 with SMTP id 8so10943391iwn.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Nov 2010 06:30:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1290607959.2793.11.camel@localhost>
References: <AANLkTimwumfui-_T1ScDYwMLKbNh1ia-SDMUg56wTfN5@mail.gmail.com>
	<4CD11C03.3090207@parrot.com>
	<AANLkTimfxjrtV4eks5tK68h6TQ20soib+6gaTC+QyB4a@mail.gmail.com>
	<AANLkTinSj2vAJJjeSxF-rvq08OVsnw3YcpRSpuOfv9pQ@mail.gmail.com>
	<AANLkTikQtNwsPkJSkmpmC=kMZpmdqHDW0HROeUBNDOEi@mail.gmail.com>
	<1289646433.2218.22.camel@localhost>
	<1289649338.2218.42.camel@localhost>
	<AANLkTink+0WvCmQWwd4+Vf8TETjR5-6BsGU=a071Rk0+@mail.gmail.com>
	<AANLkTim7TT8ydMiSX8B2ehJP2kQ6jtGSnEZU98AZjWUf@mail.gmail.com>
	<AANLkTimHCBNCcc3suXv4kJ4+MXUSf5Tw2r876A7tqtoL@mail.gmail.com>
	<AANLkTinzqwsEFoG+Z0S0ep7JN3p4jHugkHhN-J19Y3cn@mail.gmail.com>
	<1290607959.2793.11.camel@localhost>
Date: Wed, 24 Nov 2010 15:30:39 +0100
Message-ID: <AANLkTinTpe=niqS87JRR4h53TJ803ohs3e2MwiVFstgR@mail.gmail.com>
Subject: Re: Suggested patch: reset errno after isatty()
From: Ketil Froyn <ketil@froyn.name>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 24, 2010 at 3:12 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>
> So it dies very soon. You should easily find the line of code where this
> happens with gdb. Just compile nanddump with -g -O0

It's just that I have limited tools on my device where this happens.
But I've finally pinned it!

There's a couple of issues, I guess. Firstly, calling mtd_read_oob()
with an oob_size of 0 segfaults, which I guess it shouldn't. I haven't
looked into that. The problem here was that the oob_size was set to 0,
and that happens because the legacy code forgot to set it. This patch
fixes it for me:

diff --git a/lib/libmtd_legacy.c b/lib/libmtd_legacy.c
index 7488275..d6c3938 100644
--- a/lib/libmtd_legacy.c
+++ b/lib/libmtd_legacy.c
@@ -261,6 +261,7 @@ int legacy_get_dev_info(const char *node, struct
mtd_dev_info *mtd)
        mtd->size = ui.size;
        mtd->eb_size = ui.erasesize;
        mtd->min_io_size = ui.writesize;
+       mtd->oob_size = ui.oobsize;

        if (mtd->min_io_size <= 0) {
                errmsg("mtd%d (%s) has insane min. I/O unit size %d",


Cheers, Ketil
