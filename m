Received: from rezznor.smb.utfors.se ([195.58.112.22])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17P1Kh-0002WG-00
	for <linux-mtd@lists.infradead.org>; Mon, 01 Jul 2002 14:35:11 +0100
Received: from LUMENTIS02 ([212.105.56.242]) by
          rezznor.smb.utfors.se (Netscape Messaging Server 4.15) with SMTP
          id GYKOEM00.4FJ for <linux-mtd@lists.infradead.org>; Mon, 1 Jul
          2002 15:35:10 +0200
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "MTD" <linux-mtd@lists.infradead.org>
Subject: FS corruption.
Date: Mon, 1 Jul 2002 15:35:09 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLEEAJFFAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Hi 

I just got a FS crash/corruption a one of our boards. I am running the stable jffs2 branch
from late April. Any idea's what caused this?

 Jocke 

> Setting Target eth0 IP address: a000108.
> NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
> LLC 2.0 by Procom, 1997, Arnaldo C. Melo, 2001
> NET4.0 IEEE 802.2 extended support
> NET4.0 IEEE 802.2 User Interface SAPs, Jay Schulist, 2001
> JFFS2: Total scan time: 5.97 sec
> Eep. Child "S40umountfs" (ino #245) of dir ino #13 doesn't exist!
> Eep. Child "telnet" (ino #568) of dir ino #65 doesn't exist!
> Eep. Child "ansi" (ino #765) of dir ino #78 doesn't exist!
> Eep. Child "ansis" (ino #804) of dir ino #78 doesn't exist!
> Eep. Child "ansi80x60-mono" (ino #778) of dir ino #78 doesn't exist!
> Eep. Child "ansi80x30" (ino #771) of dir ino #78 doesn't exist!
> Eep. Child "ansisysk" (ino #812) of dir ino #78 doesn't exist!
> Eep. Child "ACT" (ino #1206) of dir ino #91 doesn't exist!
> Eep. Child "Yancowinna" (ino #1215) of dir ino #91 doesn't exist!
> Eep. Child "etc" (ino #1594) of dir ino #1560 doesn't exist!
> Eep. Child "liblockfile.so.1.0" (ino #671) of dir ino #66 doesn't exist!
> Eep. Child "crt1.o" (ino #637) of dir ino #66 doesn't exist!
> Eep. Child "libe2p.so.2.3" (ino #622) of dir ino #66 doesn't exist!
> Eep. Child "libpopt.so.0.0.0" (ino #694) of dir ino #66 doesn't exist!
> Eep. Child "alib_swusd" (ino #1629) of dir ino #1561 doesn't exist!
> Eep. Child "date" (ino #175) of dir ino #2 doesn't exist!
> Eep. Child "domainname" (ino #163) of dir ino #2 doesn't exist!
> Eep. Child "vt52" (ino #881) of dir ino #80 doesn't exist!
> Eep. Child "vt125" (ino #840) of dir ino #80 doesn't exist!
> Eep. Child "vt200-old" (ino #847) of dir ino #80 doesn't exist!
> Eep. Child "vt100-vb" (ino #832) of dir ino #80 doesn't exist!
> Eep. Child "vt320-w-nam" (ino #867) of dir ino #80 doesn't exist!
> Eep. Child "Saskatchewan" (ino #1227) of dir ino #93 doesn't exist!
> Eep. Child "mtp_cm_bl_shell" (ino #490) of dir ino #55 doesn't exist!
> Eep. Child "fd" (ino #193) of dir ino #4 doesn't exist!
> Eep. Child "Greenwich" (ino #1270) of dir ino #95 doesn't exist!
> Eep. Child "installComplete" (ino #1759) of dir ino #1707 doesn't exist!
> Eep. Child "S10syslog" (ino #260) of dir ino #18 doesn't exist!
> Eep. Child "MT5634ZLX.dat" (ino #367) of dir ino #44 doesn't exist!
> Eep. Child "3CXEM556.dat" (ino #361) of dir ino #44 doesn't exist!
> Eep. Child "te_server" (ino #1736) of dir ino #1708 doesn't exist!
> Eep. Child "mtp_cm_bl" (ino #1715) of dir ino #1708 doesn't exist!
> Eep. Child "K30lumentis" (ino #264) of dir ino #19 doesn't exist!
> Eep. Child "snmpd.conf" (ino #384) of dir ino #45 doesn't exist!
> Eep. Child "Asuncion" (ino #977) of dir ino #84 doesn't exist!
> Eep. Child "Cayman" (ino #990) of dir ino #84 doesn't exist!
> Eep. Child "Inuvik" (ino #1015) of dir ino #84 doesn't exist!
> Eep. Child "motd" (ino #279) of dir ino #7 doesn't exist!
> Eep. Child "group" (ino #284) of dir ino #7 doesn't exist!
> Eep. Child "anacrontab" (ino #338) of dir ino #7 doesn't exist!
> Eep. Child "minicom.users" (ino #343) of dir ino #7 doesn't exist!
> Eep. Child "inetd.conf" (ino #348) of dir ino #7 doesn't exist!
> Eep. Child "nsswitch.conf" (ino #305) of dir ino #7 doesn't exist!
> Eep. Child "passwd" (ino #283) of dir ino #7 doesn't exist!
> Eep. Child "inetd.conf~" (ino #390) of dir ino #7 doesn't exist!
> Eep. Child "pam_env.conf" (ino #319) of dir ino #35 doesn't exist!
> Eep. Child "libctutils.so.0" (ino #403) of dir ino #48 doesn't exist!
> Eep. Child "halt" (ino #555) of dir ino #61 doesn't exist!
> Eep. Child "rarp" (ino #550) of dir ino #61 doesn't exist!
> Eep. Child "klogd" (ino #553) of dir ino #61 doesn't exist!
> Eep. Child "inetd" (ino #731) of dir ino #74 doesn't exist!
> Eep. Child "ifupdown" (ino #228) of dir ino #11 doesn't exist!
> Eep. Child "lumentis~" (ino #241) of dir ino #11 doesn't exist!
> Eep. Child "skeleton" (ino #222) of dir ino #11 doesn't exist!
> Eep. Child "checkfs.sh" (ino #209) of dir ino #11 doesn't exist!
> Eep. Child "devfsd" (ino #291) of dir ino #24 doesn't exist!
> Eep. Child "Dhaka" (ino #1183) of dir ino #89 doesn't exist!
> Eep. Child "Samarkand" (ino #1156) of dir ino #89 doesn't exist!
> Eep. Child "Novosibirsk" (ino #1148) of dir ino #89 doesn't exist!
> Eep. Child "linux-lat" (ino #762) of dir ino #77 doesn't exist!
> Eep. Child "Bermuda" (ino #1186) of dir ino #90 doesn't exist!
> Eep. Child "current" (ino #1548) of dir ino #1533 doesn't exist!
> Eep. Child "previous" (ino #1550) of dir ino #1533 doesn't exist!
> VFS: Mounted root (jffs2 filesystem).
> Freeing unused kernel memory: 52k init 4k openfirmware
> INIT: version 2.78 booting
> jffs2_read_inode() on nonexistent ino 305
> jffs2_read_inode() on nonexistent ino 283
> Fast boot, no file system check
> none on /dev/shm type shm (rw)
> ramfs on /tmp type ramfs (rw)
> ramfs on /var/run type ramfs (rw)
> ramfs on /tftpboot type ramfs (rw)
> jffs2_read_inode() on nonexistent ino 228
> Enabling packet forwarding: done.
> Configuring network interfaces: /sbin/ifup: interface lo already configured
> done.
> Cleaning: /tmp /var/lock /var/runjffs2_read_inode() on nonexistent ino 284
> grep: /etc/group: Input/output error
> .
> INIT: Entering runlevel: 2
> jffs2_read_inode() on nonexistent ino 553
> jffs2_read_inode() on nonexistent ino 731
> Starting Lumentis Main Script: /opt/appl/next is a link
> /opt/appl/tuappl01a-r1b-020627_1
> jffs2_read_inode() on nonexistent ino 1736
> Could not find path... Use /usr/local ....
> Starting lumentis UP daemons: te_server start-stop-daemon: stat
> /usr/local/bin/t
> e_server: No such file or directory
> te_log start-stop-daemon: stat /usr/local/bin/te_log: No such file or
> directory
> te start-stop-daemon: stat /usr/local/bin/te: No such file or directory
> ntpd start-stop-daemon: stat /usr/local/bin/ntpd: No such file or directory
> alib_psupd start-stop-daemon: stat /usr/local/bin/alib_psupd: No such file
> or di
> rectory
> icn_server start-stop-daemon: stat /usr/local/bin/icn_server: No such file
> or di
> rectory
> upc_upc_bl start-stop-daemon: stat /usr/local/bin/upc_upc_bl: No such file
> or di
> rectory
> tosv_server start-stop-daemon: stat /usr/local/bin/tosv_server: No such file
> or
> directory
> tosv_supervisor start-stop-daemon: stat /usr/local/bin/tosv_supervisor: No
> such
> file or directory
> swusd start-stop-daemon: stat /usr/local/bin/alib_swusd: No such file or
> directo
> ry
> .
> Done.
> 
> up1_8 login:
> 
> 
