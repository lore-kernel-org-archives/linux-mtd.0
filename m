Received: from tomts25.bellnexxia.net ([209.226.175.188]
	helo=tomts25-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AJOxh-0005nE-Gg
	for <linux-mtd@lists.infradead.org>; Tue, 11 Nov 2003 03:13:01 +0000
Received: from sympatico.ca ([65.93.214.38]) by tomts25-srv.bellnexxia.net
	ESMTP
	<20031111031137.PBTM15340.tomts25-srv.bellnexxia.net@sympatico.ca>
	for <linux-mtd@lists.infradead.org>;
	Mon, 10 Nov 2003 22:11:37 -0500
Message-ID: <3FB05364.2000608@sympatico.ca>
Date: Mon, 10 Nov 2003 22:11:32 -0500
From: Mike Gore <magore@sympatico.ca>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: GRUB MTD DISKONCHIP patch failure with "grub-2003-01-08-doc.patch"
 on file stage2/disk_io.c using latest GRUB CVS
Reply-To: magore@icr1.uwaterloo.ca
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I downloaded the latest CVS for grub on 10 Nov 2003 at 9:30pmEST and 
attempted to apply the MTD patch grub-2003-01-08-doc.patch
Besides the expected Changelog and Authors errors I got one rejected 
section on stage2/disk_io.c (see below for copy of the failed section)

It is not totally clear to me how to fix this - looking at the code it 
seems that the patch is using a different parsing method and as such it 
is not clear  how to proceed since
I do not have the grub code from the original patch date - nor do I know 
what bugs it may have had and or have fixed...

I suspect the problem must be recent since others have reported success 
with patching GRUB in the last few months

I would be thankfull for any pointers

Here is disk_io.c.rej

***************
*** 964,987 ****
                return device + 2;
            }
 
-         if ((*device == 'f' || *device == 'h' || *device == 'n')
-             && (device += 2, (*(device - 1) != 'd')))
-           errnum = ERR_NUMBER_PARSING;
 
-         if (ch == 'n')
-           current_drive = NETWORK_DRIVE;
-         else
            {
              safe_parse_maxint (&device, (int *) &current_drive);
             
              disk_choice = 0;
              if (ch == 'h')
                current_drive += 0x80;
            }
        }
 
        if (errnum)
-       return 0;
 
        if (*device == ')')
        {
--- 1024,1060 ----
                return device + 2;
            }
 
+         device += 2;
 
+ #define MK16(a,b) ( ((a)<<8) + (b) )
+
+         switch (MK16(ch, *(device-1)))
            {
+           case MK16('n','d'):
+             current_drive = NETWORK_DRIVE;
+             break;
+            
+           case MK16('d','c'):
              safe_parse_maxint (&device, (int *) &current_drive);
+             disk_choice = 0;
+             current_drive += DISK_ON_CHIP;
+             break;
             
+           case MK16('h','d'):
+           case MK16('f','d'):
+             safe_parse_maxint (&device, (int *) &current_drive);
              disk_choice = 0;
              if (ch == 'h')
                current_drive += 0x80;
+             break;
+            
+           default:
+             errnum = ERR_NUMBER_PARSING;
            }
        }
 
        if (errnum)
+        return 0;
 
        if (*device == ')')
        {



-- 
# Mike Gore
# At Home:	InfoWrite Consulting
# Mail:		405 Midwood Cres, Waterloo Ontario, N2L 5N4
# Phone:	1-519-884-4943
# Fax:		1-519-885-0548
# Email:	magore@sympatico.ca
#
# At Work: 	Technical Support, CSCF
# Smail:   	DC3549C, University of Waterloo, 200 University Ave
#	     	Waterloo Ontario, Canada, N2L 3G1
# Phone:	1-519-888-4567, x6205
# Fax:		1-519-746-5036
# Email:	magore@uwaterloo.ca
