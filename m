Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RAeGc-00027t-3w
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2011 08:52:54 +0000
Received: by wyi11 with SMTP id 11so3723059wyi.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 03 Oct 2011 01:52:49 -0700 (PDT)
Message-ID: <4E8977DF.1030808@gmail.com>
Date: Mon, 03 Oct 2011 10:52:47 +0200
From: angelo <angelo70@gmail.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: erase block < 8KiB
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

i read several mail about this limitation.

http://lists.infradead.org/pipermail/linux-mtd/2011-February/033851.html
http://lists.infradead.org/pipermail/linux-mtd/2011-June/036498.html


I have a 4 KiB erase-size, common of some SST nor flash'es like mine 
(SST 39VF3201B).

 From all the posts i read here in the list, there seems not to be any 
solution guaranteed.

The tricky change to mkfs.jffs2 don't work for me. It seems to work for 
small files, but i still get error messages copying a 600KB file in the 
partition.
If it's true that the minimal jffs2 block is 4KB + some bytes, of course 
the patch to mkfs.jffs2 can't work.

Some one suggested the "virtual erase block" solution. I would like to 
try to implement it, if i have the time.

In any case, for the common users, is there maybe another flash file 
system that can work with 4KiB erase size ?

Many thanks,
Regards

Angelo Dureghello
