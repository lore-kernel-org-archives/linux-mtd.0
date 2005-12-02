Received: from wproxy.gmail.com ([64.233.184.204])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ei53J-0002jW-Aq
	for linux-mtd@lists.infradead.org; Fri, 02 Dec 2005 02:10:00 -0500
Received: by wproxy.gmail.com with SMTP id 68so9549wri
	for <linux-mtd@lists.infradead.org>;
	Thu, 01 Dec 2005 23:09:49 -0800 (PST)
Message-ID: <29f916510512012309y59af9f3au455c5323f8ca230e@mail.gmail.com>
Date: Fri, 2 Dec 2005 02:09:48 -0500
From: alfred hitch <alfred.hitch@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: file corruption with mtd / jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I would like some inputs, if someone can give some pointer / idea.

We are running jffs2 based partitions on linux 2.4 snapgear distro boards.
partitions were mounted read-write.

We are observing that after running for 3-5 months, now boards have
started giving corruped executables !
We are getting many boards back which have a corrupted binary on flash itse=
lf.

How is this possible ?

1) We by mistake were writting also in flash'es for logs /
configurations (dont ask why please ) .. and so is it be possible that
in log rotation etc jffs2 uses these got lost across a bad shutdown ?

Anyone ever observed anything like this ??
Is it safe to use jffs2 and assume all's well across unsafe shutdowns ?
Basic question perhaps, but will appreciate any directions.

Regards,
Nitin
