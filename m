Received: from pro-237-183.rediffmailpro.com ([202.137.237.183])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LmS3b-0005sP-D7
	for linux-mtd@lists.infradead.org; Wed, 25 Mar 2009 12:18:14 +0000
Date: 25 Mar 2009 12:10:41 -0000
Message-ID: <20090325121041.19271.qmail@pro-237-183.rediffmailpro.com>
MIME-Version: 1.0
From: "Syed Ismail" <ismail.riyaz@dyansys.com>
To: linux-mtd@lists.infradead.org
Subject: mounting shows lost+found only
Content-type: text/plain;
	charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Reply-To: Syed Ismail <ismail.riyaz@dyansys.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


	=0A=0AHi=0AI am having problems using yaffs2 on nand chip(2KB page size) o=
n my mx31 ads based board.=0AI got the yaffs2 from http://www.aleph1.co.uk/=
cgi-bin/viewcvs.cgi/yaffs2/ and integrated it with 2.6.22 kernel.=0A=0ADid =
flash_eraseall on a nand mtd partition of 2 MB.=0A1) Then mounted it as yaf=
fs2 in a directory, mnt=0Als showed=0Alost+found=0A=0Acopied a file into mn=
t, acceseed,mosidifed file and listed it. Fine=0AThen unmounted.=0ANanddump=
 -p showed data lots of values other than 0xff,meaning data is present.=0A=
=0A2)When i mounted same partition again, all i got was lost+found=0Als sho=
wed=0Alost+found=0A=0AThe file i copied before dissapeared.=0AAlso nanddump=
 showed only 0xff values throughout the partition.=0A=0AAny help appreciate=
d.=0A=0AP.S. I have successfully used jffs2 on the same board and same chip.
