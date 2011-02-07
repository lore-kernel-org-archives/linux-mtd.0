Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PmObK-00070a-Nr
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2011 10:45:47 +0000
Received: by iwn38 with SMTP id 38so4556272iwn.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Feb 2011 02:45:45 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 7 Feb 2011 11:45:45 +0100
Message-ID: <AANLkTimN9FYBGz3ufBxGnaWKpkdt7KY8ZvNSKzAHB59i@mail.gmail.com>
Subject: JFFS2: bug in mkfs.jffs2 recursive_populate_directory
From: Arno Steffen <arno.steffen@googlemail.com>
To: linux-mtd@lists.infradead.org, dedekind1 <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I found another bug in mkfs.jffs2 (in recent 1.4.2) version.
Generate a jffs2 file with -v (Verbose) option ends up with a
segmentation fault, caused by the prints.
I am not 100% sure, but it seems to be connected with another bug I
reported alredy. In my case, the segfault dissapear, if owner of root
( -r /opt/rootfs_build/opt/configs) is switched from user to root.
