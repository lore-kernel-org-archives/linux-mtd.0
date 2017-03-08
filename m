Received: from mail-ot0-x22e.google.com ([2607:f8b0:4003:c0f::22e])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clZ15-0007lt-Un
 for linux-mtd@lists.infradead.org; Wed, 08 Mar 2017 10:40:26 +0000
Received: by mail-ot0-x22e.google.com with SMTP id 19so28196696oti.0
 for <linux-mtd@lists.infradead.org>; Wed, 08 Mar 2017 02:40:01 -0800 (PST)
MIME-Version: 1.0
From: chaitanya vinnakota <chaitanya.sai.v@gmail.com>
Date: Wed, 8 Mar 2017 16:09:59 +0530
Message-ID: <CAMBC=j52G5XtCLiH-=KqBQ7_kFYKo1NLPf+RbHSznirUr3RkNA@mail.gmail.com>
Subject: ECC un-correctable errors seen with an unusual data pattern.
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

Hi All,

I'm working on NXP LS1024A and it is equipped with 256M spansion nand
flash enabled with HW ECC.  The page size is 2K and 128 bytes spare
area. 24 bit ECC is computed for every 1K of data.  The kernel version
is 3.2.54.
 At times, we are observing "ECC uncorrectable errors" during our
reboot tests.  These are errors will be gone in the subsequent boots.
 The test is that the device  automatically initiates  a reboot once
the booting is complete.  To achieve this we modifed the last invoked
rc script i.e /etc/init.d/zfinish , in the script we added the command
"reboot"  to reboot the device .

I modified our driver code to display the contents of the page  which
is reported uncorrectable . I used hex format for displaying the
contents and I'm seeing one peculiar "303030303030" pattern whenever
the ECC uncorrectable errors are reported .

 The below is excerpt from my logs,  the data part always contains the
sequence "3030303030303030303030303030303030303030"  in the 1st half
of the page i.e 1024 bytes,  whenever the ECC error is reported.

[  132.513399] ECC: uncorrectable error 2 !!!
[  132.517580] ECC correction failed for page 0x0001c007
[  132.517584]  ECC-BYTES = 42,  ECC-CODE-READ =
a7605473e182255e36436372e0a975d1f1a0f0805a96bf7251ab7d3b179323536265df25ef5217e9
[  132.534385]  Data =
303030303030303030303030303030303030303030303015de180558455856054d347593b73f63b2f41f3870deb1dc18047a56054ee72a57e75ba3f6385c4d09f251419320805a965aa758545fb3b2f65cca3f6391f83fa1168789df.........................................

[  132.719990] ECC: uncorrectable error 2 !!!
[  132.724100] ECC correction failed for page 0x0001c007
[  132.724104]  ECC-BYTES = 42,  ECC-CODE-READ =
850805c845f878f73b010100ae1000f0700587e8f5c4f88b8f6e2446caa1115fb6de4386
[  132.740192]  Data =
5263d1a1b2bba32c21ffffffffffffffffffffffffffff5c54f1b5bd304d384363eb7e576669c33fb61804b84455452292576373a43639d527288e5a9616a0804c845ac55454ae368b1a666143634836e12e88d5ae
.....................................


The ascii value for 0x30 is 0. Does the sequence "30303030" give any
clue.  Does it have anything to do with erase ?

Thanks
Chaitanya
