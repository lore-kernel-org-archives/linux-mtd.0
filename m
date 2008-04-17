Received: from rn-out-0910.google.com ([64.233.170.184])
	by pentafluge.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JmWOn-0004Hz-CG
	for linux-mtd@lists.infradead.org; Thu, 17 Apr 2008 15:51:46 +0000
Received: by rn-out-0910.google.com with SMTP id s46so81344rnb.3
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 Apr 2008 08:51:25 -0700 (PDT)
Message-ID: <60e9ed290804170851y17cd9ea8nbb2531275eb899fb@mail.gmail.com>
Date: Thu, 17 Apr 2008 21:21:24 +0530
From: "Abhijit Singh" <mail2abhijit@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: inconsistent behaviour with onenand with 2.6.24 kernel
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Sorry my earlier message was rejected because of suspicious header.

I am facing some problem with onenand with the kernel 2.6.24.
Everything used to work with 2.6.20 version but after upgrading the
kernel to this version there is some inconsistent behaviour. If we
keep copying small file ( ~= 20 Kb ) to onenand,it hangs after some
time. Copying some big file ( ~= 10 MB ) leads to system hang even for
the first time. I am not able to figure out whether the problem is
with onenand or jffs2.
Do i need to apply some patch to fix it ? has any one observed the behaviour ?
I have enabled the MTD_DEBUG. But all it generated was a big file. It
hangs in read, sometimes in write.

Onenand chip number that i am using is : K5W1G1GACM-DL60.
here is the boot time message from the kernel having all the details
about onenand.

Muxed OneNAND 128MB 1.8V 16-bit (0x30)
OneNAND version = 0x0221
WRITESIZE = 2048
Scanning device for bad blocks
Bad eraseblock 19 at 0x00260000
cmdlinepart partition parsing not available
mtd: Giving out device 0 to onenand.0

Our onenand is SLC.

Any pointer for this from anyone ( KP ? ).

Thanks
Abhijit
