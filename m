Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DxPBs-0007Ag-TM
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 09:09:55 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DxPB1-00067t-5r
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 15:08:55 +0200
Received: from 212.130.19.66 ([212.130.19.66])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Jul 2005 15:08:55 +0200
Received: from martin by 212.130.19.66 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Jul 2005 15:08:55 +0200
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Date: Tue, 26 Jul 2005 15:08:35 +0200
Message-ID: <dc5ckj$ldm$1@sea.gmane.org>
References: <dbl42b$hcn$1@sea.gmane.org>	<1121867130.12903.15.camel@localhost.localdomain>
	<42E634D0.6090300@inf.u-szeged.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <42E634D0.6090300@inf.u-szeged.hu>
Sender: news <news@sea.gmane.org>
Subject: Re: JFFS2 garbage collector blocking for minutes after mount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ferenc Havasi wrote:
>>The garbage collection thread is also responsible for building up the
>>node tree for every inode after mounting, so that we know for sure which
>>nodes are valid and which are obsolete. On NAND flash we can't actually
>>mark nodes as obsolete.

> Martin, you may should try our Centralizes Summary (CS) patch. It stores
> every relevant memory representation at umount time, so at mount (if the
> previous unmount was a clean one) you need only to read it without any
> scanning and rebuilding.

Unfortunately, I have no (or almost no) clean umount's - the device will 
reboot due to power-failure...

But I'm still considering - just for the clean ones :-)

// Martin
