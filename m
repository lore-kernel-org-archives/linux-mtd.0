Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 159itk-0000Mi-00
	for <linux-mtd@lists.infradead.org>; Tue, 12 Jun 2001 08:47:36 +0100
Received: from mail.mediatrix.com ([205.237.248.11])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 159TXO-0001Xo-00
	for linux-mtd@lists.infradead.org; Mon, 11 Jun 2001 16:23:30 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D99549E@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: "linux-mtd@lists.infrared.org" <linux-mtd@lists.infradead.org>
Subject: Purpose of sync() function
Date: Mon, 11 Jun 2001 11:17:37 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi all,

	I am working on a device driver for a flash chip that is not
currently supported by MTD current code.  My driver works fine, I am =
also
able to mount a jffs2 filesystem on it.  I have not implemented the =
sync()
function, because looking at others drivers it doest not seem to do =
anything
useful.  Can anyone tell me if I am right or wrong, and what should be =
the
purpose of the sync function^

Thanks in advance!

Fr=E9d=E9ric Giasson
