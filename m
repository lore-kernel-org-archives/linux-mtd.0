From: btuch@usa.net (Brian T.)
Date: Tue, 11 Mar 2003 10:58:26 -0600
Subject: Unable to open console /start init
Message-ID: <003901c2e7ef$6ef75c60$150a0ac0@jbmsoft.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

I realize that this probably isn't a JFFS2 problem, but was hoping someone
here might be able to point me in the right direction to fix this.  I am
trying to get JFFS2 with 2.4.20 running on an embedded unit with an Intel
chipset. I have modified nettel.c, so the chipset is detected with the right
MTD partition sizes.  The system seems to be hanging on starting init, but
not before it cannot open the console.  Console on my 2.2.18 build always
came up on /dev/ttyS0.  The last messages I get on bootup is:

VFS: Mounted root (jffs2 filesystem) readonly.
Freeing unused kernel memory: 64k freed
Warning: unable to open an initial console.
trying /sbin/init

My console is console,c,5,1 and ttyS0 is ttyS0,c,4,64. I have tried making a
sym link from ttyS0 -> console with no luck either.

On boot the kernel sees the serial devices:

ttyS00 at 0x03f8 (irq = 4) is a 16550A   (dunno the extra 0 is in there, but
its right)
ttyS03 at 0x02e8 (irq = 3) is a 16550A

Also:

I modified main.c so I can tell how far it is getting with init:

--snip--
        if (execute_command)
        {
                 printk("Execute command passed: %s\n",execute_command);
                execve(execute_command,argv_init,envp_init);
        }
         printk("init: trying /sbin/init\n");
        execve("/sbin/init",argv_init,envp_init);
         printk("init: trying /etc/init\n");
        execve("/etc/init",argv_init,envp_init);
         printk("init: trying /bin/init\n");
        execve("/bin/init",argv_init,envp_init);
         printk("init: trying /bin/sh\n");
        execve("/bin/sh",argv_init,envp_init);
        panic("No init found.  Try passing init= option to kernel.");
--snip--

If I remove /sbin/init then it prints out the other 3 messages as well that
I added in, but then it still hangs.  the init is part of Busybox, but have
tried using a standard /sbin/init also, with the same results.

Has anyone else ever had these problems?

-Brian
