Received: from sc-smtp1.homechoice.co.uk ([212.187.157.195] helo=sc-outsmtp1.homechoice.co.uk)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17laLg-0004Fv-00
	for <linux-mtd@lists.infradead.org>; Sun, 01 Sep 2002 20:25:28 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: adr <mtd@mcmen.demon.co.uk>
To: linux-mtd@lists.infradead.org
Subject: Problem with my mtd driver
Date: Sun, 1 Sep 2002 20:26:42 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200209012026.42558.mtd@mcmen.demon.co.uk>
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

I am writing a driver for the Dreamcast's mtd device.

Reads now work fine. But writes fail - without, it seems my code being toched 
at all (I am using the demo char driver in the kernel to test).

cat foo > /dev/mtd/0

Generates....

MTD_open
cannot create /dev/mtd/0: Permission denied

Yet /dev/mtd/0 already exists....

ls -l /dev/mtd
crw-rw-rw-		1 0 	0	90, 0 Jan 1 1970 0
crw-rw-rw-		1 0    0	90, 1 Jan 1 1970 0ro

As you can see, I am using devfs.

Any ideas as to what is up?

I have put a simply printk at the start of my write routine....

static int vmu_flash_write(struct mtd_info *mtd, loff_t from, size_t len,
			   size_t * retlen, const u_char * buf)
{
  printk("Got here\n");


But it never seems to get called....


Adrian
