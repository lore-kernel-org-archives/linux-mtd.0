Received: from web27307.mail.ukl.yahoo.com ([217.146.177.168])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FgEbH-0002Qm-Pi
	for linux-mtd@lists.infradead.org; Wed, 17 May 2006 01:29:45 -0400
Message-ID: <20060517052933.92640.qmail@web27307.mail.ukl.yahoo.com>
Date: Wed, 17 May 2006 05:29:33 +0000 (GMT)
From: Sreecharan Sivadevuni <mailsreecharan@yahoo.co.uk>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: JFFS2 reports warning continuously !
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
          I am running JFFS2.1 on uClinux2.4.24. My flash chip is SST39VF6401B. For all Write/erase/ (and may be also read) operations the MTD drivers print the following warning message. 

Warning: DQ5 raised while program operation was in progress, however operation completed OK

Is this normal? can I get over it anyway? any comments would be great!

I am using JEDEC_PROBE. The following is the code I am using in jedec_probe.c file to support above flash device.
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
