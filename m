Received: from smtp20.libero.it ([193.70.192.147])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CCJnr-0008MP-4b
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2004 11:22:08 -0400
Date: Tue, 28 Sep 2004 17:21:32 +0200
Message-Id: <I4RBZW$1BC751545D7EDF7C8647146B5A96310F@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
From: "lp4u\@inwind\.it" <lp4u@inwind.it>
To: "Ben Dooks" <ben@fluff.org.uk>,
	"MTD mailing list" <linux-mtd@lists.infradead.org>
Cc: 
Subject: Write on nand
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,   
   
finally my board detect the NAND. How to use MTD? How to wri=
te, read on my NAND?   
Can I write on:   
0x00000000-0x00004000 : "Boo=
t Agent"   
mtd: Giving out device 0 to Boot Agent   
0x00004000-0x0040=
0000 : "/boot"   
mtd: Giving out device 1 to /boot   
 
Or I can writ=
e only on: 
0x00400000-0x04000000 : "user"   
mtd: Giving out device 2 =
to user   
 
Thanks, 
Lorenzo 
