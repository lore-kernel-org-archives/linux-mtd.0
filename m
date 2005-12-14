Received: from wproxy.gmail.com ([64.233.184.207])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EmRS4-0001ZB-Px
	for linux-mtd@lists.infradead.org; Wed, 14 Dec 2005 02:53:36 -0500
Received: by wproxy.gmail.com with SMTP id i1so318659wra
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Dec 2005 23:53:27 -0800 (PST)
Message-ID: <29f916510512132353y39427546j1413e0fdc5dcaa7a@mail.gmail.com>
Date: Wed, 14 Dec 2005 02:53:26 -0500
From: alfred hitch <alfred.hitch@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: mtd size calcualtion assumes same size'd flashes ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Please correct me if my understanding is wrong here:
but while grepp'ing through the code of linux 2.6 base I had.
File cfi_cmdset0001.c :
function: static struct mtd_info *cfi_intelext_setup(struct map_info *map)

      mtd->size =3D devsize * cfi->numchips;

This seems to me an assumption that the flash'es in system are all of
same size and so can be added up ?
Is my understanding correct, sorry dont have latest code access.

If that is the case, any reasons to do so  ?
My system happened to have an odd sized flash config and was creating messu=
ps.
If my understanding is correct, I would have like to patch and post it.

Regards,
Alfred
