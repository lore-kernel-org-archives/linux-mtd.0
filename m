Received: from v-mail.vsnl.com ([202.54.117.17] helo=vmail.vsnl.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DapyJ-0005ya-Ds
	for linux-mtd@lists.infradead.org; Wed, 25 May 2005 03:06:34 -0400
Received: from ramakrishnanr ([127.0.0.1])
	by vmail.vsnl.com (iPlanet Messaging Server 5.2 HotFix 1.16 (built May
	14 2003)) with SMTP id <0IH100DZJA9IE5@vmail.vsnl.com> for
	linux-mtd@lists.infradead.org; Wed, 25 May 2005 12:33:19 +0530 (IST)
Date: Wed, 25 May 2005 12:34:11 +0530
From: ramakrishnanr <ramakrishnanr@tataelxsi.co.in>
To: linux-mtd@lists.infradead.org
Message-id: <007301c560f7$f4569230$9219320a@telxsi.com>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: (jffs2) flash images lost
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi

after doing a fis init we now have only the folowing images on our flash.
(IXP425 board. INTEL strata flash.)

RedBoot> fis list
Name              FLASH addr  Mem addr    Length      Entry point
RedBoot           0x50000000  0x50000000  0x00040000  0x00000000
RedBoot config    0x50FC0000  0x50FC0000  0x00001000  0x00000000
FIS directory     0x50FE0000  0x50FE0000  0x00020000  0x00000000

this is understandable. but when i tried a fis free i get a NULL response.
though there is nearly a 15.5Mb of space unallotted between the first and
second image(RedBoot and RedBoot config).

Now if i create a JFFS2 image in this space(between 0x50040000 and
0x50FC0000),
will i be oversteeping any boundaries?
i am unable to try it out because i can't afford to erase my redboot even
accidentally.

thanks
ramakrishnan
