Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B3dND-00006W-7G
	for linux-mtd@lists.infradead.org; Wed, 17 Mar 2004 15:54:27 +0000
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "Ferenc Havasi" <havasi@inf.u-szeged.hu>, <linux-mtd@lists.infradead.org>
Date: Wed, 17 Mar 2004 16:54:21 +0100
Message-ID: <IGEFJKJNHJDCBKALBJLLIEAAIKAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <404C433C.7060604@inf.u-szeged.hu>
Subject: RE: A JFFS2 extension - compression performance improvement
Reply-To: joakim.tjernlund@lumentis.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Dear All,
> 
> With some of my colleagues at the University of Szeged (Hungary) we have 
> been working on improving the compression performance of JFFS2 - keeping 
> on mind the compatibility and the flexibility.
> 
> The result of our work (BBC - Block Based Compression Framework) is an 
> extension to JFFS2. At
> 
> http://www.inf.u-szeged.hu/jffs2/
> 
> you can read more information about it, download and use it under the 
> terms of the GNU General Public License.

Hi

I looked at the performance data in the above link and I wounder what version
of zlib was used in the performance tests?

I ask because I noticed that the newest zlib version(1.2.1) is supposed
to be much quicker than previous versions.

 Jocke
