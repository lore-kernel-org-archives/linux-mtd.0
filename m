Received: from smtp-out-2.wanadoo.fr ([193.252.19.254] helo=mel-rto2.wanadoo.fr)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17nDNA-00060I-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Sep 2002 08:17:45 +0100
From: "Thomas TESTASECCA" <thomas.testasecca@etictelecom.com>
To: "Xiaogeng \(Shawn\) Jin" <xjin@redswitch.com>,
	<linux-mtd@lists.infradead.org>
Subject: RE: writing to jffs2 is so slow?
Date: Fri, 6 Sep 2002 09:15:33 +0200
Message-ID: <AEEFILJDOOHJLBCFOBJDEEJCDAAA.thomas.testasecca@etictelecom.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <3D77C812.3080108@redswitch.com>
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

Hi Shawn,

All i can say is that it's not normal !! :)
Try to turn off the debugging mode for mtd & jffs2 (into "make menuconfig").
good luck
tom

-----Message d'origine-----
De : linux-mtd-admin@lists.infradead.org
[mailto:linux-mtd-admin@lists.infradead.org]De la part de Xiaogeng
(Shawn) Jin
Envoye : jeudi 5 septembre 2002 23:10
A : linux-mtd@lists.infradead.org
Objet : writing to jffs2 is so slow?


Hi,

I have an empty mtd partition (capacity is 16 MB) where a jffs2 fs is
mounted. The strange observation is that making a first directory on
that partition takes almost 2 minutes. So far I observed this behaviour
just when making the first directory and just on that particular
partition. Can anyone help me to explain this? Is there anything wrong
with flash memory (hardware) or MTD device driver or JFFS2? Thanks.

- Shawn.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
