Received: from tur.go2.pl ([193.17.41.50])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UOACx-0005MM-VQ
 for linux-mtd@lists.infradead.org; Fri, 05 Apr 2013 17:13:49 +0000
Received: from moh1-ve1.go2.pl (moh1-ve1.go2.pl [193.17.41.131])
 by tur.go2.pl (Postfix) with ESMTP id 1B38F698645
 for <linux-mtd@lists.infradead.org>; Fri,  5 Apr 2013 19:13:34 +0200 (CEST)
Received: from moh1-ve1.go2.pl (unknown [10.0.0.131])
 by moh1-ve1.go2.pl (Postfix) with ESMTP id A9D9C91D299
 for <linux-mtd@lists.infradead.org>; Fri,  5 Apr 2013 19:13:08 +0200 (CEST)
Received: from o2.pl (unknown [10.0.0.121])
 by moh1-ve1.go2.pl (Postfix) with SMTP
 for <linux-mtd@lists.infradead.org>; Fri,  5 Apr 2013 19:13:07 +0200 (CEST)
Subject: =?UTF-8?Q?JFFS2_performance_problem_with_large?=
 =?UTF-8?Q?_number_of_files_in_one_directory?=
From: =?UTF-8?Q?Marcin_Adamski?= <mass85@tlen.pl>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Message-ID: <73ba874f.5a559a00.515f0622.dc69d@tlen.pl>
Date: Fri, 05 Apr 2013 19:13:06 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I=20use=20JFFS2=20on=20top=20of=20NAND=20flash=20in=20my=20Linux=20workin=
g=20on=20ARM=20processor.=20I=20noticed=20that=20issuing=20"rm=20*"=20in=20=
directory=20containing=20a=20lot=20(i.e.=20150000)=20of=20small=20files=20=
(about=2020kB),=20causes=20JFFS2=20process=20consume=20almost=20100%=20of=
=20CPU.=20This=20state=20lasts=20about=201,5day.

Is=20this=20a=20known=20issue?=20Can=20I=20do=20anything=20about=20it?

Regards
Marcin=20Adamski
