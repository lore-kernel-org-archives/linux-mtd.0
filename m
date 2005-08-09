From: =?iso-8859-1?Q?Cal=F2_Massimo?= <m.calo@ctsgroup.it>
To: "ucLinux-Mtd@Lists. Infradead. Org" <Linux-Mtd@Lists.Infradead.Org>
Date: Tue, 9 Aug 2005 12:02:44 +0200
Message-ID: <004201c59cc9$7d35bb00$050213ac@MCaloMobile>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re : Newly-erased Block...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



I have created a "jffs2" file system using "mkfs.jffs2" command and copied
it to my "/dev/mtd5" partition using "cp" command.

While the "cp" command is running, I receive the following error msg:

	"Warning: DQ5 raised while program operation was in progress,
however operation completed OK"

The operation is really completed OK : if I mount this partition my jffs2
filesystem is copied to my mtd5 partition... 
 But I have no space available on it and I receive the messages :

	/>Newly-erased block contained word 0x4c004c at offest 0x00040000 
	Newly-erased block contained word 0x4c004c at offest 0x00030000

Any suggestion is appreciated.

Thanks!

	Massimo.
