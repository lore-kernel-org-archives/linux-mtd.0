Received: from c210.h061013191.is.net.tw ([61.13.191.210] helo=mail.arbor.com.tw)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mu10-0003pJ-00
	for <linux-mtd@lists.infradead.org>; Thu, 05 Sep 2002 11:37:35 +0100
From: Daniel Toussaint <daniel@arbor.com.tw>
To: Mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain;
  charset="us-ascii"
Subject: compact flash and jffs2
Date: Thu, 5 Sep 2002 18:40:08 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200209051840.08265.daniel@arbor.com.tw>
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

Hi all,=20

So far I've always been using compact flash as a regular IDE device, =
putting=20
cramfs for read-only, ext2 for r/w partitions.=20
I was wondering if using the blkmtd device with a jffs2 filesystem =
would be a=20
better way for R/W partitions ?=20
On diverse mailling lists, there are contradicting answers. Some say =
it's THE=20
way to use CF cards, others say it's totally useless since CF cards =
have=20
their own wear leveling system build in.=20
There were reports that it takes forever to mount a cf card with =
blkmtd/jffs2.=20
I've tried it, it does take a long time for the whole cf, but in =
smaller=20
partitions (2 - 3 M) it's acceptable.=20

questions:=20
* So, is it wise, to use a setup like that in a system, let's say to =
update=20
system configuration files on a small , sepate partition ?=20
* Are there some parameters that I can give to blkmtd.o to speed up the =

process of mounting? Currently I only give it "device=3D/dev/.."=20
* Is it better to compile blkmtd.o in the kernel, or leave it as a  =
module? .

Thanks,=20

Greetings,
Daniel



--=20
ARBOR Technology Corp.		   	Industrial PC-based Automation
_______________________________________________________________________

Address :  5F, No 738 Zhong Zheng Rd., Zhong He, Taipei, Taiwan
Tel     :  886 2 8226 9396   ext : 652
Fax     :  886 2 8226 9398


WWW pages  :  http://www.arbor.com.tw=20

an ISO-9001 certified company
