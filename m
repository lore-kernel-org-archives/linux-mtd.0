Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17XH57-0007RJ-00
	for <linux-mtd@lists.infradead.org>; Wed, 24 Jul 2002 09:01:13 +0100
Date: Wed, 24 Jul 2002 10:01:09 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Yuan, Cain" <cain.yuan@intel.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: about intel K3 strata falsh.
Message-ID: <20020724080109.GA13031@wohnheim.fh-wedel.de>
References: <957BD1C2BF3CD411B6C500A0C944CA2601499C18@pdsmsx32.pd.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <957BD1C2BF3CD411B6C500A0C944CA2601499C18@pdsmsx32.pd.intel.com>
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

On Wed, 24 July 2002 15:26:48 +0800, Yuan, Cain wrote:
> 	in drivers/mtd there is no corresponding code for Intel starta
> flash. As intel's datasheet said, strata K3/K18 flash has an  write buffer
> and Sync mode that can improve 
> the performance, I decide to drive it. So  should I write an "driver module"
> for it?  Any ideas?  TIA!!

try drivers/mtd/chips/cfi_cmdset_0001.c

Jörn

-- 
Remember that silence is sometimes the best answer.
-- reputely from the Dalai Lama, unverified
