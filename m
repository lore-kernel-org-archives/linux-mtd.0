Received: from 64-1-201-226.daf.concentric.net
	([64.1.201.226] helo=firegate.datalight.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16qGit-0001rW-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Mar 2002 16:56:31 +0000
Received: from rsherrillmob ([10.0.1.39])
	by firegate.datalight.com (8.8.5/8.8.7) with SMTP id IAA07874
	for <linux-mtd@lists.infradead.org>; Wed, 27 Mar 2002 08:56:24 -0800
Reply-To: <roy.sherrill@datalight.com>
From: "Roy Sherrill" <roy.sherrill@datalight.com>
To: <linux-mtd@lists.infradead.org>
Subject: unsubscribe
Date: Wed, 27 Mar 2002 09:00:27 -0800
Message-ID: <NDBBIEELOLFJFIKOHGAAEEDOCDAA.roy.sherrill@datalight.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit
In-Reply-To: <IGEFJKJNHJDCBKALBJLLIELJFCAA.joakim.tjernlund@lumentis.se>
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


-----Original Message-----
From: linux-mtd-admin@lists.infradead.org
[mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Joakim
Tjernlund
Sent: Wednesday, March 27, 2002 2:47 AM
To: linux-mtd@lists.infradead.org
Subject: Unable to recover from CRC failiure


Hi

I got the following on one of our nodes:
-------------- Start log --------------
<snip>
JFFS2: Total scan time: 11.41 sec
Eep. Child "utmp" (ino #1853) of dir ino #130 doesn't exist!
VFS: Mounted root (jffs2 filesystem).
Freeing unused kernel memory: 52k init 4k openfirmware
jffs2_read_inode() on nonexistent ino 1853
INIT: version 2.78 booting
Fast boot, no file system check
none on /dev/shm type shm (rw)
Cleaning: /etc/network/ifstate.
Enabling packet forwarding: done.
Configuring network interfaces: done.
Cleaning: /tmp /var/lock /var/runfind: ./utmp: Input/output error
/etc/init.d/rcS: /var/run/utmp: Input/output error
Give root password for maintenance
(or type Control-D for normal startup):
bash-2.04# cd /var/run
bash-2.04# ls
exim  utmp
bash-2.04# ls -l
ls: utmp: Input/output error
total 0
drwxr-xr-x    1 root     root            0 May 24  2001 exim
bash-2.04# rm utmp
rm: cannot remove `utmp': Input/output error
bash-2.04# rm -f utmp
rm: cannot remove `utmp': Input/output error
bash-2.04# ls
exim  utmp
bash-2.04# ls -l
ls: utmp: Input/output error
total 0
drwxr-xr-x    1 root     root            0 May 24  2001 exim
bash-2.04# cd ..
bash-2.04# pwd
/var
bash-2.04# ls
cache  lib  local  lock  log  mail  opt  run  spool  tmp  ucd-snmp
bash-2.04# ls run
exim  utmp
bash-2.04# mv run slask
mv: cannot stat `run/utmp': Input/output error
bash-2.04# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/root                63744     44996     18748  71% /
bash-2.04#
-------------- End log -------------

I have no problem with getting a bad CRC on the JFFS2 FS at times, but that
I am unable to get rid of
the offending file(utmp).

I am using the latest stable 2.4 branch.

Any ideas?

           Jocke



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
