Received: from [203.197.255.76] (helo=mail.navayuga.co.in)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CdnM5-0001Ff-Ih
	for linux-mtd@lists.infradead.org; Mon, 13 Dec 2004 05:23:03 -0500
Message-ID: <013c01c4e0fe$0a481e30$8500a8c0@nit37>
From: "Subrahmanyam" <subrahmanyam@navayuga.co.in>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 13 Dec 2004 15:55:06 +0530
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
Subject: Writing data to Flash
Reply-To: Subrahmanyam <subrahmanyam@navayuga.co.in>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Stephan,

In my target there is a Redhat ecos wherein basically I can find out the 
usnused & used partiitions. To store data (ex: string) in the flash firstly 
I need to load the file into the RAM using the "fis load" command, 
thereafter I need to create a partition in the flash based on the data in 
the RAM using the command "fis create".

To acheive it, the first step is how exaclty should I load data into the 
(target's) RAM. After the data is available in the target's RAM then only I 
can create a partition and store data into the flash.

Kindly suggest a suitable approach.

Thanks,
Subrahmanyam. 
