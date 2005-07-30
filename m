Received: from wproxy.gmail.com ([64.233.184.207])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DyhJR-0006Eb-Qp
	for linux-mtd@lists.infradead.org; Fri, 29 Jul 2005 22:43:11 -0400
Received: by wproxy.gmail.com with SMTP id i20so688628wra
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Jul 2005 19:42:56 -0700 (PDT)
Message-ID: <9185a3fa050729193514dd5f8@mail.gmail.com>
Date: Sat, 30 Jul 2005 11:35:51 +0900
From: Amit Sharma <amitsharma91@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: mkfs issue
Reply-To: Amit Sharma <amitsharma91@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi ALL

Thanks Thomas for help,I need more support form group

Now for creating file i am using this option but i have some doubt

nkfs.jffs2 -s 2 -e 128 -o jffs2.image


Issue

1. what is the purpose of block size option -e
2. This problem based on my two host PC=20
if i use option -d /home/jffs2stuff  i found my file size is zero on
my one Host PC
but on other setup i found file size 13310 always ,what is this problem .
3. If i create file of more than 1.3MB Jffs2 response degraded during
ls-la and using of benchmarking.

I am using linux 2.4 kernel .do you think i should upgrade my jffs2
for 2.4 kernel from cvs.

Thanks
AK
