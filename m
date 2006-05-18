Received: from web27309.mail.ukl.yahoo.com ([217.146.177.170])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fgdx9-0001XN-Mf
	for linux-mtd@lists.infradead.org; Thu, 18 May 2006 04:34:30 -0400
Message-ID: <20060518082710.79870.qmail@web27309.mail.ukl.yahoo.com>
Date: Thu, 18 May 2006 08:27:10 +0000 (GMT)
From: Sreecharan Sivadevuni <mailsreecharan@yahoo.co.uk>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Jffs2 reports "Warning: DQ5 raised while program ...", Contiuously!
Reply-To: Sreecharan Sivadevuni <mailsreecharan@yahoo.co.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all, 
         I am running JFFS2.1 on uClinux2.4.24. My flash chip is SST39VF6401B.
For all Write/erase/ (and may be also read) operations, the MTD drivers print the following warning message.  
 
"Warning: DQ5 raised while program operation was in progress, however operation completed OK"
 
Is there any fix for the above warning message.
 
I am using JEDEC_PROBE. 

The following is the code I have added in jedec_probe.c file to support above flash device. 

{ 
         .mfr_id        = MANUFACTURER_SST, 
         .dev_id        = SST39VF6401B, 
         .name        = "SST 39VF6401B", 
         .DevSize    = SIZE_8MiB, 
         .CmdSet        = P_ID_AMD_STD, 
         .NumEraseRegions= 2, 
         .regions    = { 
             ERASEINFO(0x02000, 8), 
             ERASEINFO(0x10000, 127), 
         } 
   } 
 
Thanks 
Sreecharan.S 
 
