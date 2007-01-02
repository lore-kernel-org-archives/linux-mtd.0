Received: from wx-out-0506.google.com ([66.249.82.228])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H1jTj-0008SG-7N
	for linux-mtd@lists.infradead.org; Tue, 02 Jan 2007 08:14:57 -0500
Received: by wx-out-0506.google.com with SMTP id i31so5339310wxd
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Jan 2007 05:14:53 -0800 (PST)
Message-ID: <c93f20960701020514r56d6bde9w303cf2d2c6bba0ae@mail.gmail.com>
Date: Tue, 2 Jan 2007 05:14:53 -0800
From: "Nathan Edson" <nedson@nedson.org>
Sender: nedson@gmail.com
To: linux-mtd@lists.infradead.org
Subject: DiskOnChip
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Hello!

I'm trying to get a diskonchip2000 mounted and
working...

I have a couple Wyse Winterm thin clients with
96mb DOC's.  I'm booting them off the network
using Knoppix.  They don't have any other drives.
So far, I've tried:

modprobe doc2000
modprboe docprobe

After doing docprobe I get an error that the device
is temporarily unvailable.  When I dmesg I see
that the device has been identified.  I've tried mknod
and then mounting the chips with no success.

The knoppix disc I'm using uses kernel 2.6.17.


Any ideas?  Thanks in advance!

Nathan
