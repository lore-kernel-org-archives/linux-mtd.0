Received: from softsteprubberfloors.com ([192.220.111.56] helo=rcmenter.iserver.net)
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18fmNb-0001a6-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Feb 2003 19:35:43 +0000
From: Russ Dill <Russ.Dill@asu.edu>
To: Siddharth Choudhuri <choudhri@cs.tamu.edu>
Cc: leeyang <leeyang@ycig.com>, linux-mtd@lists.infradead.org
In-Reply-To: <Pine.GSO.4.44.0302031329001.12655-100000@unix.cs.tamu.edu>
References: <Pine.GSO.4.44.0302031329001.12655-100000@unix.cs.tamu.edu>
Message-Id: <1044301078.15823.13.camel@timmy>
Mime-Version: 1.0
Date: 03 Feb 2003 12:37:59 -0700
Subject: Re: need suggestion about embedded FS plan
Content-Type: text/plain
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

On Mon, 2003-02-03 at 12:29, Siddharth Choudhuri wrote:
> > mount -t jffs2 /dev/mtd2 /etc
> 
> Shouldn't this be /dev/mtdblock2 since mtd2 is a char device ?

yes, yes, I wrote this up quick as an example, sorry the details aren't
right

-- 
Russ Dill <Russ.Dill@asu.edu>
