Received: from mail-pz0-f197.google.com ([209.85.222.197])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MaVhe-0000QL-2s
	for linux-mtd@lists.infradead.org; Mon, 10 Aug 2009 14:18:26 +0000
Received: by pzk35 with SMTP id 35so2994372pzk.24
	for <linux-mtd@lists.infradead.org>;
	Mon, 10 Aug 2009 07:18:20 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 10 Aug 2009 19:48:20 +0530
Message-ID: <630851df0908100718k261615c4sddc6025765a9b5d8@mail.gmail.com>
Subject: onenand DDP device read issue
From: Murali N <nalajala.murali@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All, i need a help on onenand driver.

I have written basic onenand driver to test the read/write operations
to the device.
I am using 4Gb DDP device.Before enabling the DDP all read/writes are
happening fine.
After enabling the DDP feature i am not able to read the files which
falls on the chip boundary.
I did my level best to understand the spec but somewhere i am missing
something.Can any one please know me what causing this issue.

Assumptions:

1) Using yaffs2 filesystem over mtd
2) Device 'KFN4G16Q2A DEB8
3) Read/write happends only one page at a time.Means MTD calls my
driver reads/write functions when it want to read/program at page
level.
4) Not using read-while-loading etc


ex:
    suppose if i start writing a file X at the location 0x0fff_f800 (
last page in chip0 ) to 0x1006_1800 ( in chip1 ).
    after i call the read function i am not able to retrieve back the
file, it is showing as lost+found.

while crossing the boundary i am taking care below settings

1) DFS/FBA based on 'from' address whether it is chip0 or chip1 address
2) DBS
3) FPA/FSA
4) BSA/BSC

Is there anything else do i need to takecare?
