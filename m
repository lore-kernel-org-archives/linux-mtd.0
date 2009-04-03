Received: from rv-out-0708.google.com ([209.85.198.250])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LpgFB-00046A-UZ
	for linux-mtd@lists.infradead.org; Fri, 03 Apr 2009 10:03:33 +0000
Received: by rv-out-0708.google.com with SMTP id k29so281138rvb.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Apr 2009 03:03:23 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 3 Apr 2009 15:33:23 +0530
Message-ID: <d7ca49770904030303y293921b8o767bd5fd8c11af0@mail.gmail.com>
Subject: jffs2 on a 32k partition.
From: Manish D <manish2312@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,


I have a 32k flash partition that is used with jffs2. (4k * 8
eraseblock). [linux kernel 2.4.32]
Some of the files in this partition, do get updated often and stores
only config files.

Problem i am facing is, I am not able to use more than 10-12k of flash
for data. If I reboot, (let jffs2 run pass1/2), i might be able to add
upto 1k sometimes. But never more than that.

I am not really sure why so much of flash space is not allowed to be
used. I understand 32k is a really small partition for any filesystem,
but understanding jffs2 overheads (approx 200 bytes per file), i am
not sure why i am not able to use rest of the space.
Is gcd thread not freeing up flash space ? or with small number of
eraseblocks wear-levelling.
Any pointers on understanding this would really help. Is there any
other way out ?

I plan to move to raw read-write now without wear-levelling (with a
smarter write algorithm to even out writes to one of 8 blocks).

Would really appreciate inputs and pointers on how i can go about
using jffs2 (disabling gcd / wear levelling ? ) on such a small
partition.


Regards,
-Manish
