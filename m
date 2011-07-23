Received: from mail-fx0-f43.google.com ([209.85.161.43])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QklDZ-0000PD-Hv
	for linux-mtd@lists.infradead.org; Sat, 23 Jul 2011 23:02:46 +0000
Received: by fxg17 with SMTP id 17so5662961fxg.16
	for <linux-mtd@lists.infradead.org>;
	Sat, 23 Jul 2011 16:02:41 -0700 (PDT)
MIME-Version: 1.0
Sender: dsd.olpc@gmail.com
Date: Sun, 24 Jul 2011 00:02:40 +0100
Message-ID: <CAGq3pz7XqJvapBQyiAuwvKMZekmXC-Nc4UugUB5H4ApHZo8aDw@mail.gmail.com>
Subject: ubifs: missing FAQ item regarding default compression options?
From: Daniel Drake <dsd@laptop.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

OLPC is looking more seriously at making the switch from jffs2 to
ubifs. We did this for a few months but we found that ubifs has
significantly higher (10-15%) disk space requirements for the same
data, compared with jffs2. We switched back to jffs2 because of this,
promising to look at ubifs again later (i.e. now).

What I didn't realise clearly at the time is that mkfs.jffs2 defaults
to zlib compression, and mkfs.ubifs defaults to LZO compression. So,
this was not a fair test. If I switch ubifs to zlib compression, it
produces results very similar to jffs.

For example, for one OS image, mkfs.jffs2 + sumtool produced a 664mb
file. mkfs.ubifs (with zlib selected) + ubinize created a 668mb image
of the same data - very comparable.

Should this be a FAQ entry? Others who aren't aware of this difference
in default compression options may run into the same non-issue.

Thanks,
Daniel
