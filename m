Received: from wx-out-0506.google.com ([66.249.82.235])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I3r5k-0003Ot-C3
	for linux-mtd@lists.infradead.org; Thu, 28 Jun 2007 06:19:15 -0400
Received: by wx-out-0506.google.com with SMTP id s7so132585wxc
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Jun 2007 03:19:11 -0700 (PDT)
Message-ID: <38b44d590706280319y35bc00c0ree32d6e99b7918f5@mail.gmail.com>
Date: Thu, 28 Jun 2007 15:49:11 +0530
From: "Saiful Khan" <saiful.etc@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: fsload taking more time
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have booted kernel image from the jffs2 file system.
The kernel image "uImage" is located in /boot directoy of jffs2 file
system, to load uImage form /boot to RAM location 0=D7400000, "fsload
0=D7400000 boot/uImage" command is used. Then this kernel image is
booted from 0=D7400000 using " bootm 0=D7400000" command

But there is a issue that it is taking 5-6 sec (approx) more while
doing fsload, comapred to loading uImage from raw flash location and
booting it. Can anyone suggest me what to do to solve this isuue??

thanks and regards
Saiful
