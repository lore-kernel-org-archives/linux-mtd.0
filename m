Received: from [160.114.120.248] (helo=eos.fwall.u-szeged.hu)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B0HVD-00026W-Az
	for linux-mtd@lists.infradead.org; Mon, 08 Mar 2004 09:56:51 +0000
Received: from localhost ([127.0.0.1] helo=eos.fwall.u-szeged.hu)
	by eos.fwall.u-szeged.hu with smtp (Exim 4.24)
	id 1B0HUW-0004lL-PR
	for linux-mtd@lists.infradead.org; Mon, 08 Mar 2004 10:56:08 +0100
Received: from eos.fwall.u-szeged.hu ([127.0.0.1])
 by eos.fwall.u-szeged.hu (SAVSMTP 3.0.0.44) with SMTP id M2004030810560811037
 for <linux-mtd@lists.infradead.org>; Mon, 08 Mar 2004 10:56:08 +0100
Received: from sol.cc.u-szeged.hu ([160.114.8.24])
	by eos.fwall.u-szeged.hu with esmtp (Exim 4.30)
	id 1B0HUW-0004lP-Mx
	for linux-mtd@lists.infradead.org; Mon, 08 Mar 2004 10:56:08 +0100
Received: from sed.inf.u-szeged.hu ([160.114.37.208] helo=sed)
	by sol.cc.u-szeged.hu with esmtp (Exim 4.24)
	id 1B0HUW-0004m0-B1
	for linux-mtd@lists.infradead.org; Mon, 08 Mar 2004 10:56:08 +0100
Received: from kpax.inf.u-szeged.hu
	([160.114.36.214] helo=inf.u-szeged.hu ident=hafy)
	by sed with esmtp (Exim 3.36 #1 (Debian))
	id 1B0HUT-0001rt-00
	for <linux-mtd@lists.infradead.org>; Mon, 08 Mar 2004 10:56:05 +0100
Message-ID: <404C433C.7060604@inf.u-szeged.hu>
Date: Mon, 08 Mar 2004 10:56:12 +0100
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: A JFFS2 extension - compression performance improvement
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear All,

With some of my colleagues at the University of Szeged (Hungary) we have 
been working on improving the compression performance of JFFS2 - keeping 
on mind the compatibility and the flexibility.

The result of our work (BBC - Block Based Compression Framework) is an 
extension to JFFS2. At

http://www.inf.u-szeged.hu/jffs2/

you can read more information about it, download and use it under the 
terms of the GNU General Public License.

Enjoy! :)

Best regards,

Ferenc Havasi
http://www.inf.u-szeged.hu/~havasi/
