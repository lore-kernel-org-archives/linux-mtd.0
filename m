Received: from mailhost.rdmcorp.com ([204.225.180.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17s9iU-0006JF-00
	for <linux-mtd@lists.infradead.org>; Thu, 19 Sep 2002 23:24:10 +0100
Received: from PARKER (10.1.2.1) by mailhost.rdmcorp.com (Worldmail 1.3.167) for linux-mtd@lists.infradead.org; 19 Sep 2002 18:28:45 -0400
From: "Jack Lu" <jlu@rdmcorp.com>
To: <linux-mtd@lists.infradead.org>
Subject: error " inflate returned -3" occured when copying file into jffs2 file system
Date: Sun, 19 May 2002 18:23:28 -0400
Message-ID: <DFEAJMIABOLKNEBOPGDHAEDKCBAA.jlu@rdmcorp.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi
	I have set up the jffs2 file system on 16MB Am29LV320MB.
	When I copied files into the jffs2 file system, for some files, the message
"inflate returned -3" occured.
This message displayed with no relatation with the length of being copied
file. Even though this message occured, the file
still was copied into the mounted jffs2 file system. Then I copied the file
back and compared it with the original file
there was no difference. So it seems the coping is still being done
correctly.
	I checked the "infalte returned -3" means DATA ERROR on decompressing when
function zlib_inflate is called.

	Why does this happen?

Thanks.
