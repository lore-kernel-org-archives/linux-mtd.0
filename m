Received: from ro-out-1112.google.com ([72.14.202.183])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JCT4J-0001SY-6R
	for linux-mtd@lists.infradead.org; Wed, 09 Jan 2008 05:01:41 +0000
Received: by ro-out-1112.google.com with SMTP id a14so112036rof.8
	for <linux-mtd@lists.infradead.org>;
	Tue, 08 Jan 2008 21:01:34 -0800 (PST)
Message-ID: <478454EB.9010302@gmail.com>
Date: Wed, 09 Jan 2008 10:30:27 +0530
From: Ramanuj Pandey <tatsam07@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: space shown by df is more than actual used space
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi List,
I am new in this field, actually in my target board there is one
partition that is having jffs2 file system, some times after much read
and write the df shows much space used than actual, i tried to read
previous posts and other helps in this list and mail also but was not
able to get the problem fully. Since i am new to this particular field
i want to clear few of my basic doubts like this is the problem of mtd
driver in kernel of mkfs.jffs2 utility.
Please provide me solution or hint of the problem and kindly suggest
some place from where i can get some insight about jffs2 file system and
flashes.
my mkfs.jffs2 utility version is 1.43 and kernel we are using is 2.6.16

Thanks in Advance

Ramanuj
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFHhFTXq8Ry4Vqy+XkRAhURAJwOOsILaSUA4F2FGrg4wAvxUszX7QCgidKu
ODv1t7SZV26htZGaFwfCx+c=
=y4MZ
-----END PGP SIGNATURE-----
