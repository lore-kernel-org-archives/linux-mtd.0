Received: from [203.197.255.76] (helo=mail.navayuga.co.in)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CrZ7n-0002VV-2q
	for linux-mtd@lists.infradead.org; Thu, 20 Jan 2005 05:01:14 -0500
Message-ID: <00d901c4fed7$09a1f810$8500a8c0@nit37>
From: "Subrahmanyam" <subrahmanyam@navayuga.co.in>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 20 Jan 2005 15:31:29 +0530
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
Subject: Kernel Image Update
Reply-To: Subrahmanyam <subrahmanyam@navayuga.co.in>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

My query is about kernel image update not through jtag port but through
usb/firewire ports, after the target device is up and running. For this we
also need to update the fis directory as well.

When the existing kernel is already running and corresponds to the mount
area ex: /dev/mem., can I overwrite the same "/dev/mem"., here I am confused
can any one explain, can this be possible, if yes will the existing
kernel in RAM run?

Can any one guide me how I should proceed.

Thanks,
Subrahmanyam.
