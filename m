Received: from isengard.yottayotta.com ([209.115.177.37])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17IbfA-0002pM-00
	for <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2002 21:57:48 +0100
Received: from fw-edm-dmz.yottayotta.com ([192.168.1.2] helo=edm-app01.yottayotta.com)
	by isengard.yottayotta.com with esmtp (Exim 3.33 #1)
	id 17Ibat-0006Le-00
	for linux-mtd@lists.infradead.org; Thu, 13 Jun 2002 14:53:23 -0600
Message-ID: <3D09070E.4080500@yottayotta.com>
Date: Thu, 13 Jun 2002 14:56:46 -0600
From: Murtada Shah <mshah@yottayotta.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Building a filesystem fails
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

I'm using mkfs.jffs2 to create a jffs2 filesystem, and copying it over 
to /dev/mtd/1

When trying to mount the flash... I receive the following messages:

Inode #2 was a directory with children - removing those too...
Inode #3 was a directory with children - removing those too...
Inode #4 was a directory with children - removing those too...
Inode #5 was a directory with children - removing those too...
Inode #6 was a directory with children - removing those too...
Inode #7 was a directory with children - removing those too...

....

Now in the mount directory, most the files are not present...

I'm wondering whether any one else has received such errors in the past. 
If so/not, any advice would be appreciated.

Murtada Shah
