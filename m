Received: from rproxy.gmail.com ([64.233.170.194])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EPpxd-0006eL-Fm
	for linux-mtd@lists.infradead.org; Wed, 12 Oct 2005 19:25:04 -0400
Received: by rproxy.gmail.com with SMTP id b11so4401rne
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Oct 2005 16:24:32 -0700 (PDT)
Message-ID: <9b7ca6570510121624h5abdbf3erf526aab893bf285a@mail.gmail.com>
Date: Thu, 13 Oct 2005 08:24:31 +0900
From: Daniel Ann <ktdann@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: FYI, problem in CVS version
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hey folks,

I've downloaded CVS version yesterday and patched linux-2.6.12.3
kernel but everytime I try to do make mrproper I get an error saying
fs/jffs3/makefile.clean doesnt exist.

I've noticed that patch didnt include any JFFS3 files since there
werent any fs/jffs3 directory to start with, but fs/Makefile had line
mentioning JFFS3. So, I've commented out and did make mrproper which
worked.

Just to let you know how I've patched the kernel, I've executed
patchkernel.sh with following argument,
./patchkernel.sh -c -2 -3 -v /usr/src/linux-2.6.12.3


--
Daniel
