Received: from woody.esisar.inpg.fr ([195.220.37.21] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17AmDw-0000fY-00
	for <linux-mtd@lists.infradead.org>; Thu, 23 May 2002 07:37:20 +0100
Reply-To: <gregory.janiszewski@esisar.inpg.fr>
From: "Gregory Janiszewski" <gregory.janiszewski@esisar.inpg.fr>
To: <mark@lakeshoremicro.com>
Cc: <linux-mtd@lists.infradead.org>
Subject: Re : Installation of DoC, HELP... 
Date: Thu, 23 May 2002 08:32:42 +0200
Message-ID: <000801c20223$a4d182a0$c625dcc3@esisar.inpg.fr>
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

Thank you for your answer.

I format the DoC with the "dformat" program (version 4.2), and the
"UnitSizeFactor" is now correct.
But the fdisk program don't work. It's the same problem : nothing append,
after "fdisk /dev/nftla", the prompt is frozen (I try during 2 hours !!!).
I don't understand why the nftla program can't find the correct geometry of
the DoC, is it correct ?

Cannot calculate an NFTL geometry to match size of 0x17780.
Using C:1001 H:16 S:6 (== 0x17760 sects)
nftla: nftla1

JANISZEWSKI Gregory
