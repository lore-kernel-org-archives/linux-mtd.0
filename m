Received: from desire.actrix.co.nz ([203.96.16.164])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EhwXm-0003nJ-ED
	for linux-mtd@lists.infradead.org; Thu, 01 Dec 2005 17:04:49 -0500
Received: from 202-154-142-208-tollfree.connections.net.nz
	(202-154-142-208-tollfree.connections.net.nz [202.154.142.208])
	by desire.actrix.co.nz (Postfix) with ESMTP id 350121535B
	for <linux-mtd@lists.infradead.org>;
	Fri,  2 Dec 2005 11:04:40 +1300 (NZDT)
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Date: Fri, 2 Dec 2005 11:03:58 +1300
References: <20051129180204.2f79e2ae.vwool@ru.mvista.com>
	<200511301112.14512.manningc2@actrix.gen.nz>
	<438D68DD.9060400@ru.mvista.com>
In-Reply-To: <438D68DD.9060400@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200512021103.58798.manningc2@actrix.gen.nz>
Subject: Re: [PATCH] treat OOB as a single chunk of oobavail bytes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 30 November 2005 21:54, Vitaly Wool wrote:
> Hi Charles,
>
> I've kept the read_ecc/read_oob interface as it was. The reasons behind
> are: - permitting NULL data for read_ecc in order to facilitate pure OOB
> read will overcomplicate the implementation and will require API change (i.
> e. how much of the OOB to read, at least)
> - read_oob provides additional capabilities like reading the OOB from a
> specified offset.

No worries at all.

<snip yaffs2 stuff shifted to yaffs list>

-- CHarles
