Received: from mail.mediatrix.com ([205.237.248.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15CjqA-00055Y-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Jun 2001 16:24:23 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D9954CA@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: "MTD mailing list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: jffs2_scan_medium effor
Date: Wed, 20 Jun 2001 11:24:16 -0400
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

	I have some sectors on my flash memory that I don't give out to
jffs2 because they contain boot data that I cannot integrate to jffs2.  =
I
had locked them in a software way in my flash driver by simply not =
allowing
erase calls on those sectors. Up to this morning it had worked fine.  =
But
this morning I checked out last CVS code and now the jffs2_scan_medium
function does not seem to like my lock feature. =20

It says: "Cowardly refusing to erase blocks on filesystem with no valid
JFFS2 nodes."

	I guess that the way I "mapped" my flash is not MTD's way.  Could
someone tell me what should be the "right" way to prevent jffs2 to use
sectors I don't want to give it at mount time?

Thanks!

Fr=E9d=E9ric Giasson
