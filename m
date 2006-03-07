Received: from s05.tal.de ([81.92.0.8] helo=smtp.tal.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FGbzl-00042w-75
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2006 08:13:07 -0500
From: =?iso-8859-1?Q?Bernd_B=FCttner?= <b.buettner@mkc-gmbh.de>
To: =?iso-8859-1?Q?Bernd_B=FCttner?= <b.buettner@mkc-gmbh.de>,
	<linux-mtd@lists.infradead.org>
Date: Tue, 7 Mar 2006 14:12:46 +0100
Message-ID: <NIEOKDANPOACMMCCAHPAOENODAAA.b.buettner@mkc-gmbh.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
In-Reply-To: <NIEOKDANPOACMMCCAHPAOENJDAAA.b.buettner@mkc-gmbh.de>
Cc: 
Subject: RE: problem patching latest snapshot
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Hi,
>
> I'm working with uClinux for Coldfire (kernel 2.6.12-uc0) and I want to
> update mtd to the lastest snapshot (mtd-snapshot-20060306)
> patchkernel.sh shows the following:
>
> Patching /home/project/distribution/linux-2.6.x
> Include JFFS2 file system: jffs2
> Include JFFS3 file system (experimental): no
> Method: cp
> Can we start now ? [y/N]y
>
> Traceback (most recent call last):
>   File "scripts/treewalk.py", line 23, in ?
>     import xml.sax
> ImportError: No module named xml.sax
>
> The host system I'm working on is a SuSe Linux 8.2.
> My Python environment seems to be wrong.
> I'm not familiar with Python, so what can I do?
>
> Bernd Büttner
>

Problem solved by updating Python to 2.4.2

Bernd
