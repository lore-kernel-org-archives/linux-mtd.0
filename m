Received: from mail.harmonicdata.com ([192.117.154.198])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Sfz7-00062x-00
	for <linux-mtd@lists.infradead.org>; Mon, 21 Jan 2002 15:03:45 +0000
Received: from wintermute (paolo@Jlm-154-119.access.net.il [192.117.154.119] (may be forged))
	by mail.harmonicdata.com (8.11.0/8.11.0) with SMTP id g0LFFPH04817
	for <linux-mtd@lists.infradead.org>; Mon, 21 Jan 2002 17:15:25 +0200
Content-Type: text/plain;
  charset="iso-8859-1"
From: Paolo Supino <paolo.supino@harmonicdata.com>
To: linux-mtd@lists.infradead.org
Subject: DOC, grub and whatever is in between
Date: Mon, 21 Jan 2002 17:14:38 +0200
MIME-Version: 1.0
Message-Id: <02012117143805.00630@wintermute>
Content-Transfer-Encoding: 8bit
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Hi 

  I'm trying to activate a system that has a DOC Millenum as primary 
boot device and I want to use grub. I do the following: 
1. untar grub-0.90. 
2. patch it with the patch found in the mtd/patches directory.
3. configure it with --enable-diskonchip and --enable-tftp   
4. Build grub
5. move to mtd/grub
6. copy the newly built pre-stage2 
7. run make
8. run ../util/doc_loadbios /dev/mtd0 grub_firmware
   The output from the command is: 
Performing Flash Erase of length 8192 at offset 0
Performing Flash Erase of length 8192 at offset 8192
Performing Flash Erase of length 8192 at offset 16384
Performing Flash Erase of length 8192 at offset 24576
Performing Flash Erase of length 8192 at offset 32768
Performing Flash Erase of length 8192 at offset 40960
Performing Flash Erase of length 8192 at offset 49152
Performing Flash Erase of length 8192 at offset 57344
Performing Flash Erase of length 8192 at offset 65536
Performing Flash Erase of length 8192 at offset 73728
Performing Flash Erase of length 8192 at offset 81920
Performing Flash Erase of length 8192 at offset 90112

9. reboot the machine and get:
   DISK BOOT FAILIRE,  INSERT SYSTEM DISK AND PRESS ENTER


   Somewhere I'm doing something wrong, but I can't find where and what.
Can anyone point the obvious to me? 


PS - 1. I'm not subscribed to the mailing list (yet), so please send 
replies directly to me (mailto:paolo.supino@harmonicdata.com).
        2. I apologize before hand if the above is something at the 
the level of RTFM or at a proximity. 





TIA 



	Paolo 




	

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8TDBlTmyY/XcLbxARAjxJAKDVJU+wmZNC5odmyWiuh9GQ7VhNqACgzztA
iRXl+kxVAWYim5w05H3PmPY=
=Kh8s
-----END PGP SIGNATURE-----
