Received: from [203.197.255.76] (helo=mail.navayuga.co.in)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CbWHz-0000n3-Vq
	for linux-mtd@lists.infradead.org; Mon, 06 Dec 2004 22:45:25 -0500
Message-ID: <000b01c4dc0f$69fd88e0$8500a8c0@nit37>
From: "Subrahmanyam" <subrahmanyam@navayuga.co.in>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 7 Dec 2004 09:16:52 +0530
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
Subject: MTD driver
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

 I need to provide an user interface/GUI wherein when a certain data 
(string/key) is entered, it should basically store the key in the flash 
(this basically happens during run time after the target has been identified 
by the host).

In the target we have a flash in which there is jffs2 file system and also 
mtd drivers, since i need to store block oriented data, i am looking at the 
possiblity of using mtd driver and storing data(key) in a particular 
location in flash. How should i proceed in acheiving the same.

I will be thankful if you can best suggest an approach for acheiving the
same.

Thanks,
Subrahmanyam. 
