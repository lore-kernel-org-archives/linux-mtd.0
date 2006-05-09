Received: from nz-out-0102.google.com ([64.233.162.194])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FdHu8-0008UI-Rm
	for linux-mtd@lists.infradead.org; Mon, 08 May 2006 22:24:57 -0400
Received: by nz-out-0102.google.com with SMTP id z6so363673nzd
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 May 2006 19:24:45 -0700 (PDT)
Message-ID: <29f916510605081924x3adfe599oed1e2a9071b97f61@mail.gmail.com>
Date: Tue, 9 May 2006 02:24:45 +0000
From: "alfred hitch" <alfred.hitch@gmail.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <29f916510605080406g5298445ev1dc98026e668f910@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <29f916510605080406g5298445ev1dc98026e668f910@mail.gmail.com>
Subject: 2.6 and IXDP425
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We are trying to port kernel 2.6 from snapgear depot (snapgear 3,3
version) on our IXDP425 based board.

I am not being able to get MTD partitions mapped. I don;t see my
traces from cfi_cmdset0001.c file itself coming up.
I am suspecting some wrong configuration option I am missing or something.

Exact Error is:
....
IXP4XX-Flash.0: failed to claim resource 0
....
blkmtd: error missing 'device' name
....
VFS: Cannot open root device "mtdblock4"
Kernel panic ..

Has anyone else also experienced this ? Any pointers on how to get past thi=
s ?
Can someone send me his .config for comparison ?


TIA,
Alfred
