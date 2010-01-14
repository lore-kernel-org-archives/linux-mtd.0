Received: from mail-ew0-f223.google.com ([209.85.219.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NVXyb-0001bK-G5
	for linux-mtd@lists.infradead.org; Thu, 14 Jan 2010 22:15:42 +0000
Received: by ewy23 with SMTP id 23so43085ewy.4
	for <linux-mtd@lists.infradead.org>;
	Thu, 14 Jan 2010 14:15:34 -0800 (PST)
MIME-Version: 1.0
Sender: jonringle@gmail.com
Date: Thu, 14 Jan 2010 17:15:34 -0500
Message-ID: <152584231001141415x2086fed9rd8566b6609a87b7e@mail.gmail.com>
Subject: shrinking ubifs?
From: Jon Ringle <jon@ringle.org>
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

On ubi0, I have 3 volumes:
ubi0_0 kernel (static volume)
ubi0_1 squashfs (static volume)
ubi0_2 ubifs (dynamic volume)

When I create the volumes, the static volumes are created first and
then the ubifs volume is created with whatever LEBs are left over. I
am using the squashfs and ubifs in a aufs2 union fs. When I need to
reflash either of the static volumes for an upgrade, and the new
images don't fit the space available in the LEBs reserved in the
corresponding static volume, I remove the ubifs volume to create space
and then recreate the ubifs volume again with what is remaining. This
is sub-optimal as this means that and data on the ubifs is now lost.

Is there a way to shrink a UBIFS if there are unused LEBs in the UBIFS?

Thanks
Jon
