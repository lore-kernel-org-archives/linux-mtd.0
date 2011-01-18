Received: from www84.your-server.de ([213.133.104.84])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pf7Ul-0005Jm-SM
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2011 09:05:00 +0000
From: stefani@seibold.net
To: dedekind1@gmail.com, linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	Artem.Bityutskiy@nokia.com
Subject: [PATCH 0/2] v3: new tuneubifs command to adjust tunable filesystem
	parameters on ubifs
Date: Tue, 18 Jan 2011 10:04:23 +0100
Message-Id: <1295341465-2468-1-git-send-email-stefani@seibold.net>
Cc: Stefani Seibold <stefani@seibold.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Stefani Seibold <stefani@seibold.net>

ChangeLog:
31.12.2010 first proposal
18.01.2011 fixes suggested by Artem:
           - fix help message
	   - rename the tool into tuneubifs
	   - rename mkfs.ubifs" directory into "ubifs-utils"
	   - move the tool to ubifs-utils/tuneubifs
	   - code cleanup
18.01.2011 split the patch into a rename and a add patch

tuneubifs allows the system administrator to adjust various tunable filesystem
parameters on Linux ubifs filesystems. The current values of these parameters
can be displayed by using the -v or calling without any option.

Currently the tuneubifs supports the following parameters:

-x, --compr=<none|lzo|zlib>    compression type
-R, --reserved=SIZE            how much space should be reserved for super-user

Maybe it will be nice to adjust also the uid and gid of the reserved owner,
or the increase the max. size of the ubi filesystem. This will be very
simple to implement.

Signed-off-by: Stefani Seibold <stefani@seibold.net>
