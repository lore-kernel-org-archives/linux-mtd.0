Received: from an-out-0708.google.com ([209.85.132.251])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HuQ7f-0004i3-HU
	for linux-mtd@lists.infradead.org; Sat, 02 Jun 2007 05:42:12 -0400
Received: by an-out-0708.google.com with SMTP id c3so226475ana
	for <linux-mtd@lists.infradead.org>;
	Sat, 02 Jun 2007 02:42:10 -0700 (PDT)
Message-ID: <81885c0a0706020242w23a652e7q11539d4a1d038be3@mail.gmail.com>
Date: Sat, 2 Jun 2007 15:12:09 +0530
From: "Rajanikanth H.V" <rajanikanthhv@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Need info on JFFS2 Clean Marker bytes
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hello,

Can JFFS2 be made to work on NAND without CleanMarker and Magic Bitmask
Values (0x20031985) which uses spare area free bytes.

As i understand cleanmarker bytes are used to validate block for its
access, but in
the controller i am working on, it does not provide ECC protection for Spare
area.

thanks,
Raj
