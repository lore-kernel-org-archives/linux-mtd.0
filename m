Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xmf48-0000mg-Au
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 08:38:45 +0000
Date: Fri, 7 Nov 2014 09:38:12 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
Subject: RE: jffs2 usage question: nandwrite
In-Reply-To: <EACD232272DA4849B060F0828564D13B449961CFFA@ntcex01.corp.netcomm.com.au>
Message-ID: <alpine.DEB.2.02.1411070936460.23184@lnxricardw1.se.axis.com>
References: <545C32CF.9060502@graphitesystems.com>
 <EACD232272DA4849B060F0828564D13B449961CFFA@ntcex01.corp.netcomm.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
Cc: K Richard Pixley <rpixley@graphitesystems.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 7 Nov 2014, Iwo Mergler wrote:

> JFFS2 keeps all the relevant information in every block. That is, you 
> can shuffle the erase blocks any way you like and you still have a valid 
> file system.
> 
> The holes made by skipping bad blocks are not a problem.

Additionally, JFFS2 is bad-block-aware, so it knows that there can be bad 
blocks in a partition on which a file system is mounted, and avoids trying 
to use them.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
