Received: from [67.15.60.3] (helo=mail.aftek.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E65nR-0006z8-JM
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2005 08:16:38 -0400
Message-ID: <430675EB.9030905@aftek.com>
Date: Sat, 20 Aug 2005 05:44:35 +0530
From: Ashwin Chaugule <ashwinc@aftek.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: is this a bug ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 Hi,
      Im using 2.4.19-rmk7-pxa1, on a pxa255. Recently I mounted jffs2 
as rootfs. While doing this the conventional way, I found that
it was being mounted readonly. Since I'm using M28W640 (ST flash) which 
needs to be unlocked upon every reboot, I thought the readonly
was because of this locking thing. So, I integrated the flash_unlock 
code into the mtd subsystem, but I still got the readonly mount.
After digging into init/do_mounts.c , I found  root_mountflags was by 
default readonly, and is sent to mount_block_root("/dev/root", 
root_mountflags);  only to be later reassigned somewhere in fs/super.c ! 
(s->s_flags = flags;)

The following addition to do_mounts.c , did the trick.

+ root_mountflags &= ~MS_RDONLY;
   mount_block_root("/dev/root", root_mountflags);

Now jffs2 mounts nice and clean, with readwrite !

I know you guys have dropped support for 2.4.x, but just for 
clarification, might even help several others struggling to get jffs2 
working as rootfs :)

Cheers,
Ashwin Chaugule
Embedded Systems Engineer
Aftek Infosys Ltd.
[Embedded Division]
