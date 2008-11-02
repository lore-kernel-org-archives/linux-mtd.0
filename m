Received: from smtp8.server.rpi.edu ([128.113.2.228])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KwhaJ-0007rE-Cm
	for linux-mtd@lists.infradead.org; Sun, 02 Nov 2008 18:22:00 +0000
Received: from RPI02.localdomain (voiceflight.inc.rpi.edu [128.113.36.139])
	by smtp8.server.rpi.edu (8.13.1/8.13.1) with SMTP id mA2ILtpG002109
	for <linux-mtd@lists.infradead.org>; Sun, 2 Nov 2008 13:21:55 -0500
Date: Sun, 2 Nov 2008 14:23:15 -0500
From: "J. Scott Merritt" <merrij3@rpi.edu>
To: linux-mtd@lists.infradead.org
Subject: ubinize corrections
Message-Id: <20081102142315.453628de.merrij3@rpi.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear list,

I believe that I have stumbled upon two problems with the latest version
of ubinize.c in mtd-utils - one serious, and one not so serious.

- First, the easy one: At line 457, I believe that we should be printing
args.subpage_size rather than ui.min_io_size.

- More seriously, I believe that the "flags" field in the ubigen_vol_info
structures is not being properly initialized.  Line 494 allocates memory
for these structures with malloc, so they are not cleared to zero.  The
read_section function updates the flag field if the AUTO-RESIZE flag is
specified, but does not otherwise initialize or clear it.

I reckon the latter problem could be repaired either with calloc, or by
modifying read_section to more directly set/clear the flag.

Thanks, Scott.
