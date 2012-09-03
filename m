Received: from mail-ie0-f177.google.com ([209.85.223.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8U9q-00024a-5M
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 10:45:31 +0000
Received: by ieje10 with SMTP id e10so3614736iej.36
 for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2012 03:45:29 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 3 Sep 2012 18:45:28 +0800
Message-ID: <CADqH6VzVhsGvCCbokjW8TAJSq5Sj33GiHt4gZxOFZaeHtJ4JeQ@mail.gmail.com>
Subject: Offtopic: ubifs and best practice for supporting browser based
 firmware upgrades
From: Jaya Kumar <jayakumar.lkml@gmail.com>
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

Hi mtd friends,

Sorry, I have a somewhat offtopic question. I'm using ubifs, and I'm
trying to figure out what would be a good way to handle browser based
firmware upgrades. I've implemented the following:

- NAND is partitioned into bootloader, kernel, ubifs
- system is running from ubifs
- httpd with CGI is running from ubifs
- user uploads firmware containing ubifs.img (150MB) using this CGI
- during the upload, the CGI writes the temporary file (up to 150MB)
to a fat partition on a empty microSD (a non-booting microSD has to be
always present for this to work)
- upon completion of the upload, the CGI unpacks the temporary file
and validates checksums, this of course needs more space since now
both the temporary file and unpacked results are present
- then reboot since we can't ubiformat/reflash from the running ubifs
partition and I can't detach from it for same reason.
- upon reboot, u-boot script checks for the presence of the ubifs.img
in the microSD fat partition, if it is there then it nand erases the
ubifs partition, then does nandwrite of the ubifs.img
- I realize this loses the erase counters since it is simplistic
- system boots and then removes the upgrade files so that it doesn't
repeat for each bootup

This seems clunky and I recognize that if the upgrade is interrupted,
the unit would be bricked. I was curious how other people implement
this and what the best practices are. I was thinking whether I should
have another partition for a small upgrade-only OS, so if u-boot
detects ubifs.img or a user button press, it boots into the
upgrade-only OS and then I can run ubiformat from there. I would
welcome any advice/suggestions.

Thanks,
jayakumar
