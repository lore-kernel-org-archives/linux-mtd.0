Received: from smtp.transmode.se ([31.15.61.139])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXA0q-0005Am-OM
 for linux-mtd@lists.infradead.org; Wed, 02 Sep 2015 15:31:49 +0000
Received: from exch1.transmode.se (exch1.transmode.se [192.168.201.16])
 by smtp.transmode.se (Postfix) with ESMTP id DAC631187093
 for <linux-mtd@lists.infradead.org>; Wed,  2 Sep 2015 17:31:21 +0200 (CEST)
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: JFFS2 shared readonly mmap not supported?
Date: Wed, 2 Sep 2015 15:31:20 +0000
Message-ID: <1441207880.3349.243.camel@transmode.se>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <1B8E297832C3564E88A1A71CB80BB5C5@transmode.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tried to used perf on JFFS2 and it fails because of shared readonly mmap:
  ptr =3D mmap(NULL, size, PROT_READ, MAP_SHARED,0, fd);

(errno says EINVAL here)

I wonder in not this combo should work?=
