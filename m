Received: from web8606.mail.in.yahoo.com ([202.43.219.81])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K8x2T-0000l8-OX
	for linux-mtd@lists.infradead.org; Wed, 18 Jun 2008 12:45:26 +0000
Date: Wed, 18 Jun 2008 18:15:16 +0530 (IST)
From: veena s <veena_3_2003@yahoo.co.in>
Subject: Reg:LTP Test fail on nand 
To: linux-mtd@lists.infradead.org
In-Reply-To: <mailman.1514.1213626659.2802.linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID: <772763.66951.qm@web8606.mail.in.yahoo.com>
Reply-To: veena_3_2003@yahoo.co.in
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi ,
I am checking my nand filesystem(jffs2) test by running LTP test ..
My testcases are failing for following .
 rwtest01                       FAIL      =20
 rwtest02                       FAIL      =20
 rwtest03                       FAIL      =20
 rwtest04                       FAIL      =20
 rwtest05                       FAIL     =20
and the error message is mmap-write() request failed:  No such file or dire=
ctory (2)

All other testcases are PASS.
Can anyone please suggest me what is the cause & how to debug it.

Thanks=20
Veena=20
=0A=0A=0A      Best Jokes, Best Friends, Best Food and more. Go to http://i=
n.promos.yahoo.com/groups/bestofyahoo/
