Received: from eagle.basari.net.tr ([213.248.128.40])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17bdeN-00034y-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Aug 2002 09:55:40 +0100
Received: from nurpinar ([195.142.234.243]) by eagle.basari.net.tr
          (InterMail vK.4.02.00.10 201-232-116-110 license c1a63c2345dd5b62855a869805df768e)
          with SMTP id <20020805085225.DYOF654.eagle@nurpinar>
          for <linux-mtd@lists.infradead.org>;
          Mon, 5 Aug 2002 11:52:25 +0300
Message-ID: <009301c23c5d$c8a3d380$3064000a@nurpinar>
From: "nur" <nurpinar@basari.net.tr>
To: <linux-mtd@lists.infradead.org>
Subject: couldn't initialize doc2000
Date: Mon, 5 Aug 2002 11:55:00 +0300
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

I compiled kernel 2.2.18-rtl3.0 with m-systems mtd support
I followed all instructions in doc-linux README
./mkinitrd_doc is ok
doc-lilo -v -C /etc/lilo.conf-initrd is ok
shutdown -r now
no message related to diskonchip is displayed during boot
i tried "insmod doc"
then i receive this message
Using /lib/modules/2.2.18-rtl3.0-doc2000/block/doc.o
Cannot initialize M-Systems DOC 2000 OSAK
/lib/modules/2.2.18-rtl3.0-doc2000/block/doc.o: init_module: Device or
resource busy

I have 8 mb DOC 2000. What might be my problem? Thanks
