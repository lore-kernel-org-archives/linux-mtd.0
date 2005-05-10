Received: from rproxy.gmail.com ([64.233.170.193])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DVSHc-0006EK-BO
	for linux-mtd@lists.infradead.org; Tue, 10 May 2005 06:48:13 -0400
Received: by rproxy.gmail.com with SMTP id y7so1035989rne
	for <linux-mtd@lists.infradead.org>;
	Tue, 10 May 2005 03:48:16 -0700 (PDT)
Message-ID: <f6d0cd060505100348702a394a@mail.gmail.com>
Date: Tue, 10 May 2005 16:18:16 +0530
From: Niraj Maheshwari <niraj.maheshwari@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: Stable JFFS3 code
Reply-To: Niraj Maheshwari <niraj.maheshwari@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I got the latest MTD snapshot and patched in to Linux 2.6.10 kernel.
It compiled without any error but it doesn't seem to be stable.

I am just trying to fill the complete 5.5 MB JFFS3 parition with the
data and then removing few of the files. After rebooting mounting
simply hangs and sometime
removing the file also hangs for ever.

Can anyone let me know which date's snapshot for JFFS3 is stable ?

Thanks in advance.
Niraj
