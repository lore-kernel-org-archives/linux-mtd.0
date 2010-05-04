Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O9GTn-000761-Pn
	for linux-mtd@lists.infradead.org; Tue, 04 May 2010 11:40:00 +0000
Received: by vws8 with SMTP id 8so959669vws.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 04 May 2010 04:39:57 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 4 May 2010 17:09:57 +0530
Message-ID: <t2q630851df1005040439hf116acd1ucd73738e90dc5731@mail.gmail.com>
Subject: unable to run "flash_eraseall" on ARM target!!!
From: Murali N <nalajala.murali@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
i have compiled the mtd-utils for android using arm-eabi-4.4.0 tool chain.
I tried erasing the flash using "flash_eraseall" on target but i am
getting the below errors!!!

# sh ./flash_eraseall
     sh ./flash_eraseall
     ./flash_eraseall: 1: Syntax error: word unexpected (expecting ")")
# ./flash_eraseall
    ./flash_eraseall
    ./flash_eraseall: not found
# sh /data/flash_eraseall
    sh /data/flash_eraseall
    /data/flash_eraseall: 1: Syntax error: word unexpected (expecting ")")
#

Why "flash_eraseall" was not found? i am running from the same
directory where i have copied.

Thanks for your help.
