Received: from dsl-dt-207-34-112-i157-cgy.nucleus.com ([207.34.112.157] helo=mail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16hK3z-000564-00
	for <linux-mtd@lists.infradead.org>; Sun, 03 Mar 2002 00:41:19 +0000
Received: (from rayl@localhost)
	by mail.com (8.11.2/8.11.2) id g230qbX20469
	for linux-mtd@lists.infradead.org; Sat, 2 Mar 2002 17:52:37 -0700
Date: Sat, 2 Mar 2002 17:52:37 -0700
From: Ray Lehtiniemi <rayl@otii.com>
To: linux-mtd@lists.infradead.org
Subject: mkfs.jffs2 question
Message-ID: <20020302175237.C14453@otii.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

hi folks

two problems i notice with mkfs.jffs2:


first, the '-p' option seems to be parsed a little strangely:

  mkfs.jffs2                  ----> 712832 bytes
  mkfs.jffs2 -p               ----> 720896 bytes
  mkfs.jffs2 --pad            ----> 720896 bytes
  mkfs.jffs2 -p 0x800000      ----> 720896 bytes
  mkfs.jffs2 --pad=0x800000   ----> 8388608 bytes

shouldn't number 4 also result in an 8MB image?




second, if the very first dirent of the --root= argument is itself a dir, then
it is not put into the jffs2 image.  for example, if i have:

 /some/place/foo
 /some/place/usr/bin/
 /some/place/usr/sbin/

then:

  mkfs.jffs2 --root=/some/place -o some.img

will contain both /usr/bin and /usr/sbin, but

  mkfs.jffs2 --root=/some/place/usr -o some.img

will only contain /sbin (assuming it's the first dirent in usr)


i am looking at the code right now, but i was hoping the answer might jump out
at someone who already knows the code.



thanks

-- 
---------------------------------------------------------------------------
    Ray Lehtiniemi <rayl@mail.com> <rayl@otii.com>
