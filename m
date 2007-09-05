Received: from www.tier1design.com ([68.16.98.218]
	helo=tieroneserver.tier1design.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1ISweW-0001m8-C3
	for linux-mtd@lists.infradead.org; Wed, 05 Sep 2007 11:18:51 -0400
Content-class: urn:content-classes:message
Subject: RE: ramfs or ramdisk
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 5 Sep 2007 11:06:24 -0400
Message-ID: <3547473BFF99D74F875EEE3E38BCDDFF23A5F0@tieroneserver.tier1design.com>
From: "Michael Langford" <mlangford@tieronedesign.com>
To: "Saravanan Chanemouganandam" <schane@osmozis.com>,
	<linux-arm@lists.arm.linux.org.uk>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

-----Original Message-----
Subject: ramfs or ramdisk

I would like to know which rootfs files system is best for the embedded=20
systems, ramfs rootfs or ramdisk rootfs ?Can anyone point me interms of=20
memory advantage.

Thanks
Sara

---------------------------

Timesys has a website(https://linuxlink.timesys.com/docs/initramfs) and
podcast talking about the differences at their website. I believe the
pertinent discussions of the different filesystems and the boot time
tradeoffs are in the following episodes:

http://www.timesys.com/podcasts/mp3/Episode_011_LinuxLink_Radio.mp3
http://www.timesys.com/podcasts/mp3/Episode_012_LinuxLink_Radio.mp3

     --Michael

PS: I have no affiliation with them, just listen to their podcast.
