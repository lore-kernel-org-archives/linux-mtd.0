Received: from mail-ew0-f207.google.com ([209.85.219.207])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Md2KE-0002Lh-4Z
	for linux-mtd@lists.infradead.org; Mon, 17 Aug 2009 13:32:42 +0000
Received: by ewy3 with SMTP id 3so731758ewy.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 Aug 2009 06:32:34 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 17 Aug 2009 15:32:34 +0200
Message-ID: <eedb5540908170632j1e92b08fqceb28e21d50e1372@mail.gmail.com>
Subject: [mkfs.jffs2] Problems padding jffs2 image.
From: javier Martin <javier.martin@vista-silicon.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am trying to generate a jffs2 image 10 erase blocks long but I can't
make it higher than 128KB:

javier@acuario:/home/javier/SVN/visstrim_sm10.repository/branches/cctv/sw/releases/TestJffs2$
mkfs.jffs2 -r hola -s 2KiB -e 128KiB -o ./test.jffs2 -v
--pad=10*128KiB
/
	f 0644         5 (      209)   500:100 adios


Compression mode: priority
Compressors:
      none             compr: 3 blocks (5)  decompr: 0 blocks
      zlib (prio:60) + compr: 0 blocks (0/0)  decompr: 0 blocks
     rtime (prio:50) + compr: 0 blocks (0/0)  decompr: 0 blocks
Compression errors: 0
javier@acuario:/home/javier/SVN/visstrim_sm10.repository/branches/cctv/sw/releases/TestJffs2$
du -sh test.jffs2
132K	test.jffs2

I specifiy a padding of 10*128KiB but the image size is never longer than 132KB.

Can anyone give my a tip on this issue?

Thank you.
-- 
Javier Martin
Vista Silicon S.L.
Universidad de Cantabria
CDTUC - FASE C - Oficina S-345
Avda de los Castros s/n
39005- Santander. Cantabria. Spain
+34 942 25 32 60
www.vista-silicon.com
