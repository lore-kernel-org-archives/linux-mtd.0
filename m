Received: from mail-qy0-f188.google.com ([209.85.221.188])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NnOAE-0005Ye-F8
	for linux-mtd@lists.infradead.org; Fri, 05 Mar 2010 03:25:27 +0000
Received: by qyk26 with SMTP id 26so2487234qyk.12
	for <linux-mtd@lists.infradead.org>;
	Thu, 04 Mar 2010 19:25:21 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 5 Mar 2010 11:25:05 +0800
Message-ID: <2c3b11251003041925r2575b6cavf7cfda8e061563c4@mail.gmail.com>
Subject: what is the difference between NFTL and INFTL in linux kernel?
From: Liu Hui <onlyflyer@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "david.woodhouse" <david.woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi guys,

I took a quick look at the source code of NFTL and INFTL and  found
both of FTL used replacement block scheme(A. Ban, =E2=80=9CFlash file syste=
m,=E2=80=9D
United States Patent, no. 5,404,485, April 1995.) to implement its
core FTL algorithm.

What is the history of these FTLs and what is the real difference between t=
hem?

--
Thanks & Best Regards
Liu Hui
--
