Received: from [208.190.191.184] (helo=sekhmet.ad.newisys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16VJbp-0000zG-00
	for <linux-mtd@lists.infradead.org>; Mon, 28 Jan 2002 21:46:38 +0000
content-class: urn:content-classes:message
Subject: linux/completion.h missing
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Jan 2002 15:57:12 -0600
Message-ID: <D3A72C5007329A4F991C0DD87202259F096A3E@sekhmet.ad.newisys.com>
From: "Navin Boppuri" <navin.boppuri@newisys.com>
To: <linux-mtd@lists.infradead.org>
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

Hello,

I download the latest "mtd" source code. I am trying to compile the =
kernel with this new source but I get an error while building the =
kernel.  There is a missing file that jffs2_fs_sb.h looks for and does =
not find. The file name is completion.h which is supposed to be in the =
include/linux/ directory. I have the latest 2.4. kernel and I dont see =
this file. What's going on? Where do I get this?

Thank you,
Navin Boppuri.
